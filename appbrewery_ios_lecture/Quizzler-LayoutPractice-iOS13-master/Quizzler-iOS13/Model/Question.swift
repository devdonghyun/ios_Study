//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 안동현 on 2021/07/30.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer_list: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer_list = a
        answer = correctAnswer
    }
}
