//
//  Errors.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/6.
//  Copyright © 2018 chen liang. All rights reserved.
//


let RxErrorDomain = "RxErrorDomain"
let RxCompositeFailures = "RxCompositeFailures"

public enum RxError: Swift.Error, CustomDebugStringConvertible {
    
    /// Unknown error occurred
    case unknown
    
    /// Performing an action on disposed object
    case disposed(object: AnyObject)
    
    /// Aritmetic overflow error
    case overflow
    
    /// Argumnet out of range error
    case argumentOutOfRange
    
    /// Sequence doesn't contain any element
    case noElements
    
    /// Sequence contains more than one element.
    case moreThanOneElement
    
    /// Timeout error
    case timeout
}

extension RxError {
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "Unknow error occurred"
        case .disposed(let object):
            return "Object '\(object)' was already disposed"
        case .overflow:
            return "Arithmetic overflow occurred."
        case .argumentOutOfRange:
            return "Argument out of range."
        case .noElements:
            return "Sequence doesn't contain any elements."
        case .moreThanOneElement:
            return "Sequence contains more than one element."
        case .timeout:
            return "Sequence timeout."
        }
    }
}

