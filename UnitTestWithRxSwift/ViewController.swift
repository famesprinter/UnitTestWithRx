import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var colorBtns: [UIButton]!
    
    // MARK: - Variable
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    let bgColor = PublishSubject<UIColor>()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Function
    func setupView() {
        for button in colorBtns {
            button.rx.tap
                .bind {
                    switch button.titleLabel!.text! {
                    case "RED":
                        self.viewModel.updateHexColor(hex: "#FF0000")
                    case "GREEN":
                        self.viewModel.updateHexColor(hex: "#008000")
                    case "BLUE":
                        self.viewModel.updateHexColor(hex: "#0000FF")
                    case "ORANGE":
                        self.viewModel.updateHexColor(hex: "#FFA500")
                    default:
                        break
                    }
                }
                .disposed(by: disposeBag)
        }
        
        viewModel.color
            .drive(onNext: { [unowned self] color in
                self.view.backgroundColor = color
            })
            .disposed(by: disposeBag)
    }
}

