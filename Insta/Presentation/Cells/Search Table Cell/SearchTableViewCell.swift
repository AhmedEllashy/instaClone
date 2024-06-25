//
//  SearchTableViewCell.swift
//  Insta
//
//  Created by mac on 6/25/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    //MARK: - UIViews
    private let imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppImageNames.instagramNameImage)
        return imageView
    }()
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Micheal Omer"
        return label
    }()
    
    //MARK: -Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(imageview)
        addSubview(userNameLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configUIViews()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: - Functions
    private func configUIViews(){
        imageview.frame = CGRect(x: 10, y: 0, width: 50, height: 50)
        userNameLabel.frame = CGRect(x: imageview.right + 10, y: 0, width: width, height: 30)
    }
    
    //MARK: - Cell Config
    static let identifier: String = "SearchTableViewCell"

}
