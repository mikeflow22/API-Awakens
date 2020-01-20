//
//  HomeTableViewController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let network = NetworkController()
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
            
            network.fetchAllCharacters { (characters, error) in
                if let error = error {
                    print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                    return
                }
                
                guard let returnedCharacters = characters else {
                    print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                    return
                }
                destVC.characters = returnedCharacters
                           
//                           var largestString = ""
//                           var placeholderInt = 0
//
//                           let a =  returnedCharacters.sorted(by: { Int($0.height)! > Int($1.height)! })
//                           print("a.first: \(a.first)")
//                           print("a.last: \(a.last)")
//
//                           for character in returnedCharacters {
//                               if let height = Int(character.height) {
//                                   if height > placeholderInt {
//                                       print("characters name: \(character.name), HEIGHT: \(height)")
//
//                                       placeholderInt = height
//                                       print("placeHolderInt: \(placeholderInt)")
//
//                                       largestString = character.name
//                                       print("largestString: \(character.name)")
//                                       let x =  self.convertToMeter(placeholderInt)
//                                       print("\(x) meters")
//                                       print("\(x) ft")
//                                   }
//                               }
//                           }
//                           print("largest name: \(largestString)")
//                           print("**********************************")
            }
        }
        
        if segue.identifier == "vehiclesSegue" {
                  guard let destVC = segue.destination  as? DetailViewController else {
                      return
                  }
                  
                  network.fetchAllVehicles { (vehicles, error) in
                      if let error = error {
                          print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                          return
                      }
                      
                      guard let returnedVehicles = vehicles else {
                          print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                          return
                      }
                      destVC.vehicles = returnedVehicles
                  }
              }
        
        if segue.identifier == "starshipsSegue" {
            guard let destVC = segue.destination  as? DetailViewController else {
                return
            }
            
            network.fetchAllStarships { (starships, error) in
                if let error = error {
                    print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                    return
                }
                
                guard let returnedStarships = starships else {
                    print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                    return
                }
                destVC.starships = returnedStarships
                
            }
        }
        
    }
    
    
}
