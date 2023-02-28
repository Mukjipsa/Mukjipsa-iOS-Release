//
//  UIButton+.swift
//  Mukjipsa-iOS-Release
//
//  Created by 강윤서 on 2023/02/28.
//

import UIKit

extension UIButton {
    /// 자간과 lineHeight를 모두 조정하는 메서드, lineHeight 1.25로 고정
    func setLineHeightAndletterSpacing(_ fontSize: CGFloat, _ letterSpacing: CGFloat = -0.02) {
        if let text = self.titleLabel?.text {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = Number.lineHeight
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .kern: letterSpacing,
                .baselineOffset: (fontSize * Number.lineHeight - fontSize) / 4
            ]
            
            let attributedStr = NSMutableAttributedString(string: text,
                                                          attributes: attributes)
            
            self.setAttributedTitle(attributedStr, for: .normal)
        }
    }
}
