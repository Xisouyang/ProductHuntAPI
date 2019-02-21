//
//  NetworkManager.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/19/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class NetworkManager {
    
    enum EndPoints {
        case posts
        case comments(postId: Int)
        
        func getPath() -> String {
            switch self {
            case .posts:
                return "posts/all"
            case .comments:
                return "comments"
            }
        }
        
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getHeaders(token: String) -> [String: String] {
            return [
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",
                "Host": "api.producthunt.com"
            ]
        }
        
        func getParams() -> [String: String] {
            switch self {
            case .posts:
                return [
                    "sort_by": "votes_count",
                    "order": "desc",
                    "per_page": "20",
                    
                    "search[featured]": "true"
                ]
                
            case let .comments(postId):
                return [
                    "sort_by": "votes",
                    "order": "asc",
                    "per_page": "20",
                    
                    "search[post_id]": "\(postId)"
                ]
            }
        }
        
        func paramsToString() -> String {
            let parameterArray = getParams().map { key, value in
                return "\(key)=\(value)"
            }
            return parameterArray.joined(separator: "&")
        }
    }
    
    enum Result<T> {
        case success(T)
        case failure(Error)
    }
    
    enum EndPointError: Error {
        case couldNotParse
        case noData
    }
    
    private func makeRequest(for endPoint: EndPoints) -> URLRequest {
        let stringParams = endPoint.paramsToString()
        let path = endPoint.getPath()
        let fullURL = URL(string: baseURL.appending("\(path)?\(stringParams)"))!
        var request = URLRequest(url: fullURL)
        request.httpMethod = endPoint.getHTTPMethod()
        request.allHTTPHeaderFields = endPoint.getHeaders(token: token)
        
        return request
    }
    
    let urlSession = URLSession.shared
    var baseURL = "https://api.producthunt.com/v1/"
    var token = "fafef68a6c5e18d330fa5a26a7fb077ef6da8d534eeaff8c52a31a123fc1e6e3"
    var result: PostList?
    
    // The escaping closure allows the compiler to continue on to other code—escaping the method—and return later on when the data is ready to be returned.
    func getPosts(completion: @escaping (Result<[Post]>) -> Void) {
//        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
//        let fullURL = URL(string: baseURL + query)!
//        var request = URLRequest(url: fullURL)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = [
//            "Accept": "application/json",
//            "Content-Type": "application/json",
//            "Authorization": "Bearer \(token)",
//            "Host": "api.producthunt.com"
//        ]
        let postsRequest = makeRequest(for: .posts)
        let task = urlSession.dataTask(with: postsRequest) { data, response, error in
            if let error = error {
                return completion(Result.failure(error))
            }
            
            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }
            print(data as Any)
            
//            guard let result = try? JSONDecoder().decode(PostList.self, from: data) else {
//                print("error with result")
//                return
//            }
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(PostList.self, from: data)
                self.result = decoded
                print(decoded)
            } catch {
                print(error)
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            let posts = self.result!.posts
            DispatchQueue.main.async {
                completion(Result.success(posts))
            }
        }
        task.resume()
    }
    
    func getComments(_ postId: Int, completion: @escaping (Result<[Comment]>) -> Void) {
        let commentsRequest = makeRequest(for: .comments(postId: postId))
        let task = urlSession.dataTask(with: commentsRequest) { data, response, error in
            if let error = error {
                return completion(Result.failure(error))
            }
            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }
            
            guard let result = try? JSONDecoder().decode(CommentAPIResponse.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            DispatchQueue.main.async {
                completion(Result.success(result.comments))
            }
        }
        task.resume()
    }
}
