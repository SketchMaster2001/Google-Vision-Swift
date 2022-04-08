//
//  GoogleVision.swift
//
//
//  Created by Noah Pistilli on 2022-04-07.
//

import Foundation

public struct VisionClient {
    // MARK: Properties
    
    /// The autentication key to connect to Google Cloud
    let apiKey: String
    
    /// Global JSONEncoder
    let encoder = JSONEncoder()
    
    // MARK: Methods
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /// Dispatches a request to read the text in a passed image.
    func textDetection(image: Data) async throws {
        let image = Image(image)
        let annotateImageRequest = [AnnotateImageRequest(image: image, features: [.init(type: .textDetection)])]
        
        let request = GoogleRequest(requests: annotateImageRequest)
        
        let body = try self.encoder.encode(request)
        
        try await AsyncHTTPRequest(URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(self.apiKey)")!, data: body)
    }
}

/// The root of the JSON sent to Google
struct GoogleRequest: Encodable {
    let requests: [AnnotateImageRequest]
}
