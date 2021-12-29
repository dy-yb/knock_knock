//
//  LoginViewController.swift
//  knock_knock
//
//  Created by Daye on 2021/12/23.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

  // MARK: - UI

  lazy var kakaoLoginButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("login", for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
    button.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
    layout()
    // Do any additional setup after loading the view.
  }

  // MARK: - Layout
  func setView() {
    view.addSubview(kakaoLoginButton)
  }

  func layout() {
    NSLayoutConstraint.activate([
      kakaoLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      kakaoLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  @objc func doLogin() {
    print("clicked")
    if(UserApi.isKakaoTalkLoginAvailable()) {
      UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
        if let error = error {
          print(error)
        } else {
          print("loginWithKakaoTalk() success.")
          _ = oauthToken
        }
      }
    }
  }

}
