//
//  DetailController.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation
import UIKit
import Resolver

class DetailController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    
    @Injected private var repository : DetailRepositoryProtocol
    fileprivate var detailResult: DetailUIModel?
    
    var searchedId: Int = 0
    var searchedMediaType: String = ""
    var appendToResponseUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getdata(id: searchedId, mediaType: searchedMediaType)
        
    }
    
    func getdata(id:Int,mediaType:String){
        if mediaType != "Person" {
            appendToResponseUser = "videos,credits"
        }
        repository.loadDetailsOfSearchedItem(itemId: id, itemType: mediaType, appendToResponse: appendToResponseUser) { result in
            switch result{
            case .success(let model):
                DispatchQueue.main.async {
                    self.detailResult = model
                    self.detailTableView.reloadData()
                    self.setUpTableView()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.detailResult = nil
                }
            }
        }
    }

    func setUpTableView() {
        detailTableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        detailTableView.register(UINib.init(nibName: "PosterHeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        detailTableView.register(UINib.init(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
}

extension DetailController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "headerCell") as! PosterHeaderCell
            cell.data = detailResult
            return cell
        }else {
            let cell: DetailCell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
            cell.detail = detailResult
            return cell
        }
      
    }
    
}

extension DetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return UITableView.automaticDimension
    }
    

}
