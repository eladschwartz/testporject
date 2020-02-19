//
//  FollowerListVC.swift
//  HomeProject
//
//  Created by elad schwartz on 18/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var username: String!
    var movies : [Movie] = [Movie]()
    var filteredMovies : [Movie] = [Movie]()
    
    fileprivate var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        searchBar.delegate = self
        NetworkManager.shared.getNowPlaying { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let movies):
                self.movies = movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            case .failure(let error):
                self.presentGFalertOnMainThread(title: "Bade Stuff Happend", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isSearching ? self.filteredMovies.count : self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! movieTVC
         let movie = self.isSearching ? self.filteredMovies[indexPath.item] : self.movies[indexPath.item]
        cell.setupCell(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension FollowerListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearching  = searchText.count > 0 ? true : false
        self.filteredMovies = self.movies.filter({ $0.title.lowercased().contains(searchText.lowercased()) })
        self.tableView.reloadData()
    }
}
