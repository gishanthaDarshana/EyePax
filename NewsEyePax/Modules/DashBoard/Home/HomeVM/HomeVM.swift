//
//  HomeVM.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
class HomeVM{
    
    weak var headLineDelegate : HeadLineFetchDelegate?
    weak var newsFetchDelegate : NewsFetchDelegate?
    
    
    func getNewsHeadLines(){
        headLineDelegate?.onStartFetchHeadLine()
        APIServiceBreakingNewsAPI.shared.getHeadLines { [weak self] headLines in
            if headLines != nil{
                self?.headLineDelegate?.onSuccessHeadlines(headLines: headLines!)
            }else{
                self?.headLineDelegate?.onHeadLineFetchFail()
            }
        }
    }
    
    func getTopNews(categoryName : String){
        newsFetchDelegate?.onStartFetchNews()
        APIServiceTopNewsAPI.shared.getTopNews(category: categoryName) { [weak self] news in
            if news != nil{
                self?.newsFetchDelegate?.onSuccessNews(news: news!)
            }else{
                self?.newsFetchDelegate?.onNewsFetchFail()
            }
        }
    }
}

protocol HeadLineFetchDelegate : AnyObject{
    func onStartFetchHeadLine()
    func onSuccessHeadlines(headLines : HeadLines)
    func onHeadLineFetchFail()
}

protocol NewsFetchDelegate : AnyObject{
    func onStartFetchNews()
    func onSuccessNews(news : News)
    func onNewsFetchFail()
}
