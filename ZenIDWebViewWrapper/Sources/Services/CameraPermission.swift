
import Foundation
import AVFoundation


protocol CameraPermission {
    
    func authorize(completion: @escaping (Bool) -> Void)
    
}


final class iOSCameraPermission: CameraPermission {
    func authorize(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: completion)
    }
}
