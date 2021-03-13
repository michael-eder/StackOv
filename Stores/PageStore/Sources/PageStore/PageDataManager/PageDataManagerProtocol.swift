//
//  PageDataManagerProtocol.swift
//  StackOv (PageStore module)
//
//  Created by Erik Basargin
//  Copyright © 2021 Erik Basargin. All rights reserved.
//

import Foundation

public protocol PageDataManagerProtocol: class {
    
    typealias CollectedData = [QuestionModel]
    typealias ResultHandler = (Result<CollectedData, Error>) -> Void
    
    var data: CollectedData? { get }
    var isLoading: Bool { get }
    var hasMoreData: Bool { get }
    
    func fetch(receiveCompletion: @escaping ResultHandler)
    func reload(receiveCompletion: @escaping ResultHandler)
    func reset()
}
