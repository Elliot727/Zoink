import Foundation

struct RequestBuilder {
    private var url: URL
    private var headers: [String: String] = [:]
    
    init(url: URL) {
        self.url = url
    }
    
    mutating func addHeader(name: String, value: String) -> RequestBuilder {
        headers[name] = value
        return self
    }
    
    func buildRequest() -> URLRequest {
        var request = URLRequest(url: url)
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
