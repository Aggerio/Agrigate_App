import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:vector_math/vector_math_64.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:screenshot/screenshot.dart';
import 'package:http/http.dart' as http;

class ArPage extends StatefulWidget {
  ArPage({Key? key}) : super(key: key);
  @override
  _ArPageWidget createState() => _ArPageWidget();
}

class _ArPageWidget extends State<ArPage> {
  bool showResult = false;
  List<String> diseases = ["apple-rot", "maize-rust", "tomato_mold"];
  String current_disease = "tomato_mold";
  ARSessionManager? arSessionManager;
  ARNode? localObjectNode;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;
  ScreenshotController screenshotController = ScreenshotController();

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR View'),
      ),
      body: Container(
        child: Stack(
          children: [
            Screenshot(
              controller: screenshotController,
              child: ARView(
                onARViewCreated: onARViewCreated,
                planeDetectionConfig:
                    PlaneDetectionConfig.horizontalAndVertical,
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: onRemoveEverything,
                      child: Text("Remove Everything")),
                  ElevatedButton(
                    onPressed: onTakeScreenshot,
                    child: Text("Take image for disease detection"),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {onPlaneNotFound(context);},
                  //   child: Text("Place Tractor"),
                  // ),
                  Visibility(
                    visible: showResult,
                    child: ElevatedButton(
                      onPressed: showResult3DModel,
                      child: Text("show/hide result"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showResult3DModel() async {
    if (localObjectNode != null) {
      arObjectManager!.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      String modelUri = "Models/" + current_disease + ".gltf";
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: modelUri,
          scale: Vector3(0.2, 0.2, 0.2),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddLocalNode = await arObjectManager!.addNode(newNode);
      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }

  Future<String> sendScreenshotToServer() async {
    var image = await arSessionManager!.snapshot();
    Uint8List? screenshot = await screenshotController.capture();
    if (screenshot != null) {
      String response = await sendScreenshotToServer();

      print(
          "----------------------------------------------------------------------");
      print("Received Response: " + response);
      print(
          "----------------------------------------------------------------------");
    } else {
      print('Failed to capture screenshot.');
    }

    try {
      String serverUrl =
          "http://192.168.237.219/plantdisease"; 
      var response = await http.post(
        Uri.parse(serverUrl),
        body: screenshot,
        headers: {
          "Content-Type":
              "image/png", 
        },
      );
      print("Received response: " + response.body);
      // if(current_disease == 'Tomato___Leaf_Mold')
      // {
      //   current_disease = 'tomato_mold';
      // }
      // if(current_disease == 'Apple___Black_rot')
      // {
      //   current_disease = 'apple-rot';
      // }
      // if(current_disease == 'Corn_(maize)___Common_rust_')
      // {
      //   current_disease = 'maize-rust';
      // }
      // else{
      //   current_disease ='none';
      // }
      return response.body;
    } catch (e) {
      // current_disease = 'none';
      print('Error sending screenshot to server: $e');
      return "Error";
    }
  }

  Future<void> onTakeScreenshot() async {
    // Send the screenshot to the server
    //String response = await sendScreenshotToServer(screenshot);
    //var byteData = convertStringtoUint8List(image.toString());
    var image = await arSessionManager!.snapshot();

    await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          width: 600,
          height: 800,
          child: Column(
            children: [
              Image(
                image: image,
                height: 600,
                width: 450,
              ),
              ElevatedButton(
                onPressed: () async {
                  //var request = http.MultipartRequest(
                  //    "POST", Uri.parse("http://192.168.186.219"));
                  //request.files.add(await http.MultipartFile.fromBytes(
                  //  'image',
                  //  [0],
                  //  contentType: new MediaType('application', 'jpeg'),
                  //));
                  //request.send().then((response) {
                  //  if (response.statusCode == 200) print("Uploaded!");
                  //});
                  setState(() {
                    showResult = true;
                  });
                  sendScreenshotToServer();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Send for Evaluation",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager!.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "Images/triangle.png",
          showWorldOrigin: false,
          handlePans: true,
          handleRotation: true,
        );
    this.arObjectManager!.onInitialize();

    this.arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager!.onPanStart = onPanStarted;
    this.arObjectManager!.onPanChange = onPanChanged;
    this.arObjectManager!.onPanEnd = onPanEnded;
    this.arObjectManager!.onRotationStart = onRotationStarted;
    this.arObjectManager!.onRotationChange = onRotationChanged;
    this.arObjectManager!.onRotationEnd = onRotationEnded;
  }

  Future<void> onRemoveEverything() async {
    anchors.forEach((anchor) {
      this.arAnchorManager!.removeAnchor(anchor);
    });
    anchors = [];
    setState(() {
      showResult = false;
    });
  }

  Future<void> onPlaneNotFound(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: Text(
        "No Valid Plane found!! Wait for the floor texture to show up and then tap on it to place tractor",
        style: TextStyle(fontSize: 16.0, color: Color(0xFF0000)),
      ),
    ),
  );
}

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
        (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor =
          ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      bool? didAddAnchor = await this.arAnchorManager!.addAnchor(newAnchor);
      if (didAddAnchor!) {
        this.anchors.add(newAnchor);
        var newNode = ARNode(
            type: NodeType.localGLTF2,
            uri: "Models/tractor.gltf",
            scale: Vector3(0.2, 0.2, 0.2),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0));

        bool? didAddNodeToAnchor = await this
            .arObjectManager!
            .addNode(newNode, planeAnchor: newAnchor);
        if (didAddNodeToAnchor!) {
          this.nodes.add(newNode);
        } else {
          this.arSessionManager!.onError("Adding Node to Anchor failed");
        }
      } else {
        this.arSessionManager!.onError("Adding Anchor failed");
      }
    } else {
      await onPlaneNotFound(context);
    }
  }

  onPanStarted(String nodeName) {
    print("Started panning node " + nodeName);
  }

  onPanChanged(String nodeName) {
    print("Continued panning node " + nodeName);
  }

  onPanEnded(String nodeName, Matrix4 newTransform) {
    print("Ended panning node " + nodeName);
    final pannedNode =
        this.nodes.firstWhere((element) => element.name == nodeName);

  }

  onRotationStarted(String nodeName) {
    print("Started rotating node " + nodeName);
  }

  onRotationChanged(String nodeName) {
    print("Continued rotating node " + nodeName);
  }

  onRotationEnded(String nodeName, Matrix4 newTransform) {
    print("Ended rotating node " + nodeName);
    final rotatedNode =
        this.nodes.firstWhere((element) => element.name == nodeName);

  }
}
