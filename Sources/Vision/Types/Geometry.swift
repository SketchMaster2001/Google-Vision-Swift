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
    public let x: Int?
    
    /// Y coordinate.
    public let y: Int?
    
    // MARK: Methods
    public func toCGPoint() -> CGPoint {
        return CGPoint(x: x ?? 0, y: y ?? 0)
    }
}
