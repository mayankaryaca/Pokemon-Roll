//
//  ViewController.swift
//  Test1Starter
//
//  Created by zebra on 2021-03-26.
//  Copyright © 2021 zebra. All rights reserved.
//

import UIKit

class Screen1ViewController: UIViewController {
    
    var GrassPokemonExp : Int = 0
    var WaterPokemonExp : Int = 0
    var ElectricPokemonExp : Int = 0
    // ---------------
    // MARK: Outlets
    // ---------------
    @IBOutlet weak var lblGrass: UILabel!
    @IBOutlet weak var lblWater: UILabel!
    @IBOutlet weak var lblElectric: UILabel!

    // ---------------
    // MARK: ViewDidLoad
    // ---------------
    override func viewDidLoad() {
           super.viewDidLoad()
           rollValues()
    }
    
    // ---------------
    // MARK: Actions
    // ---------------
    @IBAction func electricButtonPressed(_ sender: Any) {
        startBattle(with:PokemonType.ELECTRIC)
    }
    
    @IBAction func grassButtonPressed(_ sender: Any) {
        startBattle(with:PokemonType.GRASS)
    }
    
    @IBAction func waterButtonPressed(_ sender: Any) {
        startBattle(with:PokemonType.WATER)
    }
    
    @IBAction func rerollPressed(_ sender: Any) {
        print("You pressed the reroll button!")
        rollValues()
     
    }

    // ---------------
    // MARK: Functions
    // ---------------
    func startBattle(with pokemonType:PokemonType) {
        print("You picked a \(pokemonType) pokemon!")
        guard let  gameScreen = storyboard?.instantiateViewController(identifier: "GameScreen", creator: nil) as? Screen2ViewController else {
            print("Error")
            return
        }
        switch pokemonType {
        case PokemonType.GRASS :
            gameScreen.pokemon = Pokemon(exp: GrassPokemonExp, pokemonType: PokemonType.GRASS)
            show(gameScreen, sender: self)
        case PokemonType.WATER :
                gameScreen.pokemon = Pokemon(exp: WaterPokemonExp, pokemonType: PokemonType.WATER)
                show(gameScreen, sender: self)
        case PokemonType.ELECTRIC :
            gameScreen.pokemon = Pokemon(exp: ElectricPokemonExp, pokemonType: PokemonType.ELECTRIC)
            show(gameScreen, sender: self)
        }
        // TODO: Fill in this logic
    }
    func rollValues() {
        GrassPokemonExp = Int.random(in: 100...150)
        WaterPokemonExp = Int.random(in: 100...150)
        ElectricPokemonExp = Int.random(in: 100...150)
        lblGrass.text = "\(PokemonType.GRASS.rawValue) Pokemon (\(GrassPokemonExp) exp)"
        lblWater.text = "\(PokemonType.WATER.rawValue) Pokemon (\(WaterPokemonExp) exp)"
        lblElectric.text = "\(PokemonType.ELECTRIC.rawValue) Pokemon (\(ElectricPokemonExp)exp)"
    }
}

