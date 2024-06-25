//
//  CommentsTableViewCell.swift
//  Insta
//
//  Created by mac on 6/23/24.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    //MARK: - Properties
    
    //MARK: - UIViews
    private let commenterImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "ahmad")
         return imageView
     }()
    
    private let commenterNameLabel: UILabel = {
        let label = UILabel()
        label.text = "moha65.ns"
        label.font = .systemFont(ofSize: 14,weight: .bold)
        return label
    }()
 
    private let commentDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Your are so awsome what a view!!!!"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let commentPostTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12)
        label.text = "6h"
        return label
    }()
    private let loveButton: UIButton  = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    private let loveCountsLabel: UIView = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 9)
        label.text = "1"
        label.textAlignment = .center
        return label
    }()
    private let replayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Replay", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    //MARK: - Life Cycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(commenterImageView)
        addSubview(commenterNameLabel)
        addSubview(commentDetailsLabel)
        addSubview(commentPostTimeLabel)
        addSubview(loveButton)
        addSubview(loveCountsLabel)
        addSubview(replayButton)
//        contentView.backgroundColor = .systemYellow
//        commenterImageView.backgroundColor = .systemRed
//        commenterNameLabel.backgroundColor = .systemBlue
//        commentDetailsLabel.backgroundColor = .systemCyan
//        commentPostTimeLabel.backgroundColor = .systemGray
//        loveButton.backgroundColor = .systemPink
//        loveCountsLabel.backgroundColor = .systemBrown
//        replayButton.backgroundColor = .systemPurple


    }
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configUIViews()
    }
    //MARK: - Functions
    private func configUIViews(){
        let imageSize: Int = 40
        commenterImageView.clipsToBounds = true
        commenterImageView.layer.cornerRadius = CGFloat(imageSize / 2)
        commenterImageView.layer.borderWidth = 0.4
        //
        commenterImageView.frame = CGRect(x: 10, y: Int(top + 20.0), width: imageSize, height: imageSize)
        commenterNameLabel.frame = CGRect(x: commenterImageView.right + 20, y: top + 10, width: 85, height: 20)
        commentPostTimeLabel.frame = CGRect(x: commenterNameLabel.right, y: top + 12, width: 20, height: 20)
        commentDetailsLabel.frame = CGRect(x: commenterImageView.right + 20, y: commenterNameLabel.bottom, width: width, height: 20)
        loveButton.frame = CGRect(x: contentView.right - 50, y: top + 20, width: 35, height: 30)
        loveCountsLabel.frame = CGRect(x:  contentView.right - 50, y: loveButton.bottom, width: 35, height: 15)
        replayButton.frame = CGRect(x: commenterImageView.right + 20, y: commentDetailsLabel.bottom, width: 37, height: 33)

    }
    //MARK: - Cell Configs
    static let identifier: String = "CommentsTableViewCell"

}
