import Foundation

struct BookProgress: Codable {
    var bookUrl: String
    var durChapterIndex: Int
    var durChapterPos: Int
    
    enum CodingKeys: String, CodingKey {
        case bookUrl
        case durChapterIndex
        case durChapterPos
    }
    
    init(book: Book) {
        self.bookUrl = book.bookUrl
        self.durChapterIndex = book.durChapterIndex
        self.durChapterPos = book.durChapterPos
    }
}