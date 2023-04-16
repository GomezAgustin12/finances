#!/bin/bash

# Create a new directory
cd packages
mkdir $1
cd $1

# Create a new package.json file
yarn init --yes 

# Read the package.json file into a variable
package=$(cat package.json)

# Modify the package.json file
new_package=$(echo $package | jq '. + { "main": "./dist/index.js", "scripts": {"start": "yarn ts-node ./src/index.ts"} }')

# Write the modified package.json file
echo $new_package > package.json

# Install the dependencies
yarn add @types/node typescript 
yarn add -D ts-node

# Create a tsconfig.json file
yarn tsc --init --rootDir src --outDir ./dist --esModuleInterop --lib ES2019 --module commonjs --noImplicitAny true

# Create a src directory and an index.ts file
mkdir src
touch src/index.ts

# Add a newPackage function to the index.ts file
echo export const newPackage = \( \) =\> \{\\n console.log\( \"NEW PACKAGE WORKING!!\" \) \\n\} \\n \\n newPackage\(\) > src/index.ts

# Add a build script to the package.json file
yarn tsc

# Add the package to the workspace
yarn link

# Test the package
yarn start
