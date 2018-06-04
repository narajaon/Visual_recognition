//
//  CheckPerms.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 30/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit
import AVFoundation

extension ViewController {
    func checkPermissions() -> AVAuthorizationStatus {
        return AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    func setUpCamera(perm: AVAuthorizationStatus, camHandler: @escaping () -> Void) {
        switch perm {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    camHandler()
                }
            }
        case .authorized:
            camHandler()
        default:
            break
        }
    }
}
