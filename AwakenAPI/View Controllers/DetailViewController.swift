//
//  DetailViewController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/18/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Class Properties
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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
    }
    
    //MARK: - IBActions
    @IBAction func convertToUSDButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func convertToCreditsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func convertToEnglishMeasurement(_ sender: UIButton) {
    }
    
    @IBAction func convertToMetricButtonTapped(_ sender: UIButton) {
    }
    
    //MARK: - Class Methods
    func updateViewsForCharacters(){
        guard let passedInCharacters = characters, isViewLoaded else {
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
            return
        }
        
        //we have an array of characters configure the picker to display  the first character in the array and then configure the rest of the views
       
    }
    
    func configurePickerViewsFor(character: Character) {
        //view labels
        makeBornLabel1.text = "Born"
        costHomeLabel1.text = "Home"
        lengthHeightLabel1.text = "Height"
        classEyesLabel1.text = "Eyes"
        crewHairLabel1.text = "Hair"
        
        //view buttons
        usdProperties.isHidden = true
        creditProperties.isHidden = true
        
        //character's information
        self.nameLabel1.text = character.name
        self.makeBornLabel2.text = character.birthYear
        self.costHomeLabel2.text = character.homeworld.absoluteString
        self.lenghtHeightLabel2.text = character.height
        self.classEyesLabel2.text = character.eyeColor
        self.crewHairLabel2.text = character.hairColor
        
        
    }
    
} //end of class

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let charactersCount = characters {
            return charactersCount.count
        } else {
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let characters = characters {
            let charactersName = characters[row]
            return charactersName.name
        } else {
            return "IDK"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let character = characters?[row] {
            self.configurePickerViewsFor(character: character)
        } else {
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
        }
        
//        self.nameLabel1.text = characters?[row].name
        
    }
    
}
