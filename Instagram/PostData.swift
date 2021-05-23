//
//  PostData.swift
//  Instagram
//
//  Created by 岩渕優児 on 2021/05/18.
//

import Foundation
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var comment: [String] = []
    var likes: [String] = []
    var isLiked: Bool = false
   
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        
        let postDic = document.data()
        
        self.name = postDic["name"] as? String
        
        self.caption = postDic["caption"] as? String
        
        
        if let comment = postDic["comment"] as? [String] {
            self.comment = comment
        }
            
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }
}
