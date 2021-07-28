//
//  Screen2ViewController.swift
//  Test1Starter
//
//  Created by Mayank Arya on 2021-03-26.
//  Copyright © 2021 zebra. All rights reserved.
//

import UIKit

class Screen2ViewController: UIViewController {

    var pokemon : Pokemon?
    
    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var playerPokemonLabel: UILabel!
    @IBOutlet weak var computerPokemonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeGame()
    }
    

    func initializeGame(){
        guard var playerPokemonExp = pokemon?.exp, let playerPokemonType = pokemon?.pokemonType else {
            return
        }
        playerPokemonLabel.text = "\(playerPokemonType.rawValue) has \(playerPokemonExp)"
        let arrayOfPokemons = [PokemonType.GRASS,PokemonType.WATER,PokemonType.ELECTRIC]
        let computerRandomPokemon = arrayOfPokemons[Int.random(in: 0...2)]
        let computerRandomExp = Int.random(in: 100...150)
        
        computerPokemonLabel.text = "\(computerRandomPokemon.rawValue) has \(computerRandomExp)"
        if(playerPokemonType == PokemonType.ELECTRIC && computerRandomPokemon == PokemonType.WATER){
            
            let oldPlayerPokemonExp = playerPokemonExp
            
            playerPokemonExp = playerPokemonExp + (playerPokemonExp * 20)/100
            
            playerPokemonLabel.textColor = UIColor.yellow
            playerPokemonLabel.backgroundColor = UIColor.black
            playerPokemonLabel.text = "Electric pokemon has \(oldPlayerPokemonExp)exp. New exp: \(playerPokemonExp)"
        }
        checkWinner(computerPokemonType: computerRandomPokemon, computerPokemonExp: computerRandomExp, playerPokemonExp : playerPokemonExp )
    }
    
    
    func checkWinner(computerPokemonType : PokemonType , computerPokemonExp : Int, playerPokemonExp : Int){
        
        if(computerPokemonExp > playerPokemonExp){
            gameResultLabel.text = "Winner is : Computer"
        }else{
            gameResultLabel.text = "Winner is : Player"
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

 

}
