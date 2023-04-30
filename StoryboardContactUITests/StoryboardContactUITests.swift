//
//  StoryboardContactUITests.swift
//  StoryboardContactUITests
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import XCTest

final class StoryboardContactUITests: XCTestCase {

    var app: XCUIApplication!
    
    override  func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testWithNavigationTitle() throws{
        app.launch()
        XCTAssert(app.navigationBars["Storyboard Contact"].exists)
    }
    
    func testWithTableViewExist() throws{
        app.launch()
        
        let ex = expectation(description: "testWithTableViewExist")
        
        AFHttp.get(url: AFHttp.API_CONTACT_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                XCTAssertTrue(self.app.tables.element.exists)
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(error)
                ex.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }

}
