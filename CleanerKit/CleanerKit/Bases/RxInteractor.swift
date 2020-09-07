//
//  RxInteractor.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxSwift

open class RxInteractor: RxInteractorProtocol, DeinitializableProtocol {
    private lazy var jsonDecoder = JSONDecoder()
    private let client: ClientProtocol!
    private var disposeBag = DisposeBag()
    func deinitialize() {
        self.disposeBag = DisposeBag()
    }

    public init(client: ClientProtocol) {
        self.client = client
    }
    
    func paramValidateCheck<T>(param: T, url: String) -> Bool {
        return true
    }
    
    public func request<T, R : Decodable>(url: String, param: T) -> Single<R> {
        return Single<R>.create { [weak self] single in
            guard let self = self else {
                single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.systemDeallocated.rawValue, userInfo: nil)))
                return Disposables.create()
            }

            guard self.paramValidateCheck(param: param, url: url) else {
                single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParameter.rawValue, userInfo: nil)))
                return Disposables.create()
            }
            
            let paramDictionary = self.paramToDictionary(param: param)
            
            self.client.request(url: url, parameters: paramDictionary)
                .subscribe(onSuccess: { data in
                    do {
                        let responseModel = try self.jsonDecoder.decode(R.self, from: data)
                        single(.success(responseModel))
                    }
                    catch {
                        single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParse.rawValue, userInfo: nil)))
                        print("❌❌❌ parsing error!! ❌❌❌")
                        do {
                            guard let object = try? JSONSerialization.jsonObject(with: data, options: []),
                                  let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                                  let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                            print(object)
                            print("❌❌❌❌❌❌❌❌❌")
                            print(prettyPrintedString)
                        }
                    }
                }, onError: { error in
                    single(.error(error))
                })
                .disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }

    func requestPost<T, R : Decodable>(url: String, param: T) -> Single<R> {
        return Single<R>.create { [weak self] single in
            guard let self = self else {
                single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.systemDeallocated.rawValue, userInfo: nil)))
                return Disposables.create()
            }

            guard self.paramValidateCheck(param: param, url: url) else {
                single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParameter.rawValue, userInfo: nil)))
                return Disposables.create()
            }
            
            let paramDictionary = self.paramToDictionary(param: param)
            
            self.client.requestPost(url: url, parameters: paramDictionary)
                .subscribe(onSuccess: { data in
                    do {
                        let responseModel = try self.jsonDecoder.decode(R.self, from: data)
                        single(.success(responseModel))
                    }
                    catch {
                        single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParse.rawValue, userInfo: nil)))
                        print("❌❌❌ parsing error!! ❌❌❌")
                        do {
                            guard let object = try? JSONSerialization.jsonObject(with: data, options: []),
                                  let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                                  let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                            print(prettyPrintedString)
                        }
                    }
                }, onError: { error in
                    single(.error(error))
                })
                .disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    func requestPost<T>(url: String, param: T) -> Completable {
        return Completable.create { [weak self] completable in
            guard let self = self else {
                completable(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.systemDeallocated.rawValue, userInfo: nil)))
                return Disposables.create()
            }

            guard self.paramValidateCheck(param: param, url: url) else {
                completable(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParameter.rawValue, userInfo: nil)))
                return Disposables.create()
            }
            
            let paramDictionary = self.paramToDictionary(param: param)
            
            self.client.requestPost(url: url, parameters: paramDictionary)
                .subscribe(onSuccess: { data in
                    completable(.completed)
                }, onError: { error in
                    completable(.error(error))
                })
                .disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    private func paramToDictionary<T>(param: T) -> [String : Any] {
        let mirror = Mirror(reflecting: param)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            if case Optional<Any>.none = value { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }
}
