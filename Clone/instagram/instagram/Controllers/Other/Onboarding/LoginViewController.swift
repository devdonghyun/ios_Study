//
//  LoginViewController.swift
//  instagram
//
//  Created by 안동현 on 2022/01/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct K {
        static let cornerRadius: CGFloat = 8.0
        
    }

    private let usernameEmailField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        // 그냥 textField 자체에 왼쪽 뷰가 존재하는데 그 뷰가 기본적으로는 보이지 않는 모드로 되어 있어요. 그래서 우리는 leftView를 항상 나타내서 padding 효과를 내는 거죠.
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        // UIView는 화면의 직사각형 모양을 관리하는 객체
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        
        // layer: The view’s Core Animation layer used for rendering.
        field.layer.masksToBounds = true
        // clipsToBounds 는 UIView 의 하위 속성 중 하나
        // masksToBounds 은 CALayer 의 하위 속성 중 하나
        // 뷰의 Bounds를 벗어난 서브 뷰를 클립한다 -> view bounds 를 넘어간 시각적 콘텐츠는 잘려서 보이지 않는다.
        // 두 속성은 항상 같은 값을 가집니다.
        field.layer.cornerRadius = K.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = K.cornerRadius
        field.backgroundColor = .secondarySystemBackground

        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = K.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign Frames
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0)
        
        
        configureHeaderView()
    }
     
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // Add instagram logo
    }
    
    private func addSubViews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        
    }
    
    @objc private func didTapTermButton() {
        
    }
    
    @objc private func didTapPrivacyButton() {
        
    }
    
    @objc private func didTapCreateAccountButton() {
        
    }

}
