import Foundation

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Codable>(_ endpoint: URL) async throws -> T {
        var requestBuilder = RequestBuilder(url: endpoint)
        
        let request = requestBuilder.addHeader(name: "X-Auth-Token", value: "ADD API KEY HERE").buildRequest()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch let decodingError as DecodingError {
                switch decodingError {
                case .typeMismatch(let type, let context):
                    print("Type mismatch: \(type)")
                    print("Coding path: \(context.codingPath)")
                    print("Debug description: \(context.debugDescription)")
                case .valueNotFound(let type, let context):
                    print("Value not found: \(type)")
                    print("Coding path: \(context.codingPath)")
                case .keyNotFound(let key, let context):
                    print("Key not found: \(key)")
                    print("Coding path: \(context.codingPath)")
                case .dataCorrupted(let context):
                    print("Data corrupted")
                    print("Coding path: \(context.codingPath)")
                @unknown default:
                    print("Unknown decoding error")
                }
                throw decodingError
            }
        } catch {
            throw error
        }
    }
}

