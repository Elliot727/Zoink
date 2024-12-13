import SwiftUI

struct LeagueHeaderView: View {
    let competitionName: String
    let competitionCode: String
    let onLeaguePickerToggle: () -> Void
    @Binding var selectedDate: Date
    
    var body: some View {
        HStack {
            VStack(alignment:.leading){
                Text(competitionName)
                    .font(.title2)
                    .fontWeight(.semibold)
                DatePicker(
                    "",
                    selection: $selectedDate,
                    in: ...Date(),
                    displayedComponents: [.date]
                )
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
            }
            Spacer()
            Button(action: onLeaguePickerToggle) {
                Text(competitionCode)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(color: .black, radius: 0, x: 6, y: 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(.black, lineWidth: 2)
                    )
            }
        }
        .padding([.top, .horizontal])
    }
}
