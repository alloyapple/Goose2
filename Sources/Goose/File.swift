//
// Created by color on 5/11/19.
//

import Foundation
import Glibc

public class File {

    var _path: String = ""

    public init(path: String) {
        if let l = path.last, l == "/" {
            self._path = String(path.dropLast())
        } else {
            self._path = path
        }
    }

    var exists: Bool {
        var st = stat()
        return stat(self._path, &st) == 0
    }

    var canRead: Bool {
        var st = stat()
        if stat(self._path, &st) == 0 {
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
        return false
    }

    var canExecute: Bool {
        return false
    }

    var isFile: Bool {
        return false
    }

    var isLink: Bool {
        return false
    }

    var isDirectory: Bool {
        return false
    }

    var isDevice: Bool {
        return false
    }

    var isHidden: Bool {
        return false
    }

    var created: Timestamp {
        return Timestamp()
    }

    var LastModified: Timestamp {
        return Timestamp()
    }


}