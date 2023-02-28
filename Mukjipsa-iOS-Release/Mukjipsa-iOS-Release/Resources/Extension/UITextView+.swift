//
//  UITextView+.swift
//  Mukjipsa-iOS-Release
//
//  Created by 강윤서 on 2023/02/28.
//

import UIKit

extension UITextView {
    /// 자간 설정 메서드
    func setletterSpacing(spacing: CGFloat) {
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedStr.length))
        self.attributedText = attributedStr
    }
    
    /// 행간 설정 메서드
    func setLineSpacing(linespaicing: CGFloat) {
        if let text = self.text {
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = linespaicing
            attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedStr.length))
            self.attributedText = attributedStr
        }
    }
    
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
}
