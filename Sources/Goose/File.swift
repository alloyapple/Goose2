//
// Created by color on 5/11/19.
//

import Foundation
import Glibc
import GlibcExtra

public class File: Equatable {

    var path: String = ""

    public init(path: String) {
        if let l = path.last, l == "/" {
            self.path = String(path.dropLast())
        } else {
            self.path = path
        }
    }

    var exists: Bool {
        var st = stat()
        return stat(self.path, &st) == 0
    }

    var canRead: Bool {
        var st = stat()
        if stat(self.path, &st) == 0 {
            if st.st_uid == geteuid() {
                return (st.st_mode & S_IRUSR) != 0
            } else if st.st_gid == getegid() {
                return st.st_mode & S_IRGRP != 0
            } else {
                return (st.st_mode & S_IROTH) != 0 || geteuid() == 0
            }

        }
        return false
    }

    var canWrite: Bool {
        var st = stat()
        if stat(self.path, &st) == 0 {
            if st.st_uid == geteuid() {
                return (st.st_mode & S_IWUSR) != 0
            } else if st.st_gid == getegid() {
                return st.st_mode & S_IWGRP != 0
            } else {
                return (st.st_mode & S_IWOTH) != 0 || geteuid() == 0
            }

        }
        return false
    }

    var canExecute: Bool {
        var st = stat()
        if stat(path, &st) == 0 {
            if st.st_uid == geteuid() || geteuid() == 0 {
                return (st.st_mode & S_IXUSR) != 0
            } else if st.st_gid == getegid() {
                return (st.st_mode & S_IXGRP) != 0
            } else {
                return (st.st_mode & S_IXOTH) != 0
            }
        }

        return false
    }


    var isFile: Bool {
        var st = stat()
        if stat(path, &st) == 0 {
            let ret = C_S_ISREG(st.st_mode) == 0
            return !ret
        }
        return false
    }


    var isLink: Bool {
        var st = stat()
        if stat(path, &st) == 0 {
            let ret = C_S_ISLNK(st.st_mode) == 0
            return !ret
        }
        return false
    }

    var isDirectory: Bool {
        var st = stat()
        if stat(path, &st) == 0 {
            let ret = C_S_ISDIR(st.st_mode) == 0
            return !ret
        }
        return false
    }

    var isDevice: Bool {
        var st = stat()
        if stat(path, &st) == 0 {
            let ret = C_S_ISBLK(st.st_mode) == 0
            let ret1 = C_S_ISCHR(st.st_mode) == 0
            return !ret || !ret1
        }
        return false
    }


    //TODO:
    var isHidden: Bool {
        return false
    }

    //TODO:
    var created: Timestamp {
        return Timestamp()
    }

    //TODO:
    var lastModified: Timestamp {
        return Timestamp()
    }

    //TODO:
    var size: File {
        return self
    }

    //TODO:
    public func writeable(flag: Bool) {

    }

    //TODO:
    public func readOnly(flag: Bool) {

    }

    //TODO:
    public func executable(flag: Bool) {

    }

    //TODO:
    public func copyTo(path: String) {

    }

    //TODO:
    public func moveTo(path: String) {

    }


    //TODO:
    public func renameTo(path: String) {

    }

    //TODO:
    public func linkToHard(path: String) {

    }

    //TODO:
    public func linkToSymbolic(path: String) {

    }

    //TODO:
    public func remove(recursive: Bool = false) {

    }

    //TODO:
    public func createFile() -> Bool {
        return false
    }

    //TODO:
    public func createDirectory() -> Bool {
        return false
    }

    //TODO:
    public func createDirectories() -> Bool {
        return false
    }

    //TODO:
    public func list() -> [String] {
        return []
    }

    //TODO:
    public func list() -> [File] {
        return []
    }

    //TODO:
    public func totalSpace() -> Int64 {
        return 0
    }

    //TODO:
    public func usableSpace() -> Int64 {
        return 0
    }

    //TODO:
    public func freeSpace() -> Int64 {
        return 0
    }

    public static func ==(lhs: File, rhs: File) -> Bool {
        return lhs.path == rhs.path
    }

    public static func !=(lhs: File, rhs: File) -> Bool {
        return lhs.path != rhs.path
    }

    public static func >(lhs: File, rhs: File) -> Bool {
        return lhs.path > rhs.path
    }

    public static func >=(lhs: File, rhs: File) -> Bool {
        return lhs.path >= rhs.path
    }

    public static func <(lhs: File, rhs: File) -> Bool {
        return lhs.path < rhs.path
    }

    public static func <=(lhs: File, rhs: File) -> Bool {
        return lhs.path <= rhs.path
    }
}