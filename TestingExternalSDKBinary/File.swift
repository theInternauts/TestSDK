//
//  File.swift
//  TestingExternalSDKBinary
//
//  Created by Cricket on 8/5/24.
//

import Foundation

public class ExternalTestSDK {
    static var imageFileNameInternal = "bird_throwaway_image" // yes, yes, I can do this better, I know
    
    public static var imageFileName = "bird_throwaway_image.jpg"
    public static func imageFileResourcePath() -> URL? {
        Bundle.main.url(forResource: ExternalTestSDK.imageFileNameInternal, withExtension:"jpg")
    }
    public static func writeThis(message: String) -> String {
        let msg = "### -! ExternalTestSDK => STATIC writeThis: \(message)"
        print(msg)
        
        return msg
    }
    
    public func writeThis(message: String) -> String {
        let msg = "### -! ExternalTestSDK => DYNAMIC writeThis: \(message)"
        print(msg)
        
        return msg
    }
    
    public static func getTestImageData() -> Data? {
        print("### -! This probably won't work")
        var res: Data? = nil
        if let url = ExternalTestSDK.imageFileResourcePath() {
            if let fileContents = try? Data(contentsOf: url) {
                res = fileContents
            }
        }
        return res
    }
}
