//
//  LeetcodeManager.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 28/05/24.
//

import Foundation

struct LeetcodeManager {
    let leetcodeURL = "https://alfa-leetcode-api.onrender.com"
    func fetchData(username: String){
        let URLstring = "\(leetcodeURL)/\(username)"
        self.PerformRequest(with: URLstring)
    }
    
    func PerformRequest(with URLstring: String){
        
    }
        
}
