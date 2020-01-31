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
            .class("sidebar pure-u-1 pure-u-lg-1-4"),
            .grid(
                .div(
                    .class("pure-u-1 pure-u-lg-1 "),
                    .class("author-avatar"),
                    .img(
                        .src("https://scontent-yyz1-1.cdninstagram.com/v/t51.2885-19/s320x320/20759325_649132935277555_5991222899652952064_a.jpg?_nc_ht=scontent-yyz1-1.cdninstagram.com&_nc_ohc=cIralpmNJB0AX83Pf5L&oh=0566d20594b92980ab0bc8dd64ed4603&oe=5EB900D5")
                    )
                ),
                .wrapper(
                    .class("pure-u-1 pure-u-lg-1 "),
                    .h1(
                        .class("brand-title"),
                        .text(site.name)
                    ),
                    .h3(
                        .class("brand-tagline"),
                        .text(site.description)
                    )
                )
            )
        )
    }
}
