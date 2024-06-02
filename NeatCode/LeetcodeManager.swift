//
//  LeetcodeManager.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 28/05/24.
//

import Foundation

protocol LeetcodeManagerDelegate{
    func getDetails(_ leetcodeManager: LeetcodeManager, structure : LeetcodeStructureModel)
    func didFailWithError(_ error: Error)
    
}

struct LeetcodeManager {
    var delegate: LeetcodeManagerDelegate?
    let leetcodeURL = "https://alfa-leetcode-api.onrender.com/userProfile"
    
    
    func fetchData(username: String){
        let URLstring = "\(leetcodeURL)/\(username)"
        self.PerformRequest(with: URLstring)
    }
    
    func PerformRequest(with URLstring: String){
        if let url = URL(string: URLstring){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url){(data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data{
                    if let status = self.parseJSON(safeData){
                        self.delegate?.getDetails(self, structure: status)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ LeetData: Data)-> LeetcodeStructureModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(LeetcodeData.self, from: LeetData)
            let eassy = decodedData.easySolved
            let medium = decodedData.mediumSolved
            let hard = decodedData.hardSolved
            let total = decodedData.totalSolved
            let rank = decodedData.ranking
            let repo = decodedData.reputation
            let contri = decodedData.contributionPoint
            
            let leetcodedata = LeetcodeStructureModel(NoOfEassy: eassy, NoOfMedium: medium, NoOfHard: hard, NoOfTotal: total, ranking: rank, reputation: repo, contributionPoint: contri)
            
            return leetcodedata
                
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
        
    }
        
}
