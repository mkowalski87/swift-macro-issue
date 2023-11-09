import MyMacro

struct Struct {
    @TestMacro
    func method() {
        let x = 100
        "Swift Macro".lowercased()
        let y = 123.byteSwapped
    }
}

