//
//  PetController.swift
//  Pets2
//
//  Created by Lisa Sampson on 7/31/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class PetController {
    
    func createPet(favoritePet: String) -> Pet {
        let pet = Pet(favoritePet: favoritePet)
        pets.append(pet)
        return pet
    }
    
    func updatePet(pet: Pet, favoritePet: String) {
        guard let index = pets.index(of: pet) else { return }
        
        var scratch = pet
        scratch.favoritePet = favoritePet
        
        pets.remove(at: index)
        pets.append(scratch)
    }
    
    private(set) var pets: [Pet] = []
}
