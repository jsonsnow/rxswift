//
//  AnyObserver.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/5.
//  Copyright © 2018 chen liang. All rights reserved.
//

import Foundation

/// Forwards operations to an
public struct AnyObserver<Element>: ObserverType {
    
    /// The type of elements in sequence that observer can observer
    //public typealias E = Element
    public typealias EventHandler = (Event<Element>) -> Void
    
    private let observer: EventHandler
    
    
    /// Construct an instance whose `on(event)` calls `eventHandler(event)`
    ///
    /// - Parameter eventHandler: Event handler that observes sequences events
    public init(eventHandler: @escaping EventHandler) {
        self.observer = eventHandler
    }
    
    ///Construct an instance whose `on(event)` calls `observe.on(event)`
    public init<O: ObserverType>(_ observer: O) where O.E == Element {
        self.observer = observer.on 
    }
    
    
    /// Send `event` to this observer
    ///
    /// - Parameter event: Event instance
    public func on(_ event: Event<Element>) {
        self.observer(event)
    }
    
    
    /// Erases type of observer and returns canoical observer
    ///
    /// - Returns: type erased observer
    public func asObserver() -> AnyObserver<E> {
        return self
    }
    
}

extension ObserverType {
    
    /// Erases type of observer and returns canoical observer
    ///
    /// - Returns: type erased observer
    public func asObserver() -> AnyObserver<E> {
        return AnyObserver(self)
    }
    
    ///Transforms observer of type R to type E using custon transform method
    /// Each event sent to result observer is transformed and sent to `self`
    ///
    /// - returns: observer that transforms event.
    public func mapObserver<R>(_ transform: @escaping (R) throws -> E) -> AnyObserver<R> {
        return AnyObserver {e in
            self.on(e.map(transform))
        }
    }
}
