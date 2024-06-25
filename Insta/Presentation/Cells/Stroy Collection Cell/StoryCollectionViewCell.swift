//
//  StoryCollectionViewCell.swift
//  Insta
//
//  Created by mac on 6/20/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    //MARK: - Propertie
    static let identifier: String = "StoryCollectionViewCell"
    //MARK: - UIViews
    private var storyImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = UIImage(systemName: "person",withConfiguration: UIImage.SymbolConfiguration(pointSize: 5))
        imageView.image = UIImage(named: "ahmad")
        return imageView
    }()
    private var storyPosterName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.text = "Ahmad Ellashy"
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(storyImageView)
        contentView.addSubview(storyPosterName)
        storyImageView.clipsToBounds = true
        //        contentView.backgroundColor = .systemRed
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        //        storyImageView.image = nil
        //        storyPosterName.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configUIViews()
    }
    //MARK: - Functions
    private func configUIViews(){
        let imageSize = 70
        storyImageView.frame = CGRect(x: 10, y: 10, width: imageSize, height: imageSize)
        storyPosterName.frame = CGRect(x: 0, y: Int(storyImageView.bottom), width: Int(contentView.width), height: 30)
        storyImageView.layer.cornerRadius = CGFloat(imageSize / 2)
        self.addBorderGradient(to: storyImageView, startColor: UIColor.red, endColor: UIColor.systemYellow, lineWidth: 9,
                               startPoint:CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
    }
    
    private func addBorderGradient(to view: UIView, startColor:UIColor, endColor: UIColor, lineWidth: CGFloat, startPoint: CGPoint, endPoint: CGPoint) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = UIBezierPath(
            arcCenter: CGPoint(x: view.bounds.height / 2,
                               y: view.bounds.height/2),
            radius: view.bounds.height / 2,
            startAngle: CGFloat(0),
            endAngle:CGFloat(CGFloat.pi * 2),
            clockwise: true).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        view.layer.addSublayer(gradient)
    }
}
