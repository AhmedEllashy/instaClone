//
//  CommentsViewController.swift
//  Insta
//
//  Created by mac on 6/23/24.
//

import UIKit

class CommentsViewController: UIViewController {
    //MARK: - Properities
    //MARK: - UIViews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    private var bottomView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.2
        view.backgroundColor = .white
        return view
    }()
    private var addCommentView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.2
        view.backgroundColor = .systemGray5
        view.clipsToBounds = true
        return view
    }()
    private var commentTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your comment..."
        textField.keyboardType = .emailAddress
        textField.borderStyle = .none
        textField.textContentType = .emailAddress
        textField.font = .systemFont(ofSize: 11)
        return textField
    }()
    private var currentUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ahmad")
        imageView.clipsToBounds = true
        return imageView
    }()
    private var postCommentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
//        button.backgroundColor = .systemRed
        return button
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
        configTableView()
        view.addSubview(bottomView)
        bottomView.addSubview(addCommentView)
        bottomView.addSubview(postCommentButton)
        bottomView.addSubview(currentUserImageView)
        addCommentView.addSubview(commentTextField)
    }
    private func configUIViews(){
        tableView.frame = view.bounds
        bottomView.frame = CGRect(x: 0, y: view.bottom - 120, width: view.width, height: 120)
        postCommentButton.frame = CGRect(x: bottomView.right - 60, y: 30, width: 40, height: 40)
        currentUserImageView.frame = CGRect(x: bottomView.left + 20, y: 30 , width: 40, height: 40)
        addCommentView.frame = CGRect(x: currentUserImageView.left + 60, y: 30, width: bottomView.width - postCommentButton.width - currentUserImageView.width - 80, height: 40)
        commentTextField.frame = CGRect(x: 10, y: 0, width: addCommentView.width - 10, height: addCommentView.height)
        
        addCommentView.layer.cornerRadius = addCommentView.height / 2
        postCommentButton.layer.cornerRadius = postCommentButton.height / 2
        currentUserImageView.layer.cornerRadius = currentUserImageView.height / 2
    }
    private func configTableView(){
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
    }
}
//MARK: - Table View Delegate and DataSource Methods
extension CommentsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as? CommentsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
