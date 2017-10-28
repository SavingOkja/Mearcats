//
//  QRCameraViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import AVFoundation
import Presentr

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    
    @IBOutlet var cancelView: UIView!
    @IBOutlet var qrView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var anotherCancelButton: UIButton!

    @IBOutlet weak var captureButton: UIButton!
    
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        
        qrView.frame = CGRect(x: 0, y: 0, width: 180, height: 180)
        qrView.center = CGPoint(x: view.center.x, y: view.bounds.height - 100 )
        
        qrView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        captureButton.backgroundColor = UIColor.clear.withAlphaComponent(0)
        captureButton.addTarget(self, action: #selector(capture), for: .touchUpInside)
        
        cancelView.frame = CGRect(x: view.bounds.width-60, y: 40, width: 40, height: 30)
        cancelView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        cancelButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        view.layer.addSublayer(previewLayer)
        view.addSubview(qrView)
        view.addSubview(cancelView)
        
        captureSession.startRunning()
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
        
        customizatino()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {

        
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            found(code: stringValue)
        }
        
    }
    
    func found(code: String) {
        print(code)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @objc
    func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    func capture() {
        
        /// Remove capture layer.
        if let sublayers = view.layer.sublayers {
            for layer in sublayers {
                if layer is AVCaptureVideoPreviewLayer {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        /// Remove extra views.
        qrView.removeFromSuperview()
        cancelView.removeFromSuperview()
        
    }

    @IBAction func settingAction(_ sender: UIButton) {
        
        let presentr = Presentr(presentationType: .custom(
            width: ModalSize.custom(size: Float(320)),
            height: ModalSize.custom(size: Float(570)),
            center: ModalCenterPosition.custom(
                centerPoint: CGPoint(
                    x: UIScreen.main.bounds.width/2,
                    y: UIScreen.main.bounds.height/2
            ))
            )
        )
        
        let picker = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "SurveyPickerViewController") as! SurveyPickerViewController
        
        self.customPresentViewController(presentr, viewController: picker, animated: true, completion: nil)
    }
}

extension QRViewController {

    func customizatino() {
        anotherCancelButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
}
