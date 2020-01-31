//
//  Node+Wrapper.swift
//  
//
//  Created by Maciej Kowalski on 30/01/2020.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(
            .class("wrapper"),
            .group(nodes)
        )
    }
}
