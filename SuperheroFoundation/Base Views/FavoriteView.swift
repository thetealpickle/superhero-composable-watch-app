/*
 +----------------------------------------------------------------------+
 | PROJECT: WATCH TCA SINGLE
 +----------------------------------------------------------------------+
 | Copyright (c) 2021 THETEALPICKLE LLC.
 | All Rights Reserved.
 +----------------------------------------------------------------------+
 | Author: Jessica Joseph <jessica@thetealpickle.com>
 +----------------------------------------------------------------------+
 */

import ComposableArchitecture
import SwiftUI

struct FavoriteView: View {
    let store: Store<Home.State, Favorite.Action>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            GeometryReader { (container: GeometryProxy) in

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    Text("Your Favorite Superheros")
                    ForEach(viewStore.viewModel.favorites, id: \.self.id) { object in
                        SuperheroRowView(model: object)
                            .frame(height: container.size.height * 0.15)
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(store: .init(initialState: .init(),
                                  reducer: Favorite.reducer,
                                  environment: .dev(environment: .init())))
    }
}
