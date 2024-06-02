//
//  LeetcodeManager.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 28/05/24.
//

import Foundation

protocol LeetcodeManagerDelegate{
    func getDetails(_ leetcodeManager: LeetcodeManager, status : LeetcodeData)
    func didFailWithError(_ error: Error)
    
}

struct LeetcodeManager {
    let leetcodeURL = "https://alfa-leetcode-api.onrender.com"
    
    
//    func fetchData(username: String){
//        let URLstring = "\(leetcodeURL)/\(username)"
//        self.PerformRequest(with: URLstring)
//    }
    
//    func PerformRequest(with URLstring: String){
//        if let url = URL(string: URLstring){
//            
//            let session = URLSession(configuration: .default)
//            
//            let task = session.dataTask(with: url){(data, response, error) in
//                if error != nil {
//                    self.delegate?.didFailWithError(error!)?
//                    return
//                }
//            }
//        }
//    }
        
}
