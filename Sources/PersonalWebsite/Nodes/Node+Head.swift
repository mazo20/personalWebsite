//
//  Node+Head.swift
//
//
//  Created by Maciej Kowalski on 29/01/2020.
//
import Plot
import Publish

extension Node where Context == HTML.DocumentContext {
    static func head(for site: Blog, sectionTitle: String = "") -> Node {
        var title = sectionTitle
        if title.isEmpty {
            title = site.name
        } else {
            title.append(" | " + site.name)
        }
        return Node.head(
            .title(title),
            .meta(
                .charset(.utf8),
                .name("viewport"),
                .content("width=device-width, initial-scale=1")
            ),
            .link(
                .rel(.stylesheet),
                .href("https://unpkg.com/purecss@1.0.1/build/pure-min.css"),
                .init(name: "integrity", value: "sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47"),
                .init(name: "crossorigin", value: "anonymous")
            ),
            .link(
                .rel(.stylesheet),
                .href("https://unpkg.com/purecss@1.0.1/build/grids-responsive-min.css")
            ),
            .link(
                .rel(.stylesheet),
                .href("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css")
            ),
            .link(
                .rel(.stylesheet),
                .href("/styles.css")
            )
            
        )
    }
}
