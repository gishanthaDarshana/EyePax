//
//  NewsList+SearchCategories.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import UIKit
extension NewsList : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return categoryCollectionViewCell(from: collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchCategories[indexPath.row].name.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 40, height: categoriesCollection.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = searchCategories[indexPath.row]
        selectedCategoryIndex = indexPath.row
        collectionView.reloadData()
        newsListViewModel.getTopNewsInNewsList(categoryName: category.name)
    }
    
    
    // Initiate category collection view cell
    func categoryCollectionViewCell(from collectionView : UICollectionView, at indexPath: IndexPath) -> CategoryCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionCellID, for: indexPath) as! CategoryCell
        
        let category = searchCategories[indexPath.row]
        
        cell.titleText.text = category.name
        
        if indexPath.row == selectedCategoryIndex {
            cell.selectedItem(true)
        } else {
            cell.selectedItem(false)
        }
        
        return cell
    }
    
}
