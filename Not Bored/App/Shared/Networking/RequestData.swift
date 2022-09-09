//
//  RequestData.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation
import Alamofire

struct RequestData {
    
    let path: String
    let method: Alamofire.HTTPMethod
    let headers: [String : String]
    let parameters: [ String : Any? ]
    
    init(endpoint : String , method : Alamofire.HTTPMethod = .get , headers: [String : String ] = [:], parameters: [String : Any?] = [:] ){
        
        self.path = Request.baseURL + endpoint
        self.method = method
        self.headers = headers
        self.parameters = parameters
        
    }
    
    func getEncoding() -> ParameterEncoding {
        if method == .get {
            return URLEncoding.init( boolEncoding: .literal)
        } else {
            return JSONEncoding.default
        }
    }
    
    
}

protocol NetworkRequestTpe {
    var request : RequestData { get }
    var identifier: String { get }
    
    typealias Headers = Dictionary< String , String >
    typealias Parameters = Dictionary< String , Any >
    
}

extension NetworkRequestTpe {
    
    var identifier: String { String(describing: type(of: self ))}
    
    
    func getRequest(onResult: @escaping (Swift.Result<Any,Error>) throws -> Void )  -> DataRequest {
        
        return AF.request(request.path , method: request.method, parameters: request.parameters, encoding: request.getEncoding()  , headers: HTTPHeaders(request.headers))
            .responseJSON { ( res : AFDataResponse ) in
                
                do {
                    
                    if let _ = res.error {
                        try onResult(.failure(NetworkingError.error))
                    }
                                        
                    if let statusCode = res.response?.statusCode {
                        
                        guard let value = res.value else {
                            try onResult(.failure(NetworkingError.error))
                            return
                        }
                        
                        switch statusCode {
                        case (200...299) :
                            try onResult(.success(value))
                            break
                        default :
                            try onResult(.failure(NetworkingError.error))
                            break
                        }
                    }
                    
                } catch {
                    
                }
               
                return
            }
        
    }
}

enum NetworkingError : Error {
    case error
}
