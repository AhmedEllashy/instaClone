//
//  ShareViewController.swift
//  Insta
//
//  Created by mac on 6/25/24.
//

import UIKit

class ShareViewController: UIViewController {
    //MARK: - Properties
    //MARK: - UIViews
    @IBOutlet weak var searchBar: UISearchBar!
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { index, _ in
            return ShareViewController.createCollectionSectionLayout()
        }))
        return collectionView
    }()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: searchBar.bottom, width: view.width, height: view.height - searchBar.height)
    }
  
    //MARK: - Functions
   private func setup(){
       collectionView.register(SearchUserCollectionViewCell.nib(), forCellWithReuseIdentifier: SearchUserCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
       view.addSubview(collectionView)
    }
    
   static  func createCollectionSectionLayout() -> NSCollectionLayoutSection{
       let item = NSCollectionLayoutItem(
        layoutSize:NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.336),
            heightDimension: .fractionalWidth(1.0))
       )
       let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(160)),
        repeatingSubitem: item,
        count: 3)
       let section = NSCollectionLayoutSection(group: group)
       return section
    }
    
}

//MARK: - collection View Delegate and DataSource Methods
extension ShareViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchUserCollectionViewCell.identifier, for: indexPath) as? SearchUserCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
