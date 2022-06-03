import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/chrisboshoff/Desktop/Completed\Apps/Intrinsic-Value\ -\ Complete/twitter-sanders-apple3\ -\ twitter-sanders-apple3.csv"))

let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let sentimentClassifier = MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluateMetrics = sentimentClassifier.evaluation(on: testingData)

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100
