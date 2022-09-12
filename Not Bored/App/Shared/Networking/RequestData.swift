//
//  RequestData.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation
import Alamofire
import UIKit

struct RequestData {
    
    let path: String
    let method: Alamofire.HTTPMethod
    let headers: [String : String]
    let parameters: [ String : Any ]
    
    init(endpoint : String , method : Alamofire.HTTPMethod = .get , headers: [String : String ] = [:], parameters: [String : Any?] = [:] ){
        
        self.path = Request.baseURL + endpoint
        self.method = method
        self.headers = headers
        
        var params : [String : Any ] = [:]
        
        for param in parameters {
            if let value = param.value {
                params[param.key] = value
            }
        }
        self.parameters = params
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
    
    func getRequest<T : Decodable >( element : T.Type , onResult: @escaping (Swift.Result<T,Error>) -> Void )  -> DataRequest {
        
        return AF.request(request.path , method: request.method, parameters: request.parameters as Parameters, encoding: request.getEncoding()  , headers: HTTPHeaders(request.headers))
            .responseDecodable(of: element.self) { response in
                
                switch response.result {
                case .success(let data) :
                    onResult(.success(data))
                    break
                case .failure(let error):
                    onResult(.failure(error))
                    break
                }
            }
    }
}

enum NetworkingError : Error {
    case error
}
