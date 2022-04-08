//
//  ImageAnnotator.swift
//  
//
//  Created by Noah Pistilli on 2022-04-07.
//

import Foundation

/// Request for performing Google Cloud Vision API tasks over a user-provided image, with user-requested features, and with context information.
struct AnnotateImageRequest: Encodable {
    
    /// The passed image structure.
    let image: Image
    
    /// Array of features for the request.
    let features: [Features]
}

/// The type of Google Cloud Vision API detection to perform, and the maximum number of results to return for that type.
struct Features: Encodable {
    enum Types: String, Codable {
        case unSpecified = "TYPE_UNSPECIFIED"
        case faceDetection = "FACE_DETECTION"
        case landmarkDetection = "LANDMARK_DETECTION"
        case logoDetection = "LOGO_DETECTION"
        case labelDetection = "LABEL_DETECTION"
        case textDetection = "TEXT_DETECTION"
        case documentTextDetection = "DOCUMENT_TEXT_DETECTION"
        case safeSearchDetection = "SAFE_SEARCH_DETECTION"
        case imageProperties = "IMAGE_PROPERTIES"
        case cropHints = "CROP_HINTS"
        case webDetections = "WEB_DETECTION"
        case productSearch = "PRODUCT_SEARCH"
        case objectLocalization = "OBJECT_LOCALIZATION"
    }
    
    /// The type of feature to run.
    let type: Features.Types
    
    /// The maximum amount of results to return. Does not apply to `Types.textDetection`, `Types.documentTextDetection`, or `Types.cropHints`.
    let maxResults: Int?
    
    public init(type: Features.Types, maxResults: Int? = nil) {
        self.type = type
        
        if let maxResults = maxResults {
            self.maxResults = maxResults
        } else {
            self.maxResults = nil
        }
    }
}

/// Client image to perform Google Cloud Vision API tasks over.
struct Image: Encodable {
    
    /// The base64 encoded string of the image.
    let content: String
    
    public init(_ data: Data) {
        self.content = data.base64EncodedString()
    }
}
