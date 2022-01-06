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
    
    struct State: Equatable { }
    
    // MARK: - Static Properties
    // MARK: Reducer
    static var reducer = Reducer<Home.State, Action, SystemEnvironment<Base.Environment>> { (state, action, environment) in
        switch action {
            case .onAppear:
                state.viewModel.favorites = state.viewModel.objects.filter { $0.favorited }

                return .none
            case .deleteButtonTapped, .detailButtonTapped:
                return .none
        }
    }
}
