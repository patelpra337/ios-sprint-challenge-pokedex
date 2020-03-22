//
//  PokedexTableViewController.swift
//  ios-sprint-challenge-pokedex
//
//  Created by patelpra on 3/21/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {
    
    var pokemonController = PokemonController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonController.pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        
        let pokemon = self.pokemonController.pokemon[indexPath.row]
        cell.textLabel?.text = pokemon.name.capitalized
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pokemon = self.pokemonController.pokemon[indexPath.row]
            self.pokemonController.delete(with: pokemon)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSearchPokemon" {
            guard let pokemonDVC = segue.destination as? PokemonDetailViewController else { return }
            pokemonDVC.pokemonController = self.pokemonController
        } else if segue.identifier == "ToDetailPokemon" {
            guard let indexPath = self.tableView.indexPathForSelectedRow,
                let pokemonDVC = segue.destination as? PokemonDetailViewController else { return }
            
            let pokemon = self.pokemonController.pokemon[indexPath.row]
            pokemonDVC.pokemon = pokemon
            pokemonDVC.pokemonController = self.pokemonController
            pokemonDVC.detailView = true
        }
    }
}
