/*
 +----------------------------------------------------------------------+
 | PROJECT: SUPERHERO FOUNDATION
 +----------------------------------------------------------------------+
 | Copyright (c) 2021 THETEALPICKLE LLC.
 | All Rights Reserved.
 +----------------------------------------------------------------------+
 | Author: Jessica Joseph <jessica@thetealpickle.com>
 +----------------------------------------------------------------------+
 */

import ComposableArchitecture

extension Favorite {
    enum Action: Equatable {
        case onAppear
        case deleteButtonTapped(_ model: Superhero)
        case detailButtonTapped(_ model: Superhero)
        
        static func ==(_ lhs: Action, _ rhs: Action) -> Bool {
            switch (lhs, rhs) {
                case (.detailButtonTapped(_), .detailButtonTapped(_)), (.deleteButtonTapped(_), .deleteButtonTapped(_)), (.onAppear, .onAppear):
                    return true
                default:
                    return false
            }
        }
    }
}
