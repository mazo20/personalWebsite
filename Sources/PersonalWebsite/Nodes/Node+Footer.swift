//
//  Node+Footer.swift
//  
//
//  Created by Maciej Kowalski on 30/01/2020.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func footer(for site: Blog) -> Node {
        return .div(
            .class("footer pure-u-1"),
            .div(
                //.class("pure-u-1"),
                .text("Copyright © \(site.name) 2020")
            ),
            .div(
                .class("pure-u-1"),
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                ),
                .text(". Written in Swift.")
            )
        )
    }
}
