//
//  SignInViewController.swift
//  Insta
//
//  Created by Ahmad Ellashy on 13/06/2024.
//

import UIKit

class SignInViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - UIViews
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton : UIButton!
    
    var emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email..."
        textField.keyboardType = .emailAddress
        textField.borderStyle = .none
        textField.textContentType = .emailAddress
        return textField
    }()
    var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password..."
//        textField.keyboardType = .default
        textField.borderStyle = .none
//        textField.textContentType = .password
//        textField.isOpaque = true
        return textField
    }()
  
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.addSubview(emailTextField)
        passwordView.addSubview(passwordTextField)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configUIViews()
    }
    //MARK: - IBActions
    @IBAction func loginButtondDidTapped(_ sender: UIButton){
        print("login Tapped")
    }
    @IBAction func forgetPasswordButtonDidTapped(_ sender: UIButton){
        print("forget password Tapped")
    }
    @IBAction func signupButtonDidTapped(_ sender: UIButton){
        print("signup Tapped")
    }
    //MARK: - Fuctions
    private func configUIViews(){
        emailView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        emailTextField.frame = CGRect(x: 10, y: 0, width: emailView.width - 10, height: emailView.height)
        passwordTextField.frame = CGRect(x: 10, y: 0, width: passwordView.width - 10, height: passwordView.height)
    }
}
