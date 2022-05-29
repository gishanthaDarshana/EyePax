//
//  Home.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import UIKit
import SDWebImage
import ListPlaceholder
class Home: UIViewController {

    @IBOutlet weak var searchBar: NewsSearchBar!
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var latestNewsCollection: UICollectionView!
    
    var selectedCategoryIndex = 0
    
    let latestNewsCellID = "LatestNewsCell"
    let categoryCellID = "CategoryCell"
    let newsCellID = "NewsCell"
    let newsShimmerID = "shimmerCell"
    let headLineShimmer = "collectionShimmerCell"
    
    var headLinesItems : HeadLines?
    var newsItems      : News?
    
    var homeViewModel = HomeVM()
    
    let searchCategories = [
        SearchCategory(name: "Healthy", isClicked: false) ,
        SearchCategory(name: "Technology", isClicked: false) ,
        SearchCategory(name: "Finance", isClicked: false) ,
        SearchCategory(name: "Arts", isClicked: false) ,
        SearchCategory(name: "Sports", isClicked: false) ,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register latestNews collection view cell
        let latestNews = UINib(nibName: latestNewsCellID, bundle: nil)
        latestNewsCollection.register(latestNews, forCellWithReuseIdentifier: latestNewsCellID)
        // Register category collection view cell
        let category = UINib(nibName: categoryCellID, bundle: nil)
        categoryCollection.register(category, forCellWithReuseIdentifier: categoryCellID)
        
        let newsItem = UINib(nibName: newsCellID, bundle: nil)
        newsTable.register(newsItem, forCellReuseIdentifier: newsCellID)
        
        
        latestNewsCollection.delegate = self
        latestNewsCollection.dataSource = self
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        newsTable.delegate = self
        newsTable.dataSource = self
        
        homeViewModel.getNewsHeadLines()
        homeViewModel.getTopNews(categoryName: searchCategories.first!.name)
        homeViewModel.headLineDelegate = self
        homeViewModel.newsFetchDelegate = self
        
        searchBar.delegate = self
    }
    

    @IBAction func clickOnNotification(_ sender: Any) {
        //UserDefaultsHelper.shared.removeLoginFlag()
    }
    
    @IBAction func seeAll(_ sender: Any) {
        performSegue(withIdentifier: "newsList", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsDetail"{
            guard let newsDetailVC = segue.destination as? NewsDetailView else{
                return
            }
            guard let article = sender as? Article else{
                return
            }
            newsDetailVC.newsArticle = article
        }
    }
    
}


extension Home : HeadLineFetchDelegate, NewsFetchDelegate{
    
    //MARK: - Headlines Fetch Delegates
    func onStartFetchHeadLine() {
        latestNewsCollection.reloadData()
        latestNewsCollection.layoutIfNeeded()
        latestNewsCollection.showLoader()
    }
    func onHeadLineFetchFail() {
        latestNewsCollection.hideLoader()
    }
    
    func onSuccessHeadlines(headLines: HeadLines) {
        latestNewsCollection.hideLoader()
        headLinesItems = headLines
        DispatchQueue.main.async { [weak self] in
            self?.latestNewsCollection.reloadData()
        }
        
    }
    
    //MARK: - News Fetch Delegates
    func onStartFetchNews() {
        newsTable.reloadData()
        newsTable.showLoader()
    }
    func onNewsFetchFail() {
        newsTable.hideLoader()
    }
    
    func onSuccessNews(news: News) {
        newsTable.hideLoader()
        newsItems = news
        DispatchQueue.main.async { [weak self] in
            self?.newsTable.reloadData()
        }
    }
}

extension Home : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        homeViewModel.getTopNews(categoryName: textField.text!)
    }
}


