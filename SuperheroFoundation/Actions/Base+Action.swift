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

extension Base {
    enum Action {
        case home(Home.Action)
        case favorite(Favorite.Action)
        case search(Search.Action)
        case toolbar(Toolbar.Action)
    }
}

