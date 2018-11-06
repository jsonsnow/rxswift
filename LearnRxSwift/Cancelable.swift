//
//  Cancelable.swift
//  LearnRxSwift
//
//  Created by chen liang on 2018/11/6.
//  Copyright © 2018 chen liang. All rights reserved.
//

import Foundation
public protocol Cancelable: Disposable {
    var isDisposed: Bool { get }
}
