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
        //        updateViewsForCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //switch over selected type
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
                    self.configurePickerViewsFor(character: self.starwarsEntity?[0] as! Character)
                    self.picker.selectRow(0, inComponent: 0, animated: true)
                    let characterArraySortedByHeight =  returnedCharacters.sorted(by: { Int($0.height)! > Int($1.height)! })
                    self.smallestLabel2.text = characterArraySortedByHeight.last?.name
                    self.largestLabel2.text = characterArraySortedByHeight.first?.name
                }
            }
        default: break
        }
    }
    
    //MARK: - IBActions
    @IBAction func convertToUSDButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func convertToCreditsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func convertToEnglishMeasurement(_ sender: UIButton) {
        self.metricProperties.setTitleColor(.gray, for: .normal)
        self.englishProperties.setTitleColor(.blue, for: .normal)
        
        switch currentEntity {
        case is Character:
            self.lenghtHeightLabel2.text = (currentEntity as! Character).heightConversion
        default: break
        }
    }
    
    @IBAction func convertToMetricButtonTapped(_ sender: UIButton) {
        self.englishProperties.setTitleColor(.gray, for: .normal)
        self.metricProperties.setTitleColor(.blue, for: .normal)
        
        switch currentEntity {
        case is Character:
            self.lenghtHeightLabel2.text = (currentEntity as! Character).height
        default: break
        }
    }
    
    //MARK: - Class Methods
    //    func updateViewsForCharacters(){
    //        guard let passedInCharacters = characters, isViewLoaded else {
    //            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
    //            return
    //        }
    //
    //        let characterArraySortedByHeight =  passedInCharacters.sorted(by: { Int($0.height)! > Int($1.height)! })
    //        //we have an array of characters configure the picker to display  the first character in the array and then configure the rest of the views
    //        self.smallestLabel2.text = characterArraySortedByHeight.last?.name
    //        self.largestLabel2.text = characterArraySortedByHeight.first?.name
    //    }
    
    func configurePickerViewsFor(character: Character) {
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
        
        //character's information
        self.nameLabel1.text = character.name
        self.makeBornLabel2.text = character.birthYear
        self.lenghtHeightLabel2.text = character.height
        self.classEyesLabel2.text = character.eyeColor
        self.crewHairLabel2.text = character.hairColor
        
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
        if let entityCount = starwarsEntity {
            return entityCount.count
        } else {
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let entities = starwarsEntity {
            let entitysName = entities[row]
            return entitysName.name
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let entity = starwarsEntity?[row] {
            switch starwarsEntity {
            case is Character:
                self.currentEntity = entity
                self.configurePickerViewsFor(character: entity as! Character)
            default: break
            }
        } else {
            print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
        }
    }
    
}
