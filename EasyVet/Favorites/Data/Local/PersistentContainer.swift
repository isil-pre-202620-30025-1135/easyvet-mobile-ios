//
//  PersistentContainer.swift
//  EasyVet
//
//  Created by Jorge Mayta on 29/10/26.
//

import SwiftData
import Foundation

class PersistentContainer {
    var container: ModelContainer
    
    static let shared = PersistentContainer()
    
    private init() {
        do {
            let config = ModelConfiguration(for: FavoriteEntity.self)
            container = try ModelContainer(for: FavoriteEntity.self, configurations: config)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
}
