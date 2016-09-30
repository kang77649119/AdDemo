//
//  Ad.swift
//  AdDemo
//
//  Created by 也许、 on 16/9/30.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit
import AFNetworking

class Ad : NSObject {
    
    // 广告接口地址
    static let adURL = "http://api.changba.com/ktvbox.php?ac=serverconfigs2&curuserid=25856171&channelsrc=appstore&version=6.0.5&token=T1e7eb8c51756faa&bless=0&macaddress=A843A568-202D-4D18-8A33-8D5EFC82AA7C&ismember=0&openudid=493d91252c722a7e11b96f032ce3412b2b730daa&systemversion=10.0.1&device=iPhone7,2&broken=0&callCount=0&isiphone5=1&secret=19f72eb2cd"

    // 广告图片地址
    var splashSreenPic:String?
    
    override init() {
        
    }
    
    // 加载广告
    class func loadData(finished: @escaping (String?) -> Void) {
        
        NetWorkTools.shareNetWorkTools().get(adURL, parameters: nil, progress: { (_) in
            
            }, success: { (_, response) in
                
                if response != nil {
                    let dict = (response as! NSDictionary)["result"] as! NSDictionary
                    let adObj = Ad(dict: dict)
                    finished(adObj.splashSreenPic)
                    return
                }
                
                finished(nil)
                
        }) { (_, error) in
            print(error)
        }

        
    }
    
    // 字典转模型
    init(dict:NSDictionary) {
        super.init()
        self.setValuesForKeys(dict as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    

}
