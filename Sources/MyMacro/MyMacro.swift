@attached(peer, names: arbitrary)
public macro TestMacro() = #externalMacro(module: "MyMacroMacros", type: "TestMacro")
