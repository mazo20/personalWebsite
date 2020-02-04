//
//  SocialMedia.swift
//  
//
//  Created by Maciej Kowalski on 27/01/2020.
//

import Foundation

struct SocialMediaLink {
    let title: String
    let url: String
    let icon: String
}

extension SocialMediaLink {
    
    static var linkedIn: SocialMediaLink {
        return SocialMediaLink(
            title: "LinkedIn",
            url: "https://www.linkedin.com/in/maciej-kowalski-284165156/",
            icon: "fa fa-linkedin"
        )
    }
    
    static var email: SocialMediaLink {
        return SocialMediaLink(
            title: "Email",
            url: "mailto:maciej.mateusz.kowalski@gmail.com",
            icon: "fa fa-envelope"
        )
    }
    
    static var github: SocialMediaLink {
        return SocialMediaLink(
            title: "GitHub",
            url: "https://github.com/mazo20",
            icon: "fa fa-github"
        )
    }
    
    static var twitter: SocialMediaLink {
        return SocialMediaLink(
            title: "Twitter",
            url: "https://twitter.com/Kowal_Maciej",
            icon: "fa fa-twitter"
        )
    }
}
