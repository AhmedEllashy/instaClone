//
//  SignUpViewController.swift
//  Insta
//
//  Created by Ahmad Ellashy on 13/06/2024.
//

import UIKit

class SignUpViewController: UIViewController {
//MARK: - UIViews
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var firstNameView : UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var emailView : UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    var firstNameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
        return textField
    }()
    var lastNameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last Name"
        return textField
    }()
    var emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .none
        textField.textContentType = .emailAddress
        return textField
    }()
    var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
//        textField.keyboardType = .default
        textField.borderStyle = .none
//        textField.textContentType = .password
//        textField.isOpaque = true
        return textField
    }()
    var mobileNumberTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Mobile Number"
        textField.keyboardType = .phonePad
        textField.borderStyle = .none
        textField.textContentType = .telephoneNumber
        return textField
    }()
    
//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configUIViews()
    }
//MARK: - Functions
    private func setup(){
        firstNameView.addSubview(firstNameTextField)
        lastNameView.addSubview(lastNameTextField)
        emailView.addSubview(emailTextField)
        passwordView.addSubview(passwordTextField)
        mobileView.addSubview(mobileNumberTextField)
        titleLabel.text = """
    Sign up to see photos and videos
    from your friends.
    """
        privacyLabel.text = """
  By Signing up, you agree to our
Terms, Data policy, and Cookies
policy.
"""
    }
    private func configUIViews(){
        firstNameView.layer.cornerRadius = 8.0
        lastNameView.layer.cornerRadius = 8.0
        emailView.layer.cornerRadius = 8.0
        passwordView.layer.cornerRadius = 8.0
        mobileView.layer.cornerRadius = 8.0
        signUpButton.layer.cornerRadius = 10.0
        //Align UIElements on screen
        firstNameTextField.frame = CGRect(x: 10, y: 0, width: firstNameView.width - 10, height: firstNameView.height)
        lastNameTextField.frame = CGRect(x: 10, y: 0, width: lastNameView.width - 10, height: lastNameView.height)
        emailTextField.frame = CGRect(x: 10, y: 0, width: emailView.width, height: emailView.height)
        passwordTextField.frame = CGRect(x: 10, y: 0, width: passwordView.width - 10, height: passwordView.height)
        mobileNumberTextField.frame = CGRect(x: 10, y: 0, width: mobileView.width - 10, height: mobileView.height)
    }
    //MARK: - IBActions
    @IBAction func didTapSignUp(_ sender: UIButton){
        print("sign in tapped")
    }
    @IBAction func didTapLogin(_ sender: UIButton){
        print("login tapped")
    }
}
