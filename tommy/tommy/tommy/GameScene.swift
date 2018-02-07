//
//  GameScene.swift
//  tommy
//
//  Created by Matteo De giuseppe on 22/01/18.
//  Copyright © 2018 ZIMBY. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
        //creo una costante torre che rappresenterà il nodo della Sprite torre
        let torre = SKSpriteNode(imageNamed: "Image")
        //questo metodo viene chiamato immediatamente dopo la creazione dell'SKView
    override func didMove(to view: SKView) {
            // setto a grigio il background della scena
            backgroundColor = SKColor.gray
            // definisco la posizione dove spawnare la sprite. moltiplicato per 0.1 significa ottenere un
            // valore uguale al 10% della larghezza, stesso discorso per l'altezza
            torre.position = CGPoint(x: 187, y: 100)
            // x=187 è la metà di un iphone x nelle x e 100 va bene per la nostra cosa
            // per farlo apparire nella scene view, dato che si tratta di una sprite (un'immagine)
            //bisogna renderla figlia della Scena
            addChild(torre)
            //aggiungo i mostri in modo infinito ad intervalli di 1 secondo dall'altro
            run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addNemico),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        }
    //ritorna un numero random
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    //ritorna un numero random compreso tra due numeri
    func random ( min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addNemico() {
        
        //Creo il nodo che rappresenta il nemico
        let nemico = SKSpriteNode(imageNamed: "Image2")
        
        // determino una x random da assegnare alle coordinate del nemico
        let randomX = arc4random_uniform(374)
        
        // posiziono il nemico assegnandogli una y e la x random generata prima
        nemico.position = CGPoint(x: CGFloat(randomX), y: size.width + nemico.size.width/2)
        
        // Aggiungo il nemico alla scena
        addChild(nemico)
        
        // creo una durata random della Sprite, questo influisce sulla velocità di movimento
        let durataRandom = random(min: CGFloat(4.0), max: CGFloat(2.0))
        
        // assegno un'azione al nemico, ovvero muoversi verso la coordinate x opposta
        let azioneMuovi = SKAction.move(to: CGPoint(x: CGFloat(randomX), y: -nemico.size.width/2), duration: TimeInterval(durataRandom))
        
        //quando finisce l'azione rimuovo il nodo dalla View
        let azioneMuoviFinita = SKAction.removeFromParent()
        nemico.run(SKAction.sequence([azioneMuovi, azioneMuoviFinita]))
        
    }
}
