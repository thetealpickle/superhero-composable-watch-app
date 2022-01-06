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

extension Detail {
    // MARK: - Environment
    struct Environment {
        var request: (JSONDecoder) -> Effect<Home.APIResponse, APIError>
    }
    
    // MARK: - State
    struct State {
        var viewModel: Superhero?
    }

    // MARK: - Static Properties
    // MARK: Reducer
    static var reducer = Reducer<State, Action, SystemEnvironment<Detail.Environment>> { (state, action, environment) in
        switch action {
            case .navigateBackTapped:
                return .none
        }
    }
}
