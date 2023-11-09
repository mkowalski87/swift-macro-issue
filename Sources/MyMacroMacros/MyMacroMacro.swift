import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

public struct TestMacro: PeerMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {

        guard let declaration = declaration.as(FunctionDeclSyntax.self) else {
            fatalError()
        }
        let body = declaration.body!.statements
        return ["""
                func test1() {
                    \(raw: body)
                }
                """]
    }
}

@main
struct MyMacro: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        TestMacro.self,
    ]
}
