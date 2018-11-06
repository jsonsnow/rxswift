//
//  Event.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/5.
//  Copyright © 2018 chen liang. All rights reserved.
//

import Foundation

public enum Event<Element> {
    
    /// Next element is produced
    case next(Element)
    
    /// Sequence terminated with an error
    case error(Swift.Error)
    
    /// Sequence completed successfully
    case completed
}

extension Event: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .next(let value):
            return "next(\(value))"
        case .error(let error):
            return "error(\(error))"
        case .completed:
            return "completed"
        }
    }
}

extension Event {
    
    /// Is `completed` or `error` event
    public var isStopEvent: Bool {
        switch self {
        case .next:
            return false
        case .error, .completed: return true
        }
    }
    
    /// if 'next' event, returns element value
    public var element: Element? {
        if case .next(let value) = self {
            return value
        }
        return nil
    }
    
    /// if `error` event return error
    public var error: Swift.Error? {
        if case .error(let error) = self {
            return error
        }
        return nil
    }
    
    /// if 'completed' event, returns `true`
    public var isCompleted: Bool {
        if case .completed = self {
            return true
        }
        return false
    }
}

extension Event {
    public func map<Result>(_ transform: (Element) throws -> Result) -> Event<Result> {
        do {
            switch self {
            case let .next(element):
                return .next(try transform(element))
            case let .error(error):
                return .error(error)
            case .completed:
                return .completed
            }
        }
        catch let e {
            return .error(e)
        }
    }
}

/// A type that can be converted to 'Event<Element>'
public protocol EventConvertible {
    /// Type of element in event
    associatedtype ElementType
    
    /// Event representation of this instance
    var event: Event<ElementType>  {get}
    
}

extension Event: EventConvertible {
    /// Event representation of this instance
    public var event: Event<Element> {
        return self
    }
}
