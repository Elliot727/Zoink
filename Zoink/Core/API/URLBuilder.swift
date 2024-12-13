import Foundation

struct URLBuilder:URLBuilding {
    private var baseURL: String
    private var endpoint: Endpoint
    private var queryItems: [URLQueryItem] = []
    
    init(baseURL: String = APIConfig.baseURL, endpoint: Endpoint) {
        self.baseURL = baseURL
        self.endpoint = endpoint
    }
    
    mutating func addQueryItem(name: String, value: String?) -> URLBuilder {
        queryItems.append(URLQueryItem(name: name, value: value))
        return self
    }
    
    func buildURL() -> URL? {
        var components = URLComponents(string: baseURL + endpoint.path)
        components?.queryItems = queryItems
        return components?.url
    }
}
