import Hummingbird
import Logging

func buildApplication(
    configuration: HBApplicationConfiguration
) async throws -> some HBApplicationProtocol {

    var logger = Logger(label: "hummingbird-logger")
    logger.logLevel = .trace

    let env = HBEnvironment.shared
    // let env = try await HBEnvironment.dotEnv()
    let logLevel = env.get("LOG_LEVEL")
    
    if let logLevel, let logLevel = Logger.Level(rawValue: logLevel) {
        logger.logLevel = logLevel
    }

    let router = HBRouter()
    router.get("/") { _, _ in
        return "Hello"
    }
    
    let app = HBApplication(
        router: router,
        configuration: configuration,
        logger: logger
    )
    return app
}
