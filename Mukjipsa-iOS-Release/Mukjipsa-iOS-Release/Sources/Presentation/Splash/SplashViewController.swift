//
//  SplashViewController.swift
//  Mukjipsa-iOS-Release
//
//  Created by 강윤서 on 2023/01/30.
//

import UIKit

import SnapKit
import Then

final class SplashViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let logoImageView = UIImageView()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

private extension SplashViewController {
    func setUI() {
        view.backgroundColor = .secondary
//        logoImageView.image =
    }
    
    func setLayout() {
        view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(261)
        }
    }
}
