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
        case blog
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        //var excerpt: String
    }

    var url = URL(string: "https://mkowalski.me")!
    var title = "Maciej Kowalski"
    var name = "Maciej Kowalski"
    var description = "Computer science student with deep interest in mobile development."
    var language: Language { .english }
    var imagePath: Path? { nil }
    var sections = SectionID.allCases
    var socialMediaLinks: [SocialMediaLink] { [.email, .linkedIn, .twitter, .github] }
    var profilePicture = "https://avatars2.githubusercontent.com/u/7370986?s=400&u=18a0c2f0f88d8b5d362eacd48ca33bb2e6d93e06&v=4"
}
