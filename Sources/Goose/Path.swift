//
// Created by color on 5/12/19.
//

import Foundation


public struct Path {
    var node: String = ""
    var device: String = ""
    var name: String = ""
    var version: String = ""
    var dirs: [String] = []
    var absolute: Bool = false

    public init(_ path: String) {
        var path = path

        if let first = path.first, first == "/" {
            absolute = true
        } else if let first = path.first, first == "~" {

        }


    }

    mutating public func pushDirectory(dir: String) {
        guard dir.count > 0 else {
            return
        }

        guard dir != "." else {
            return
        }

        if dir == ".." {
            if let last = dirs.last, last != ".." {
                dirs.removeLast()
            } else if absolute == false {
                dirs.append(dir)
            }
        } else {
            dirs.append(dir)
        }

    }

    mutating public func popDirectory() {
        self.dirs.removeLast()
    }

    mutating public func popFrontDirectory() {
        self.dirs.removeFirst()
    }

    func directory(n: Int) -> String {
        guard n < dirs.count else {
            return name
        }

        return dirs[n]
    }

    func parseUnix(path: String) {

    }

    subscript(index: Int) -> String {
        guard index < dirs.count else {
            return name
        }

        return dirs[index]
    }

    var `extension`: String {
        if let index = self.name.lastIndex(of: ".") {
            return String(self.name[index...])
        } else {
            return ""
        }
    }

    var fileName: String {
        set {
            self.name = newValue
        }

        get {
            return self.name
        }
    }

    static public let separator = "/"
}