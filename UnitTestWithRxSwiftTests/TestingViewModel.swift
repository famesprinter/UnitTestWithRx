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
    
    func testUpdateHexColorToFF0000() {
        viewModel.updateHexColor(hex: "#FF0000")
        XCTAssertEqual(viewModel.hexColor.value, "#FF0000")
    }
    
    func testUpdateHexColorTo008000() {
        viewModel.updateHexColor(hex: "#008000")
        XCTAssertEqual(viewModel.hexColor.value, "#008000")
    }
    
    func testUpdateHexColorTo0000FF() {
        viewModel.updateHexColor(hex: "#0000FF")
        XCTAssertEqual(viewModel.hexColor.value, "#0000FF")
    }
    
    func testUpdateHexColorToFFA500() {
        viewModel.updateHexColor(hex: "#FFA500")
        XCTAssertEqual(viewModel.hexColor.value, "#FFA500")
    }
    
    func testColorRedWhenUpdateHexColorToFF0000() {
        let colorObservable = viewModel.color.asObservable().subscribeOn(scheduler)
        viewModel.updateHexColor(hex: "#FF0000")
        do {
            guard let result = try colorObservable.toBlocking(timeout:1.0).first() else { return }
            XCTAssertEqual(result, UIColor(hex: "#FF0000"))
        } catch {
            print(error)
        }
    }
    
    func testColorRedWhenUpdateHexColorTo008000() {
        let colorObservable = viewModel.color.asObservable().subscribeOn(scheduler)
        viewModel.updateHexColor(hex: "#008000")
        do {
            guard let result = try colorObservable.toBlocking(timeout:1.0).first() else { return }
            XCTAssertEqual(result, UIColor(hex: "#008000"))
        } catch {
            print(error)
        }
    }
    
    func testColorRedWhenUpdateHexColorTo0000FF() {
        let colorObservable = viewModel.color.asObservable().subscribeOn(scheduler)
        viewModel.updateHexColor(hex: "#0000FF")
        do {
            guard let result = try colorObservable.toBlocking(timeout:1.0).first() else { return }
            XCTAssertEqual(result, UIColor(hex: "#0000FF"))
        } catch {
            print(error)
        }
    }
    
    func testColorRedWhenUpdateHexColorToFFA500() {
        let colorObservable = viewModel.color.asObservable().subscribeOn(scheduler)
        viewModel.updateHexColor(hex: "#FFA500")
        do {
            guard let result = try colorObservable.toBlocking(timeout:1.0).first() else { return }
            XCTAssertEqual(result, UIColor(hex: "#FFA500"))
        } catch {
            print(error)
        }
    }
}
