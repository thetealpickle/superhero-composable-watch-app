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
        var request: (JSONDecoder) -> Effect<APIResponse, APIError>
    }
    
    // MARK: - State
    struct State {
        var apiResponse: APIResponse?
        var viewModel: ViewModel?
        
//        func configure() {}
    }
    
    // MARK: - View Model
    struct ViewModel {
        var name: String
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
