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
            DispatchQueue.main.async {
                self.title = "Characters"
            }
            if let passedInCharacters = characters {
                for character in passedInCharacters {
                    print("Character name: \(character.name)")
                }
            }
        }
    }
    
    var vehicles: [Vehicle]? {
        didSet {
            DispatchQueue.main.async {
                self.title = "Vehicles"
            }
            if let passedInVehicles = vehicles {
                for vehicle in passedInVehicles {
                    print("Vehicles name: \(vehicle.name)")
                }
            }
        }
    }
    
    
    var starships: [Starship]? {
        didSet {
            DispatchQueue.main.async {
                self.title = "Starships"
            }
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
    
    //MARK: - IBOutlets
    @IBOutlet weak var picker: UIPickerView!
    //LABEL 1
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var makeBornLabel1: UILabel!
    @IBOutlet weak var costHomeLabel1: UILabel!
    @IBOutlet weak var lengthHeightLabel1: UILabel!
    @IBOutlet weak var classEyesLabel1: UILabel!
    @IBOutlet weak var crewHairLabel1: UILabel!
    
    
    //Label 2
    @IBOutlet weak var makeBornLabel2: UILabel!
    @IBOutlet weak var costHomeLabel2: UILabel!
    @IBOutlet weak var lenghtHeightLabel2: UILabel!
    @IBOutlet weak var classEyesLabel2: UILabel!
    @IBOutlet weak var crewHairLabel2: UILabel!
    @IBOutlet weak var smallestLabel2: UILabel!
    @IBOutlet weak var largestLabel2: UILabel!
    
    
    //button properties
    @IBOutlet weak var usdProperties: UIButton!
    @IBOutlet weak var creditProperties: UIButton!
    @IBOutlet weak var englishProperties: UIButton!
    @IBOutlet weak var metricProperties: UIButton!
    
    
    
    //MARK: - IBActions
    @IBAction func convertToUSDButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func convertToCreditsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func convertToEnglishMeasurement(_ sender: UIButton) {
    }
    
    @IBAction func convertToMetricButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
