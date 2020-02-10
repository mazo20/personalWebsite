//
//  Node+Grid.swift
//
//
//  Created by Maciej Kowalski on 30/01/2020.
//
import Plot

extension Node where Context == HTML.BodyContext {
    static func sidebar(for site: Blog) -> Node {
        .wrapper(
            .class("sidebar pure-u-1 pure-u-lg-5-24"),
            .grid(
                .div(
                    .class("pure-u-1 pure-u-lg-1 "),
                    .class("author-avatar"),
                    .img(
                        .src(site.profilePicture)
                    )
                ),
                .wrapper(
                    .class("pure-u-1 pure-u-lg-1 "),
                    .h2(
                        .class("brand-title"),
                        .text(site.name)
                    ),
                    .h3(
                        .class("brand-tagline"),
                        .text(site.description)
                    ),
                    .p(),
                    
                    .div(
                        .forEach(site.socialMediaLinks, { link in
                            
                            .a(
                                .href(link.url),
                                .class(link.icon)
                            )
                        })
                    )
                    
                )
            )
        )
    }
}
