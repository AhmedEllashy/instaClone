//
//  PostCollectionViewCell.swift
//  Insta
//
//  Created by mac on 6/21/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    //MARK: - UIViews
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterNameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var viewAllCommentsLabel: UILabel!
    @IBOutlet weak var dataCreatedLabel: UILabel!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var addCommentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCommentsLabel(_:)))
        viewAllCommentsLabel.addGestureRecognizer(gesture)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.layer.borderWidth = 0.3
        posterImageView.layer.cornerRadius = posterImageView.height / 2

    }
    //MARK: - IBActions
    @IBAction func loveButtonPressed(_ sender: UIButton){
        loveButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        NotificationCenter.default.post(name: .lovePostButtonPressed, object: nil)
    }
    @IBAction func commentButtonPressed(_ sender: UIButton){
        NotificationCenter.default.post(name: .commentsPostButtonPressed, object: nil)
    }
    @IBAction func shareButtonPressed(_ sender: UIButton){
        NotificationCenter.default.post(name: .sharePostButtonPressed, object: nil)
    }
    //MARK: - Functions
    @objc private func didTapCommentsLabel(_ gesture: UITapGestureRecognizer){
        NotificationCenter.default.post(name: .commentsPostButtonPressed, object: nil)
    }
    
    
    
    //MARK: - Cell Configurations
    static var identifier: String = "PostCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
