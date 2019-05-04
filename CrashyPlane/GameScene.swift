//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  GameScene.swift 
//  CrashyPlane 
// 
//  Created by AriSwift on 2019/5/3. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import SpriteKit
import GameplayKit
/// string valued "scoreDetect"
let scoreDetect = "scoreDetect"

class GameScene: SKScene {
    
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    override func didMove(to view: SKView) {
        createPlayer()
        createSky()
        createBackground()
        createGround()
        createScore()
    }
    
    
    
}
extension GameScene {
    
    func createPlayer() {
        let playerTexture = SKTexture(imageNamed: R.image.player1.name)
        player = SKSpriteNode(texture: playerTexture)
        player.position = CGPoint(x: frame.width / 6, y: frame.height * 0.75)
        player.zPosition = 10
        addChild(player)
    }
    
    func createSky() {
        ///top UIColor(hue: 0.55, saturation: 0.14, brightness: 0.97, alpha: 1)
        ///bottom UIColor(hue: 0.55, saturation: 0.16, brightness: 0.96, alpha: 1)
        let topSky = SKSpriteNode(color: UIColor(hue: 0.55, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: frame.width , height: 0.67 * frame.height))
        topSky.anchorPoint = CGPoint(x: 0.5, y: 1)
        topSky.zPosition = -40
        topSky.position = CGPoint(x: frame.midX, y: frame.maxY)
        
        let bottomSky = SKSpriteNode(color: UIColor(hue: 0.55, saturation: 0.16, brightness: 0.96, alpha: 1), size: CGSize(width: frame.width , height: 0.33 * frame.height))
        bottomSky.anchorPoint = CGPoint(x: 0.5, y: 1)
        bottomSky.zPosition = -40
        bottomSky.position = CGPoint(x: frame.midX, y: 0.33 * frame.height)
        
        addChild(topSky)
        addChild(bottomSky)
    }
    
    func createBackground() {
        let backgroundTexture = SKTexture(imageNamed: R.image.background.name)
        for i in 0 ... 1 {
            let background = SKSpriteNode(texture: backgroundTexture)
            background.zPosition = -30
            background.anchorPoint = .zero
            background.position = CGPoint(x: CGFloat(i) * backgroundTexture.size().width, y: 100)
            addChild(background)
        }
    }
    
    func createGround() {
        let groundTexture = SKTexture(imageNamed: R.image.ground.name)
        for i in 0...1{
            let ground = SKSpriteNode(texture: groundTexture)
            ground.zPosition = -10
            ground.position = CGPoint(x: (CGFloat(i) + 0.5) * groundTexture.size().width, y: groundTexture.size().height/2)
            ground.physicsBody = SKPhysicsBody(texture: groundTexture, size: groundTexture.size())
            ground.physicsBody?.isDynamic = false
            addChild(ground)
        }
    }
    
    func createRocks() {
        let rockTexture = SKTexture(imageNamed: R.image.rock.name)
        let topRock = SKSpriteNode(texture: rockTexture)
        
        topRock.zRotation = .pi
        topRock.xScale = -1
        topRock.zPosition = -20
        
        let bottomRock = SKSpriteNode(texture: rockTexture)
        bottomRock.zPosition = -20
        
        let rockCollision = SKSpriteNode(color: .red, size: CGSize(width: 32, height: frame.height))
        rockCollision.name = scoreDetect
        
        addChild(topRock)
        addChild(bottomRock)
        addChild(rockCollision)
        
        let xPosition = frame.width + topRock.frame.width
        
        let max = CGFloat(frame.width/3)
        let yPosition = CGFloat.random(in: -50...max)
        
        let rockDistance: CGFloat = 70
        
        topRock.position = CGPoint(x: xPosition, y: yPosition + topRock.size.height + rockDistance)
        bottomRock.position = CGPoint(x: xPosition, y: yPosition - rockDistance)
        rockCollision.position = CGPoint(x: xPosition + rockCollision.size.width * 2, y: frame.midY)
    }
    
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 24
        
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 60)
        scoreLabel.text = "SCORE: 0"
        scoreLabel.fontColor = UIColor.black
        
        addChild(scoreLabel)
    }
    
    func createLogo() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
}
