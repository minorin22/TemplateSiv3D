# TemplateSiv3D
Template for Builting Siv3D project with Makefile.  
Only available on Intel Mac (Not for M1 Mac)

## Usage
- Download [OpenSiv3D Project Templates for macOS](https://siv3d.github.io/ja-jp/#macos) and unzip it.
- Click [Use This template](https://github.com/minorin22/TemplateSiv3D/generate).

```sh
% mv ~/Downloads/siv3d_v0.4.3_macOS ~
% cd
% git clone your new repository from TemplateSiv3D
```

### How to built and run

```sh
% make
% make run
```

### How to remove
```sh
% make clean
```

### How to install
```sh
% make install
```

### Makefile
```Makefile
# Choose your favorite compiler.
CXX = c++ -std=c++17 -framework AudioToolbox -framework OpenAL
# Application Name(Require same name as the main cpp file)
NAME = Main
# Path to siv3d_v0.4.3_macOS
SIV3D = ../siv3d_v0.4.3_macOS
```

## Reference Links
[OpenSiv3D with Makefile on macOS](https://qiita.com/toyboot4e/items/cc0d87b0f8945de25774)