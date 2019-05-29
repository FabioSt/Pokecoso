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
import Photos

class ArViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var shutterButton: UIButton!
    
    @IBAction func shotAction(_ sender: Any) {
        guard shutterButton.isEnabled else {
            return
        }
        
        let takeScreenshotBlock = {
            //Render and capture an UIView named view:
            UIGraphicsBeginImageContextWithOptions(self.view.frame.size, false, 0.0)
            self.view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
            UIGraphicsEndImageContext();
            
            
            DispatchQueue.main.async {
                // briefly flash the screen
                let flashOverlay = UIView(frame: self.sceneView.frame)
                flashOverlay.backgroundColor = UIColor.white
                self.sceneView.addSubview(flashOverlay)
                UIView.animate(withDuration: 0.25, animations: {
                    flashOverlay.alpha = 0.0
                }, completion: { _ in
                    flashOverlay.removeFromSuperview()
                })
            }
        }
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            takeScreenshotBlock()
        case .restricted, .denied:
            let alertController = UIAlertController(title: "Photo access denied", message: "Please enable Photos Library access for this appliction in Settings > Privacy.", preferredStyle: UIAlertController.Style.alert)
            let actionOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(actionOK)
            present(alertController, animated: true, completion: nil)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    takeScreenshotBlock()
                }
            })
        @unknown default:
            print("no")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scatta", style: .done, target: self, action: #selector(shotAction))
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
    
    func addPika(x: Float = 0.1, y: Float = 0.6, z: Float = -5) {
        guard let pikaScene = SCNScene(named: "model-pika.dae") else {
            print("niente pokémon")
            return }
        print(pikaScene)
        let pikaNode = SCNNode()
        let pikaSceneChildNodes = pikaScene.rootNode.childNodes
        for childNode in pikaSceneChildNodes {
            pikaNode.addChildNode(childNode)
        }
        pikaNode.position = SCNVector3(x, y, z)
        pikaNode.scale = SCNVector3(0.04, 0.04, 0.04)
        sceneView.scene.rootNode.addChildNode(pikaNode)
        
    }
}
