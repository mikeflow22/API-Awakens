//
//  ViewController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/16/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://swapi.co/api/people")!
        let data = try! Data(contentsOf: url)
        let  decoder = JSONDecoder()
        
        
        let arrayOfPeople = try! decoder.decode(People.self, from: data)
        print("this is the array of people: \(arrayOfPeople.results.description)")
        
    }


}

