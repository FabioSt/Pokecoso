//
//  DetailViewController.swift
//  Pokecoso3
//
//  Created by Fabbio on 21/05/2019.
//  Copyright © 2019 Fabbio. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var numeroPokemon: Int = 0
    var pokemonScelto: Pokemon?
    var musicPlayer : AVAudioPlayer!
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionText2: UITextView!
    @IBOutlet weak var pesoLabel: UILabel!
    
    @IBAction func btnSound(_ sender: UIButton) {
        initAudio()
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "\(pokemonScelto?.nomePkmn ?? "loremipsum")", ofType: "wav")
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path ?? "loremipsum")!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = 0
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonScelto = listaPkmn[numeroPokemon - 1]
        pesoLabel.text = pokemonScelto?.peso
        nameDetail.text = pokemonScelto?.nomePkmn
        self.title = pokemonScelto?.nomePkmn
        bigImageView.image = UIImage(named: "\(pokemonScelto?.nomePkmn ?? "loremipsum")")
        
        if let path = Bundle.main.path(forResource: "Bulbasaur", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                descriptionText2.text = myStrings.joined(separator: ", ")
            } catch {
                print(error)
            }
        }
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation

}
