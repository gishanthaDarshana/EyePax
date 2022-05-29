//
//  Home+TableView.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//
import UIKit
import Foundation
extension Home : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellID, for: indexPath) as! NewsCell
        let news = newsItems?.articles[indexPath.row]
        cell.auther.text = news?.author ?? ""
        cell.newsTitle.text = news?.title ?? ""
        cell.publishedDate.text = news?.publishedAt.asDate(format: .yyyy_MM_dd_T_HH_mm_ssZ)?.format(.dd_MMM_yyyy) ?? ""
        cell.newsImage.sd_setImage(with: URL(string: news?.urlToImage ?? ""), placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width * 0.4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = newsItems?.articles[indexPath.row] else{
            return
        }
        performSegue(withIdentifier: "newsDetail", sender: article)
    }
}
