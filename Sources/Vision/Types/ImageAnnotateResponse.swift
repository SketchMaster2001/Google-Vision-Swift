//
//  ImageAnnotateResponse.swift
//  
//
//  Created by Noah Pistilli on 2022-04-08.
//

import Foundation

/// The parent of all AnnotateImageResponses
public struct Responses: Decodable {
    public let responses: [AnnotateImageResponse]
}

public struct AnnotateImageResponse: Decodable {
    public let textAnnotations: [EntityAnnotation]
}

/// Set of detected entity features.
public struct EntityAnnotation: Decodable {
    
    /// The language code for the locale in which the entity textual description is expressed.
    public let locale: String?
    
    /// Entity textual description, expressed in its locale language.
    public let description: String
    
    /// A bounding polygon for the detected image annotation.
    public let boundingPoly: BoundingPoly
    
}

/// A bounding polygon for the detected image annotation.
public struct BoundingPoly: Decodable {
    
    /// The bounding polygon vertices.
    public let vertices: [Vertex]
}
