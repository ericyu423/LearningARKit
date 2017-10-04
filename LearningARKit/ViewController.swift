//
//  ViewController.swift
//  LearningARKit
//
//  Created by eric yu on 10/3/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var arscnView: ARSCNView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let scene = SCNScene()
        arscnView.scene = scene
        addObject()
    }
    
    func addObject() {
        let ship = Ship()
        ship.loadShip()
        let xPosition = randomPosition(lb: -1.5, ub: 1.5)
        let yPosition = randomPosition(lb: -1.5, ub: 1.5)
        
        ship.position = SCNVector3(xPosition, yPosition, -1)
        arscnView.scene.rootNode.addChildNode(ship)
        
    }
    
    func randomPosition(lb lower: Float,ub upper: Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: arscnView)
            
            let hitList = arscnView.hitTest(location, options: nil)
            
            if let hitObject = hitList.first{
                let node = hitObject.node
                
                if node.name == "shipMesh" {
                    node.removeFromParentNode()
                    addObject()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //remeber to add info.plist Camera Usage
        // device capability arkit item1
        let configuration = ARWorldTrackingConfiguration()
        arscnView.session.run(configuration)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

