# coreML-Watson

/!\ Disclaimer : This is just an app I did to get more comfortable using coreML and Bluemix, it still contains some bugs that may or may not be addressed

## Getting Started

After cloning it, launch the `.xcworkspace` with XCode. You may need to install some of the dependencies if it's not already done

## Usage

This is the home screen, a collection of images

<img src="https://github.com/narajaon/Visual_recognition/blob/master/readmePics/Gallery.png" width="200" height="350"/>
Select an image to display how Watson categorized it. Current categories associated with the model include : Samsung, Mac, LG and Other.

Don't worry if an image has not all of the categories displayed, it just means that it's value is too small to be displayed.


<img src="https://github.com/narajaon/Visual_recognition/blob/master/readmePics/Mac.png" width="200" height="350"/>                          <img src="https://github.com/narajaon/Visual_recognition/blob/master/readmePics/Other.png" width="200" height="350"/>

## About the coding part

First of all you need to train your model and place your `.mlmodel` file in your project directory, here's a good tutorial on how to do so : https://www.raywenderlich.com/190191/ibm-watson-services-for-core-ml-tutorial

When you get that part done, you need to open your project with `XCode` and then click your `myModel.mlmodel` file, you'll notice that a `.swift` file was generated in the Assistant Editor.

Now you need to follow those 3 steps:
### Instantiate your model
``` swift
Let model = MyModelClass()
```

### Create helpers to format an UImage to a CVPixelBuffer
``` swift
extension UIImage {
    func formatSize(size: Int) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), true, 1.0)
        self.draw(in: CGRect(x: 0, y: 0, width: size, height: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func toBuffer() -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        return pixelBuffer
    }
}
```

### Get your result!
``` swift
    func getMLResults(image: UIImage, model: MyModelClass) -> [String : Double]? {
        let formatedImage = image.formatSize(size: 224)
        let bufferedImage = formatedImage.toBuffer()
        
        guard let prediction = try? model.prediction(data: bufferedImage!) else {
            print("Error: Something went wrong")
            return nil
        }
        
        var scores = prediction.outputScores
        
//      The two lines below can be deleted, I wanted to create a "Other" value to fill my data result in case the total amount was not 100%
        let otherStat = fillRemainingStats(stats: prediction.outputScores)
        scores.updateValue(otherStat, forKey: "Other")
        
        return scores
    }
```

The getMLResults function takes a UIImage and the model you just instantiated. It then returns a dictionary with every info you need to display.
