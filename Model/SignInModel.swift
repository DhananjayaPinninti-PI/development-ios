//
//  SignInModel.swift
//  SampleDemo
//
//  Created by Param on 29/04/24.
//

import Foundation

struct SignInModel: Codable {
    let result: SignInResult?
    let data:dataResponseHandler
    let status: Bool
}

struct dataResponseHandler:  Codable {
    
    let httpStatusCode: Int
    let httpStatusMessage, requestID, dateTime: String
    let error: Error?
}

// MARK: - Result
struct SignInResult: Codable {
    let userID: Int?
    let name, emailID, token, isdcode: String?
    let phone: String?
    let isPropertySubscribed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name
        case emailID = "emailId"
        case token, isdcode, phone, isPropertySubscribed
    }
}

// MARK: - Error
struct Error: Codable {
    let errorMessageCode: Int
    let errorMessage: String
}
