//
//  iVideoRenderer.swift
//  WKWebViewRTC
//
//  Created by DHL on 8/9/20.
//

import UIKit
import WebRTC

class iVideoRender: UIView, RTCVideoRenderer {
    var delegate: RTCVideoViewDelegate?
    
    func setSize(_ size: CGSize) {
        NSLog("TODO")
    }
    
    func renderFrame(_ frame: RTCVideoFrame?) {
        if let buffer = frame?.buffer {
            let cvPixelBuffer = buffer as! RTCCVPixelBuffer
            CVPixelBufferLockBaseAddress(cvPixelBuffer.pixelBuffer, .readOnly)
            let baseAddress = CVPixelBufferGetBaseAddress(cvPixelBuffer.pixelBuffer)
            let length = CVPixelBufferGetDataSize(cvPixelBuffer.pixelBuffer)
            let data = NSData(bytes: baseAddress, length: length)
            let ciImage = CIImage(cvImageBuffer: cvPixelBuffer.pixelBuffer)
            let temporaryContext = CIContext(options: nil)
            let rect = CGRect(x: 0, y: 0, width: 640, height: 480)
            let videoImage = temporaryContext.createCGImage(ciImage, from: rect)
            let uiimage = UIImage(cgImage: videoImage!)
            let pngData = uiimage.pngData()
            let base64 = pngData?.base64EncodedString(options: .endLineWithCarriageReturn)
        }
    }
}
