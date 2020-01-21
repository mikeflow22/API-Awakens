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
    
    var selectedEntity: HomeTableViewController.SelectedEntity? //this is to switch on the selected type for the segue
    var starwarsEntity: [StarwarsEntity]? //passing in the array of the concrete type this is to switch  on the concrete type
    var currentEntity: StarwarsEntity?
    
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
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //switch over selected Entity
        switch selectedEntity {
        case .character:
            NetworkController<Character>.fetchAllEntity { (characters, error) in
                if let error = error {
                    print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                    return
                }
                
                guard let returnedCharacters = characters else {
                    print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                    return
                }
                
                DispatchQueue.main.async {
                    self.starwarsEntity = returnedCharacters
                    self.configureViewsForCharacter(self.starwarsEntity?[0] as! Character)
                    self.picker.selectRow(0, inComponent: 0, animated: true)
                    let characterArraySortedByHeight =  returnedCharacters.sorted(by: { Int($0.height)! > Int($1.height)! })
                    self.smallestLabel2.text = characterArraySortedByHeight.last?.name
                    self.largestLabel2.text = characterArraySortedByHeight.first?.name
                }
            }
        case .vehicle:
            NetworkController<Vehicle>.fetchAllEntity { (vehicles, error) in
                if let error = error {
                    print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                    return
                }
                
                guard let returnedVehicles = vehicles else {
                    print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                    return
                }
                
                DispatchQueue.main.async {
                    //assign returnedVehicles to our entity placeholder so it can be accessed throughout the file
                    self.starwarsEntity = returnedVehicles
                    
                    //views will match the picker and show the first element in th array.
                    self.configureViewsForEntity(self.starwarsEntity?[0] as! Vehicle)
                    
                    //we want to selecte the first entity in the array to populate the views and the picker
                    self.picker.selectRow(0, inComponent: 0, animated: true)
                    
                    //we want to now update the smallest/largest labels
                    let entitySortedByLength =  returnedVehicles.sorted(by: { if let length1 = Int($0.length), let length2 = Int($1.length){
                        return length1 > length2
                        }
                        return true
                    })
                    
                    self.smallestLabel2.text = entitySortedByLength.last?.name
                    self.largestLabel2.text = entitySortedByLength.first?.name
                }
            }
        case .starship:
            NetworkController<Starship>.fetchAllEntity { (starships, error) in
                if let error = error {
                    print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                    return
                }
                
                guard let returnedVStarships = starships else {
                    print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                    return
                }
                
                DispatchQueue.main.async {
                    //assign returnedVehicles to our entity placeholder so it can be accessed throughout the file
                    self.starwarsEntity = returnedVStarships
                    self.currentEntity = self.starwarsEntity?[0] as! Starship
                    //views will match the picker and show the first element in th array.
                    self.configureViewsForEntity(self.starwarsEntity?[0] as! Starship)
                    
                    //we want to selecte the first entity in the array to populate the views and the picker
                    self.picker.selectRow(0, inComponent: 0, animated: true)
                    
                    //we want to now update the smallest/largest labels
                    let entitySortedByLength =  returnedVStarships.sorted(by: { if let length1 = Int($0.length), let length2 = Int($1.length){
                        return length1 > length2
                        }
                        return true
                    })
                    
                    self.smallestLabel2.text = entitySortedByLength.last?.name
                    self.largestLabel2.text = entitySortedByLength.first?.name
                }
            }
        default:
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
            break
        }
    }
    
    //MARK: - IBActions
    
    func convertToInches(string: String) -> String {
        if let number = Double(string) {
            return String(number * 2.54)
        }
        return string
    }
    
    func convertToCentimeters(string: String) -> String {
        if let number = Double(string) {
            return String(number / 2.54)
        }
        return string
    }
    
    
    @IBAction func convertToUSDButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func convertToCreditsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func convertToEnglishMeasurement(_ sender: UIButton) {
        self.metricProperties.setTitleColor(.gray, for: .normal)
        self.englishProperties.setTitleColor(.blue, for: .normal)
        
        switch currentEntity {
        case is Character, is Vehicle, is Starship:
            guard let height = self.lenghtHeightLabel2.text, !height.isEmpty else {
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                return
            }
            self.lenghtHeightLabel2.text = self.convertToInches(string: height)
            
        default: break
        }
    }
    
    @IBAction func convertToMetricButtonTapped(_ sender: UIButton) {
        self.englishProperties.setTitleColor(.gray, for: .normal)
        self.metricProperties.setTitleColor(.blue, for: .normal)
        
        switch currentEntity {
        case is Character, is Vehicle, is Starship:
            guard let height = self.lenghtHeightLabel2.text, !height.isEmpty else {
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                return
            }
            self.lenghtHeightLabel2.text = self.convertToCentimeters(string: height)
        default:
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
            break
        }
    }
    
    //MARK: - Class Methods
    
    func configureViewsForCharacter(_ character: Character) {
        getHomeworldFor(character: character)
        
        picker.reloadAllComponents()
        
        //view labels
        makeBornLabel1.text = "Born"
        costHomeLabel1.text = "Home"
        lengthHeightLabel1.text = "Height"
        classEyesLabel1.text = "Eyes"
        crewHairLabel1.text = "Hair"
        
        //view buttons
        usdProperties.isHidden = true
        creditProperties.isHidden = true
        englishProperties.setTitleColor(.gray, for: .normal)
        metricProperties.setTitleColor(.blue, for: .normal)
        
        //character's information
        self.nameLabel1.text = character.name
        self.makeBornLabel2.text = character.birthYear
        
        self.lenghtHeightLabel2.text = character.height
            
        self.classEyesLabel2.text = character.eyeColor
        self.crewHairLabel2.text = character.hairColor
        
    }
    
    func configureViewsForEntity(_ entity: StarwarsEntity) {
        picker.reloadAllComponents()
        
        //view labels
        makeBornLabel1.text = "Make"
        costHomeLabel1.text = "Cost"
        lengthHeightLabel1.text = "Length"
        classEyesLabel1.text = "Class"
        crewHairLabel1.text = "Crew"
        
        //view buttons
        usdProperties.isHidden = false
        creditProperties.isHidden = false
        englishProperties.setTitleColor(.gray, for: .normal)
        metricProperties.setTitleColor(.blue, for: .normal)
        usdProperties.setTitleColor(.gray, for: .normal)
        creditProperties.setTitleColor(.blue, for: .normal)
        
        //MARK: - QUESTION Why does this work but not the switch statement below
        //doing the following populates the views on the first try without changing the pickerView
        if let vehicle = entity as? Vehicle {
            self.nameLabel1.text = vehicle.name
            self.costHomeLabel2.text = vehicle.costInCredits
            self.makeBornLabel2.text = vehicle.model
            self.lenghtHeightLabel2.text = vehicle.length
            self.classEyesLabel2.text = vehicle.vehicleClass
            self.crewHairLabel2.text = vehicle.crew
        } else if let starship = entity as? Starship {
            self.nameLabel1.text = starship.name
            self.costHomeLabel2.text = starship.costInCredits
            self.makeBornLabel2.text = starship.model
            self.lenghtHeightLabel2.text = starship.length
            self.classEyesLabel2.text = starship.starshipClass
            self.crewHairLabel2.text = starship.crew
        } else {
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
        }
        
        //the following doesnt populate the views on the first try. I have to change the pickerView
//        switch entity {
//            //use is to pattern match against type name
//        case  is Vehicle:
//            if let currentEntity = currentEntity as? Vehicle {
//                self.nameLabel1.text = currentEntity.name
//                self.costHomeLabel2.text = currentEntity.costInCredits
//                self.makeBornLabel2.text = currentEntity.model
//                self.lenghtHeightLabel2.text = currentEntity.length
//                self.classEyesLabel2.text = currentEntity.vehicleClass
//                self.crewHairLabel2.text = currentEntity.crew
//            } else {
//                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
//                return
//            }
//        case is Starship:
//            if let currentEntity = currentEntity as? Starship {
//                self.nameLabel1.text = currentEntity.name
//                self.costHomeLabel2.text = currentEntity.costInCredits
//                self.makeBornLabel2.text = currentEntity.model
//                self.lenghtHeightLabel2.text = currentEntity.length
//                self.classEyesLabel2.text = currentEntity.starshipClass
//                self.crewHairLabel2.text = currentEntity.crew
//            } else {
//                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
//                return
//            }
//        default:
//            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
//            break
//        }
    }
    
    func getHomeworldFor(character: Character){
        self.costHomeLabel2.text = "loading..."
        
        HomeworldManager.fetchHomeworldForCharacter(character) { (result) in
            if let homeworld = try? result.get() {
                DispatchQueue.main.async {
                    self.costHomeLabel2.text = homeworld.name
                }
            } else {
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
            }
        }
    }
    
} //end of class

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return starwarsEntity?.count ??  10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return starwarsEntity?[row].name ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let entityInRow = starwarsEntity?[row] {
            switch entityInRow {
            case is Character:
                //we want to assign our placeholder for currentEntity to match the one selected for the picker
                self.currentEntity = entityInRow
                self.configureViewsForCharacter(entityInRow as! Character)
            case is Vehicle:
                self.currentEntity = entityInRow
                self.configureViewsForEntity(entityInRow as! Vehicle)
            case is Starship:
                self.currentEntity = entityInRow
                 self.configureViewsForEntity(entityInRow as! Starship)
            default:
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                break
            }
        } else {
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
        }
    }
}
