//
//  mvc_to_mvvmTests.swift
//  mvc_to_mvvmTests
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import XCTest
@testable import mvc_to_mvvm

var musicList: ArtistResult?
class mvc_to_mvvmTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let bundle = Bundle(for: type(of: self))
         guard let url = bundle.url(forResource: "MusicApp", withExtension: "json"),
             let data = try? Data(contentsOf: url) else {
                 return
         }

         let decoder = JSONDecoder()
         musicList = try? decoder.decode(ArtistResult.self, from: data)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        musicList = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testMusicViewModel()
    {
        let artist = Artist.init(artistId: 1, collectionId: 1, artistName: "Lady Gaga", trackName: "", artworkUrl100: "")
        let musicData = ArtistViewModel.init(artist: artist)
        XCTAssertEqual(artist.artistName, musicData.name)
    }

    func testServiceRunning() {
        // Put the code you want to measure the time of here.
        setUp()
        let expectation = self.expectation(description: "Service is failed and don't receive correct response")
        Service.shared.fetchMusicDatas { (artists, err) in

            if let err = err {
                XCTFail("Error \(err)")
                return
            }

            XCTAssertNotNil(artists)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 6.0)
    }

}
