import SwiftUI

struct LeaguePickerView: View {
    @Binding var selectedLeague: League
    @Binding var showLeaguePicker: Bool
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom))
                .opacity(0.4)
                .rotationEffect(.degrees(45))
                .edgesIgnoringSafeArea(.all)
            VStack {
                ForEach(League.allCases, id: \.self) { league in
                    Button {
                        selectedLeague = league
                        showLeaguePicker = false
                    } label: {
                        HStack {
                            Text(league.displayName)
                                .font(.headline)
                            Spacer()
                            Text(league.rawValue)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                        .foregroundStyle(league == selectedLeague ? .white : .black)
                        .padding()
                        .background(league == selectedLeague ? .black : .clear)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                    }
                }
            }
            .padding()
            .presentationDetents([.fraction(0.5), .medium])
            .presentationDragIndicator(.hidden)
        }
    }
}

