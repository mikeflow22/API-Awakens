//
//  DetailViewController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/18/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var characters: [Character]? {
           didSet {
               if let passedInCharacters = characters {
                    for character in passedInCharacters {
                        print("Character name: \(character.name)")
                    }
               }
           }
       }
       
       var vehicles: [Vehicle]? {
           didSet {
              if let passedInVehicles = vehicles {
                    for vehicle in passedInVehicles {
                        print("Vehicles name: \(vehicle.name)")
                    }
               }
           }
       }
       
       
       var starships: [Starship]? {
              didSet {
                 if let passedInStarships = starships {
                       for starship in passedInStarships {
                           print("Starship's name: \(starship.name)")
                       }
                  }
              }
          }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
