//
//  ProjectOrbitalTests.swift
//  ProjectOrbitalTests
//
//  Created by Leandrea De Conceicao on 24/7/23.
//

import XCTest
@testable import ProjectOrbital
import Firebase
import FirebaseAuth


import XCTest
@testable import ProjectOrbital
import AVKit
import Firebase


final class ProjectOrbitalTests: XCTestCase {
    
    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //    }
    //
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    //
    //    // Test case for verifying successful login
    //    func testLoginSuccess() throws {
    //        // Create an instance of SignInView with appropriate bindings and states for the test
    //        var signInView = SignInView(show: .constant(false))
    //        signInView.email = "test@example.com"
    //        signInView.password = "testpassword"
    //
    //        // Call the verify() function explicitly with valid test data
    //        signInView.verify()
    //
    //        // Assert that the isLoggedIn state should be true after successful login
    //        XCTAssertTrue(signInView.isLoggedIn, "Expected isLoggedIn to be true after successful login")
    //    }
    //}
    
    class ActivityPage2ViewTests: XCTestCase {
        
        func testActivityVideoPlayback() throws {
            // Create an instance of ActivityPage2View
            let activityPageView = ActivityPage2View()
            
            // Create a mock activity for testing
            
            // Call the showVideoPlayer(for:) function with the mock activity
            activityPageView.showVideoPlayer(for: testActivity)
            
            // Check if the AVPlayerViewController is presented
            let topViewController = UIApplication.shared.windows.first?.rootViewController?.topMostViewController()
            XCTAssertTrue(topViewController is AVPlayerViewController, "AVPlayerViewController should be presented")
            
            // If needed, you can also simulate the video playback to ensure the video is playing correctly.
            // For example:
            // let playerViewController = topViewController as! AVPlayerViewController
            // let player = playerViewController.player
            // XCTAssertTrue(player?.rate == 1.0, "Video should be playing")
        }
    }
}
