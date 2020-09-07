//
//  StoreResponseModels.swift
//  Example
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation

struct StoreResponseModel: Codable {
    let results: [StoreResultModel]?
    let resultCount: Int?
}

// MARK: - Result
struct StoreResultModel: Codable {
    let artworkUrl60: String?
    let contentAdvisoryRating: String?
    let collectionPrice: Double?
    let wrapperType: String?
    let country: String?
    let isStreamable: Bool?
    let releaseDate: String?
    let artistID: Int?
    let collectionViewURL: String?
    let kind: String?
    let trackExplicitness: String?
    let currency: String?
    let artistName: String?
    let artistViewURL: String?
    let artworkUrl30: String?
    let trackViewURL: String?
    let discCount: Int?
    let collectionCensoredName: String?
    let collectionID: Int?
    let trackCensoredName: String?
    let previewURL: String?
    let trackTimeMillis: Int?
    let trackName: String?
    let trackPrice: Double?
    let collectionName: String?
    let artworkUrl100: String?
    let trackCount, trackID, discNumber: Int?
    let collectionExplicitness: String?
    let trackNumber: Int?
    let primaryGenreName: String?
    let collectionArtistViewURL: String?
    let collectionArtistID: Int?
    let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case artworkUrl60, contentAdvisoryRating, collectionPrice, wrapperType, country, isStreamable, releaseDate
        case artistID = "artistId"
        case collectionViewURL = "collectionViewUrl"
        case kind, trackExplicitness, currency, artistName
        case artistViewURL = "artistViewUrl"
        case artworkUrl30
        case trackViewURL = "trackViewUrl"
        case discCount, collectionCensoredName
        case collectionID = "collectionId"
        case trackCensoredName
        case previewURL = "previewUrl"
        case trackTimeMillis, trackName, trackPrice, collectionName, artworkUrl100, trackCount
        case trackID = "trackId"
        case discNumber, collectionExplicitness, trackNumber, primaryGenreName
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionArtistID = "collectionArtistId"
        case collectionArtistName
    }
}
