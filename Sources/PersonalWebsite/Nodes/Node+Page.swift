//
//  Node+Grid.swift
//
//
//  Created by Maciej Kowalski on 30/01/2020.
//
import Plot

extension Node where Context == HTML.BodyContext {
    static func page(_ nodes: Node...) -> Node {
        .div(
            .class("pure-u-1 content"),
            .group(nodes)
        )
    }
}
