//
//  Service.swift
//  VideoApp
//
//  Created by hoang linh on 11/1/20.
//

import Foundation

class ApiCall {
    private var dataTask : URLSessionDataTask?
    
    func getListUser (completion : @escaping(Result<UserModel, Error>)-> Void){
        let url = "https://api.github.com/search/users?q=tom"
        
        guard let uRl = URL(string: url) else {return}
        dataTask = URLSession.shared.dataTask(with: uRl, completionHandler:  { (data, res, err) in
            if let err = err {
                completion(.failure(err))
                print("dataTask error \(err.localizedDescription)")
                return
            }
            
            guard let res = res as? HTTPURLResponse else {
                print("emty response")
                return
            }
            print("statusCode \(res.statusCode)")
            
            guard let data = data else {
               print("emty data")
                return
            }
            
            do {
                //parse data
                let jsonData = try JSONDecoder().decode(UserModel.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }catch let error {
                completion(.failure(error))
            }
        })
        dataTask?.resume()
    }
}
