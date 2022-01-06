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

extension Home {
    struct APIResponse: Decodable, Equatable {
        var id: String 
        var name: String
        var work: Superhero.Work
        var image: Superhero.Image
    }
}
