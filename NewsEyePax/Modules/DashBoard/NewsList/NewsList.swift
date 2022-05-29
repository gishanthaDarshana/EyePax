//
//  NewsList.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import UIKit
import ListPlaceholder
class NewsList: UIViewController {

    @IBOutlet weak var searchBar: NewsSearchBar!
    @IBOutlet weak var categoriesCollection: UICollectionView!
    @IBOutlet weak var searchResultsCount: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    
    var selectedCategoryIndex : Int?
    
    let categoryCollectionCellID = "CategoryCell"
    let newsTableCellID = "NewsCell"
    
    let searchCategories = [
        SearchCategory(name: "Healthy", isClicked: false) ,
        SearchCategory(name: "Technology", isClicked: false) ,
        SearchCategory(name: "Finance", isClicked: false) ,
        SearchCategory(name: "Arts", isClicked: false) ,
        SearchCategory(name: "Sports", isClicked: false) ,
    ]
    
    var newsListViewModel = NewsListVM()
    var newsItems      : News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResultsCount.isHidden = true
        let latestNews = UINib(nibName: categoryCollectionCellID, bundle: nil)
        categoriesCollection.register(latestNews, forCellWithReuseIdentifier: categoryCollectionCellID)
        
        let newsItem = UINib(nibName: newsTableCellID, bundle: nil)
        newsTableView.register(newsItem, forCellReuseIdentifier: newsTableCellID)
        
        categoriesCollection.delegate = self
        categoriesCollection.dataSource = self
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsListViewModel.newsFetchDelegate = self
        
        newsListViewModel.getTopNewsInNewsList(categoryName: searchCategories.first!.name)
        
        searchBar.delegate = self
    }
    
    @IBAction func openFilter(_ sender: Any) {
        let filterationVC = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "FilterController") as! FilterController
        filterationVC.filterDelegate = self
        if let sheet = filterationVC.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24
            
        }
        self.present(filterationVC, animated: true, completion: nil)
    }
    

}


extension NewsList : NewsFetchDelegate{
    func onStartFetchNews() {
        newsTableView.reloadData()
        newsTableView.showLoader()
    }
    func onNewsFetchFail() {
        newsTableView.hideLoader()
    }
    
    func onSuccessNews(news: News) {
        newsTableView.hideLoader()
        searchResultsCount.text = "About \(news.totalResults) results"
        newsItems = news
        DispatchQueue.main.async { [weak self] in
            self?.newsTableView.reloadData()
        }
    }
}

extension NewsList : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchResultsCount.isHidden = false
        newsListViewModel.getTopNewsInNewsList(categoryName: textField.text!)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchResultsCount.isHidden = true
    }
}

extension NewsList : FilterationDelegate{
    func filterNews(filter: String) {
        let q = searchCategories[selectedCategoryIndex ?? 0]
        newsListViewModel.getTopNewsInNewsList(withFilter: filter,query: q.name)
    }
}
