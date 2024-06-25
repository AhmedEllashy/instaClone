//
//  SearchUserCollectionViewCell.swift
//  Insta
//
//  Created by mac on 6/26/24.
//

import UIKit

class SearchUserCollectionViewCell: UICollectionViewCell {
    //MARK: - UIViews
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 50
    }

    //MARK: - Cell Configs
    static let identifier: String = "SearchUserCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
