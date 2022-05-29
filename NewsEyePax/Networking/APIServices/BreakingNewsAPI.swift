//
//  BreakingNewsAPI.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import Alamofire
struct APIServiceBreakingNewsAPI {
    
    static let shared           =   APIServiceBreakingNewsAPI()
    
    let sharedHTTPService       =   HTTPService.shared
    let sharedHTTPErrorHandler  =   HTTPErrorHandler.shared
    
    let BASE_URL                =   Release.BASE_URL
    
    //let alertAppearance         =   SCLAlertView.SCLAppearance(showCloseButton : false)
    
    
    func getHeadLines(completion: @escaping (_ headLines: HeadLines?) -> ()) {
        
        let headers             =   [
            "X-Api-Key"         :   Release.API_KEY,
        ] as HTTPHeaders
        
        let parameters      =   [
            "country"               :   "us",
            ] as [String : Any]
        
        let url             =   BASE_URL + WebService.headLines.rawValue
        
        sharedHTTPService.getRequest(url: url, parameters: parameters, headers: headers) { json, status in
            if status == 200 {
                //print("Responce: ", json)
                do {
                    let data = try json.rawData()
                    let headLines = try JSONDecoder().decode(HeadLines.self, from: data)
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
