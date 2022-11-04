//
//  Question.swift
//  Quiz App
//
//  Created by Mahmut Şenbek on 2.11.2022.
//

import Foundation


struct Question {
    
    let question : String
    let answers : String
    
    init(q: String, a: String) {
        question = q
     answers = a
    }
    
}
