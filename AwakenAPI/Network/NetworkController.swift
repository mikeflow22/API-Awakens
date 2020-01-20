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
    static let vehicles = "vehicles"
    static let starships = "starships"
}
//Generic Constraint: This allows us to
class NetworkController<T: StarwarsAPI> {
    
    private let baseURL = URL(string: "https://swapi.co/api/")!
    
    //we will need to fetch all characters to populate the picker on the view
    ///This function will return all characters
    func fetchAllCharacters(completion: @escaping ([T]?, Error?) -> Void) {
        
        //construct the url to send in the request
        let url =  T.path
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
                //pageable protocol has the results property in it that we need to drill down in the api
                let arrayOfCharacters  =  try decoder.decode(Pageable.self, from: data).results
                
                completion(arrayOfCharacters, nil)
            } catch  {
                print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                completion(nil, error)
                return
            }
            
        }.resume()
    }
    
    ///This function will return all Vehicles
     func fetchAllVehicles(completion: @escaping ([Vehicle]?, Error?) -> Void) {
         
         //construct the url to send in the request
         let url =  baseURL.appendingPathComponent(Constants.vehicles)
         print("This is the url for fetching all the vehicles: \(url.description)")
         
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
                 let arrayOfVehicles  =  try decoder.decode(Transportation.self, from: data).results
                 
                 completion(arrayOfVehicles, nil)
             } catch  {
                 print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                 completion(nil, error)
                 return
             }
             
         }.resume()
    }

    ///This function will return all Starships
     func fetchAllStarships(completion: @escaping ([Starship]?, Error?) -> Void) {
         
         //construct the url to send in the request
         let url =  baseURL.appendingPathComponent(Constants.starships)
         print("This is the url for fetching all the Starship: \(url.description)")
         
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
                 let arrayOfStarship  =  try decoder.decode(Aircraft.self, from: data).results
                 
                 completion(arrayOfStarship, nil)
             } catch  {
                 print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                 completion(nil, error)
                 return
             }
             
         }.resume()
    }

    ///this function will return the home town
    func homeWordFor(character: Character, completion: @escaping (String?, Error?) -> Void){
        //get the url from the character passed in
        let url = character.homeworld
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
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
                completion(nil, error)
                return
            }
            let decoder =  JSONDecoder()
            do {
                let homeworld = try decoder.decode(Homeworld.self, from: data).name
                completion(homeworld, nil)
            } catch  {
                print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    
    
}
