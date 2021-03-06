//
//  ViewController.swift
//  Was koche ich heute?
//
//  Created by Marc Haldenwang on 22.03.20.
//  Copyright © 2020 Generation Future. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var foodLabel: UILabel!
    
    let foodArray = ["Hähnchen-Curry", "Pizza Funghi", "Gyros & Reis", "Wraps", "Kaiserschmarrn", "Bolognese", "Chili con Carne"]

    
    //Vergleichsarray
    var currentNumber = [0,0]
    //Zähler für die Funktion
    var zaehler = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            
            suggestionButtonHandler(UIButton())
            
        }
    }
    
    
    
    @IBAction func suggestionButtonHandler(_ sender: UIButton) {
   
    
        
        //Anzahl der Einträge im Array
        let currentMeal = 0...(foodArray.count - 1)
        
     
        //Shufflen der Array-Einträge (zufällig)
        var shuffledMeal = currentMeal.shuffled()
     
       
        //Eintragen des jeweils ersten shuffledMeal Eintrags in neues Array zum Vergleichen
        currentNumber[zaehler] = shuffledMeal[0]
        
       
        //Vergleich von zwei aufeinanderfolgenden Einträgen in shuffledMeal auf dessen erster Stelle
        while (currentNumber[0] == currentNumber[1]) {
            
            
            shuffledMeal = currentMeal.shuffled()
            
          currentNumber[zaehler] = shuffledMeal[0]
             
        }
        
        
        //Zähler hochzählen bzw. zurücksetzen
        if (zaehler < 1) {
        
        zaehler += 1
        
        } else {
            
            
            zaehler = 0
            
            
        }
        //Setzt den Text auf den ersten Wert von shuffledMeal
        foodLabel.text = "\(foodArray[shuffledMeal[0]])"
        
        
    }
    
    
    
    
    
    
    
    
    
    
    

}

