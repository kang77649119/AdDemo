//
//  AdVC.swift
//  AdDemo
//
//  Created by 也许、 on 16/9/28.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit
import AFNetworking
import SDWebImage

class AdVC: UIViewController {
    
    let iPhone7P = UIScreen.main.bounds.height == 736
    let iPhone7 = UIScreen.main.bounds.height == 667
    let iPhone5 = UIScreen.main.bounds.height == 568
    let iPhone4S = UIScreen.main.bounds.height == 48
    
    // 倒计时时间
    var time = 3
    
    // 定时器
    var timer:Timer?
    
    // 倒计时按钮
    @IBOutlet weak var timeBtn: UIButton!
    
    // 启动图片
    @IBOutlet weak var launchImg: UIImageView!
    
    // 广告容器
    @IBOutlet weak var adContainView: UIView!
    
    // 广告图片
    lazy var adImage:UIImageView =  UIImageView()
    
    // 状态栏隐藏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        // 隐藏倒计时按钮
        self.timeBtn.isHidden = true

        // 显示启动图片
        showLaunchImage()
        
        // 加载网络数据
        loadAD()
        
        // 显示倒计时
        showTime()
        
    }
    
    // 显示启动图片
    func showLaunchImage() {
    
        if iPhone7P {
            self.launchImg.image = UIImage(named: "LaunchImage-800-Portrait-736h.png")
        } else if iPhone7 {
            self.launchImg.image = UIImage(named: "LaunchImage-800-667h.png")
        } else if iPhone5 {
            self.launchImg.image = UIImage(named: "LaunchImage-568h.png")
        } else {
            self.launchImg.image = UIImage(named: "LaunchImage.png")
        }
    
    }
    
    // 显示倒计时
    func showTime() {
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
        
            if self.time == 0 {
                self.timer?.invalidate()
                UIApplication.shared.keyWindow?.rootViewController = ViewController()
            }
            
            self.timeBtn.isHidden = false
            self.timeBtn.setTitle("倒计时\(self.time)", for: .normal)
            self.time -= 1
        }
    
    }
    
    // 跳过
    @IBAction func jumpAD(_ sender: UIButton) {
    
        UIApplication.shared.keyWindow?.rootViewController = ViewController()
        self.timer?.invalidate()
        
    }
    
    
    // 加载广告数据
    func loadAD() {
    
        Ad.loadData { (url) in
            
            if url != nil {
                
                let imgName = NSString(string: url!).lastPathComponent.components(separatedBy: ".").first!
                var sizeArray = imgName.components(separatedBy:"_")
                let width = CGFloat(Float(sizeArray.last!)! / 2)
                sizeArray.removeLast()
                let height = CGFloat(Float(sizeArray.last!)! / 2)
                
                let screenW = UIScreen.main.bounds.width
                let adHeight = (width / height) * screenW
                
                self.adImage.frame = CGRect(x: 0, y: 0, width: screenW, height: adHeight)
         
                self.adImage.sd_setImage(with: URL(string: url!), completed: { (_, _, _, _) in
                    self.adContainView.addSubview(self.adImage)

                })
            
                return
            }
            
            print("广告加载失败")
        }
    }

}
