import XCTest
@testable import GoogleVision

final class google_vision_swiftTests: XCTestCase {
    func testTextDetection() async throws {
        let file = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
        
        let fullPath = try Data(contentsOf: file.appendingPathComponent("image.png"))
        
        try! await VisionClient(apiKey: "key").textDetection(image: fullPath)
    }
}
