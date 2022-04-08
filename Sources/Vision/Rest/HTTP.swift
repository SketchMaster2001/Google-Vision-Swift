//
//  HTTP.swift
//  
//
//  Created by Noah Pistilli on 2022-04-07.
//

#if canImport(FoundationNetworking)
import FoundationNetworking
#else
import Foundation
#endif

/// `HTTPRequest` is our base HTTP request. This is used with `AsyncHTTPRequest` for our hacky way at
/// async HTTP across all systems.
func HTTPRequest(
    _ endpoint: URL,
    body: Data,
    completion: @escaping (Data?, Error?) -> Void
) {
    var request = URLRequest(url: endpoint)
    request.httpBody = body
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if error != nil {
            completion(nil, error)
        } else {
            completion(data, nil)
        }
    }
    
    task.resume()
}
