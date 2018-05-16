# node-canvas-lambda-demo
Demo of using node-canvas and fabric on AWS lambda.

# Development

See `setup.sh`. You'll need an AWS Linux EC2 instance, last time I updated this I used an m5.4xl, but it should work on smaller instances.

# Getting Started

Create a new AWS Lambda NodeJS function.

Zip up the contents of this repo: `./bundle.sh`

Upload the zip file.

Point the function at the desired handler (app.handler or canvas_only.handler).

Test the function. The execution should succeed and you should see a PNG data URL in the log.
