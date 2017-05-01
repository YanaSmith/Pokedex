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
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var hightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokemonIDLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        mainImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        currentEvoImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        pokemonIDLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail { 
            // Whatever we write will onliy be called after the network code is completed
            print("Did we atrrive here")
            self.updateUI()
        }
       
    }
    
    func updateUI() {
        
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        hightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
            
        } else {
            
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
        
        
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
        
    }
   
   }
