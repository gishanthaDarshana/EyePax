//
//  TopNewsAPI.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import Foundation
import Alamofire
struct APIServiceTopNewsAPI {
    
    static let shared           =   APIServiceTopNewsAPI()
    
    let sharedHTTPService       =   HTTPService.shared
    
    let BASE_URL                =   Release.BASE_URL
    
    //let alertAppearance         =   SCLAlertView.SCLAppearance(showCloseButton : false)
    
    
    func getTopNews(category : String, completion: @escaping (_ news: News?) -> ()) {
        
        let headers             =   [
            "X-Api-Key"         :   Release.API_KEY,
        ] as HTTPHeaders
        
        let parameters      =   [
            "q"               :   category,
            ] as [String : Any]
        
        let url             =   BASE_URL + WebService.news.rawValue
        
        sharedHTTPService.getRequest(url: url, parameters: parameters, headers: headers) { json, status in
            if status == 200 {
                print("Responce: ", json)
                do {
                    let data = try json.rawData()
                    let headLines = try JSONDecoder().decode(News.self, from: data)
                    completion(headLines)
                } catch { print(error)
                    completion(nil)
                }
            }else{
                completion(nil)
            }
        }
    }
    
    
    func getTopNewsFiltered(filter : String,query : String, completion: @escaping (_ news: News?) -> ()) {
        
        let headers             =   [
            "X-Api-Key"         :   Release.API_KEY,
        ] as HTTPHeaders
        
        let parameters      =   [
            "q"                  : query,
            "language"           :   filter,
            ] as [String : Any]
        
        let url             =   BASE_URL + WebService.news.rawValue
        
        sharedHTTPService.getRequest(url: url, parameters: parameters, headers: headers) { json, status in
            if status == 200 {
                print("Responce: ", json)
                do {
                    let data = try json.rawData()
                    let headLines = try JSONDecoder().decode(News.self, from: data)
                    completion(headLines)
                } catch { print(error)
                    completion(nil)
                }
            }else{
                completion(nil)
            }
        }
    }

        
}
