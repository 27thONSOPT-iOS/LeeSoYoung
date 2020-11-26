//
//  SignUpService.swift
//  Sopt27SixthAssignment
//
//  Created by soyounglee on 2020/11/21.
//

import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService()
    // 로그인 통신에 대한 함수 정의
    func signUp(email: String,
                password: String,
                userName: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.usersSignUpURL
        let header: HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        let body: Parameters = [
            "email": email,
            "password": password,
            "userName": userName
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData {(response) in
            switch response.result {
            case .success:
                print("데이터는 받아 왔니?")
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeSignUpData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
    }
    
    private func judgeSignUpData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignInData>.self, from: data) else {
            return .pathErr
        }
        switch status {
        case 200:
            print ("status = \(200)")
            return .success(decodedData.data)
        case 400..<500:
            print ("status = \(400-500)")
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
}

