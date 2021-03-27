//
//  FavoriteStore.swift
//  StackOv (FavoriteStore module)
//
//  Created by Erik Basargin
//  Copyright © 2021 Erik Basargin. All rights reserved.
//

import Foundation
import Combine
import StackexchangeNetworkService
import Common

public final class FavoriteStore: ObservableObject {
    
    // MARK: - Nested types
    
    public enum State {
        case unknown
        case emptyContent
        case content([QuestionModel])
        case loading
        case error(Error)
    }
    
    // MARK: - Substores & Services
    
    let dataManager: FavoriteDataManagerProtocol
    
    // MARK: - Public properties
    
    @Published public private(set) var state: State = .unknown
    @Published public private(set) var loadMore: Bool = false
    
    // MARK: - Initialization and deinitialization
    
    public init(dataManager: FavoriteDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

// MARK: - Actions

public extension FavoriteStore {
    
    func loadNextQuestions() {
        if case .loading = state { return }
        loadMore = true
        dataManager.fetch { [unowned self] result in
            loadMore = false
            switch result {
            case let .success(models):
                if models.isEmpty { break }
                state = .content(models)
            case .failure:
                // need show error not by changing the state of screen
                break
            }
        }
    }
    
    func reloadQuestions() {
        loadMore = false
        state = .loading
        dataManager.reload { [unowned self] result in
            switch result {
            case let .success(models):
                state = models.isEmpty ? .emptyContent : .content(models)
            case .failure:
                switch state {
                case .emptyContent:
                    // need show error state of screen
                    break
                default:
                    // need show error not by changing the state of screen
                    break
                }
            }
        }
    }
}
