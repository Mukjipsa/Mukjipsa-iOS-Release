//
//  BaseTargetType.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/01/27.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: APIConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
