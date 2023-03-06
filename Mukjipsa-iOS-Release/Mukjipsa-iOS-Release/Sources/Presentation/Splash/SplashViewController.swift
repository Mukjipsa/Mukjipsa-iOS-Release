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
        presentAuthViewController()
    }
}

private extension SplashViewController {
    func setUI() {
        view.backgroundColor = .secondary
        logoImageView.image = Image.logoSplash
    }
    
    func setLayout() {
        view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(261)
        }
    }
    
    func presentAuthViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 400) {
                let nextViewController = AuthViewController()
                nextViewController.modalPresentationStyle = .overFullScreen
                nextViewController.modalTransitionStyle = .crossDissolve
                self.present(nextViewController, animated: true)
            }
        }
    }
}
