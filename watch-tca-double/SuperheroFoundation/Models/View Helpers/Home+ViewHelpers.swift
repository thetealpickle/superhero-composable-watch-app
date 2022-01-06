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
    // MARK: - Environment
    struct Environment {
        var request: (JSONDecoder) -> Effect<APIResponse, APIError>
    }
    
    // MARK: - State
    struct State {
        var apiResponse: APIResponse?
        var viewModel: ViewModel?
    }
    
    // MARK: - View Model
    struct ViewModel {
        var objects: [Superhero]
    }
    
    // MARK: - Static Properties
    // MARK: Reducer
    static var reducer = Reducer<State, Action, SystemEnvironment<Home.Environment>> { (state, action, environment) in
        switch action {
            case .apiResponseLoaded(let result):
                return .none
            case .detailButtonTapped:
                return .none
        }
    }
}
