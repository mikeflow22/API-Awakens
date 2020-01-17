//
//  NetworkController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

//Enum for constant keys
struct Constants {
    static let people = "people"
    static let starships = "starships"
    static let vehicles = "vehicles"
}
class NetworkController {
    
    private let baseURL = URL(string: "https://swapi.co/api/")!
    
    //we will need to fetch all characters to populate the picker on the view
    ///This function will return all characters
    func fetchAllCharacters(completion: @escaping ([Character]?, Error?) -> Void) {
        
        //construct the url to send in the request
        let url =  baseURL.appendingPathComponent(Constants.people)
        print("This is the url for fetching all the characters: \(url.description)")
        
        //because we are only GET-ing we don't  need to construct a urlRequest.
        //also because we are not adding any queryItems we dont need to construct a urlComponent object either
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Response: \(response.statusCode)")
            }
            
            if let error = error {
                print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                completion(nil, NSError())
                return
            }
            
            //construct a decoder object to parse through the json. we want to get back an array of characters based on how we set up our model
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy =  .convertFromSnakeCase
            
            do {
                let arrayOfCharacters  =  try decoder.decode(People.self, from: data).results
                
                completion(arrayOfCharacters, nil)
            } catch  {
                print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                completion(nil, error)
                return
            }
            
        }.resume()
    }
    
    ///This function will return all Vehicles
     func fetchAllVehicles(completion: @escaping ([Character]?, Error?) -> Void) {
         
         //construct the url to send in the request
         let url =  baseURL.appendingPathComponent(Constants.people)
         print("This is the url for fetching all the characters: \(url.description)")
         
         //because we are only GET-ing we don't  need to construct a urlRequest.
         //also because we are not adding any queryItems we dont need to construct a urlComponent object either
         
         URLSession.shared.dataTask(with: url) { (data, response, error) in
             if let response = response as? HTTPURLResponse {
                 print("Response: \(response.statusCode)")
             }
             
             if let error = error {
                 print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                 completion(nil, error)
                 return
             }
             
             guard let data = data else {
                 print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                 completion(nil, NSError())
                 return
             }
             
             //construct a decoder object to parse through the json. we want to get back an array of characters based on how we set up our model
             let decoder = JSONDecoder()
             decoder.keyDecodingStrategy =  .convertFromSnakeCase
             
             do {
                 let arrayOfCharacters  =  try decoder.decode(People.self, from: data).results
                 
                 completion(arrayOfCharacters, nil)
             } catch  {
                 print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                 completion(nil, error)
                 return
             }
             
         }.resume()
}
