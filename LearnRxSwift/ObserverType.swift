//
//  ObserverType.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/5.
//  Copyright © 2018 chen liang. All rights reserved.
//

import Foundation
public protocol  ObserverType {
    /// The type of elements in sequence that observer can observe
    associatedtype E
    
    /// Notify observer about sequence event
    ///
    /// - Parameter event: Event that occurred
    func on(_ event: Event<E>)
}

extension ObserverType {
    
    /// Convenience method equivalent to 'on(.next(element: E))'
    ///
    /// - Parameter element: Next element to send to observer(s)
    public func onNext(_ element: E) {
        on(Event.next(element))
    }
    
    
    /// Convenience method equivalent to 'on(.completed)'
    public func onCompleted() {
        on(Event.completed)
    }
    
    
    /// Convenienc method equivalent to 'on(.error(Swift.Error))'
    ///
    /// - Parameter error: Swift.Error to send to observer(s)
    public func onError(_ error : Swift.Error) {
        on(.error(error))
    }
}
