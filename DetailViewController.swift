//
//  DetailViewController.swift
//  Pokecoso3
//
//  Created by Fabbio on 21/05/2019.
//  Copyright © 2019 Fabbio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    var bigImagesList = [BigImages]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigImageView.image = UIImage(named: "1b")
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
