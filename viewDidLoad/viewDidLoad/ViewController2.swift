//
//  ViewController2.swift
//  viewDidLoad
//
//  Created by 邱慧珊 on 2023/3/18.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    
    var labelBye = UILabel()

    //一進入畫面
    override func viewDidLoad() {
        super.viewDidLoad()
        addmyphotoDevel()
        
        labelBye.frame = CGRect(x: 50, y: 150, width: 300, height: 100)
        labelBye.font = UIFont(name: "Helvetica-Bold", size: 50)
        labelBye.text = "trick or treat"
        labelBye.textColor = .systemYellow
        view.addSubview(labelBye)
    }
    
    
    //程式碼加上照片(非Storyboard)
    func addmyphotoDevel() {
        var image = UIImage(named: "再見圖.png")
        var posterImageView = UIImageView(image: image)
        
        posterImageView.frame = CGRect(x: 1, y: 230, width: 400, height: 440)
        view.insertSubview(posterImageView, at: 1)
        
        //posterImageView.class = UISharpLmageView
    }
    

        
}
