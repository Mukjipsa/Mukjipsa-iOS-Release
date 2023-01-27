//
//  UIViewController+.swift
//  Mukjipsa-iOS-Release
//
//  Created by 황찬미 on 2023/01/27.
//

import Foundation

extension UIViewController {
    
    /// Constraint 설정 시 노치 유무로 기기를 대응하는 상황에서 사용
    func constraintByNotch(_ hasNotch: CGFloat, _ noNotch: CGFloat) -> CGFloat {
        return UIScreen.main.hasNotch ? hasNotch : noNotch
    }
    
    /// 아이폰 12(width 380)를 기준으로 레이아웃을 잡고, 기기의 width 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByWidthRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 390) * Number.deviceWidth
    }
    
    /// 아이폰 12(height 844)를 기준으로 레이아웃을 잡고, 기기의 height 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByHeightRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 844) * Number.deviceHeight
    }
    
    /// 화면 진입시 키보드 바로 올라오게 해 주는 메서드
    func showKeyboard(textView: UIView) {
        textView.becomeFirstResponder()
    }
}
