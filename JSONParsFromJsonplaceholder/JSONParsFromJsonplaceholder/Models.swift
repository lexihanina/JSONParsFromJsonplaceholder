//
//  Posts.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import Foundation

protocol DecodableData: Decodable {}

struct Posts: Codable, DecodableData {
    let userId: Int
    let id: Int
    let title: String?
    let body: String?
}

struct Comments: Codable, DecodableData {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

struct Todos: Codable, DecodableData {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct Users: Codable, DecodableData {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UsersAddress
    let phone: String
    let website: String
    let company: UsersCompany
}

struct UsersAddress: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: UsersGeo
}

struct UsersGeo: Codable {
    let lat: String
    let lng: String
}

struct UsersCompany: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
