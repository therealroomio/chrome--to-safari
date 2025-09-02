import Foundation

struct Message: Codable {
    let url: String
}

func readMessage() -> Message? {
    let input = FileHandle.standardInput
    guard let lengthData = try? input.read(upToCount: 4),
          lengthData.count == 4 else { return nil }
    let length = lengthData.withUnsafeBytes { $0.load(as: UInt32.self) }
    guard let messageData = try? input.read(upToCount: Int(length)) else { return nil }
    return try? JSONDecoder().decode(Message.self, from: messageData)
}

func sendResponse(_ dict: [String: String]) {
    if let data = try? JSONSerialization.data(withJSONObject: dict) {
        var length = UInt32(data.count).littleEndian
        let header = Data(bytes: &length, count: 4)
        FileHandle.standardOutput.write(header)
        FileHandle.standardOutput.write(data)
    }
}

while let message = readMessage() {
    let process = Process()
    process.launchPath = "/usr/bin/open"
    process.arguments = ["-a", "Safari", message.url]
    process.launch()
    sendResponse(["status": "ok"])
}
