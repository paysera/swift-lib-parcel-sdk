import PayseraCommonSDK
import Alamofire

public struct ParcelAPIClientFactory {
    
    public static func createParcelAPIClient(
        credentials: PSApiJWTCredentials,
        tokenRefresher: PSTokenRefresherProtocol? = nil,
        logger: PSLoggerProtocol? = nil
    ) -> ParcelAPIClient {
        let interceptor = PSRequestAdapter(credentials: credentials)
        let session = Session(interceptor: interceptor)
    
        return ParcelAPIClient(
            session: session,
            credentials: credentials,
            tokenRefresher: tokenRefresher,
            logger: logger
        )
    }
}
