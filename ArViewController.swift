//
//  ArViewController.swift
//  Pokecoso3
//
//  Created by Fabbio on 26/05/2019.
//  Copyright © 2019 Fabbio. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class ArViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
        addPika()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func addPika(x: Float = 1, y: Float = 0, z: Float = -0.3) {
        guard let pikaScene = SCNScene(named: "pikachu.dae") else { return }
        let pikaNode = SCNNode()
        let pikaSceneChildNodes = pikaScene.rootNode.childNodes
        for childNode in pikaSceneChildNodes {
            pikaNode.addChildNode(childNode)
        }
        pikaNode.position = SCNVector3(x, y, z)
        pikaNode.scale = SCNVector3(0.1, 0.1, 0.1)
        sceneView.scene.rootNode.addChildNode(pikaNode)
        sceneView.allowsCameraControl = true;
    }
}
