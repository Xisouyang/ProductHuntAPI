//
//  NetworkManager.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/19/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class NetworkManager {
    let urlSession = URLSession.shared
    var baseURL = "https://api.producthunt.com/v1/"
    var token = "fafef68a6c5e18d330fa5a26a7fb077ef6da8d534eeaff8c52a31a123fc1e6e3"
    var result: PostList?
    
    // The escaping closure allows the compiler to continue on to other code—escaping the method—and return later on when the data is ready to be returned.
    func getPosts(completion: @escaping ([Post]) -> Void) {
        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
        let fullURL = URL(string: baseURL + query)!
        var request = URLRequest(url: fullURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)",
            "Host": "api.producthunt.com"
        ]
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("error with data")
                return
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
            }
            
            let posts = self.result!.posts
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        task.resume()
    }
}
