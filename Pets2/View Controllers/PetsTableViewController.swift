//
//  PetsTableViewController.swift
//  Pets2
//
//  Created by Lisa Sampson on 7/31/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class PetsTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petController.pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)
        
        let pet = petController.pets[indexPath.row]
        cell.textLabel?.text = pet.favoritePet
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPetSegue" {
            guard let detailVC = segue.destination as? PetsViewController else { return }
            
            detailVC.petController = petController
        } else if segue.identifier == "EditPetSegue" {
            guard let detailVC = segue.destination as? PetsViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.petController = petController
            detailVC.pet = petController.pets[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pet = petController.pets[indexPath.row]
            petController.deletePet(pet: pet)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    let petController = PetController()
    
}
