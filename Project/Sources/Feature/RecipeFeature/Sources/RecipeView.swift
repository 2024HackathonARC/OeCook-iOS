//
//  RecipeView.swift
//  oeCook
//
//  Created by 서지완 on 10/30/24.
//

import SwiftUI

struct RecipeView: View {
    @State private var categoryTextField: String = ""
    @State private var companyTextField: String = ""
    @State private var menuTextField: String = ""
    @State private var explanationTextField: String = ""
    @State private var priceTextField: String = ""
    @State private var showError: Bool = false
    @State private var showPicker1 = false
    @State private var showPicker2 = false
    let languag = ["베이커리", "디저트/음료", "외식/다이닝", "한식"]
    @State private var openPhoto = false
    @State private var images: UIImage?
    @State private var selectedImageIndex: Int?
    @State private var selectedColor = ""
    @State private var selectedImage: UIImage?
    @StateObject var viewModel: RecipeViewModel
    @State private var oButton = false
    @State private var xButton = false
    @State private var oButton2 = false
    @State private var xButton2 = false
    @State var allergyStatus = [Bool](repeating: false, count: 8)
    @State var loveStatus = [Bool](repeating: false, count: 2)
    @State private var isActive = false
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    @State private var navigateToTestView = false
    @State private var shouldNavigateToWebView = false
    @Binding var selectedTab: Int
    @State private var isSpicy = false
    @State private var isHot = false

    var body: some View {
        NavigationStack {
            ScrollView {
        VStack(alignment: .leading ,spacing: 0) {
            Image("oeCookLogo")
                .frame(maxWidth: .infinity, alignment: .center)

            ZStack {
                oeCookTextField(
                    "카테고리를 선택해주세요.",
                    text: $categoryTextField,
                    title: "카테고리",
                    errorText: "",
                    isError: showError,
                    isDisabled: true,
                    onSubmit: {
                        if categoryTextField.isEmpty {
                            showError = true
                        } else {
                            showError = false
                        }
                    }
                )
                .padding(.top, 20)

                Image("downButton")
                    .padding(.top, 50)
                    .padding(.leading, 310)
                    .onTapGesture {
                        showPicker1.toggle()
                    }
            }

            Text("사진")
                .oeCook(.semibold, size: 16)
                .oeCookColor(.black)
                .padding(.leading, 16)
                .padding(.top, 20)

            HStack {
                if let image = images {
                    ZStack {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(6)
                            .padding(.leading, 16)
                            .padding(.top, 6)

                        Button {
                            images = nil
                        }label: {
                            Image("x")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.leading, 90)
                                .padding(.bottom, 72)
                                .foregroundStyle(.gray700)
                        }

                    }
                }

                if images == nil {
                    Button {
                        openPhoto.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color.gray.opacity(0.2))
                            .overlay(
                                Image("photo")
                                    .foregroundStyle(.black)
                            )
                            .padding(.leading, 16)
                            .padding(.top, 6)
                    }
                }
            }

            oeCookTextField(
                "제목을 입력해주세요.",
                text: $menuTextField,
                title: "제목"
            )
            .padding(.top, 20)

            oeCookTextField(
                "금액을 입력해주세요.",
                text: $priceTextField,
                title: "금액"
            )
            .padding(.top, 20)

            oeCookTextField(
                "레시피를 입력해주세요.",
                text: $explanationTextField,
                title: "레시피"
            )
            .padding(.top, 20)

            Text("알레르기를 선택해주세요.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .oeCook(.semibold, size: 16)
                .padding(.leading, 16)
                .padding(.top, 20)

            HStack(spacing: 15) {
                allergy(text: "육류", isSelected: $allergyStatus[0])
                allergy(text: "견과류", isSelected: $allergyStatus[1])
                allergy(text: "유제품", isSelected: $allergyStatus[2])
                allergy(text: "혜산물", isSelected: $allergyStatus[3])
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)

            HStack(spacing: 15) {
                allergy(text: "계란", isSelected: $allergyStatus[4])
                allergy(text: "밀가루", isSelected: $allergyStatus[5])
                allergy(text: "과일", isSelected: $allergyStatus[6])
                allergy(text: "기타", isSelected: $allergyStatus[7])
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)


            //                HStack(spacing: 20) {
            //                    allergy(text: "과일", isSelected: $allergyStatus[6])
            //                    allergy(text: "기타", isSelected: $allergyStatus[7])
            //                }
            //                .padding(.top, 10)


            Text("비건 푸드인가요?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .oeCook(.semibold, size: 16)
                .padding(.leading, 16)
                .padding(.top, 20)

            HStack(spacing: 0) {
                Image(oButton ? "trueO" : "falseO")
                    .padding(.leading, 30)
                    .onTapGesture {
                        oButton.toggle()
                        xButton = false
                    }
                Spacer()
                Image(xButton ? "trueX" : "falseX")
                    .padding(.trailing, 30)
                    .onTapGesture {
                        oButton = false
                        xButton.toggle()
                    }
            }
            .padding(.top, 10)

            Text("할랄 푸드인가요?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .oeCook(.semibold, size: 16)
                .padding(.leading, 16)
                .padding(.top, 20)

            HStack(spacing: 0) {
                Image(oButton2 ? "trueO" : "falseO")
                    .padding(.leading, 30)
                    .onTapGesture {
                        oButton2.toggle()
                        xButton2 = false
                    }
                Spacer()
                Image(xButton2 ? "trueX" : "falseX")
                    .padding(.trailing, 30)
                    .onTapGesture {
                        oButton2 = false
                        xButton2.toggle()
                    }
            }
            .padding(.top, 10)

            Text("선호도 키워드를 선택해주세요.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .oeCook(.semibold, size: 16)
                .padding(.leading, 16)
                .padding(.top, 20)

            HStack(spacing: 15) {
                allergy(text: "#매움", isSelected: $loveStatus[0])
                allergy(text: "#뜨거움", isSelected: $loveStatus[1])
            }
            .padding(.leading, 16)
            .padding(.top, 10)


            oeCookButton(
                text: "게시하기",
                horizontalPadding: 155,
                verticalPadding: 14
            ){
                self.showingAlert.toggle()
            }
//            .navigationDestination(isPresented: $isActive) {
//                SignInView(viewModel: SignInViewModel())
//            }
            .padding(.top, 30)
            .frame(maxWidth: .infinity, alignment: .center)


            Spacer()
        }
        .sheet(isPresented: $showPicker1) {
            VStack(alignment: .leading, spacing: 0){
                Text("카테고리를 선택해주세요.")
                    .oeCook(.medium, size: 18)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 30)

                ForEach(languag, id: \.self) { languags in
                    Text(languags)
                        .tag(languags)
                        .oeCook(.medium, size: 18)
                        .padding(.leading, 42)
                        .padding(.top, 19)
                        .onTapGesture {
                            categoryTextField = languags
                        }

                    Rectangle()
                        .frame(width: 383, height: 1)
                        .foregroundStyle(.gray100)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 19)

                }

//                NavigationLink(
//                    destination: MyWebView(urlToLoad: "https://google.com")
//                        .navigationBarBackButtonHidden(true),
//                    isActive: $navigateToTestView
//                ) {
//                    MyWebView(urlToLoad: "https://google.com")
//                        .navigationBarBackButtonHidden(true)
//                }

                Spacer()
            }
            .presentationDetents([.height(378)])  // sheet의 높이를 조절
        }
        .sheet(isPresented: $openPhoto) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .onChange(of: selectedImage) { newImage in
            if let newImage = newImage {
                self.images = newImage
                selectedImage = nil  // Reset selectedImage after adding
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("게시물 업로드"),
                message: Text("업로드 하시겠습니까?"),
                primaryButton: .default(Text("완료"), action: {
                    viewModel.setupCompanyName(companyName: companyTextField)
                    viewModel.setupMenu(menu: menuTextField)
                    viewModel.setupPrice(price: priceTextField)
                    viewModel.setupExplanation(explanation: explanationTextField)
                    viewModel.setupIsVegan(isVegan: oButton)
                    viewModel.setupIsHalal(isHalal: oButton2)
                    viewModel.setupCategory(category: categoryTextField)
                    viewModel.setupIsSpicy(isSpicy: loveStatus[0])
                    viewModel.setupIsHot(isHot: loveStatus[1])

                    if let unwrappedImage = images {
                        viewModel.setupImage(image: unwrappedImage)
                    } else {
                        print("images가 nil입니다.")
                    }

                    viewModel.submit()
                    //viewModel.imagesubmit()
                    selectedTab = 1
                    navigateToTestView.toggle()
                }),
                secondaryButton: .destructive(Text("취소"))  // 취소 버튼을 빨간색으로 변경
            )
        }
//        .navigationDestination(isPresented: $navigateToTestView) {
//                            MyWebView(urlToLoad: "https://oecook.netlify.app/")
//                                .navigationBarBackButtonHidden(true)
//                        }

    }
}
}
}


#Preview {
    RecipeView(viewModel: RecipeViewModel(), selectedTab: .constant(1))
}
