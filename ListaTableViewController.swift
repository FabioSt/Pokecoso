//
//  ListaTableViewController.swift
//  Pokecoso3
//
//  Created by Fabbio on 20/05/2019.
//  Copyright © 2019 Fabbio. All rights reserved.
//

import UIKit



class ListaTableViewController: UITableViewController, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.filtraContenuti(testoCercato: searchController.searchBar.text!, scope: "Tutti")
    }
    

    
    var listaPkmn = [Pokemon]()
    var resultSearchController: UISearchController?
    var listaFiltrata = [Pokemon]()
    
    
    
    func filtraContenuti(testoCercato: String, scope:String) {
        listaFiltrata.removeAll(keepingCapacity: true)
        
        for x in listaPkmn {
            var justOne = false
            for (_, categoria) in x.categoria.enumerated() {
                if scope == "Tutti" || scope == categoria {
                    if x.nomePkmn.range(of: testoCercato.localizedLowercase) != nil && justOne == false {
                        listaFiltrata.append(x)
                        justOne = true
                    }
                }
            }
            tableView.reloadData()
        }
}

 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.listaPkmn = [
        Pokemon(nomePkmn: "Bulbasaur", categoria: [""]),
        Pokemon(nomePkmn: "Ivysaur", categoria: [""]),
        Pokemon(nomePkmn: "Venusaur", categoria: [""]),
        Pokemon(nomePkmn: "Charmander", categoria: [""]),
        Pokemon(nomePkmn: "Charmeleon", categoria: [""]),
        Pokemon(nomePkmn: "Charizard", categoria: [""]),
        Pokemon(nomePkmn: "Squirtle", categoria: [""]),
        Pokemon(nomePkmn: "Wartortle", categoria: [""]),
        Pokemon(nomePkmn: "Blastoise", categoria: [""]),
        Pokemon(nomePkmn: "Caterpie", categoria: [""]),
        Pokemon(nomePkmn: "Metapod", categoria: [""]),
        Pokemon(nomePkmn: "Butterfree", categoria: [""]),
        Pokemon(nomePkmn: "Weedle", categoria: [""]),
        Pokemon(nomePkmn: "Kakuna", categoria: [""]),
        Pokemon(nomePkmn: "Beedrill", categoria: [""]),
        Pokemon(nomePkmn: "Pidgey", categoria: [""]),
        Pokemon(nomePkmn: "Pidgeotto", categoria: [""]),
        Pokemon(nomePkmn: "Pidgeot", categoria: [""]),
        Pokemon(nomePkmn: "Rattata", categoria: [""]),
        Pokemon(nomePkmn: "Raticate", categoria: [""]),
        Pokemon(nomePkmn: "Spearow", categoria: [""]),
        Pokemon(nomePkmn: "Fearow", categoria: [""]),
        Pokemon(nomePkmn: "Ekans", categoria: [""]),
        Pokemon(nomePkmn: "Arbok", categoria: [""]),
        Pokemon(nomePkmn: "Pikachu", categoria: [""]),
        Pokemon(nomePkmn: "Raichu", categoria: [""]),
        Pokemon(nomePkmn: "Sandshrew", categoria: [""]),
        Pokemon(nomePkmn: "Sandslash", categoria: [""]),
        Pokemon(nomePkmn: "NidoranF", categoria: [""]),
        Pokemon(nomePkmn: "Nidorina", categoria: [""]),
        Pokemon(nomePkmn: "Nidoqueen", categoria: [""]),
        Pokemon(nomePkmn: "NidoranM", categoria: [""]),
        Pokemon(nomePkmn: "Nidorino", categoria: [""]),
        Pokemon(nomePkmn: "Nidoking", categoria: [""]),
        Pokemon(nomePkmn: "Clefairy", categoria: [""]),
        Pokemon(nomePkmn: "Clefable", categoria: [""]),
        Pokemon(nomePkmn: "Vulpix", categoria: [""]),
        Pokemon(nomePkmn: "Ninetales", categoria: [""]),
        Pokemon(nomePkmn: "Jigglypuff", categoria: [""]),
        Pokemon(nomePkmn: "Wigglytuff", categoria: [""]),
        Pokemon(nomePkmn: "Zubat", categoria: [""]),
        Pokemon(nomePkmn: "Golbat", categoria: [""]),
        Pokemon(nomePkmn: "Oddish", categoria: [""]),
        Pokemon(nomePkmn: "Gloom", categoria: [""]),
        Pokemon(nomePkmn: "Vileplume", categoria: [""]),
        Pokemon(nomePkmn: "Paras", categoria: [""]),
        Pokemon(nomePkmn: "Parasect", categoria: [""]),
        Pokemon(nomePkmn: "Venonat", categoria: [""]),
        Pokemon(nomePkmn: "Venomoth", categoria: [""]),
        Pokemon(nomePkmn: "Diglett", categoria: [""]),
        Pokemon(nomePkmn: "Dugtrio", categoria: [""]),
        Pokemon(nomePkmn: "Meowth", categoria: [""]),
        Pokemon(nomePkmn: "Persian", categoria: [""]),
        Pokemon(nomePkmn: "Psyduck", categoria: [""]),
        Pokemon(nomePkmn: "Golduck", categoria: [""]),
        Pokemon(nomePkmn: "Monkey", categoria: [""]),
        Pokemon(nomePkmn: "Primeape", categoria: [""]),
        Pokemon(nomePkmn: "Growlithe", categoria: [""]),
        Pokemon(nomePkmn: "Arcanine", categoria: [""]),
        Pokemon(nomePkmn: "Poliwag", categoria: [""]),
        Pokemon(nomePkmn: "Poliwhirl", categoria: [""]),
        Pokemon(nomePkmn: "Poliwrath", categoria: [""]),
        Pokemon(nomePkmn: "Abra", categoria: [""]),
        Pokemon(nomePkmn: "Kadabra", categoria: [""]),
        Pokemon(nomePkmn: "Alakazam", categoria: [""]),
        Pokemon(nomePkmn: "Machop", categoria: [""]),
        Pokemon(nomePkmn: "Machoke", categoria: [""]),
        Pokemon(nomePkmn: "Machamp", categoria: [""]),
        Pokemon(nomePkmn: "Bellsprout", categoria: [""]),
        Pokemon(nomePkmn: "Weepinbell", categoria: [""]),
        Pokemon(nomePkmn: "Victreebel", categoria: [""]),
        Pokemon(nomePkmn: "Tentacool", categoria: [""]),
        Pokemon(nomePkmn: "Tentacruel", categoria: [""]),
        Pokemon(nomePkmn: "Geodude", categoria: [""]),
        Pokemon(nomePkmn: "Graveler", categoria: [""]),
        Pokemon(nomePkmn: "Golem", categoria: [""]),
        Pokemon(nomePkmn: "Ponyta", categoria: [""]),
        Pokemon(nomePkmn: "Rapidash", categoria: [""]),
        Pokemon(nomePkmn: "Slowpoke", categoria: [""]),
        Pokemon(nomePkmn: "Slowbro", categoria: [""]),
        Pokemon(nomePkmn: "Magnemite", categoria: [""]),
        Pokemon(nomePkmn: "Magneton", categoria: [""]),
        Pokemon(nomePkmn: "Farfetch'd", categoria: [""]),
        Pokemon(nomePkmn: "Doduo", categoria: [""]),
        Pokemon(nomePkmn: "Dodrio", categoria: [""]),
        Pokemon(nomePkmn: "Seel", categoria: [""]),
        Pokemon(nomePkmn: "Dewgong", categoria: [""]),
        Pokemon(nomePkmn: "Grimer", categoria: [""]),
        Pokemon(nomePkmn: "Muk", categoria: [""]),
        Pokemon(nomePkmn: "Shellder", categoria: [""]),
        Pokemon(nomePkmn: "Cloyster", categoria: [""]),
        Pokemon(nomePkmn: "Gastly", categoria: [""]),
        Pokemon(nomePkmn: "Hunter", categoria: [""]),
        Pokemon(nomePkmn: "Gengar", categoria: [""]),
        Pokemon(nomePkmn: "Onix", categoria: [""]),
        Pokemon(nomePkmn: "Drowzee", categoria: [""]),
        Pokemon(nomePkmn: "Hypno", categoria: [""]),
        Pokemon(nomePkmn: "Krabby", categoria: [""]),
        Pokemon(nomePkmn: "Kingler", categoria: [""]),
        Pokemon(nomePkmn: "Voltorb", categoria: [""]),
        Pokemon(nomePkmn: "Electrode", categoria: [""]),
        Pokemon(nomePkmn: "Exeggcute", categoria: [""]),
        Pokemon(nomePkmn: "Exeggutor", categoria: [""]),
        Pokemon(nomePkmn: "Cubone", categoria: [""]),
        Pokemon(nomePkmn: "Marowak", categoria: [""]),
        Pokemon(nomePkmn: "Hitmonlee", categoria: [""]),
        Pokemon(nomePkmn: "Hitmonchan", categoria: [""]),
        Pokemon(nomePkmn: "Lickitung", categoria: [""]),
        Pokemon(nomePkmn: "Koffing", categoria: [""]),
        Pokemon(nomePkmn: "Weezing", categoria: [""]),
        Pokemon(nomePkmn: "Rhyhorn", categoria: [""]),
        Pokemon(nomePkmn: "Rhydon", categoria: [""]),
        Pokemon(nomePkmn: "Chansey", categoria: [""]),
        Pokemon(nomePkmn: "Tangela", categoria: [""]),
        Pokemon(nomePkmn: "Kangaskhan", categoria: [""]),
        Pokemon(nomePkmn: "Horsea", categoria: [""]),
        Pokemon(nomePkmn: "Seadra", categoria: [""]),
        Pokemon(nomePkmn: "Goldeen", categoria: [""]),
        Pokemon(nomePkmn: "Seaking", categoria: [""]),
        Pokemon(nomePkmn: "Staryu", categoria: [""]),
        Pokemon(nomePkmn: "Starmie", categoria: [""]),
        Pokemon(nomePkmn: "Mr.Mime", categoria: [""]),
        Pokemon(nomePkmn: "Schyter", categoria: [""]),
        Pokemon(nomePkmn: "Jinx", categoria: [""]),
        Pokemon(nomePkmn: "Electabuzz", categoria: [""]),
        Pokemon(nomePkmn: "Magmar", categoria: [""]),
        Pokemon(nomePkmn: "Pinsir", categoria: [""]),
        Pokemon(nomePkmn: "Tauros", categoria: [""]),
        Pokemon(nomePkmn: "Magikarp", categoria: [""]),
        Pokemon(nomePkmn: "Gyarados", categoria: [""]),
        Pokemon(nomePkmn: "Lapras", categoria: [""]),
        Pokemon(nomePkmn: "Ditto", categoria: [""]),
        Pokemon(nomePkmn: "Eevee", categoria: [""]),
        Pokemon(nomePkmn: "Vaporeon", categoria: [""]),
        Pokemon(nomePkmn: "Jolteon", categoria: [""]),
        Pokemon(nomePkmn: "Flareon", categoria: [""]),
        Pokemon(nomePkmn: "Porygon", categoria: [""]),
        Pokemon(nomePkmn: "Omanyte", categoria: [""]),
        Pokemon(nomePkmn: "Omastar", categoria: [""]),
        Pokemon(nomePkmn: "Kabuto", categoria: [""]),
        Pokemon(nomePkmn: "Kabutops", categoria: [""]),
        Pokemon(nomePkmn: "Aerodactyl", categoria: [""]),
        Pokemon(nomePkmn: "Snorlax", categoria: [""]),
        Pokemon(nomePkmn: "Articuno", categoria: [""]),
        Pokemon(nomePkmn: "Zapdos", categoria: [""]),
        Pokemon(nomePkmn: "Moltres", categoria: [""]),
        Pokemon(nomePkmn: "Dratini", categoria: [""]),
        Pokemon(nomePkmn: "Dragonair", categoria: [""]),
        Pokemon(nomePkmn: "Dragonite", categoria: [""]),
        Pokemon(nomePkmn: "Mewtwo", categoria: [""]),
        Pokemon(nomePkmn: "Mew", categoria: [""])
        ]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       
        //aggiorna la tabella ricaricando le funzioni
        self.tableView.reloadData()
        
        self.resultSearchController = ({
            // creo un oggetto di tipo UISearchController
            let controller = UISearchController(searchResultsController: nil)
            // rimuove la tableView di sottofondo in modo da poter successivamente visualizzare gli elementi cercati
            controller.dimsBackgroundDuringPresentation = false
            
            // il searchResultsUpdater, ovvero colui che gestirà gli eventi di ricerca, sarà la ListaTableViewController (o self)
            controller.searchResultsUpdater = self
            
            // impongo alla searchBar, contenuta all'interno del controller, di adattarsi alle dimensioni dell'applicazioni
            controller.searchBar.sizeToFit()
            
            // attacco alla parte superiore della TableView la searchBar
            self.tableView.tableHeaderView = controller.searchBar
            
            // restituisco il controller creato
            return controller
        })()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // se la search bar viene visualizzata allora ritorno il numero di elementi della lista filtrata se no quelli della lista pokemon
        guard let controller = self.resultSearchController else {
            return 0
        }
        
        if controller.isActive {
            return self.listaFiltrata.count
        } else {
            return self.listaPkmn.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cerca una cella con identifier uguale a "Cella" e ne recupera un'istanza
        // L'IDENTIFIER VIENE IMPOSTATO DALLO STORYBOARD
        let cella = tableView.dequeueReusableCell(withIdentifier: "Cella", for: indexPath)
        
        var pokemon : Pokemon
        
        // se viene la Search Bar è attiva allora utilizza l'elemento con indice visualizzato a partire dalla listra Filtrata
        if (resultSearchController?.isActive)! {
            pokemon = listaFiltrata[indexPath.row]
        } else {
            pokemon = listaPkmn[indexPath.row]
        }
        
        //riempio la cella assegnando ad una label testuale il nome dell'alimento
        cella.textLabel?.text = pokemon.nomePkmn
        cella.imageView?.image = UIImage(named: "\(indexPath.row+1)")
        cella.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cella
    }
    
    //se viene selezionato una riga della tabella attiva il segue per spostarti nella View dei Dettagli
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "dettaglioPokemonSegue", sender: tableView)
       
    }
    
    
    
    //quando viene attivato il segue setta il titolo della View di Dettaglio in base al nome
    //dell'elemento o cercato o selezionato
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dettaglioPokemonSegue" {
            let pokemonDetailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            _ = tableView.cellForRow(at: indexPath!)
            if self.resultSearchController?.isActive ?? true {
                let TitoloDestinazione = self.listaFiltrata[indexPath?.row ?? 0].nomePkmn
                pokemonDetailViewController.title = TitoloDestinazione
            } else {
                let TitoloDestinazione = self.listaPkmn[indexPath?.row ?? 0].nomePkmn
                pokemonDetailViewController.title = TitoloDestinazione
            }
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 }
