//
//  StoryboardContactTests.swift
//  StoryboardContactTests
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import XCTest
@testable import StoryboardContact

final class StoryboardContactTests: XCTestCase {

    func testContactListApiResponseNil() {
        let ex = expectation(description: "testContactListApiResponseNil")
        
        AFHttp.get(url: AFHttp.API_CONTACT_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                XCTAssertNotNil(response)
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
    
    func testContactDeleteApiResponseNil() {
        let ex = expectation(description: "testContactDeleteApiResponseNil")
        
        AFHttp.del(url: AFHttp.API_CONTACT_DELETE + "22", params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
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
    
    func testContactCreateApiResponseNil() {
        let ex = expectation(description: "testContactCreateApiResponseNil")
        
        AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: Contact(name: "Valisher", phone: "+998883170072")), handler: { response in
            switch response.result {
            case .success:
                let contact = try! JSONDecoder().decode(Contact.self, from: response.data!)
                XCTAssertEqual(contact.name!, "Valisher")
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

    func testContactEditApiResponseNil() {
        let ex = expectation(description: "testContactEditApiResponseNil")
        
        AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + "12", params: AFHttp.paramsContactUpdate(contact: Contact(name: "Otabek", phone: "+998990123456")), handler: { response in
            switch response.result {
            case .success:
                let contact = try! JSONDecoder().decode(Contact.self, from: response.data!)
                XCTAssertEqual(contact.name!, "Otabek")
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
