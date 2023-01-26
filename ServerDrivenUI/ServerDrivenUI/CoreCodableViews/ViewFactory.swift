//
//  ViewFactory.swift
//  My360iDevApp
//
//  Created by Florian Harr on 8/21/21.
//

import Foundation
import SwiftUI

struct ViewFactory {
    @ViewBuilder
    static func view(for codableView: CodableView) -> some View {
        switch codableView {
        case let .list(cView): cView
        case let .text(cView): cView
        case let .button(cView): cView
        case let .image(cView): cView
        case let .systemImage(cView): cView
        case let .vStack(cView): cView
        case let .hStack(cView): cView
        case let .zStack(cView): cView
        case let .navigationStack(cView): cView
        case let .color(cView): cView
        case let .spacer(cView): cView
        case let .divider(cView): cView
        case let .textField(cView): cView
        }
    }
}
