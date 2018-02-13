import XCTest
import RxSwift
import RxTest
import RxBlocking

@testable import UnitTestWithRxSwift

class TestingViewModel: XCTestCase {
    // MARK: - Variable
    var viewModel: ViewModel!
    var scheduler: ConcurrentDispatchQueueScheduler!
    
    // MARK: - Life Cycle
    override func setUp() {
        super.setUp()
        
        viewModel = ViewModel()
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test Function
    func testColorIsWhiteWhenInitViewModel() {
        let colorObservable = viewModel.color.asObservable().subscribeOn(scheduler)
        do {
            guard let result = try colorObservable.toBlocking(timeout:1.0).first() else { return }
            XCTAssertEqual(result, .white)
        } catch {
            print(error)
        }
    }
}
