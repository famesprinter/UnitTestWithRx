import Foundation
import RxSwift
import RxCocoa
import Hue

class ViewModel {
    // MARK: - Variable
    let hexColor: Variable<String>
    let color: Driver<UIColor>
    
    // MARK: - Life Cycle
    init() {
        self.hexColor = Variable<String>("")
        self.color = hexColor.asObservable()
                        .map { hex in
                            if hex.isEmpty {
                                return .white
                            }
                            return UIColor(hex: hex)
                        }
                        .asDriver(onErrorJustReturn: .white)
    }
    
    // MARK: - Function
    func updateHexColor(hex: String) {
        self.hexColor.value = hex
    }
}
