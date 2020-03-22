//
//  Pokemon.swift
//  ios-sprint-challenge-pokedex
//
//  Created by patelpra on 3/21/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import Foundation

struct Pokemon: Equatable, Codable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    var id: Int
    var name: String
    var abilities: [Abilities]
    var types: [Types]
    var sprites: Image

}

struct Abilities: Codable {
    var ability: Ability
}

struct Ability: Codable {
    var name: String
}

struct Types: Codable {
    var type: Type
}

struct Type: Codable {
    var name: String
}

struct Image: Codable {
    var front_default: String
}
