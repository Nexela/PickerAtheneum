# Vscode Setup

## Base Extensions

* Lua Plus
* LuaCoderAssist
* Factorio Lua API autocomplete

## Recomended Extensions

* Git Lens
* GitKraken Glo
* Error Lens
* Better Comments
* Bracket Pair Colorizer 2
* Git Graph
* Indenticator
* Lua Debug
* TodoTree

------------------

## launch.json

```json
{
    // Debugger Launch.json
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug Lua File",
            "type": "lua",
            "request": "launch",
            "stopOnEntry": false,
            "program": "${file}",
            "cwd": "${workspaceRoot}",
            "path": "?.lua;${workspaceRoot}/?.lua;C:\\lua\\luarocks\\lua\\?.lua;c:\\lua\\luarocks\\systree\\share\\lua\\5.2\\?.lua;;",
            "cpath": "C:\\lua\\luarocks\\systree\\lib\\lua\\5.2\\?.dll",
            "console": "internalConsole"
        }
    ]
}
```

------------------

## settings.json

```json
{
  "files.associations": {
    ".luacheckrc": "lua",
    "config.ld": "lua",
    "*.uiflow": "uiflow"
  },
  "code-runner.fileDirectoryAsCwd": false,
  "code-runner.runInTerminal": false,
  "code-runner.clearPreviousOutput": true,
  "editor.quickSuggestions": {
    "other": true,
    "comments": false,
    "strings": true
  },
  "window.title": "${dirty}${rootName}${separator}${activeEditorShort}",
  "editor.formatOnPaste": false,
  "editor.formatOnType": false,
  "git.autofetch": true,
  "breadcrumbs.enabled": true,
  "breadcrumbs.filePath": "on",

  "files.exclude": {
    "**/.git": true,
    "**/.svn": true,
    "**/.hg": true,
    "**/CVS": true,
    "**/.DS_Store": true,
    "**/.build": true,
    "**/.history":true
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true
  },
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "search.followSymlinks": true,
  "problems.decorations.enabled": true,
  "editor.acceptSuggestionOnEnter": "off",
  "files.insertFinalNewline": true,
  "editor.tabCompletion": "on",

  "LuaCoderAssist.debug": false,
  "LuaCoderAssist.luaparse.luaversion": 5.2,

  "LuaCoderAssist.luacheck.enable": true,
  "LuaCoderAssist.luacheck.automaticOption": false,
  "LuaCoderAssist.luacheck.onTyping": true,
  "LuaCoderAssist.luacheck.onSave": true,
  "LuaCoderAssist.luacheck.keepAfterClosed": false,
  "LuaCoderAssist.luacheck.fileSizeLimit": 500,

  "LuaCoderAssist.luacheck.options": [],
  "LuaCoderAssist.luacheck.globals": [],
  "LuaCoderAssist.luacheck.ignore": [],
  "LuaCoderAssist.luacheck.jobs": 1,
  "LuaCoderAssist.luacheck.std": [],

  "LuaCoderAssist.ldoc.authorInFunctionLevel": false,
  "LuaCoderAssist.format.lineWidth": 360,
  "LuaCoderAssist.format.quotemark": "single",
  "LuaCoderAssist.search.followLinks": true,
  "LuaCoderAssist.ldoc.authorName": "Nexela",
  "LuaCoderAssist.metric.enable": false,
  "LuaCoderAssist.search.filters": [],
  "LuaCoderAssist.search.externalPaths": [
    "c:\\lua\\luarocks\\systree\\share\\lua\\5.2",
    "c:\\lua\\luarocks\\lua",
  ],
  "LuaCoderAssist.preloads": ["c:\\lua\\luarocks\\systree\\share\\lua\\5.2"],

  "bracketPairColorizer.showBracketsInGutter": true,
  "bracketPairColorizer.showBracketsInRuler": true,

  "gitlens.codeLens.scopes": [
    "document",
  ],

  "todo-tree.regex": "((\\-\\-)\\s*(TODO|todo|Todo|FIXME)+|(\\-\\-\\s*!))",
  "todo-tree.showInExplorer": false,
  "todo-tree.defaultHighlight": {
    "foreground": "green",
    "type": "none"
  },
  "todo-tree.customHighlight": {
    "TODO": {},
    "FIXME": {}
  },
}
```
