//
//  DNService.swift
//  DNApp
//
//  Created by kfengc27 on 15/7/4.
//  Copyright (c) 2015年 Meng To. All rights reserved.
//

import UIKit
import Alamofire

class DNService: NSObject {
   // Doc: https://www.designernews.co
    private static let baseURL = "https://www.designernews.co"
    private static let clientID = "750ab22aac78be1c6d4bbe584f0e3477064f646720f327c5464bc127100a1a6d"
    private static let clientSecret = "53e3822c49287190768e009a8f8e55d09041c5bf26d0ef982693f215c72d87da"
    
    private enum ResourcePath: Printable {
        case Login
        case Stories
        case StoryId(storyId: Int)
        case StoryUpvote(storyId: Int)
        case StoryReply(storyId: Int)
        case CommentUpvote(commentId: Int)
        case CommentReply(commentId: Int)
        
        var description: String {
            switch self {
            case .Login: return "/oauth/token"
            case .Stories: return "/api/v1/stories"
            case .StoryId(let id): return "/api/v1/stories/\(id)"
            case .StoryUpvote(let id): return "/api/v1/stories/\(id)/upvote"
            case .StoryReply(let id): return "/api/v1/stories/\(id)/reply"
            case .CommentUpvote(let id): return "/api/v1/comments/\(id)/upvote"
            case .CommentReply(let id): return "/api/v1/comments/\(id)/reply"
            }
        }
    }
    static func storiesForSection(section: String, page: Int, response: (JSON) -> ()) {
        
        let urlString = baseURL + ResourcePath.Stories.description + "/" + section
        let parameters = [
            "page": toString(page),
            "client_id": clientID
        ]
        Alamofire.request(.GET, urlString, parameters: parameters).responseJSON { (_, _, data, _) in
            let stories = JSON(data ?? [])
            response(stories)
        }
        
    }
}
