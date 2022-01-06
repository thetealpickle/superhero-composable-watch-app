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

struct BaseView: View {
    let store: Store<Base.State, Base.Action>
    
    var body: some View {
        WithViewStore(self.store.stateless) { _ in
            GeometryReader { (container: GeometryProxy) in
                ZStack(alignment: .bottom) {
                    TabView {
                        HomeView(store: store.scope(state: \.home,
                                                    action: Base.Action.home))
                            .tabItem {
                                Image(systemName: "house.fill")
                            }
                        
                        #if !os(iOS)
                        Button(action: {
                            print("search touched")
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                        .padding(.bottom, 20.0)
                        #endif
                        
                        FavoriteView(store: store.scope(state: \.home,
                                                        action: Base.Action.favorite))
                            .tabItem {
                                Image(systemName: "heart.fill")
                            }
                    }
                    .accentColor(.mint)
                    
                    #if os(iOS)
                    ToolbarView(store: store.scope(state: \.home,
                                                   action: Base.Action.toolbar))
                    #endif
                }
            }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(store: .init(initialState: Base.State(),
                              reducer: Base.reducer,
                              environment: .prod(environment: Base.Environment())))
    }
}
