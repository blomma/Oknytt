import Foundation
import os

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs the payment flows like Apple Pay.
    @available(OSX 11.0, iOS 14.0, *)
    static let debug = Logger(subsystem: subsystem, category: "DEBUG")
}

public func DLog(
    message: String,
    view: String = "",
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line,
    column: UInt = #column
) {
    #if DEBUG
        Logger.debug.debug(
            "🟩 \(file) : \(view) : \(function) : \(line) : \(column) - \(message) 🟩")
    #endif
}

// get current dispatch queue label
extension DispatchQueue {
    static var currentLabel: String {
        return String(validatingUTF8: __dispatch_queue_get_label(nil)) ?? "unknown"
    }
}
