//
// Created by color on 5/11/19.
//

import Foundation


public class Timestamp {

    let ts: Int64

    public init() {
        var _ts = timespec()
        if clock_gettime(CLOCK_REALTIME, &_ts) == 0 {
            ts = Int64(_ts.tv_sec) * Timestamp.resolution() + Int64(_ts.tv_nsec / 1000)
        } else {
            ts = 0
        }
    }

    public init(tv: Int64) {
        self.ts = tv
    }


    public static func resolution() -> Int64 {
        return 1000000
    }

    public static func fromEpochTime(t: Int) -> Timestamp {
        return Timestamp(tv: Int64(t) * Timestamp.resolution())
    }

    public static func fromUtcTime(t: Int64) -> Timestamp {
        var val = t - (Int64(0x01b21dd2) << 32) - 0x13814000
        val /= 10

        return Timestamp(tv: val)
    }
}