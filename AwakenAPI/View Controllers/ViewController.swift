//
//  ViewController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/16/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

//class ViewController: UIViewController {
//  
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let network = NetworkController()
//        network.fetchAllCharacters { (characters, error) in
//            if let error = error {
//                print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
//                return
//            }
//            
//            guard let returnedCharacters = characters else {
//                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
//                return
//            }
//            
//            for character in returnedCharacters {
//                print("Character name: \(character.name)")
//            }
//        }
//        
//        print("************************************************************")
//        
//        network.fetchAllVehicles { (vehicles, error) in
//              if let error = error {
//                          print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
//                          return
//                      }
//                      
//                      guard let returnedvehicles = vehicles else {
//                          print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
//                          return
//                      }
//                      
//                      for vehicles in returnedvehicles {
//                          print("Vehicles name: \(vehicles.name)")
//                      }
//                  }
//        
//        network.fetchAllStarships { (starships, error) in
//              if let error = error {
//                          print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
//                          return
//                      }
//                      
//                      guard let returnedStarships = starships else {
//                          print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
//                          return
//                      }
//                      
//                      for starship in returnedStarships {
//                          print("Starship name: \(starship.name)")
//                      }
//                  }
//        }
//    
//    } //end of file
//
//
//
//
