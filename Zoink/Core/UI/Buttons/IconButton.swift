import SwiftUI

struct IconButton: View {
    var icon:String
    var onTap:()->Void
    var body: some View {
        Button {
            onTap()
        } label: {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(.black)
        }

    }
}

#Preview {
    IconButton(icon: "arrow.left") {
        print("On Tap")
    }
}
