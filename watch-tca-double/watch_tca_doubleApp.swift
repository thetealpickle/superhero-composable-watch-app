/*
 +----------------------------------------------------------------------+
 | PROJECT: WATCH TCA DOUBLE
 +----------------------------------------------------------------------+
 | Copyright (c) 2021 THETEALPICKLE LLC.
 | All Rights Reserved.
 +----------------------------------------------------------------------+
 | Author: Jessica Joseph <jessica@thetealpickle.com>
 +----------------------------------------------------------------------+
 */

import ComposableArchitecture
import SwiftUI

@main
struct watch_tca_doubleApp: App {
    let store =  Store(initialState: Base.State(),
                       reducer: Base.reducer,
                   environment: .prod(environment: Base.Environment()))
    
    var body: some Scene {
        WindowGroup {
            BaseView(store: self.store)
        }
    }
}
