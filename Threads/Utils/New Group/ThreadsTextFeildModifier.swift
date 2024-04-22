//
//  ThreadsTextFeildModifier.swift
//  Threads
//
//  Created by Shivansh Mahajan on 08/04/24.
//

import SwiftUI

struct ThreadsTextFeildModifier:ViewModifier{
    func body(content:Content)-> some View{
        content
        .font(.subheadline)
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal,24)
    }
}
