//
//  UserModel.swift
//  VideoApp
//
//  Created by hoang linh on 11/1/20.
//

import Foundation

struct UserModel: Codable {
    let total_count : Int?
    let incomplete_results : Bool?
    let items : [ItemModel]?

    enum CodingKeys: String, CodingKey {

        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }

}

struct ItemModel: Codable {
    let login : String?
    let id : Int?
    let node_id : String?
    let avatar_url : String?
    let gravatar_id : String?

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case node_id = "node_id"
        case avatar_url = "avatar_url"
        case gravatar_id = "gravatar_id"
}
}
