@echo off
set /p projectName=type project name :
mkdir %projectName%
cd %projectName%
call npx create-react-app ./ --template typescript
call yarn add -D eslint prettier eslint-config-prettier
mkdir .vscode 
(
    echo {
    echo "editor.codeActionsOnSave": {
    echo     "source.fixAll.eslint": true
    echo },
    echo "eslint.format.enable": false,
    echo "editor.formatOnSave": true,
    echo "[javascript]": {
    echo     "editor.defaultFormatter": "esbenp.prettier-vscode"
    echo },
    echo "[json]": {
    echo     "editor.defaultFormatter": "esbenp.prettier-vscode"
    echo },
    echo "editor.lineNumbers": "on",
    echo "editor.rulers": [119],
    echo "editor.wordWrap": "on",
    echo "eslint.packageManager": "yarn",
    echo "files.insertFinalNewline": true,
    echo "files.trimTrailingWhitespace": true,
    echo "typescript.enablePromptUseWorkspaceTsdk": true
    echo }
) > .vscode/settings.json
(
    echo GENERATE_SOURCEMAP=false
) > ./.env
(
    echo {
    echo     "env": {
    echo        "browser": true,
    echo        "es2021": true,
    echo        "node":true
    echo    },
    echo    "extends": ["eslint:recommended", "prettier"],
    echo    "parserOptions": {
    echo        "ecmaVersion": "latest",
    echo        "sourceType": "module"
    echo    },
    echo    "plugins": ["react", "@typescript-eslint"],
    echo "rules": {
    echo    "no-unused-vars": ["warn", { "vars": "all", "args": "after-used", "ignoreRestSiblings": false }]
    echo    }
    echo }
 ) > ./.eslintrc
 (
    echo {
    echo "printWidth": 119,
    echo "tabWidth": 2,
    echo "singleQuote": true,
    echo "semi": true, 
    echo "parser": "typescript",
    echo "endOfLine":"lf"
    echo }
 ) > ./.prettierrc
 (
    echo # Name
    echo ## Dependency
    echo ## Setup
    echo ```bash
    echo cd %projectName%
    echo yarn
    echo ```
    echo ## Usage
    echo ```bash
    echo cd %projectName%
    echo yarn start
    echo ```
    echo ## License
    echo This software is released under the MIT License, see LICENSE.
    echo ## Authors
    echo ## References
    echo - [create-react-app](https://github.com/facebook/create-react-app/blob/main/packages/cra-template/template/README.md)
    echo - [prettier](https://prettier.io/)
    echo - [eslint](https://eslint.org/)
 ) > README.md

mkdir src\utils
mkdir src\component
mkdir src\component\atoms
mkdir src\component\molecules
mkdir src\component\organisms
mkdir src\component\templates
mkdir src\component\pages
