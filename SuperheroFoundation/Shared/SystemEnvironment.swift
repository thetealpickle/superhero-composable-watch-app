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

@dynamicMemberLookup
struct SystemEnvironment<Environment> {
    var environment: Environment
    
    subscript<Dependency>(
        dynamicMember keyPath: WritableKeyPath<Environment, Dependency>
    ) -> Dependency {
        get { self.environment[keyPath: keyPath] }
        set { self.environment[keyPath: keyPath] = newValue }
    }
    
    var decoder: () -> JSONDecoder
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    // MARK: - Environment Setup
    static func dev(environment: Environment) -> Self {
        Self(environment: environment, decoder: { JSONDecoder() }, mainQueue: { .main })
    }
    
    static func prod(environment: Environment) -> Self {
        Self(environment: environment, decoder: { JSONDecoder() }, mainQueue: { .main })
    }
}

