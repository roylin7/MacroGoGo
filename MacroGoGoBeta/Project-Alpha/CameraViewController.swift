//
//  CameraViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 11/25/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let captureDevice = AVCaptureDevice.default(.builtInDualCamera,
                                                    for: AVMediaType.video,
                                                    position: .back)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            preview.layer.addSublayer(videoPreviewLayer!)
            captureSession?.startRunning()
        } catch {
            print(error)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var preview: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
