//
//  ContentView.swift
//  StepperSample
//
//  Created by 大西玲音 on 2021/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var kosu: Int = 0
    let tanka = 240
    let tax = 0.1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("5個ずつ30個まで、1個\(tanka)円")
                .font(.headline)
            Stepper(
                onIncrement: {
                    kosu += 5
                    kosu = min(kosu, 30)
                },
                onDecrement: {
                    kosu -= 5
                    kosu = max(kosu, 0)
                },
                label: {
                    Text("個数: \(kosu)")
                }
            )
            .frame(width: 200)
            Text("料金: \(calc(kosu))円[税込]")
                .underline()
        }
    }
    
    func calc(_ num: Int) -> Int {
        let price = tanka * num
        let result = Double(price) * (1+tax)
        return Int(result)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
