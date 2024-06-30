//
//  User.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 30.06.2024.
//

import UIKit

struct User {
    let username: String
    let avatarImage: String
    let highscore: Float
    
    var avatar: UIImage? {
        return UIImage(named: avatarImage)!
    }
}
