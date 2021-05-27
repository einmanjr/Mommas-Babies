//
//  ViewController.swift
//  Mommas Babies
//
//  Created by Michael Einman on 5/25/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let imageToPlayVideo = ARReferenceImage.referenceImages(inGroupNamed: "Baby Pictures", bundle: Bundle.main) {
            configuration.detectionImages = imageToPlayVideo
            configuration.maximumNumberOfTrackedImages = 2 // MAYBE SHOULD DO MAX = 1??????
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate

    fileprivate func playCorrespondingVideo(_ videoNode: SKVideoNode, _ plane: SCNPlane) {
        videoNode.play()
        let videoScene = SKScene(size: CGSize(width: 480, height: 360))
        plane.firstMaterial?.diffuse.contents = UIColor(white: 0, alpha: 0.5)
        plane.firstMaterial?.diffuse.contents = videoScene
        videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
        videoNode.yScale = 1.0
        videoNode.xScale = -1.0  // YEEHAW
        videoScene.addChild(videoNode)
        print("Found baby picture")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height * 2) //HELLO ( * 2)
         //   plane.firstMaterial?.diffuse.contents = videoScene
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -Float.pi / 2
            node.addChildNode(planeNode)
            
            switch imageAnchor.referenceImage.name {
            case "Briar Ducks 1":
                let videoNode = SKVideoNode(fileNamed: "Briar Ducks 1.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Little Mermaid Ride":
                let videoNode = SKVideoNode(fileNamed: "Little Mermaid Ride.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Big Monkey":
                let videoNode = SKVideoNode(fileNamed: "Big Monkey.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Safari Ride":
                let videoNode = SKVideoNode(fileNamed: "Briar Safari Ride.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Braxton Laughing":
                let videoNode = SKVideoNode(fileNamed: "Braxton Laughing.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Break Toy Car":
                let videoNode = SKVideoNode(fileNamed: "Briar Break Toy Car.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Dinosaur Ride 2":
                let videoNode = SKVideoNode(fileNamed: "Briar Dinosaur Ride 2.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Dinosaur Ride Dance 1":
                let videoNode = SKVideoNode(fileNamed: "Briar Dinosaur Ride Dance 1.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Dinosaur Ride":
                let videoNode = SKVideoNode(fileNamed: "Briar Dinosaur Ride.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Drive Car":
                let videoNode = SKVideoNode(fileNamed: "Briar Drive Car.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Ducks 2":
                let videoNode = SKVideoNode(fileNamed: "Briar Ducks 2.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Fish Tank":
                let videoNode = SKVideoNode(fileNamed: "Briar Fish Tank.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Hotel Room":
                let videoNode = SKVideoNode(fileNamed: "Briar Hotel Room.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Parade":
                let videoNode = SKVideoNode(fileNamed: "Briar Parade.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Flutter":
                let videoNode = SKVideoNode(fileNamed: "Flutter.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Frozen Play":
                let videoNode = SKVideoNode(fileNamed: "Frozen Play.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Giraffe_":
                let videoNode = SKVideoNode(fileNamed: "Giraffe_.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Jennifer Feed Bird":
                let videoNode = SKVideoNode(fileNamed: "Jennifer Feed Bird.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Lilly Beast Dinner":
                let videoNode = SKVideoNode(fileNamed: "Lilly Beast Dinner.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Lilly Painting Cup":
                let videoNode = SKVideoNode(fileNamed: "Lilly Painting Cup.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Lilly_Briar Bubbles":
                let videoNode = SKVideoNode(fileNamed: "Lilly_Briar Bubbles.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Safair Rhinoceros":
                let videoNode = SKVideoNode(fileNamed: "Safair Rhinoceros.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Sleepy Briar 2":
                let videoNode = SKVideoNode(fileNamed: "Sleepy Briar 2.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Weird 1":
                let videoNode = SKVideoNode(fileNamed: "Weird 1.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Weird 2":
                let videoNode = SKVideoNode(fileNamed: "Weird 2.mp4")
                playCorrespondingVideo(videoNode, plane)
            case "Briar Sleepy":
                let videoNode = SKVideoNode(fileNamed: "Briar Sleepy.mp4")
                playCorrespondingVideo(videoNode, plane)

                
            default:
                print("No Video, Something is fucked!")
            }
            
            
//            if imageAnchor.referenceImage.name == "Briar Ducks 1" {
//            let videoNode = SKVideoNode(fileNamed: "Briar Ducks 1.mp4")
//                playCorrespondingVideo(videoNode, plane)
//            }
//
//            if imageAnchor.referenceImage.name == "Little Mermaid Ride" {
//            let videoNode = SKVideoNode(fileNamed: "Little Mermaid Ride.mp4")
//                playCorrespondingVideo(videoNode, plane)
//            }
//
            
            

        }
        return node
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
