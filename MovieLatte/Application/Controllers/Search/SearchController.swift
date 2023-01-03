//
//  ViewController.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import UIKit

import Resolver

class SearchController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searhTableView: UITableView!
    
    @Injected private var service: SearchServiceProtocol
    
    fileprivate var searchResult:[MultiSearchResult] = []
    
    private var timer:Timer?
    private var page = 1
    private var isPagination = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searhTableView.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "searchResultCell")
        
        searhTableView.dataSource = self
        searhTableView.delegate = self
    }
}

extension SearchController: UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            //Searchbar is empty
            
            
        }else {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
                
                self.service.getSearchedItems(queryText: searchText, page: self.page) { result in
                    switch result {
                    case .success(let model):
                        DispatchQueue.main.async {
                            self.searchResult = []
                            self.searchResult = model.results
                        }
                    case .failure(let err):
                        DispatchQueue.main.async {
                            print(err.localizedDescription)
                            self.searchResult = []
                        }
                    }
                
                    
                }
            })
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searhTableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as! SearchResultCell
        
        let result = searchResult[indexPath.item]
        
        cell.titleLabel.text = result.name ?? result.title
        cell.dataTypeLabel.text = result.mediaType?.rawValue
        cell.searchImageView.setImage(imageUrl: AppConfig.imageUrl+result.posterPath!)
        cell.dateTimeLabel.text = result.firstAirDate
        
        
        return cell
    }
    
    
}

