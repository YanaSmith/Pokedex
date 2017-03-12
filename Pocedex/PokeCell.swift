//
//  PokeCell.swift
//  Pocedex
//
//  Created by Standart+ on 3/9/17.
//  Copyright © 2017 Yana Docheva. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    //Rounded corners of the cell
    
    //what if you want to save the state of your view to disk? This is a known as serialization. The reverse is deserialization - restoring the state of the object from disk.
    
//    The NSCoding protocol defines 2 methods to serialize and deserialize objects:
//    
//    encodeWithCoder(_ aCoder: NSCoder) {
//    // Serialize your object here
//    }
//    
//    init(coder aDecoder: NSCoder) {
//        // Deserialize your object here
//    }
//    So why is it needed in your custom class? The answer is Interface Builder. When you drag an object onto a storyboard and configure it, Interface Builder serializes the state of that object on to disk, then deserialize it when the storyboard appears on screen. You need to tell Interface Builder how to do those. At the very least, if you don't add any new properties to your subclass, you can simply ask the superclass to do the packing and unpacking for you, hence the super.init(coder: aDecoder) call. If your subclass is more complex, you need to add your own serialization and deserialization code for the subclass.
    
    required init?( coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    
    func configureCell(_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalized
        thumImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
    
}
