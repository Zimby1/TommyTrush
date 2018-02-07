//
//  GameViewController.swift
//  tommy
//
//  Created by Matteo De giuseppe on 22/01/18.
//  Copyright © 2018 ZIMBY. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    //questo metodo viene chiamato la prima volta che l'applicazione viene aperta
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creo una scena di dimensioni uguali a quelle del SKView
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        
        //mostro a schermo gli FPS
        skView.showsFPS = true
        //mostro il numero di nodi
        skView.showsNodeCount = true
        //ignoro l'ordine di renderizzazione dei nodi
        skView.ignoresSiblingOrder = true
        //setto il modo di rappresentare le dimensioni della scena in modo da non scalarle
        scene.scaleMode = .aspectFill
        scene.size = skView.frame.size    // per fermare la scena nei confini di ogni dispositivo
        //aggiungo alla SKView alla scena
        skView.presentScene(scene)
    }
}
