//
//  URLBuilder.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 26.01.24.
//

import Foundation

class URLBuilder {
    private var components = URLComponents()
    
    init() {
        
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
    }
    
    func forPosts() -> Self {
        components.path = "/posts"
        return self
    }
    
    func forAllComments() -> Self {
        components.path = "/comments"
        return self
    }
    
    func forTodos() -> Self {
        components.path = "/todos"
        return self
    }
    
    func forUsers() -> Self {
        components.path = "/users"
        return self
    }
    
    func andCommentsToPost(number: Int) -> Self {
        components.path.append("/\(number)/comments")
        return self
    }
    
    func build() -> URL? {
        return components.url
    }
}
