import Foundation
import Moya
import UIKit

enum RecipeAPI {
    case postInfo(param: RecipeRequest)
    case postImage(id: String, image: UIImage)
}

extension RecipeAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://mainly-massive-cricket.ngrok-free.app")!
    }

    var path: String {
        switch self {
        case .postInfo:
            return "/products/common"
        case .postImage:
            return "/products/image"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .postInfo(let param):
            return .requestJSONEncodable(param)
        case .postImage(let id, let image):
            // UIImage를 Data로 변환
            guard let imageData = image.pngData() else {
                return .requestPlain // 이미지 변환 실패 시 빈 요청
            }
            return .uploadMultipart([
                MultipartFormData(provider: .data(imageData), name: "image", fileName: "image.png", mimeType: "image/png"),
                MultipartFormData(provider: .data(id.data(using: .utf8)!), name: "id") // ID를 Data로 변환
            ])
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "multipart/form-data"] // 멀티파트 형식의 Content-Type
    }
}
