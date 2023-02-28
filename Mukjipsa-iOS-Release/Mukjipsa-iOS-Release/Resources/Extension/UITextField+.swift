//
//  UITextField+.swift
//  Mukjipsa-iOS-Release
//
//  Created by 강윤서 on 2023/02/28.
//

import UIKit

extension UITextField {
    /// 자간과 lineHeight를 모두 조정하는 메서드, lineHeight 1.25로 고정
    func setLineHeightAndletterSpacing(_ fontSize: CGFloat, _ letterSpacing: CGFloat = -0.02) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = Number.lineHeight
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .kern: letterSpacing,
                .baselineOffset: (fontSize * Number.lineHeight - fontSize) / 4
            ]
            
            let attributedStr = NSMutableAttributedString(string: text,
                                                          attributes: attributes)
            
            self.attributedText = attributedStr
        }
    }
    
    func addLeftPadding() {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
}
