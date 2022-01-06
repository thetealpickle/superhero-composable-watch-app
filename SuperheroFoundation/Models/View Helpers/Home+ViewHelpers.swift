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
import SwiftUI

extension Home {
    // MARK: - Environment
    struct Environment {
        var request: (JSONDecoder) -> Effect<APIResponse, APIError>
    }
    
    // MARK: - State
    struct State: Equatable {
        var viewModel = ViewModel()
        
        mutating
        func configureModel(from response: APIResponse) {
            guard !viewModel.objects.contains (where: { $0.name == response.name }) else { return }
            
            viewModel.objects.append(.init(id: response.id, name: response.name, work: response.work, image: response.image))
            print("entered the state configurator  \(viewModel)")
        }
    }
    
    // MARK: - View Model
    struct ViewModel: Equatable {
        var objects: [Superhero] = []
        var favorites: [Superhero] = []
    }
    
    // MARK: - Static Properties
    // MARK: Reducer
    static var reducer = Reducer<State, Action, SystemEnvironment<Environment>> { (state, action, environment) in
        switch action {
            case .onAppear, .addAnotherHero:
                return environment
                    .request(environment.decoder())
                    .receive(on: environment.mainQueue())
                    .catchToEffect()
                    .map(Action.apiResponseLoaded)
            case .apiResponseLoaded(let result):
                switch result {
                    case .success(let response):
                        state.configureModel(from: response)
                    case .failure:
                        break
                }
                return .none
            case .detailButtonTapped:
                return .none
        }
    }
}
