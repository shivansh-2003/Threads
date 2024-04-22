//
//  UserCell.swift
//  Threads
//
//  Created by Shivansh Mahajan on 09/04/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            VStack(alignment: .leading) { // Fixed the typo in "alignment"
                Text("Shivansh_mahajan")
                    .fontWeight(.semibold)
                Text("Mahajan")
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray), lineWidth: 1) // Removed unnecessary conversion to UIColor
                )
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
