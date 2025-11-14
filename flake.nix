{
  description = "html dev shell for my little website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      dependencies = with pkgs; [
        superhtml
        vscode-css-languageserver
      ];

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = dependencies;
        shellHook = "echo 'html shell init complete.'";
      };

    };
}
