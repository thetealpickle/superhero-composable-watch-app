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

struct ToolbarView: View {
    let store: Store<Home.State, Toolbar.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            GeometryReader { (container: GeometryProxy) in
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            print("search touched")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .renderingMode(.template)
                                .padding(container.size.width * 0.05)
                                .background(Circle()
                                                .foregroundColor(.pink))
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            viewStore.send(.addAnotherHero)
                        }){
                            Image(systemName: "plus")
                                .renderingMode(.template)
                                .padding(container.size.width * 0.05)
                                .background(Circle()
                                                .foregroundColor(.pink))
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding(.bottom, container.size.height * 0.025)
                }
            }
        }
    }
}
