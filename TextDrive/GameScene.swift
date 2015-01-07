//
//  GameScene.swift
//  TextDrive
//
//  Created by Corey Chang on 1/5/15.
//  Copyright (c) 2015 FastlaneFire. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
   // var upArrow:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        //self.addChild(myLabel)
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
        
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
        
        for i in 1...5 {
            makeArrow(Int(arc4random_uniform(4)+1))
            movingSprites()
            var wait = SKAction.waitForDuration(1)
            runAction(wait)
        }
        
        
        
    }
    
    
    
    /*
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
    */
    
    func moveArrowFromLevel(sprite: SKSpriteNode) {
        let moveArrow = SKAction.moveTo(CGPoint(x:frame.size.width/2, y:frame.size.height+10), duration: NSTimeInterval(CGFloat(3.0)))
        let removeArrow = SKAction.removeFromParent() //#4
        let moveArrowAndRemove = SKAction.sequence([moveArrow, removeArrow]) //#5
        sprite.runAction(moveArrowAndRemove)
    }
    private func movingSprites() {
        // #7
        for child in self.children as [SKNode] {
            if let sprite = child as? SKSpriteNode {  //#8
                if sprite.zPosition == 0 {        //#9
                    moveArrowFromLevel(sprite)
                }
            }
        }
    }

    func makeArrow(direction:Int) {
        var Arrow = SKSpriteNode()
        switch direction {
        case 1: Arrow = SKSpriteNode(imageNamed: "up")
                Arrow.name = "Up"
        case 2: Arrow = SKSpriteNode(imageNamed: "right")
                Arrow.name = "Right"
        case 3: Arrow = SKSpriteNode(imageNamed: "down")
                Arrow.name = "Down"
        case 4: Arrow = SKSpriteNode(imageNamed: "left")
                Arrow.name = "Left"
        default: break
        }
        
        Arrow.position = CGPoint(x:frame.size.width/2, y:0)
        Arrow.zPosition = 0
        self.addChild(Arrow)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer){
        println("swiped right")
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        println("swiped left")
    }
    
    func swipedUp(sender:UISwipeGestureRecognizer){
        println("swiped up")
        for child in self.children as [SKNode] {
            if let sprite = child as? SKSpriteNode {  //#8
                if sprite.name == "Up" {        //#9
                    println("Hit")
                    sprite.runAction(SKAction.removeFromParent())
                }
            }
        }

    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        println("swiped down")
    }
}
