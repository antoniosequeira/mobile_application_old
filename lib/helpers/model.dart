import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';


class Model {
  //To call the tflite plugin
  static const MethodChannel _channel = const MethodChannel('tflite');

  //Method that loads the mobilenet model
  static Future<String> loadModel({
    @required String model,
    String labels = "",
    int numThreads = 1,
    bool isAsset = true,
  }) async {
    return await _channel.invokeMethod(
      'loadModel',
      {
        "model": model,
        "labels": labels,
        "numThreads": numThreads,
        "isAsset": isAsset,
      },
    );
  }

  //Method that runs the model on the given image, parameter are the default values for the runModelOnImage method
  static Future<List> runModelOnImage(
      {@required String path,
      double imageMean = 117.0,
      double imageStd = 1.0,
      int numResults = 5,
      double threshold = 0.1,
      bool asynch = true}) async {
    return await _channel.invokeMethod(
      'runModelOnImage',
      {
        "path": path,
        "imageMean": imageMean,
        "imageStd": imageStd,
        "numResults": numResults,
        "threshold": threshold,
        "asynch": asynch,
      },
    );
  }

  static Future close() async {
    return await _channel.invokeMethod('close');
  }

}
