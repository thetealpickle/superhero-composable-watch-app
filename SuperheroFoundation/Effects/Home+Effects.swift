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

extension Home {
    static func effect(decoder: JSONDecoder) -> Effect<APIResponse, APIError> {
        guard let accessToken = ProcessInfo.processInfo.environment["ACCESS_TOKEN"],
              let url = URL(string: "https://superheroapi.com/api/\(accessToken)/\(Int.random(in: 1...731))") else {
                  fatalError("Hey, you need to setup your access token!")
              }
                        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { _ in APIError.downloadError }
            .map { (response, error) in response }
            .decode(type: APIResponse.self, decoder: decoder)
            .mapError { _ in APIError.decodingError}
            .eraseToEffect()
    }
    
    static func testEffect(decoder: JSONDecoder) -> Effect<APIResponse, APIError> {
        let hero = Superhero.sampleModel
        
        return Effect(value: .init(id: hero.id, name: hero.name, work: hero.work, image: hero.image))
    }
}
