//: # Your goal
//: ![goal](scenario-one.png "Your goal")
/*:
 ## Notes:
 * the image is exactly 360 pixels wide by 360 pixels high
 * rainbow circles, circles in upper left, and squares in lower right must be exactly as shown
 * the "bites" taken out of the rainbow circle are randomly generated as follows:
 ​position varies as high as 50 pixels and as low as 50 pixels below horizontal centre line of image
 * when position is below centre line, opacity is 75%
 * when position is above centre line, opacity is 25%
 */
//: ## Template code
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
//: ## Reminder
//: To see the visual output, be sure to show the Assistant Editor and choose the Timeline option.
//:
//: ![assistanteditor](timeline.png "Timeline")
//: ## Your code starts here
// Create a new canvas
let canvas = Canvas(width: 360, height: 360)

// The Rainbow Circle
for plusone in stride(from: 360, through: 0, by: -1) {
    canvas.drawShapesWithBorders = true
    canvas.drawShapesWithFill = false
    canvas.defaultBorderWidth = 1
    canvas.borderColor = Color(hue: Float(plusone), saturation: 100, brightness: 100, alpha: 100)
    canvas.drawEllipse(centreX: 180, centreY: 180, width: plusone, height: plusone)
}

// Circles in top left and Rectangle in bottom right
for x in stride(from: 10, through: 100, by: 10) {
    canvas.drawShapesWithBorders = true
    canvas.drawShapesWithFill = false
    canvas.borderColor = Color.black
    canvas.drawEllipse(centreX: 50, centreY: 310, width: x, height: x)
    canvas.drawRectangle(bottomLeftX: 250 + x, bottomLeftY: 0, width: 110 - x, height: 110 - x)
}

// The Random circles
for i in 1...24 {
    canvas.drawShapesWithBorders = true
    canvas.drawShapesWithFill = true
    canvas.borderColor = Color.white
    canvas.fillColor = Color.white
    let offset = Int(arc4random_uniform(360)) - 180
   canvas.drawEllipse(centreX: canvas.width / 2 + offset, centreY: 2 * i + 120, width: 10, height: 10)
}
for i in 1...12 {
    canvas.drawShapesWithBorders = false
    canvas.drawShapesWithFill = true
    canvas.borderColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 50)
    canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 50)
    let offset = Int(arc4random_uniform(360)) - 180
    canvas.drawEllipse(centreX: canvas.width / 2 + offset, centreY: 2 * i + 168, width: 10, height: 10)
}
//: ## Template code
//: The code below is necessary to see the result of your work in the Assistant Editor at right. Please do not remove.
PlaygroundPage.current.liveView = canvas.imageView
