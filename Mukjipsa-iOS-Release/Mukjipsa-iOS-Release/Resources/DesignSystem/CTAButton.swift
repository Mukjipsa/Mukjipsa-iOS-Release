//
//  CTAButton.swift
//  Mukjipsa-iOS-Release
//
//  Created by 강윤서 on 2023/02/28.
//

import UIKit

final class CTAButton: UIButton {
    
    // MARK: - Life Cycle
    
    init(frame: CGRect, title: String, radius: CGFloat = 16, font: UIFont = .bu1, fontSize: CGFloat = Number.bu1) {
        super.init(frame: frame)
        setUI(title, radius, font, fontSize)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CTAButton {
    private func setUI(_ title: String, _ radius: CGFloat, _ font: UIFont, _ fontSize: CGFloat) {
        backgroundColor = .primary
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = font
        layer.cornerRadius = 16
        setLineHeightAndletterSpacing(fontSize)
    }
}
