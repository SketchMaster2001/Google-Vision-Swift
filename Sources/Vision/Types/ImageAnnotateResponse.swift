//
//  ImageAnnotateResponse.swift
//  
//
//  Created by Noah Pistilli on 2022-04-08.
//

import Foundation

/// The parent of all AnnotateImageResponses
public struct Responses: Decodable {
    let responses: [AnnotateImageResponse]
}

public struct AnnotateImageResponse: Decodable {
    let textAnnotations: [EntityAnnotation]
}

/// Set of detected entity features.
public struct EntityAnnotation: Decodable {
    
    /// The language code for the locale in which the entity textual description is expressed.
    let locale: String?
    
    /// Entity textual description, expressed in its locale language.
    let description: String
    
    /// A bounding polygon for the detected image annotation.
    let boundingPoly: BoundingPoly
    
}

/// A bounding polygon for the detected image annotation.
public struct BoundingPoly: Decodable {
    
    /// The bounding polygon vertices.
    let vertices: [Vertex]
}
