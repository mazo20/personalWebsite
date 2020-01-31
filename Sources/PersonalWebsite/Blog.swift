//
//  File.swift
//  
//
//  Created by Maciej Kowalski on 27/01/2020.
//

import Foundation
import Publish
import Plot

struct Blog: Website {
    enum SectionID: String, WebsiteSectionID {
        case main
        //case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        //var excerpt: String
    }

    var url = URL(string: "https://mkowalski.me")!
    var title = "mkowalski.me"
    var name = "Maciej Kowalski"
    var description = "Computer science student with deep experience in mobile development."
    var language: Language { .english }
    var imagePath: Path? { nil }
    var socialMediaLinks: [SocialMediaLink] { [.location, .email, .linkedIn, .github, .twitter] }
}
