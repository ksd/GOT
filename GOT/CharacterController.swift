//
//  CharacterController.swift
//  GOT
//
//  Created by ksd on 03/10/2023.
//

import Foundation


class CharacterController: ObservableObject {
    @Published var characters: [CharacterModel] = []
    
    init(){
        guard let characterURL = URL(string: "https://thronesapi.com/api/v2/Characters") else {return}
        fetchCharacters(from: characterURL)
    }
    
    private func fetchCharacters(from url: URL) {
        Task(priority: .low){
            guard let rawUserData = await NetworkService.getData(from: url) else {return}
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode([CharacterModel].self, from: rawUserData)
                /// Task kører ikke nødvendigvis på en main tråd, så vi skal lave en closure
                /// der kan køres på main tråden. Det er her vi opdaterer vores gui
                
                Task.detached { @MainActor in
                    self.characters = result
                }
            } catch {
                fatalError("Konverteringen fra JSON gik ad helvede til")
            }
        }
    }
    
    // Some demoData
    static var demoCharacter = CharacterModel(
        id: 2,
        firstName: "Jon",
        lastName: "Snow",
        fullName: "Jon Snow",
        title: "King of the North",
        family: "House Stark",
        image: "jon-snow.jpg",
        imageUrl: URL(string: "https://thronesapi.com/assets/images/jon-snow.jpg")!
    )
}
