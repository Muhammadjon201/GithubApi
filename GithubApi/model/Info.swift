//
//  Post.swift
//  GithubApi
//
//  Created by Muhammadjon Mamarasulov on 12/7/21.
//

import Foundation

struct Info: Decodable{
    
    var login: String?
    var avatar_url: String?
    var location: String?
    var bio: String?
    var public_repos: Int?
    var followers: Int?
    var following: Int?
    
}
