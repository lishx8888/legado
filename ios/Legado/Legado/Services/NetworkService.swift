import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private let session: URLSession
    private let cache = NSCache<NSString, NSString>()
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 60
        session = URLSession(configuration: config)
        cache.countLimit = 100
    }
    
    func request(_ url: String, headers: [String: String] = [:], useCache: Bool = true) async throws -> String {
        // 检查缓存
        if useCache, let cachedContent = cache.object(forKey: url as NSString) {
            return cachedContent as String
        }
        
        guard let url = URL(string: url) else {
            throw NSError(domain: "NetworkService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 添加默认头
        request.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1", forHTTPHeaderField: "User-Agent")
        
        // 添加自定义头
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "NetworkService", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }
        
        guard let content = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "NetworkService", code: -3, userInfo: [NSLocalizedDescriptionKey: "Invalid content"])
        }
        
        // 缓存内容
        if useCache {
            cache.setObject(content as NSString, forKey: url.absoluteString as NSString)
        }
        
        return content
    }
    
    func post(_ url: String, body: Data, headers: [String: String] = [:]) async throws -> String {
        guard let url = URL(string: url) else {
            throw NSError(domain: "NetworkService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        // 添加默认头
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1", forHTTPHeaderField: "User-Agent")
        
        // 添加自定义头
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "NetworkService", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }
        
        guard let content = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "NetworkService", code: -3, userInfo: [NSLocalizedDescriptionKey: "Invalid content"])
        }
        
        return content
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}