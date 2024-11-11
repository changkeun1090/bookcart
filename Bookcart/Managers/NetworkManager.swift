//
//  NetworkManager.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/6/24.
//

import UIKit

class BookSearchService {
    
    let baseUrl = "https://dapi.kakao.com/v3/search/book"
    
    func searchBook(query: String, completion: @escaping (Result<[Book], BCError>) -> Void) {
        
        guard let url = buildURL(query: query) else {
            completion(.failure(.invalidURL))
            return
        }
                
        let request = createRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedResponse = try decoder.decode(SearchResult.self, from: data)
                
                completion(.success(decodedResponse.documents))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            } 
//                catch {
//                completion(.failure(error))
//            }
        }
        
        task.resume()
    }
    
    private func buildURL(query: String) -> URL? {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "size", value:"50")
        ]
        return urlComponents?.url
    }
    
    private func createRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("KakaoAK \(Secrets.apiKey)", forHTTPHeaderField: "Authorization")
        return request
    }
}
