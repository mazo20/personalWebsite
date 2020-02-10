//
//  Node+Header.swift
//
//
//  Created by Maciej Kowalski on 29/01/2020.
//
import Plot

extension Node where Context == HTML.BodyContext {
    
    static func header(for site: Blog) -> Node {
        return .header(
            .class("pure-u-1-1"),
            .div(
                .class("header-layout"),
                .div(
                    .class("header-title"),
                    .a(
                        .text(site.title),
                        .href("/")
                    )
                ),
                .div(
                    .class("header-section"),
                    .ul(
                        .forEach(site.sections, { section in
                            .li(
                                .a(
                                    .text(section.rawValue.capitalized),
                                    .href(site.path(for: section))
                                )
                            )
                        })
                    )
                )
            )
        )
    }
}
