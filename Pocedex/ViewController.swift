//
//  ViewController.swift
//  Pocedex
//
//  Created by Standart+ on 3/6/17.
//  Copyright © 2017 Yana Docheva. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMod = false
    
    
    
    var musicPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        searchBar.delegate = self
        
        //Changing the search button in the keyboard with done
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonCSV()
        //initAudio()
        
    }
    
//    func initAudio() {
//        
//        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
//        
//        do {
//        
//              musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
//              musicPlayer.prepareToPlay()
//              musicPlayer.numberOfLoops = -1//Loops continuasly
//              musicPlayer.play()
//            
//        } catch let error as NSError {
//            
//            print(error.debugDescription)
//        }
//    }
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
           
            for row in rows {
                
                let pokeID = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeID)
                self.pokemon.append(poke)
                
            }
             print(pokemon.count)
            
        } catch let err as NSError {
            print(err.debugDescription)
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke: Pokemon
            
            if inSearchMod {
                
                poke = filteredPokemon[indexPath.row]
                cell.configureCell(poke)
                
            } else {
                
                poke = pokemon[indexPath.row]
                cell.configureCell(poke)
                
            }

            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if inSearchMod {
            
            return filteredPokemon.count
        }
            return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }

    @IBAction func audioButton(_ sender: UIButton) {
//        initAudio()
//        
//        if musicPlayer.isPlaying {
//            
//            musicPlayer.pause()
//            sender.alpha = 0.2
//            
//        } else {
//            
//            musicPlayer.play()
//            sender.alpha = 1.0
//        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMod = false
            collection.reloadData()
            view.endEditing(true)
            
            
        } else {
            inSearchMod = true
            let lower = searchBar.text?.lowercased()
            
            filteredPokemon = pokemon.filter({$0.name.lowercased().hasPrefix(lower!) })
            collection.reloadData()
        }
    }
   
}




















