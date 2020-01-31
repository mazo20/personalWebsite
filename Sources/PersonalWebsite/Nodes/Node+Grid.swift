//
//  Node+Grid.swift
//
//
//  Created by Maciej Kowalski on 29/01/2020.
//
import Plot

extension Node where Context == HTML.BodyContext {
    static func grid(_ nodes: Node...) -> Node {
        .div(
            .id("layout"),
            .class("pure-g"),
            .group(nodes)
        )
    }
}
