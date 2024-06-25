//
//  SearchDetailsViewController.swift
//  Insta
//
//  Created by mac on 6/25/24.
//

import UIKit

class SearchResultViewController: UIViewController {

    private var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero)
        tableView.register(SearchTableViewCell.self,forCellReuseIdentifier: SearchTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBlue
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
//MARK: - Table View Delegate Methods
extension SearchResultViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    
}
