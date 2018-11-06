//
//  ObservableType.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/6.
//  Copyright © 2018 chen liang. All rights reserved.
//

import Foundation

/// Represents a push style sequence
public protocol ObservableType: ObservableConvertibelType {
    
    
    func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E 
}
