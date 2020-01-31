//
//  Node+Header.swift
//
//
//  Created by Maciej Kowalski on 29/01/2020.
//
import Plot

extension Node where Context == HTML.BodyContext {
    private static var sections: [Blog.SectionID] {
        //[Blog.SectionID.about, Blog.SectionID.main]
        []
    }
    
    static func header(for site: Blog) -> Node {
        return .header(
            .class("pure-menu pure-menu-horizontal pure-u-1-1"),
            .a(
                .class("pure-menu-heading"),
                .text(site.title),
                .href("/")
            ),
            .ul(
                .class("pure-menu-list"),
                .forEach(sections, { section in
                    .li(
                        .class("pure-menu-item"),
                        .a(
                            .class("pure-menu-link"),
                            .text(section.rawValue.capitalized),
                            .href(site.path(for: section))
                        )
                    )
                })
            )
        )
        
    }
}
