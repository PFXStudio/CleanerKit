//
//  RestClient.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

public class RestClient: ClientProtocol {
    public init() {}
    public func buildParameter(parameters: [String : Any]) -> [String : String] {
        return parameters.mapValues { value -> String in
            if let value = value as? String {
                return value
            }
            else if let value = value as? Int {
                return String(value)
            }
            
            return String(describing: value)
        }
    }
    
    public func request(url: String, parameters: [String : Any]) -> Single<Data> {
        let param: [String : String] = buildParameter(parameters: parameters)
        print("Get url \(url)")
        print("Get restParameterDict \(param)")
        return Single<Data>.create { single in
            Alamofire.request(url, method: .get, parameters: param).responseData { responseData -> Void in
                switch responseData.result {
                case .success(_) where responseData.response?.statusCode == 200:
                    if let value = responseData.data {
                        if let _ = try? JSONSerialization.jsonObject(with: value, options: JSONSerialization.ReadingOptions.allowFragments) {
                            single(.success(value))
                        } else {
                            single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParse.rawValue, userInfo: nil)))
                        }
                    }
                default:
                    print("❌❌❌ network error!! ❌❌❌")
                    let error = NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidStatus.rawValue, userInfo: nil)
                    print(error)
                    single(.error(error))
                }
            }

            return Disposables.create()
        }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
    public func requestPost(url: String, parameters: [String : Any]) -> Single<Data> {
        let param: [String : String] = buildParameter(parameters: parameters)
        print("Post url \(url)")
        print("Post restParameterDict \(param)")
        return Single<Data>.create { single in
            Alamofire.request(url, method: .post, parameters: param).responseData { responseData -> Void in
                switch responseData.result {
                case .success(_) where responseData.response?.statusCode == 200:
                    if let value = responseData.data {
                        if let _ = try? JSONSerialization.jsonObject(with: value, options: JSONSerialization.ReadingOptions.allowFragments) {
                            single(.success(value))
                        } else {
                            single(.error(NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidParse.rawValue, userInfo: nil)))
                        }
                    }
                default:
                    print("❌❌❌ network error!! ❌❌❌")
                    let error = NSError(domain: "\(#file):\(#function):\(#line):\(#column)", code: ClientError.networkInvalidStatus.rawValue, userInfo: nil)
                    print(error)
                    single(.error(error))
                }
            }

            return Disposables.create()
        }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
