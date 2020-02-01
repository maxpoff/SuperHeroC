//
//  CharacterViewController.swift
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var heroSearchBar: UISearchBar!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroRaceLabel: UILabel!
    @IBOutlet weak var heroIntelligenceLabel: UILabel!
    @IBOutlet weak var heroStrengthLabel: UILabel!
    @IBOutlet weak var heroSpeedLabel: UILabel!
    @IBOutlet weak var heroDurabilityLabel: UILabel!
    @IBOutlet weak var heroPowerLabel: UILabel!
    @IBOutlet weak var heroCombatLabel: UILabel!
    @IBOutlet weak var heroRealNameLabel: UILabel!
    
    //MARK: - Properties
    var hero: MOPCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heroSearchBar.delegate = self
    }
    
    func fetchImageAndUpdateUI(for hero: MOPCharacter) {
        MOPCharacterController.fetchCharacterImage(hero) { (image) in
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }
    }
    
    func characterInfoUpdate(for hero: MOPCharacter) {
        self.heroNameLabel.text = "Hero Alias: \(hero.name)"
        self.heroRealNameLabel.text = "Real Name: \(hero.biography.fullName)"
        self.heroRaceLabel.text = "Race: \(hero.appearance.race)"
        self.heroIntelligenceLabel.text = "Intelligence Rating: \(hero.powerstats.intelligence)"
        self.heroStrengthLabel.text = "Strength Rating: \(hero.powerstats.strength)"
        self.heroSpeedLabel.text = "Speed Rating: \(hero.powerstats.speed)"
        self.heroDurabilityLabel.text = "Durability Rating: \(hero.powerstats.durability)"
        self.heroPowerLabel.text = "Power Rating: \(hero.powerstats.power)"
        self.heroCombatLabel.text = "Combat Rating: \(hero.powerstats.combat)"
    }
}//End of class

extension CharacterViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        
        MOPCharacterController.fetchCharacterInfo(searchTerm) { (hero) in
            DispatchQueue.main.async {
                guard let hero = hero else {return}
                searchBar.text = ""
                self.characterInfoUpdate(for: hero)
                self.fetchImageAndUpdateUI(for: hero)
            }
        }
    }
}
