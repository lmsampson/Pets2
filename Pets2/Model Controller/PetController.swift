//
//  PetController.swift
//  Pets2
//
//  Created by Lisa Sampson on 7/31/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class PetController {
    
    func createPet(favoritePet: String, wantPet: Bool) -> Pet {
        let pet = Pet(favoritePet: favoritePet, wantPet: wantPet)
        if wantPet == true {
            pets.insert(pet, at: 0)
        } else {
            pets.append(pet)
        }
        return pet
    }
    
    func updatePet(pet: Pet, favoritePet: String, wantPet: Bool) {
        guard let index = pets.index(of: pet) else { return }
        
        var scratch = pet
        scratch.favoritePet = favoritePet
        scratch.wantPet = wantPet
        
        pets.remove(at: index)
        if wantPet == true {
            pets.insert(scratch, at: 0)
        } else {
            pets.append(scratch)
        }
    }
    
    private(set) var pets: [Pet] = []
}
