import SwiftUI

struct TabBarButton: View {
    var icon:String
    var text:String
    var isSelected:Bool
    var onTap:()->Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack{
                Image(systemName: icon)
                Text(text)
            }
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(isSelected ? .white:.gray)
            .padding()
            .background(isSelected ? .black:.clear)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
