//
//  Node+ArticleHeader.swift
//  
//
//  Created by Maciej Kowalski on 15/02/2020.
//

import Plot
import Publish
import Foundation

extension Node where Context == HTML.BodyContext {
    static func articleHeader(for item: Item<Blog>) -> Node {
        .div(
            .class("article-header"),
            .h1(.text(item.title)),
            .i(
                .text(DateFormatter.article.string(from: item.date))
            )
        )
    }
}
