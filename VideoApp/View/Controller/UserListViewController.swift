//
//  UserlListViewController.swift
//  VideoApp
//
//  Created by hoang linh on 11/1/20.
//

import UIKit

class UserlListViewController: UIViewController {
    var userViewModel = UserViewModel()
    var userList = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userList)
        userList.translatesAutoresizingMaskIntoConstraints = false
        userList.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        userList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        userList.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userList.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        userList.register(UINib(nibName:"UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        loadUserData()
        userList.translatesAutoresizingMaskIntoConstraints = false
       
    }
    private func loadUserData(){
        userViewModel.fetchUserList { [weak self] in
            self?.userList.dataSource = self
            self?.userList.delegate = self
            self?.userList.reloadData()
        }
    }
    
}

extension UserlListViewController : UITableViewDataSource ,  UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.numberOfRowInsection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)as! UserCell
        let userItem = userViewModel.cellForRowAt(indexPath: indexPath)
        cell.setValueCell(userItem)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
