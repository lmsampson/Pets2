//
//  PetsViewController.swift
//  Pets2
//
//  Created by Lisa Sampson on 7/31/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class PetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func saveButtonWasTapped(_ sender: Any) {
        guard let favoritePet = favoritePetTextField.text else { return }
        let _ = petController?.createPet(favoritePet: favoritePet)
    }
    
    private func updateViews() {
        guard let pet = pet else {
            title = "New Favorite Pet"
            return
        }
        
        title = pet.favoritePet
        
        favoritePetTextField.text = pet.favoritePet
    }

    var pet: Pet?
    var petController: PetController?
    
    @IBOutlet weak var favoritePetTextField: UITextField!
}
