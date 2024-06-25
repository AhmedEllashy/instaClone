//
//  SignInViewController.swift
//  Insta
//
//  Created by Ahmad Ellashy on 13/06/2024.
//

import UIKit

class SignInViewController: UIViewController {
    //MARK: - Properties
    private var seePasswordState: Bool = true
    private var imageConfig = UIImage.SymbolConfiguration(pointSize: 18)
    //MARK: - UIViews
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton : UIButton!
    
    private var emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email..."
        textField.keyboardType = .emailAddress
        textField.borderStyle = .none
        textField.textContentType = .emailAddress
        return textField
    }()
    private var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password..."
        textField.keyboardType = .default
        textField.borderStyle = .none
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        return textField
    }()

   private var seePasswordButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))
        button.setImage(image,for: .normal)
       button.addTarget(self, action: #selector(didTapSeeButtonState), for: .touchUpInside)
        return button
    }()
  
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true
        emailView.addSubview(emailTextField)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(seePasswordButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configUIViews()
        print(passwordTextField.right)
    }
    //MARK: - IBActions
    @IBAction func loginButtondDidTapped(_ sender: UIButton){
        let vc = MainTabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: true)
    }
    @IBAction func forgetPasswordButtonDidTapped(_ sender: UIButton){
        print("forget password Tapped")
        print(passwordTextField.right)

    }
    @IBAction func signupButtonDidTapped(_ sender: UIButton){
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    //MARK: - Fuctions
    private func configUIViews(){
        emailView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        emailTextField.frame = CGRect(x: 10, y: 0, width: emailView.width - 10, height: emailView.height)
        passwordTextField.frame = CGRect(x: 10, y: 0, width: passwordView.width - 80, height: passwordView.height)
        seePasswordButton.frame = CGRect(x: passwordTextField.right + 30, y: 0, width: passwordView.width - passwordTextField.width - 10, height: passwordView.height)
    }
    @objc private func didTapSeeButtonState(){
         var image: String = "eye.slash"
        seePasswordState.toggle()
        if seePasswordState {
            image = "eye.slash"
            passwordTextField.isSecureTextEntry = true
        }else{
            image = "eye"
            passwordTextField.isSecureTextEntry = false
        }
        seePasswordButton.setImage(UIImage(systemName: image,withConfiguration: imageConfig), for: .normal)
    }
}
