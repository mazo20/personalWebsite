//
//  Node+SidebarPage.swift
//  
//
//  Created by Maciej Kowalski on 09/02/2020.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func sidebarPage(_ nodes: Node...) -> Node {
        .div(
            .class("pure-u-1 pure-u-lg-19-24 content"),
            .group(nodes)
        )
    }
}
