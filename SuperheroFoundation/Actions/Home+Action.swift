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

extension Home {
    enum Action: Equatable {
        case onAppear
        case addAnotherHero
        case apiResponseLoaded(Result<APIResponse, APIError>)
        case detailButtonTapped(_ model: Superhero)
        
        static func ==(_ lhs: Action, _ rhs: Action) -> Bool {
            switch (lhs, rhs) {
                case (.detailButtonTapped, .detailButtonTapped), (.onAppear, .onAppear),
                    (.addAnotherHero, .addAnotherHero):
                    return true
                default:
                    return false
            }
        }
    }
}
