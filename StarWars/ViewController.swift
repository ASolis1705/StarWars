//
//  ViewController.swift
//  StarWars
//
//  Created by Alejandrina Solis Trejo (Étudiant) on 18-04-21.
//  Copyright © 2018 Alejandrina Solis Trejo (Étudiant). All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let baseURL = "https://swapi.co/api/"
    let getPersonEndpoint = "people/"
    
    @IBOutlet var labe1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let getPersonURL = URL(string: baseURL + getPersonEndpoint)!
        Alamofire.request(getPersonURL).responseJSON {
            response in
            
            if response.result.isSuccess {
                print("This was a success !!!")
            }else {
                print("oh no, there was a error :(")
            }
            
            let result = response.result
            print(result)
            
            let json = response.value
            print(json)
        }
        
        let person = Person(_name: "Lucke", heigt: 188)
        let  secondPerson = Person(_name: "Alex", heigt: 190)
        labe1.text = person.name
        label2.text = "Mass is\(person.mass)"
        
        
    }
}

enum HairColor: String{
    
    case light = "Light"
    case brown = "Brown"
    case black = "Black"
    case blond = "blond"
    
}

struct Person {
    
    var name = ""
    var height = 0
    var mass = 0
    var hairColor : HairColor = .blond
    var skinColor = " "
    var eyeColor = " "
    var gender = " "
    var homeworld = " "
    
    init(_ name: String) {
        self.name = name
    }
    
    
    init( _name: String, heigt: Int) {
        self.name = name
    }
    init( _name: String, heigt: Int, hairColor: HairColor) {
        self.name = name
    }

    
    func getName() -> String {
        return self.name
    }
}
