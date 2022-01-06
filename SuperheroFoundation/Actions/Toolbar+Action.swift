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

extension Toolbar {
    enum Action: Equatable {
        case addAnotherHero
        case apiResponseLoaded(Result<Home.APIResponse, APIError>)
        
        static func ==(_ lhs: Action, _ rhs: Action) -> Bool {
            switch (lhs, rhs) {
                case (.apiResponseLoaded(let v1), .apiResponseLoaded(let v2)):
                    return v1 == v2
                default:
                    return false
            }
        }
    }
}
