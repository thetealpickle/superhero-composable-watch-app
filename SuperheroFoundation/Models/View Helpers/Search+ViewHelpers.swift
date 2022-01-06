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

extension Search {
    // MARK: - Environment
    struct Environment {
        var request: (JSONDecoder) -> Effect<Home.APIResponse, APIError>
    }
    
    // MARK: - State
    struct State {
        var apiResponse: Home.APIResponse?
        var viewModel: ViewModel?
    }
    
    // MARK: - View Model
    struct ViewModel {
        var objects: [Superhero]
    }
    
    // MARK: - Static Properties
    // MARK: Reducer
    static var reducer = Reducer<State, Action, SystemEnvironment<Search.Environment>> { (state, action, environment) in
        switch action {
            case .searchHomeTriggered, .searchFavoriteTriggered:
                return .none
        }
    }
}
