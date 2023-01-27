//
//  UIScreen+.swift
//  Mukjipsa-iOS-Release
//
//  Created by 황찬미 on 2023/01/27.
//

import UIKit

extension UIScreen {
    var hasNotch: Bool {
        return !( (UIScreen.main.bounds.width / UIScreen.main.bounds.height) > 0.5 )
    }
}
