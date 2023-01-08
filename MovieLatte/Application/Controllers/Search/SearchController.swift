//
//  ViewController.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import UIKit
import Resolver

class SearchController: UIViewController {
    
    @Injected var repository: SearchRepositoryProtocol
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searhTableView: UITableView!
    
    fileprivate var searchResult : [MultiSearchUIModel] = []
    
    private var timer:Timer?
    private var page = 1
    private var isPagination = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searhTableView.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "searchResultCell")
        searhTableView.keyboardDismissMode = .onDrag
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
                
                self.searchData(searchTerm: searchText, page: self.page)
            })
        }
        
        
    }
    
    func searchData(searchTerm:String,page:Int){
        repository.getSearched(queryText: searchTerm, page: page) { result in
            switch result{
            case .success(let model):
                DispatchQueue.main.async {
                    self.searchResult = []
                    self.searchResult = model
                    self.searhTableView.reloadData()
                }
            case .failure(let err):
                DispatchQueue.main.async {
                    self.searchResult = []
                    print(err.localizedDescription)
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searhTableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as! SearchResultCell
        
        let result = searchResult[indexPath.item]
        
        cell.titleLabel.text = result.searchedObjectTitle
        cell.dataTypeLabel.text = result.searchedObjectTypeUI
        cell.searchImageView.setImage(imageUrl: result.searchedObjectPhotoUI)
        cell.overviewLabel.text = result.overview ?? ""
        cell.yearLabel.text = result.yearTextUi
        cell.starLabel.text = result.ratingTextUi
        cell.ratingRatioLabel.text = result.scoreTextUi
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.height / 5)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = searchResult[indexPath.item]
        
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
              guard let detailTvMovie = mainStoryBoard.instantiateViewController(withIdentifier: "detailViewTo") as? DetailController else {
                  return
              }
        detailTvMovie.searchedId = data.id
        detailTvMovie.searchedMediaType = data.mediaType?.rawValue.lowercased() ?? ""
              
        navigationController?.pushViewController(detailTvMovie, animated: true)
        
    }
    
}

