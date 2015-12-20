# node-canvas-lambda-demo
Demo of using node-canvas and fabric on AWS lambda.

# Getting Started

Create a new AWS Lambda NodeJS function.

Zip up the contents of this repo: `zip -r node-canvas-lambda-demo.zip .`

Upload the zip file.

Point the function at the desired handler (app.handler or canvas_only.handler).

Test the function. The execution should succeed and you should see a PNG data URL in the log.



