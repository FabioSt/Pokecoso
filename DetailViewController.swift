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
    
    var musicPlayer : AVAudioPlayer!
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBAction func btnSound(_ sender: UIButton) {
        initAudio()
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "\(nameDetail.text ?? "loremipsum")", ofType: "wav")
        
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
        
        nameDetail.text = title
        bigImageView.image = UIImage(named: "\(nameDetail.text ?? "loremipsum")")
        
        if let path = Bundle.main.path(forResource: "\(nameDetail.text ?? "loremipsum")", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                descriptionText.text = myStrings.joined(separator: ", ")
            } catch {
                print(error)
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
