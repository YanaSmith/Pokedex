//
//  PokemonDatailVC.swift
//  Pocedex
//
//  Created by Standart+ on 3/12/17.
//  Copyright © 2017 Yana Docheva. All rights reserved.
//

import UIKit

class PokemonDatailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name

       
    }

   
    
}
