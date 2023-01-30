//
//  AuthViewController.swift
//  Mukjipsa-iOS-Release
//
//  Created by 강윤서 on 2023/01/30.
//

import UIKit

import AuthenticationServices
import SnapKit
import Then

final class AuthViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let logoImageView = UIImageView()
    private let appleLoginButton = UIButton()
    private let kakaoLoginButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

private extension AuthViewController {
    func setUI() {
        view.backgroundColor = .white
        appleLoginButton.do {
            $0.setTitle("애플로그인 버튼", for: .normal)
            $0.backgroundColor = .blue
        }
    }
    
    func setLayout() {
        view.addSubviews([logoImageView, appleLoginButton, kakaoLoginButton])
        
        appleLoginButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    func setAddTarget() {
        appleLoginButton.addTarget(self, action: #selector(doAppleLogin), for: .touchUpInside)
    }
    
    @objc
    func doAppleLogin() {
        appleLogin()
    }
    
    func appleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension AuthViewController : ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return  self.view.window!
    }
}

extension AuthViewController : ASAuthorizationControllerDelegate {
    //Apple ID 연동 성공시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            //Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential :
            
            //계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            let identityToken = appleIDCredential.identityToken
            let tokenString = String(data: identityToken!, encoding: .utf8)
            if let token = tokenString {
                print(token, "❣️")
                // postSocialLogin()
            }
        default:
            //실패할 때 실패VC로 이동
            break
        }
    }
}
