//
//  HTTPService.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import Alamofire
import SwiftyJSON
class HTTPService {
    
    static var shared   =   HTTPService()
    
    let TIME_OUT_INTERVAL: TimeInterval = 10000 // n minutes

    private static var manager : Alamofire.Session? = {
        return Session.default
    }()
    
    
    // GET Request
    func getRequest(url:String, headers: HTTPHeaders, completion: @escaping (JSON, Int) -> ()) {
        
        
        if !Connectivity.isConnectedToInternet {
            completion([], HTTPErrorCode.NO_INTERNET_ERROR.rawValue)
            return
        }
        
        //let manager = sslPinningConfiguration()
        guard let manager = HTTPService.manager else {
            completion([], HTTPErrorCode.SSL_ERROR.rawValue)
            return
        }
        
        guard let formattedURL =  url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        print("URL:: ",formattedURL)
        
        manager.session.configuration.timeoutIntervalForRequest = TIME_OUT_INTERVAL
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        manager.request(formattedURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            print("StatusCode:: ",response.response?.statusCode ?? 0)
            print("Response:: ",response.data ?? [])
            
            switch (response.result) {
            case .success:
                
                if let responseData = response.data , let statusCode = response.response?.statusCode {
                    
                    do {
                        let jsonData = try JSON(data: responseData)
                        // Success
                        completion(jsonData,statusCode)
                    } catch {
                        completion([], HTTPErrorCode.JSON_ERROR.rawValue)
                    }
                    
                } else {
                    completion([], HTTPErrorCode.RESPONSE_ERROR.rawValue)
                }
                
                break
                
            case .failure(let error):
                
                if error._code == NSURLErrorTimedOut {
                    completion([], HTTPErrorCode.TIME_OUT_ERROR.rawValue)
                    return
                }
                
                completion([], HTTPErrorCode.RESPONSE_ERROR.rawValue)
                
                break
            }
            
        }
        
    }
    
    
    // GET Request with parameters
    func getRequest(url:String, parameters:[String: Any],headers: HTTPHeaders, completion: @escaping (JSON, Int) -> ()) {
        
        
        if !Connectivity.isConnectedToInternet {
            completion([], HTTPErrorCode.NO_INTERNET_ERROR.rawValue)
            return
        }
        
        //let manager = sslPinningConfiguration()
        guard let manager = HTTPService.manager else {
            completion([], HTTPErrorCode.SSL_ERROR.rawValue)
            return
        }
        
        guard let formattedURL =  url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        print("URL:: ",formattedURL)
        
        manager.session.configuration.timeoutIntervalForRequest = TIME_OUT_INTERVAL
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        manager.request(formattedURL, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { response in
            
            print("StatusCode:: ",response.response?.statusCode ?? 0)
            print("Response:: ",response.data ?? [])
            
            
            switch (response.result) {
            case .success:
                if let responseData = response.data , let statusCode = response.response?.statusCode {
                    do {
                        let jsonData = try JSON(data: responseData)
                        // Success
                        completion(jsonData,statusCode)
                    } catch {
                        completion([], HTTPErrorCode.JSON_ERROR.rawValue)
                    }
                } else {
                    completion([], HTTPErrorCode.RESPONSE_ERROR.rawValue)
                }
                break
            case .failure(let error):
                
                if error._code == NSURLErrorTimedOut {
                    completion([], HTTPErrorCode.TIME_OUT_ERROR.rawValue)
                    return
                }
                completion([], HTTPErrorCode.RESPONSE_ERROR.rawValue)
                break
            }
        }
    }
    
    
    
    
}

