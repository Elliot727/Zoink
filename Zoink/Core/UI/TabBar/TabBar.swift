import SwiftUI

struct TabBar: View {
    @Binding var selectedView:SelectedView
    var body: some View {
        HStack{
            Spacer()
            TabBarButton(icon: SelectedView.score.icon, text: SelectedView.score.rawValue, isSelected: selectedView == .score) {
                selectedView = .score
            }
            Spacer()
            TabBarButton(icon: SelectedView.table.icon, text: SelectedView.table.rawValue, isSelected: selectedView == .table) {
                selectedView = .table
            }
            Spacer()
        }
        .padding()
        .background(.white)
    }
}
