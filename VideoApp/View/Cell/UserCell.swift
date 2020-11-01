//
//  UserCell.swift
//  VideoApp
//
//  Created by hoang linh on 11/1/20.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImages: UIImageView!
    @IBOutlet weak var userPath: UILabel!
    
   private var urlString = ""
    //update UI VIEW
    
    func setValueCell(_ user: ItemModel){
        updateUIView(userAvatar: user.avatar_url, userURL: user.followers_url)
        self.urlString = user.avatar_url ?? ""
    }
    private func updateUIView (userAvatar: String?, userURL: String?){
        self.userPath.text = userURL
        guard let imageURLs = URL(string: urlString) else {
            self.userImages.image = UIImage(named: "captcha")
            return
        }
        self.userImages.image = nil
        getImageFromUrl(url: imageURLs)
    }
    
    private func getImageFromUrl (url: URL){
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print("dataTask error \(err.localizedDescription)")
                return
            }
            guard let data = data else {
                print("empty data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.userImages.image  = image
                }else {
                    self.userImages.image = nil
                }
            }
        }.resume()
    }
}
