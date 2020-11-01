//
//  UserListViewModel.swift
//  VideoApp
//
//  Created by hoang linh on 11/1/20.
//

import Foundation

class UserViewModel  {
    private var service = ApiCall()
    private var userModel = [ItemModel]()
    
    func fetchUserList(completion: @escaping () -> ()){
        service.getListUser {[weak self] (result) in
            switch result{
            case .success(let data):
                self?.userModel = data.items ?? []
                completion()
            case .failure(let error):print("error process json data \(error.localizedDescription)")
            }
        }
    }
    
    func numberOfRowInsection(section: Int) -> Int{
        if userModel.count != 0{
            return userModel.count
        }
        return 0
    }
    func cellForRowAt(indexPath: IndexPath)-> ItemModel {
        return userModel[indexPath.row]
    }
}
