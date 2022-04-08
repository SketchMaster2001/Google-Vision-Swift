//
//  HTTP+Concurrency.swift
//  
//
//  Created by Noah Pistilli on 2022-04-07.
//

import Foundation

/// `AsyncHTTPRequest` is our hacky way at asyncronous HTTP. Normally we would use the built-in async `URLSession`
/// method in `Foundation`, but that does not exist within `FoundationNetworking`, the Networking module for Linux.
func AsyncHTTPRequest(_ link: URL, data: Data) async throws -> Data? {
    return try await withCheckedThrowingContinuation({ continuation in
        HTTPRequest(link, body: data) { data, error in
            if let error = error {
                continuation.resume(throwing: error)
            } else {
                continuation.resume(returning: data)
            }
        }
    })
}
