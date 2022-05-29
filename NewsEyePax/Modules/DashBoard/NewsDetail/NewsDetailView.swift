//
//  NewsDetailView.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import UIKit



class NewsDetailView: UIViewController {

    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var newsAuther: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsContent: UITextView!
    
    var newsArticle : Article?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualEffectView.layer.cornerRadius = 20
        visualEffectView.clipsToBounds = true
        populateNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func populateNews(){
        
        guard let newsArticle = newsArticle else {
            return
        }

        newsImageView.sd_setImage(with: URL(string: newsArticle.urlToImage ?? ""), placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
        newsDate.text = newsArticle.publishedAt.asDate(format: .yyyy_MM_dd_T_HH_mm_ssZ)?.format(.dd_MMM_yyyy) ?? ""
        newsAuther.text = newsArticle.author
        newsTitle.text   = newsArticle.title
        newsContent.text  = newsArticle.content
    }
    

    @IBAction func onBackPressed(_ sender: Any) {
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

}
