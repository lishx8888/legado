import Foundation

struct ContentRule: Codable {
    var content: String
    var remove: [String]
    var replace: [[String]]
    var imageStyle: String
    
    enum CodingKeys: String, CodingKey {
        case content
        case remove
        case replace
        case imageStyle
    }
    
    init() {
        content = ""
        remove = []
        replace = []
        imageStyle = ""
    }
}