//
//  Recipe.swift
//  ok-client
//
//  Created by the-teacher on 20/05/15.
//  Copyright (c) 2015 the-teacher. All rights reserved.
//

import Foundation

class Recipe {
    var title:   String?
    var intro:   String?
    var content: String?
    
    init(title: String?, intro: String?, content: String?) {
        self.title   = title
        self.intro   = intro
        self.content = content
    }
}
