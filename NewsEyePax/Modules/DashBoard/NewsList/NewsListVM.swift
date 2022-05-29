//
//  NewsListVM.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
class NewsListVM{
    
    weak var newsFetchDelegate : NewsFetchDelegate?
    
    func getTopNewsInNewsList(categoryName : String){
        newsFetchDelegate?.onStartFetchNews()
        APIServiceTopNewsAPI.shared.getTopNews(category: categoryName) { [weak self] news in
            if news != nil{
                self?.newsFetchDelegate?.onSuccessNews(news: news!)
            }else{
                self?.newsFetchDelegate?.onNewsFetchFail()
            }
        }
    }
    func getTopNewsInNewsList(withFilter : String, query : String){
        newsFetchDelegate?.onStartFetchNews()
        APIServiceTopNewsAPI.shared.getTopNewsFiltered(filter: withFilter,query: query) { [weak self] news in
            if news != nil{
                self?.newsFetchDelegate?.onSuccessNews(news: news!)
            }else{
                self?.newsFetchDelegate?.onNewsFetchFail()
            }
        }
    }
}
