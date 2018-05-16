exports.handler = function(event, context) {
    var Canvas = require('canvas');
    var fabric = require('fabric').fabric;

    console.log('Loading function');
    console.log('got fabric:', fabric);

    console.log('Received event:', JSON.stringify(event, null, 2));

    var canvas = new fabric.Canvas(null, {width: 200, height: 200})
    console.log('canvas: ', canvas);

    var text = new fabric.Text('Hello world', {left: 100, top: 100, fill: '#f55', angle: 15});
    console.log('text: ', text);

    canvas.add(text);
    console.log('canvas w/ text: ', canvas);

    // fabric.Canvas is not the same as Canvas.canvas!
    var dataURL = canvas.toDataURL('image/png');
    console.log('data url: ', dataURL);

    context.done(null, dataURL);
};
