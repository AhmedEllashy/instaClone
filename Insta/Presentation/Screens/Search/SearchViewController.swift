//
//  SearchViewController.swift
//  Insta
//
//  Created by mac on 6/25/24.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - UIViews
    private let searchController : UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultViewController())
        vc.searchBar.placeholder = "Search"
        vc.searchBar.searchBarStyle = .minimal
        return vc
    }()
    private var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero)
        tableView.register(SearchTableViewCell.self,forCellReuseIdentifier: SearchTableViewCell.identifier)
        return tableView
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    //MARK: - Functions
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.extendedLayoutIncludesOpaqueBars = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

}

//MARK: - Search Delegate Methods
extension SearchViewController: UISearchBarDelegate,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}

//MARK: - Table View Delegate Methods
extension SearchViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    
}
