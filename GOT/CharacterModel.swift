//
//  CharacterModel.swift
//  GOT
//
//  Created by ksd on 03/10/2023.
//

import Foundation

struct CharacterModel: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let fullName: String
    let title: String
    let family: String
    let image: String
    let imageUrl: URL
}
