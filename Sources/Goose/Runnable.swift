//
// Created by color on 5/11/19.
//

import Foundation

public protocol Runnable {
    func run()
}

public class FunctorRunnable: Runnable {
    public let f: ()->Void

    public init(f: @escaping ()->Void) {
        self.f = f
    }

    public func run() {
        self.f()
    }
}