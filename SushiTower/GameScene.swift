//
//  GameScene.swift
//  SushiTower
//
//  Created by Parrot on 2019-02-14.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene {
    
    let cat = SKSpriteNode(imageNamed: "character1")
   let sushiBase = SKSpriteNode(imageNamed: "roll")
    var chopsticks = SKSpriteNode()
    var sushi = SKSpriteNode()
    
//
//    var sushiTestPiece: SushiPiece = SushiPiece()
    
    var chopstickPosition:[String] = []
    var catPosition = "left"
    
    
    
    var sushiTower:[SushiPiece] = []
    var chopsticksArray:[SKSpriteNode] = []
      let SUSHI_GAP_WIDTH:CGFloat = 80;
    
   
    
    override func didMove(to view: SKView) {
        // add background
        
        
        
//        sushiTestPiece.position.x = 100;
//        sushiTestPiece.position.y = 600;
//        addChild(sushiTestPiece)
        
        
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = -1
        addChild(background)
        
       
        // add cat
        cat.position = CGPoint(x:self.size.width*0.25, y:100)
        addChild(cat)
        
        
        // Adding chopsticks to the GameScene
        
       
        
      
        // add base sushi pieces
        sushiBase.position = CGPoint(x:self.size.width*0.5, y: 100)
        addChild(sushiBase)
          towerSushi()
       
    }
    func towerSushi(){
        for _ in 0...5{
            self.spawnSushi()
        }
        
//        for i in 0...5 {
//        print("\(self.chopstickPosition[i])")
//                    }
    }
    
    
    func spawnSushi(){
        // 1.Make a sushi
        // 2.position sushi 10px above the previous one
        sushi = SushiPiece(imageNamed: "roll")
        

        
        if(self.sushiTower.count == 0){
            
            sushi.position.y = sushiBase.position.y + SUSHI_GAP_WIDTH
            sushi.position.x = self.size.width * 0.5
        }
        else{
            let previousSushi = sushiTower[self.sushiTower.count - 1 ]
            sushi.position.y = previousSushi.position.y + SUSHI_GAP_WIDTH
            sushi.position.x = self.size.width * 0.5
        }
        
        addChild(sushi)
        self.sushiTower.append(sushi as! SushiPiece)
        
        
         chopsticks = SKSpriteNode(imageNamed: "chopstick")
        
        // Random position for chopsticks
        
        let chopsticksPosition = Int.random(in: 0...2)
        
        if(chopsticksPosition == 1){
           
            chopsticks.position.x = sushi.position.x + 160
            chopsticks.position.y = sushi.position.y - 10
            
            self.chopstickPosition.append("right")
            
         
          
            
        }else if(chopsticksPosition == 2){
            chopsticks.position.x = sushi.position.x - 130
            chopsticks.position.y = sushi.position.y - 10
            chopsticks.xScale = -1
            
            self.chopstickPosition.append("left")
            
        }
        

//
//        addChild(chopsticks)
        self.chopsticksArray.append(chopsticks)
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // This is the shortcut way of saying:
        //      let mousePosition = touches.first?.location
        //      if (mousePosition == nil) { return }
        guard let mousePosition = touches.first?.location(in: self) else {
        
            
            return
        }
        
        print(mousePosition)
        
        
        let middleOfScreen = self.size.width/2
        
        if(mousePosition.x < middleOfScreen){
            cat.position = CGPoint(x:self.size.width*0.25, y:100)
            print("left")
            
            self.catPosition.append("left")
            
            let image1 = SKTexture(imageNamed: "character1")
            let image2 = SKTexture(imageNamed: "character2")
            let image3 = SKTexture(imageNamed: "character3")
            
            let punchAnimation = [image1,image2,image3,image1]
            let punchAnim = SKAction.animate(with: punchAnimation, timePerFrame: 0.5)
            self.cat.run(punchAnim)
            
            
            let showLeft = SKAction.scaleX(to: +1, duration: 0)
            self.cat.run(showLeft)
            
            
            //WIN LOSE DETECTION
            
            //1. if CAT and STICK are on the same sidde - OKAY ,keep going
            //2. if CAT and STICK are on the opposite sides - YOU LOSE
            
            let firstChopstick = self.chopstickPosition[0]
            
            if (catPosition == "left" && firstChopstick == "left") {
                          // you lose
                            print("Cat Position = \(catPosition)")
                                print("Stick Position = \(firstChopstick)")
                                print("Conclusion = LOSE")
                                print("------")
                       }
                    else if (catPosition == "right" && firstChopstick == "right") {
                            // you lose
                                print("Cat Position = \(catPosition)")
                                print("Stick Position = \(firstChopstick)")
                                print("Conclusion = LOSE")
                                print("------")
                        }
                    else if (catPosition == "left" && firstChopstick == "right") {
                            // you win
                                print("Cat Position = \(catPosition)")
                                print("Stick Position = \(firstChopstick)")
                                print("Conclusion = WIN")
                                print("------")
                        }
                    else if (catPosition == "right" && firstChopstick == "left") {
                            // you win
                                print("Cat Position = \(catPosition)")
                                print("Stick Position = \(firstChopstick)")
                                print("Conclusion = WIN")
                                print("------")
                        }
          
            
        }
        
        else if (mousePosition.x > middleOfScreen){
     
            
            
            cat.position = CGPoint(x:self.size.width*0.75, y:100)
            print("right")
            
            self.catPosition.append("right")
            
            let image1 = SKTexture(imageNamed: "character1")
            let image2 = SKTexture(imageNamed: "character2")
            let image3 = SKTexture(imageNamed: "character3")
            
            let punchTextures = [image1,image2,image3,image1]
            let punchAnim = SKAction.animate(with: punchTextures, timePerFrame: 0.5)
            self.cat.run(punchAnim)
            removeSushi()
            removeChopsticks()
            
            
            let showRight = SKAction.scaleX(to: -1, duration: 0)
            self.cat.run(showRight)
          
        }
        
        // DO a punch animation
     
        
    }
    
    func removeSushi(){
        
        let firstPiece = self.sushiTower.first
        
        if(firstPiece != nil){
        firstPiece?.removeFromParent()
        self.sushiTower.remove(at: 0)
        
            
            for piece in sushiTower{
                
                piece.position.y = piece.position.y - SUSHI_GAP_WIDTH
                
                
            }

        }}
    
    func removeChopsticks(){
        
      let firstChopsticks = self.chopsticksArray.first
        if(firstChopsticks != nil){
            firstChopsticks?.removeFromParent()
            self.chopsticksArray.remove(at: 0)
            
//            self.chopstickPosition.remove(at: 0)
            
            for piece in chopsticksArray{
                piece.position.y = piece.position.y - SUSHI_GAP_WIDTH
            }
        }
    
    }
    
  
    }
    

