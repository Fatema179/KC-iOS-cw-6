//
//  ContentView.swift
//  day6 bmi
//
//  Created by Zeinab H Eldeeb on 14/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var weight = ""
    @State var height = ""
    @State var result = 0.0
    @State var health = ""
    var body: some View {
        VStack {
            Image("bmi")
                .resizable()
                .frame(width: 250, height: 250)
            Text("أدخل الطول والوزن")
                .font(.largeTitle)
            Divider()
            TextField("Weight", text: $weight)
            TextField("Height", text: $height)
            Divider()
            Button {
                result = bmiCalc(w: Double(weight) ?? 0.0, h: Double(height) ?? 0.0)
                
                if result <= 20{
                    health = "ضعيف"
                } else if result >= 20 && result <= 25{
                    health = "جيد"
                } else{
                    health = "سمين"
                }
            } label: {
                Text("احسب")
                    .font(.largeTitle)
                    .frame(width: 250, height: 80)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.6))
                    .cornerRadius(50)

            }
            
            Text("BMI = \(result)")
                .font(.title)
            Text("الحالة = \(health)")
                .font(.title)

        }
    }
    func bmiCalc(w: Double, h: Double) -> Double{
        return w / (h * h)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
