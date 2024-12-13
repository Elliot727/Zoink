import SwiftUI
import Combine

@Observable
class OrientationManager {
    var isLandscape: Bool = false
    
    private var orientationChangePublisher: AnyCancellable?
    
    init() {
        updateOrientation()
        
        orientationChangePublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { [weak self] _ in
                self?.updateOrientation()
            }
    }
    
    deinit {
        orientationChangePublisher?.cancel()
    }
    
    private func updateOrientation() {
        let orientation = UIDevice.current.orientation
        isLandscape = orientation == .landscapeLeft || orientation == .landscapeRight
    }
}
