//
//  NetWorkTools.swift
//  AdDemo
//
//  Created by 也许、 on 16/9/28.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit
import AFNetworking

class NetWorkTools: AFHTTPSessionManager {
    
    static let netWorkTools:NetWorkTools = {
        let obj = NetWorkTools()
        // 微博的数据类型是text/plain，AFN默认是不支持的，所以需要添加进去
        obj.responseSerializer.acceptableContentTypes = Set(arrayLiteral: "application/json", "text/json", "text/javascript", "text/plain", "text/html")
        return obj
    }()
    
    static func shareNetWorkTools() -> NetWorkTools {
        return netWorkTools
    }
    
}
