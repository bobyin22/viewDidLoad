//
//  ViewController1.swift
//  viewDidLoad
//
//  Created by 邱慧珊 on 2023/3/18.
//

import UIKit
import SpriteKit
import AVFoundation

let label1 = UILabel()  //點點看

class ViewController1: UIViewController {

    //程式碼一開始顯示
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupGradientLayer()    //使用背景漸層函式
        snow()                  //使用下雪SpriteKit
        addmyphoto()
        addDrawing()            //使用動畫函式
        playMusic()
        addPartyText()
    }

    
    //背景漸層函式
    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        //由上到下 顏色漸層
        gradientLayer.colors = [
            CGColor(srgbRed: 1/255, green: 3/255, blue: 4/255, alpha: 1),
            CGColor(srgbRed: 27/255, green: 47/255, blue: 53/255, alpha: 1),
            CGColor(srgbRed: 5/255, green: 17/255, blue: 20/255, alpha: 1),
            CGColor(srgbRed: 25/255, green: 39/255, blue: 42/255, alpha: 1),
            //UIColor.black.cgColor 有看到同學也可以這樣寫
        ]
        //print(gradientLayer.startPoint) //預設是(0.5, 0.0)
        //print(gradientLayer.endPoint)   //預設是(0.5, 1.0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)  //左上0,0
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)    //右下1,1
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //愛心路徑
    func addDrawing() -> UIView {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 271, y: 219))
        path.addLine(to: CGPoint(x: 265, y: 210))
        path.addLine(to: CGPoint(x: 255, y: 202))
        path.addLine(to: CGPoint(x: 251, y: 200))
        path.addLine(to: CGPoint(x: 245, y: 198))
        path.addLine(to: CGPoint(x: 236, y: 197))
        path.addLine(to: CGPoint(x: 227, y: 200))
        path.addLine(to: CGPoint(x: 219, y: 205))
        path.addLine(to: CGPoint(x: 208, y: 218))
        path.addLine(to: CGPoint(x: 207, y: 241))
        path.addLine(to: CGPoint(x: 213, y: 262))
        path.addLine(to: CGPoint(x: 224, y: 279))
        path.addLine(to: CGPoint(x: 240, y: 296))
        path.addLine(to: CGPoint(x: 240, y: 296))
        path.addLine(to: CGPoint(x: 246, y: 301))
        path.addLine(to: CGPoint(x: 252, y: 304))
        path.addLine(to: CGPoint(x: 259, y: 309))
        path.addLine(to: CGPoint(x: 261, y: 310))
        path.addLine(to: CGPoint(x: 269, y: 313))
        path.addLine(to: CGPoint(x: 271, y: 313))
        
        
        //path.close()
        let leftHeart = CAShapeLayer()
        leftHeart.fillColor = UIColor.clear.cgColor //  不要內部顏色
        leftHeart.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 1, alpha: 1)
        leftHeart.lineWidth = 3
        leftHeart.path = path.cgPath
        view.layer.addSublayer(leftHeart)
        
        //愛心另一半用程式反轉
        let moveDistance = path.bounds.maxX + path.bounds.minX + path.bounds.width
        let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
        path.apply(transform)
        let rightHeart = CAShapeLayer()
        rightHeart.path = path.cgPath
        rightHeart.fillColor = UIColor.clear.cgColor
        rightHeart.strokeColor = UIColor.red.cgColor
        rightHeart.backgroundColor = UIColor.yellow.cgColor
        rightHeart.lineWidth = 5
        view.layer.addSublayer(rightHeart)
        
        //動畫
        //建立讓外框自己畫的動畫效果
        //keyPath參數設定strokeEnd就是畫輪廓的動畫
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        //fromValue和toValue設定從頭畫到尾
        animation.fromValue = 0
        animation.toValue = 1
        //duration設定3秒內畫完
        animation.duration = 3
        //repeatCount無限循環
        animation.repeatCount = .greatestFiniteMagnitude
        //將建築物輪廓加上動畫效果
        rightHeart.add(animation, forKey: nil)
        
        return view
    }
    
    //下雪函式
    func snow() {
        //建立用來放粒子動畫的view
        let skView = SKView(frame: view.frame)
        //希望加了粒子效果後仍可以看見漸層背景一定要設定這個！
        skView.allowsTransparency = true
        //將這個view插在漸層背景之上，建築物之下，所以設定1
        view.insertSubview(skView, at: 1)
        //建立顯示粒子動畫的scene
        let scene = SKScene(size: skView.frame.size)
        //讓粒子動畫view播放這個scene
        skView.presentScene(scene)
        //用設定好的粒子檔來建立可用scene播放的粒子動畫物件
        let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
        //將粒子動畫物件交給scene
        scene.addChild(emitterNode!)
        //設定scene播放的位置
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        //設定粒子動畫的背景為透明，不要遮到漸層背景
        scene.backgroundColor = UIColor.clear
    }
    
    //使用SharpLmageView類
    //程式碼加上照片(非Storyboard)
    func addmyphoto() {
        var image = UIImage(named: "巫婆.png")
        var posterImageView = SharpLmageView(image: image)
        
        posterImageView.frame = CGRect(x: 100, y: 290, width: 200, height: 350)
        view.insertSubview(posterImageView, at: 1)
        
        //posterImageView.class = UISharpLmageView
    }
    
    //加上音樂
    let player = AVPlayer()
    var looper: AVPlayerLooper?
    func playMusic() {
        let url = Bundle.main.url(forResource: "巫師歌", withExtension: "mp3")!
        let player = AVQueuePlayer()
        let item = AVPlayerItem(url: url)
        looper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
    }
    
    
    //加入文字
    func addPartyText () {
        var labelParty = UILabel()
        labelParty.frame = CGRect(x: 70, y: 650, width: 300, height: 100)
        labelParty.font = UIFont(name: "Helvetica-Bold", size: 50)
        labelParty.text = "Let's Party"
        labelParty.textColor = .systemRed
        view.addSubview(labelParty)

    }


}
