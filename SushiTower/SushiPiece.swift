//
//  SushiPiece.swift
//  SushiTower
//
//  Created by Parrot on 2019-02-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import SpriteKit

// A custom SpriteNode class.
// Used to represent a piece of sushi in the tower.
class SushiPiece: SKSpriteNode {
    
    var stick:SKSpriteNode!
    var stickPosition: String = ""
    
   
    
    
    // MARK: Variables
    // --------------------------------
    
    
    // MARK: Constructor - required nonsense
    // --------------------------------
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
//        self.texture = SKSpriteNode(imageNamed: "roll")

        
        
        
        self.stick = SKSpriteNode(imageNamed: "chopstick")
        
        let pos = Int.random(in: 1...2)
        
        
        if(pos == 0){
            
            self.stickPosition = ""
            
        }
        if(pos == 1){
            
            self.stick.position.x = self.position.x + 100
            self.stick.position.y = self.position.y - 10
            self.stickPosition = "right"
            
            
            let facingRight = SKAction.scaleX(to: -1, duration: 0)
            self.stick.run(facingRight)
            
              addChild(self.stick)
            
        }else if(pos == 2){
            self.stick.position.x = self.position.x - 100
            self.stick.position.y = self.position.y - 10
            
            self.stickPosition = "left"
            
              addChild(self.stick)
        }
        
        
        
      
        
      
    }
    
    // Required nonsense
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark:  Functions
    // --------------------------------
}
