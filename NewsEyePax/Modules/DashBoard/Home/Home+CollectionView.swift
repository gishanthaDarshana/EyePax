//
//  Home+HeadLinesCollectionView.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import UIKit

extension Home : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch collectionView {
        case latestNewsCollection:
            return headLinesItems?.articles.count ?? 0
        case categoryCollection:
            return searchCategories.count
        default:
            return 0
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView {
        case latestNewsCollection:
            return latestNewsCollectionViewCell(from: collectionView, at: indexPath)
        case categoryCollection:
            return categoryCollectionViewCell(from: collectionView, at: indexPath)
        default:
            return UICollectionViewCell()
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case latestNewsCollection:
            return CGSize(width: self.view.frame.width * 0.7, height: collectionView.frame.height)
        case categoryCollection:
            return CGSize(width: searchCategories[indexPath.row].name.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 40, height: categoryCollection.frame.height)
        default:
            return CGSize.zero
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case latestNewsCollection:
            guard let article = headLinesItems?.articles[indexPath.row] else{
                return
            }
            performSegue(withIdentifier: "newsDetail", sender: article)
            return
        
        case categoryCollection:
            let category = searchCategories[indexPath.row]
            selectedCategoryIndex = indexPath.row
            collectionView.reloadData()
            homeViewModel.getTopNews(categoryName: category.name)
            return
        
        default:
            return
        }
    }
    
    

    // Initiate category collection view cell
    func categoryCollectionViewCell(from collectionView : UICollectionView, at indexPath: IndexPath) -> CategoryCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! CategoryCell
        
        let category = searchCategories[indexPath.row]
        
        cell.titleText.text = category.name
        
        if indexPath.row == selectedCategoryIndex {
            cell.selectedItem(true)
        } else {
            cell.selectedItem(false)
        }
        
        return cell
    }
    
    // Initiate latest news collection view cell
    func latestNewsCollectionViewCell(from collectionView : UICollectionView, at indexPath: IndexPath) -> LatestNewsCell {
        
        let headLine = headLinesItems?.articles[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: latestNewsCellID, for: indexPath) as! LatestNewsCell
        cell.auther.text = headLine?.author ?? ""
        cell.headLineNme.text = headLine?.title ?? ""
        cell.partOfTheNews.text = headLine?.articleDescription ?? ""
        
        cell.newsImage.sd_setImage(with: URL(string: headLine?.urlToImage ?? ""), placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
        return cell
    }

    
}
