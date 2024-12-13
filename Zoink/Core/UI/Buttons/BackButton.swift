import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        IconButton(icon: "arrow.left") {
            dismiss()
        }
    }
}

#Preview {
    BackButton()
}
