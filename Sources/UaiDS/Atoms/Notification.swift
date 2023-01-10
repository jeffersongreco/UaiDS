//
//  SwiftUIView.swift
//  
//
//  Created by Jefferson Grēco on 09/01/23.
//

import SwiftUI

struct Notification: View {
    var body: some View {
        HStack {
            HStack {
                UaiButtonSmall(icon: "chevron.forward", label: "Registrar") {
                    print("click")
                }
            }
            Spacer()
            UaiButtonSmall(rank: .terciary, icon: "xmark") {
                print("click")
            }
        }
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
