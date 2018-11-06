//
//  Reactive.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/5.
//  Copyright © 2018 chen liang. All rights reserved.
//

import Foundation

public struct Reactive<Base> {
    
    /// Base object to extend
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions
public protocol ReactiveCompatible {
    
    ///Extended type
    associatedtype CompatibleType
    
    /// Reactive extensions
    static var rx: Reactive<CompatibleType>.Type {get set}
    
    /// Reactive extensions
    var rx: Reactive<CompatibleType> {get set}
    
}

extension ReactiveCompatible {
    public static var rx: Reactive<Self>.Type {
        get {
            return Reactive<Self>.self
        }
        set {
            // this enbale using reactive to mutate base type
        }
    }
    
    /// Reactive extensions
    public var rx: Reactive<Self> {
        get {
           return Reactive(self)
        }
        set {
            //
        }
    }
}

import class Foundation.NSObject

/// Extend NSObject with 'rx' proxy
extension NSObject: ReactiveCompatible {}
