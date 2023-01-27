//
//  UIView+.swift
//  Mukjipsa-iOS-Release
//
//  Created by 황찬미 on 2023/01/27.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    /// 그림자 추가해 주는 메서드
    func addShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: Float, offset: CGSize) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = CGFloat(shadowRadius)
    }
    
    /// 전체 corner radius 값을 주는 메서드
    func makeRoundCorner(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    /// label의 글자수 제한 후, ...으로 보여 주는 메서드
    func limitTextCount(diaryText: String, limitNumber: Int) -> String {
        var limitText: String = ""
        
        if diaryText.count > limitNumber {
            limitText = String(diaryText.prefix(limitNumber) + "...")
        } else if diaryText.count <= limitNumber {
            limitText = diaryText
        }
        
        return limitText
    }
}
