//
//  main.swift
//  Utf8Transcode
//
//  Created by Marek Přidal on 16.11.17.
//  Copyright © 2017 Marek Přidal. All rights reserved.
//

import Foundation

//MARK: - Constants
let fileManager = FileManager.default
let originalDefaultEncoding = String.Encoding.windowsCP1250
let transcodedDefaultEncoding = String.Encoding.utf8

//MARK: - Functions
func getEncoding()-> String.Encoding {
    print("Using default encoding \(originalDefaultEncoding)")
    return originalDefaultEncoding
}

func getContent(ofFile path:String, encoding: String.Encoding?) -> String? {
    if let encoding = encoding {
        do {
            return try String(contentsOfFile: path, encoding: encoding)
        } catch CocoaError.fileReadUnknownStringEncoding {
            print("Cannot determine file encoding")
            return getContent(ofFile: path, encoding: getEncoding())
        } catch let e {
            print(e.localizedDescription)
            return nil
        }
        
    } else {
        do {
            return try String(contentsOfFile: path)
        } catch CocoaError.fileReadUnknownStringEncoding {
            print("Cannot determine file encoding")
            return getContent(ofFile: path, encoding: getEncoding())
        } catch let e {
            print(e.localizedDescription)
            return nil
        }
    }
}

func checkIfFileExistsAndHaveContent(file: String) -> Bool {
    if let content = getContent(ofFile: file, encoding: transcodedDefaultEncoding) {
        return !content.isEmpty
    }
    return false
}

func printContentOfDirectory(atPath path: String) {
    print("Files in directory 📂")
    if let content = (try? fileManager.contentsOfDirectory(atPath: path)) {
        for file in content.filter({!$0.hasPrefix(".")}) {
            print("📄 " + file)
        }
    } else {
        print("Folder is empty 💨")
    }
}

func transcodeFile(withName fileName:String)throws {
    guard let original = getContent(ofFile: fileName, encoding: nil) else {
        exit(1)
    }
    print("What's your name for transcoded file? (empty for same name)")
    var newName = readLine(strippingNewline: true)
    if newName?.isEmpty ?? true {
        newName = fileName
    }
    try original.write(toFile: newName!, atomically: true, encoding: transcodedDefaultEncoding)
    if checkIfFileExistsAndHaveContent(file: newName!) {
        print("Success! 🎉 🍾")
        print("You can find new transcoded file at path \(newName!) ⬅️")
    } else {
        print("Error 😞")
        print("Something went wrong, sorry 😔")
    }
}

//MARK: - Main
func main() {
    print("➡️ Current path \(fileManager.currentDirectoryPath)\n")
    printContentOfDirectory(atPath: fileManager.currentDirectoryPath)
    
    print("\nWrite name of file 📄")
    guard var fileName = readLine(strippingNewline: true) else {
        print("Cannot get name of your file, sorry ❌")
        exit(1)
    }
    
    if !fileName.hasPrefix("/") {
        fileName = fileManager.currentDirectoryPath + "/" + fileName
    }
    
    if !fileName.hasSuffix(".srt") && !fileName.hasSuffix(".txt") {
        print("Please provide file prefix ")
        guard var prefix = readLine(strippingNewline: true) else {
            print("Cannot get your input ❌")
            exit(1)
        }
        if !prefix.hasPrefix(".") {
            prefix = "." + prefix
        }
        fileName.append(prefix)
    }
    
    do{
        try transcodeFile(withName: fileName)
    }catch let e {
        print(e.localizedDescription)
    }
}
//MARK: - Run main function
main()
