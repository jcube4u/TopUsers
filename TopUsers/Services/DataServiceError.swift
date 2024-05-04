//
//  DataServiceError.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation


/// DataServiceError to  handle the errors that could be potentially thrown.
///
/// - invalidURL : URL needs to be valid
///
/// - httpResponseError: HTTPserviceReponse errorrs
enum  DataServiceError : Error {
    case invalidURL
    case httpResponseError
}
