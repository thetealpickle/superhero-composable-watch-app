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

extension Base {
// MARK: - Environment
struct Environment { }

// MARK: - State
struct State {
    var home = Home.State()
    var search = Search.State()
    }

// MARK: - Static Properties
// MARK: Reducers
    static var reducer = Reducer<State, Action, SystemEnvironment<Environment>>.combine(
    Home.reducer.pullback(state: \.home,
                          action: /Action.home,
                          environment: { _ in
                                  .prod(environment: .init(request: Home.effect))
                          }),
    Favorite.reducer.pullback(state: \.home,
                              action: /Action.favorite,
                              environment: { _ in
                                      .prod(environment: .init())
                              }),
    Toolbar.reducer.pullback(state: \.home,
                             action: /Action.toolbar,
                             environment: { _ in
                                     .prod(environment: .init(request: Home.effect))
                             })
    )
}
