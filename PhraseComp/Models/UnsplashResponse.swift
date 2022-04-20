//
//  UnsplashResponse.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 4/7/22.
//

import Foundation

struct UnsplashResponse: Codable {
//    let total: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    //array??
    let urls: URLS
}

struct URLS: Codable {
    let small: String
}
