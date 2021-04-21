//
//  StackexchangeNetworkService.swift
//  StackOv (StackexchangeNetworkService module)
//
//  Created by Erik Basargin
//  Copyright © 2021 Erik Basargin. All rights reserved.
//

import Foundation
import Network
import DataTransferObjects

public struct StackexchangeNetworkService {
    
    // MARK: - Nested types
    
    enum Constants {
        static let baseUrl = URL(string: "https://api.stackexchange.com/2.2")!
        static let questionsFilter = "!gB66lk5yFs_jDNjfXUw05bhJZ(a*QmeMZkH" //"!*7PZ(S77sKA3Rc8i4h4)QI0bM8HG"
        static let questionFilter = "!PvyfxTBzonJRcqwIa*BHYvqSvHDWMY"
        static let answerFilter = "!3xJkL2qoqNZw7Litv"
        static let quotaKey = "P8uUWwsGz2WbRs6)qHu)yw(("
    }
    
    // MARK: - Endpoints
    
    public enum LoadQuestions {}
    public enum SearchQuestions {}
    public enum LoadQuestion {}
    public enum LoadAnswer {}
    public enum LoadAnswers {}
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - Requests
    
    @GET(Constants.baseUrl, "/questions?order=desc&sort=votes&page=%d&pagesize=%d")
    public var loadQuestions: Request<LoadQuestions, PostsEntry<QuestionEntry>>
    
    @GET(Constants.baseUrl, "/search/advanced?order=desc&sort=votes&q=%@&page=%d&pagesize=%d")
    public var searchQuestions: Request<SearchQuestions, PostsEntry<QuestionEntry>>
    
    @GET(Constants.baseUrl, "/questions/%d")
    public var loadQuestion: Request<LoadQuestion, PostsEntry<QuestionEntry>>
    
    @GET(Constants.baseUrl, "/answers/%d")
    public var loadAnswer: Request<LoadAnswer, PostsEntry<AnswerEntry>>
    
    @GET(Constants.baseUrl, "/questions/%d/answers?order=desc&sort=votes&page=%d&pagesize=%d")
    public var loadAnswers: Request<LoadAnswers, PostsEntry<AnswerEntry>>
}
