//
//  SplittingView.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/24/23.
//

import SwiftUI
import Combine


struct SplittingView: View {
  let widthRatio:CGFloat = 0.5
  let model = DriveUIModel()
  
  var body: some View {
    GeometryReader { geo in
      HStack {
        LeftView(model: model)
          .frame(width: geo.size.width*widthRatio, height: geo.size.height)
        RightView(model: model)
          .frame(width: geo.size.width*widthRatio, height: geo.size.height)
      }
    }
  }
  
}




struct SplittingView_Previews: PreviewProvider {
  static var previews: some View {
    SplittingView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}

struct LeftView: View {
  @ObservedObject var model: DriveUIModel
  @State var text: String = "Simple Swift Guide tutorials."

  
  var body: some View {
    ScrollView {
      VStack {
//        TextField("<JSON>", text: $model.input, axis: .vertical)
        TextEditor(text: $model.input)
          .font(.system(size: 17.0))
          .frame(minWidth: 600, minHeight: 730)
          .border(Color.blue)
          //.font(.custom("HelveticaNeue", size: 16))
          .lineSpacing(5)
          //.cornerRadius(4)
          //.padding()
        
          //.textFieldStyle(.roundedBorder)
          .padding()
         // .background(Color(.lightGray))
      }
    }
  }
}

struct RightView: View {
  @ObservedObject var model: DriveUIModel
  
  var body: some View {
    ScrollView {
      VStack {
        if let codableView = self.model.codableView {
          ViewFactory.view(for: codableView).background(Color.yellow)
        }
      }
    }
  }
  
}

class DriveUIModel: ObservableObject {
  @Published var input = rawString2
  @Published var codableView: CodableView?
  private var subscriptions = Set<AnyCancellable>()
  
  init() {
    self.bind()
  }
  
  private func bind() {
    $input
      .sink { [weak self] value in
        self?.codableView = self?.decodeJsonData2(value: value)
      }.store(in: &subscriptions)
  }
  
  func decodeJsonData2(value: String) -> CodableView? {
    var codableView: CodableView?
    guard let data = value.data(using: .utf8) else { return nil }
    do {
      codableView = try JSONDecoder().decode(CodableView.self, from: data)
      print(codableView)
      return codableView
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
  
  
}
