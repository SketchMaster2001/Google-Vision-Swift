//
//  Geometry.swift
//  
//
//  Created by Noah Pistilli on 2022-04-07.
//

import Foundation


/// `Vertex` represents a 2D point in the image.
public struct Vertex: Decodable {
    // MARK: Properties
    
    /// X coordinate.
    let x: Int?
    
    /// Y coordinate.
    let y: Int?
    
    // MARK: Methods
    func toCGPoint() -> CGPoint {
        return CGPoint(x: x ?? 0, y: y ?? 0)
    }
}
