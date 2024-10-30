import Foundation
import UIKit
import Moya

final class RecipeViewModel: ObservableObject {
    @Published var maxOf: Int = 0
    @Published var errorMessage = ""
    @Published var id: String = ""
    let provider = MoyaProvider<RecipeAPI>(plugins: [NetworkLoggerPlugin()])

    @Published var companyName: String = ""
    @Published var isProduct: Bool = false
    @Published var menu: String = ""
    @Published var price: String = ""
    @Published var explanation: String = ""
    @Published var isVegan: Bool = false
    @Published var isHalal: Bool = false
    @Published var category: String = ""
    @Published var isSpicy: Bool = false
    @Published var isHot: Bool = false
    @Published var image: UIImage?
    var base64ImageString: String?
    var responseId: String?

    // 응답 데이터를 저장할 프로퍼티 추가
    @Published var responseData: RecipeResponse?

    func setupCompanyName(companyName: String) {
        self.companyName = companyName
    }

    func setupIsProduct(isProduct: Bool) {
        self.isProduct = isProduct
    }

    func setupMenu(menu: String) {
        self.menu = menu
    }

    func setupPrice(price: String) {
        self.price = price
    }

    func setupExplanation(explanation: String) {
        self.explanation = explanation
    }

    func setupIsVegan(isVegan: Bool) {
        self.isVegan = isVegan
    }

    func setupIsHalal(isHalal: Bool) {
        self.isHalal = isHalal
    }

    func setupCategory(category: String) {
        self.category = category
    }

    func setupIsSpicy(isSpicy: Bool) {
        self.isSpicy = isSpicy
    }

    func setupIsHot(isHot: Bool) {
        self.isHot = isHot
    }

    func setupImage(image: UIImage) {
        self.image = image
    }

    func submit() {
        provider.request(.postInfo(param: RecipeRequest(
            companyName: companyName,
            isProduct: isProduct,
            menu: menu,
            price: price,
            explanation: explanation,
            isVegan: isVegan,
            isHalal: isHalal,
            category: category,
            isSpicy: isSpicy,
            isHot: isHot))
        ) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    // JSON 데이터를 RecipeResponse 구조체로 디코딩
                    let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        self?.responseId = String(decodedResponse.id) // id를 String으로 변환하여 responseId에 저장
                        self?.responseData = decodedResponse // responseData에 디코딩된 객체 저장
                        print("Response data saved successfully:", decodedResponse)
                        print("Response ID 저장 완료:", self?.responseId ?? "없음")
                    }
                } catch {
                    print("Failed to decode response:", error)
                    if let responseString = String(data: response.data, encoding: .utf8) {
                        print("Response data string:", responseString) // 추가된 출력
                    }
                }
            case let .failure(error):
                print("Error:", error.localizedDescription)
            }
        }
    }



    func imagesubmit() {
        print("테스트트트트트트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ")
        print(responseId)

        guard let id = responseId else {
            print("responseId가 nil입니다.")
            return
        }

        provider.request(.postImage(id: id, image: image ?? UIImage())) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    // JSON 데이터를 [String: Any] 딕셔너리로 변환
                    if let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                        DispatchQueue.main.async {
                            print("Response data saved successfully:", jsonResponse)
                        }
                    }
                } catch {
                    print("Failed to decode response:", error)
                }
            case let .failure(error):
                print("Error:", error.localizedDescription)
            }
        }
    }








    
}

struct RecipeResponse: Codable {
    let isProduct: Bool
    let menu: String
    let price: String
    let explanation: String
    let isVegan: Bool
    let isHalal: Bool
    let category: String
    let isSpicy: Bool
    let isHot: Bool
    let companyName: String?
    let allergy: String?
    let image: String?
    let link: String?
    let id: Int

    // 초기화 메서드
    init(isProduct: Bool, menu: String, price: String, explanation: String, isVegan: Bool, isHalal: Bool, category: String, isSpicy: Bool, isHot: Bool, companyName: String?, allergy: String?, image: String?, link: String?, id: Int) {
        self.isProduct = isProduct
        self.menu = menu
        self.price = price
        self.explanation = explanation
        self.isVegan = isVegan
        self.isHalal = isHalal
        self.category = category
        self.isSpicy = isSpicy
        self.isHot = isHot
        self.companyName = companyName
        self.allergy = allergy
        self.image = image
        self.link = link
        self.id = id
    }
}

