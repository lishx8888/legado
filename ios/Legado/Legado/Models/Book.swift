import Foundation

struct Book: Codable {
    var name: String
    var author: String
    var bookUrl: String
    var origin: String
    var coverUrl: String
    var intro: String
    var durChapterIndex: Int
    var durChapterPos: Int
    var durChapterTitle: String
    var totalChapterNum: Int
    var lastCheckTime: Int64
    var lastCheckCount: Int
    var durChapterTime: Int64
    var canUpdate: Bool
    var isLocal: Bool
    var charset: String
    var useReplaceRule: Bool
    var imageStyle: String?
    var pageAnim: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case author
        case bookUrl
        case origin
        case coverUrl
        case intro
        case durChapterIndex
        case durChapterPos
        case durChapterTitle
        case totalChapterNum
        case lastCheckTime
        case lastCheckCount
        case durChapterTime
        case canUpdate
        case isLocal
        case charset
        case useReplaceRule
        case imageStyle
        case pageAnim
    }
    
    func getImageStyle() -> String? {
        return imageStyle
    }
    
    mutating func setImageStyle(_ style: String) {
        imageStyle = style
    }
    
    func getPageAnim() -> Int {
        return pageAnim
    }
    
    mutating func setPageAnim(_ anim: Int) {
        pageAnim = anim
    }
    
    func getUseReplaceRule() -> Bool {
        return useReplaceRule
    }
    
    func readSimulating() -> Bool {
        return false
    }
    
    func simulatedTotalChapterNum() -> Int {
        return totalChapterNum
    }
    
    func isSameNameAuthor(_ other: Book?) -> Bool {
        guard let other = other else { return false }
        return name == other.name && author == other.author
    }
}