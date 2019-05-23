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
    

    
    var resultSearchController: UISearchController?
    var listaFiltrata = [Pokemon]()
    
    
    
    func filtraContenuti(testoCercato: String, scope:String) {
        listaFiltrata.removeAll(keepingCapacity: true)
        print("testocercato = \(testoCercato)")
        for x in listaPkmn {
            
                    if x.nomePkmn.lowercased().hasPrefix(testoCercato.localizedLowercase) {
                        print("trovato \(x.nomePkmn) con \(testoCercato.localizedLowercase)")
                        listaFiltrata.append(x)
                    } else {
                        print("NON trovato \(x.nomePkmn) con \(testoCercato.localizedLowercase)")
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
            return listaPkmn.count
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
        
        //riempio la cella assegnando ad una label testuale il nome del pokemon

        cella.textLabel?.text = pokemon.nomePkmn
        cella.imageView?.image = UIImage(named: "\(pokemon.numero)")
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
            let indexPath = tableView.indexPathForSelectedRow
            guard let numeroRiga = indexPath?.row else {
                print("Nessuna riga selezionata")
                return
            }
            guard let pokemonDetailViewController = segue.destination as? DetailViewController else {
                print("Non è il controller giusto")
                return
            }
            if self.resultSearchController?.isActive ?? true {
                let numeroPokemon = self.listaFiltrata[numeroRiga].numero
                pokemonDetailViewController.numeroPokemon = numeroPokemon
            } else {
                let numeroPokemon = listaPkmn[numeroRiga].numero
                pokemonDetailViewController.numeroPokemon = numeroPokemon
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
