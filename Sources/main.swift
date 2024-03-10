import Foundation

let env = ProcessInfo.processInfo.environment

let value = env["LOG_LEVEL"] ?? "trace"

print(value)
