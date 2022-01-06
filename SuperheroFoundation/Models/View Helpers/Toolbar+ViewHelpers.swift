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
    // MARK: State - not currently in use
    struct State: Equatable {
        var searchInput: String
        var searchOutput: Superhero?
    }
    
    // MARK: - Environment
    struct Environment {
        var request: (JSONDecoder) -> Effect<Home.APIResponse, APIError>
    }
    
//    // MARK: - Static Properties
//    // MARK: Reducers
    static var reducer = Reducer<Home.State, Action, SystemEnvironment<Toolbar.Environment>> { (state, action, environment) in
        switch action {
            case .addAnotherHero:
                return environment
                    .request(environment.decoder())
                    .receive(on: environment.mainQueue())
                    .catchToEffect()
                    .map(Action.apiResponseLoaded)
            case .apiResponseLoaded(let result):
                print("entered the api response load for the toolbar")
                
                switch result {
                    case .success(let response):
                        state.configureModel(from: response)
                    case .failure:
                        break
                }
                return .none
        }
    }
}
