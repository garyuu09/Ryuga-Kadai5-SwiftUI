//
//  ContentView.swift
//  Kadai5-SwiftUI
//
//  Created by Ryuga on 2023/02/18.
//

import SwiftUI

struct ContentView: View {
    @State private var divisor: String = ""
    @State private var divisible: String = ""
    @State private var result: String = ""
    @State private var alertMessage: String?
    @State private var showingAlert = false

    var body: some View {
        VStack {
            HStack {
                // 割られる数
                TextField("", text: $divisor)
                Text("÷")
                // 割る数
                TextField("", text: $divisible)
            }
            .modifier(CustomTextFieldStyle())

            Button(action: {
                let divisorNum: Double? = Double(divisor)
                let divisibleNum: Double?  = Double(divisible)

                guard let num1 = divisorNum else {
                    alertMessage = "割られる数を入力してください。"
                    showingAlert = true
                    return
                }
                guard let num2 = divisibleNum else {
                    alertMessage = "割る数を入力してください。"
                    showingAlert = true
                    return
                }
                if divisibleNum == 0 {
                    alertMessage = "割る数は0以外の数字を入力してください"
                    showingAlert = true
                    return
                }
                result = String(num1 / num2)

            }) {
                Text("計算")
            }
            Text(result)
        }
        .font(.title)
        .padding()
        .alert(
            "課題5",
            isPresented: $showingAlert,
            presenting: alertMessage,
            actions: { _ in Button("OK") {} },
            message: { message in
                Text(message)
            }
        )
    }
}

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(width: 300)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
