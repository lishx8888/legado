import Foundation

struct BookChapter: Codable {
    var bookUrl: String
    var title: String
    var url: String
    var index: Int
    var isVip: Bool
    var isPay: Bool
    var hasContent: Bool
    var wordCount: Int
    
    enum CodingKeys: String, CodingKey {
        case bookUrl
        case title
        case url
        case index
        case isVip
        case isPay
        case hasContent
        case wordCount
    }
    
    func getDisplayTitle(_ titleReplaceRules: [String], _ useReplaceRule: Bool) -> String {
        var displayTitle = title
        if useReplaceRule {
            // 应用标题替换规则
            for rule in titleReplaceRules {
                // 实现替换逻辑
            }
        }
        return displayTitle
    }
}