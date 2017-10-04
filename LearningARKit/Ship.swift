//
//  Ship.swift
//  LearningARKit
//
//  Created by eric yu on 10/3/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit
import ARKit

class Ship: SCNNode {
    
    func loadShip(){
        guard let vShipObject = SCNScene(named: "art.scnassets/ship.scn") else
        {
            
            return}
        
        let wrapperNode = SCNNode()
        
        for child in vShipObject.rootNode.childNodes {
            
            wrapperNode.addChildNode(child)
        }
        
        self.addChildNode(wrapperNode)
    
    }

}
