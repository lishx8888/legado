import Foundation

struct BookSource: Codable {
    var bookSourceName: String
    var bookSourceUrl: String
    var bookSourceGroup: String
    var bookSourceType: Int
    var enable: Bool
    var isLocal: Bool
    var customOrder: Int
    var lastUpdateTime: Int64
    var responseEncoding: String
    var loginUrl: String
    var username: String
    var password: String
    var cookie: String
    var searchUrl: String
    var searchRule: String
    var bookInfoUrl: String
    var bookInfoRule: String
    var chapterListUrl: String
    var chapterListRule: String
    var contentUrl: String
    var contentRule: String
    var exploreUrl: String
    var exploreRule: String
    var header: [String: String]
    var userAgent: String
    var js: String
    var enabledCookieJar: Bool
    
    enum CodingKeys: String, CodingKey {
        case bookSourceName
        case bookSourceUrl
        case bookSourceGroup
        case bookSourceType
        case enable
        case isLocal
        case customOrder
        case lastUpdateTime
        case responseEncoding
        case loginUrl
        case username
        case password
        case cookie
        case searchUrl
        case searchRule
        case bookInfoUrl
        case bookInfoRule
        case chapterListUrl
        case chapterListRule
        case contentUrl
        case contentRule
        case exploreUrl
        case exploreRule
        case header
        case userAgent
        case js
        case enabledCookieJar
    }
    
    func getContentRule() -> ContentRule {
        // 解析contentRule并返回ContentRule对象
        return ContentRule()
    }
}