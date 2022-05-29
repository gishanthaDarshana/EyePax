//
//  HTTPError.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
enum HTTPErrorCode : Int {
    case NO_INTERNET_ERROR  =   1001
    case RESPONSE_ERROR     =   1002
    case TIME_OUT_ERROR     =   1003
    case JSON_ERROR         =   1004
    case SSL_ERROR          =   1005
    case USER_ERROR         =   417
}

//Error Messages
enum HTTPErrorMsg : String {
    case NO_INTERNET_ERROR  =   "No internet connection. Please try again."
    case CONNECTION_ERROR   =   "Connection failure. Please try again."
    case TIME_OUT_ERROR     =   "Request timed out. Please try again."
    case JSON_ERROR         =   "Json failure. Please try again."
    case COMMON_ERROR       =   "Something went wrong."
    case API_ERROR          =   "Could not make the request. Please try again"
}
