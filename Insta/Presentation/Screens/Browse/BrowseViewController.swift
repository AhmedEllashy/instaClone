//
//  BrowseViewController.swift
//  Insta
//
//  Created by Ahmad Ellashy on 14/06/2024.
//

import UIKit

class BrowseViewController: UIViewController {
    //MARK: - Properties
    var observer: NSObjectProtocol?

    //MARK: - UIViews
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Funtions
    private func setup(){
        configNavBar()
        configCollectionView()
        observer = NotificationCenter.default.addObserver(forName: .lovePostButtonPressed, object: nil, queue: .main, using: { _ in
            self.collectionView.reloadData()
        })
        //
        NotificationCenter.default.addObserver(forName: .commentsPostButtonPressed, object: nil, queue: .main, using: {_ in
            let vc = CommentsViewController()
            if let sheet = vc.presentationController as? UISheetPresentationController {
                sheet.detents = [.medium(),.large()]
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 20
            }
            self.present(vc,animated: true)
        })
        //
        NotificationCenter.default.addObserver(forName: .sharePostButtonPressed, object: nil, queue: .main, using: {_ in
            let vc = ShareViewController()
            if let sheet = vc.presentationController as? UISheetPresentationController {
                sheet.detents = [.medium(),.large()]
                sheet.prefersGrabberVisible = true
            }
            self.present(vc,animated: true)
        })
        
    }
    private func configNavBar(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Instagram", style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "message"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: nil)
        ]
    }
    private func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { index, _ in
            return self.setupCollectionViewLayout(by: index)
        })
    }
    private func setupCollectionViewLayout(by index: Int) -> NSCollectionLayoutSection{
//        let sectionIndex = index
        if index == 0 {
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.22),
                    heightDimension: .fractionalHeight(0.14)
                ),
                repeatingSubitem: item,
                count: 1
            )
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }else {
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0))
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)),
                repeatingSubitem: item,
                count: 1
            )
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}

//MARK: - Collection View Delegate And DataSource Methods
extension BrowseViewController: UICollectionViewDelegate,UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section{
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    
}

