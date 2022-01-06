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

struct HomeView: View {
    let store: Store<Home.State, Home.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            GeometryReader { (container: GeometryProxy) in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        #if !os(iOS)
                        Button(action: {
                            viewStore.send(.addAnotherHero)
                        }){
                            Text("Add Another One")
                                .padding()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: container.size.width * 0.05)
                                .foregroundColor(.pink))
                        .foregroundColor(.white)
                        #endif
                        
                        Text("Soaring with Superheros")
                        
                        ForEach(viewStore.viewModel.objects, id: \.self.id) { object in
                            Text(object.name)
                        SuperheroRowView(model: Superhero.sampleModel)
                        }
                    }
                    .padding(.horizontal, container.size.width * 0.04)
                }
                .onAppear {
                    if viewStore.viewModel.objects.isEmpty {
                        viewStore.send(.onAppear)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: Store(initialState: Home.State(),
                              reducer: Home.reducer,
                              environment: .dev(environment: Home.Environment(request: Home.testEffect))))
    }
}
