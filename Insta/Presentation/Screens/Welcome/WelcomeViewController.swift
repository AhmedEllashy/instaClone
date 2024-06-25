//
//  WelcomeViewController.swift
//  Insta
//
//  Created by Ahmad Ellashy on 12/06/2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    //MARK: - Properties

    //MARK: - UIViews
    @IBOutlet weak var welcomeLabel : UILabel!
    @IBOutlet weak var welcomeButtonsView: UIView!
    @IBOutlet weak var contentView: UIView!
    private lazy var signInWithGoogleButton : UIButton = {
        let button : UIButton = UIButton(frame: .zero)
//        let image = UIImage(named: "instagram")
        //Warning!!! Still Didnot config Image Size right
//        button.setImage(image, for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Sign in With Google", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12.0
        button.addTarget(self, action: #selector(didTapSignInWithGoogle), for: .touchUpInside)
        return button
    }()
    
    var signInWithFaceBookButton : UIButton = {
        let button : UIButton = UIButton(frame: .zero)
        button.setTitle("Sign in With Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12.0
        return button
    }()
    var signInWithAppleButton : UIButton = {
        let button : UIButton = UIButton(frame: .zero)
        button.setTitle("Sign in With Apple", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12.0
        return button
    }()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeButtonsView.addSubview(signInWithGoogleButton)
        welcomeButtonsView.addSubview(signInWithFaceBookButton)
        welcomeButtonsView.addSubview(signInWithAppleButton)
        let vc = MainTabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configUIViews()
    }
    
    //MARK: - Functions
   private func configUIViews(){
//        view.clipsToBounds = true
        signInWithGoogleButton.frame = CGRect(x: 0, y: 20, width: contentView.width, height: 60)
        signInWithFaceBookButton.frame = CGRect(x: 0, y: signInWithGoogleButton.bottom + 20, width: contentView.width, height: 60)
        signInWithAppleButton.frame = CGRect(x: 0, y: signInWithFaceBookButton.bottom + 20, width: contentView.width, height: 60)
    }
    @objc private func didTapSignInWithGoogle(){
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
