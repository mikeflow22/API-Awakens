//
//  HomeTableViewController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    enum SelectedType {
        case character
        case vehicle
        case starship
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "charactersSegue" {
            guard let destVC = segue.destination  as? DetailViewController else {
                return
            }
            destVC.selectedType = .character
        }
        
        if segue.identifier == "vehiclesSegue" {
            guard let destVC = segue.destination  as? DetailViewController else {
                return
            }
            destVC.selectedType = .vehicle
            
        }
        
        
        if segue.identifier == "starshipsSegue" {
            guard let destVC = segue.destination  as? DetailViewController else {
                return
            }
            destVC.selectedType = .starship
        }
        
}

}

