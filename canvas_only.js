exports.handler = function (event, context) {
    var Canvas = require('canvas')
    , Image = Canvas.Image
    , canvas = new Canvas(200, 200)
    , ctx = canvas.getContext('2d');

    console.log('1');
    ctx.font = '30px Impact';
    console.log('2');
    ctx.rotate(.1);
    console.log('3');
    ctx.fillText("Awesome!", 50, 100);
    console.log('4');
    var te = ctx.measureText('Awesome!');
    console.log('5');
    ctx.strokeStyle = 'rgba(0,0,0,0.5)';
    console.log('6');
    ctx.beginPath();
    console.log('7');
    ctx.lineTo(50, 102);
    console.log('8');
    ctx.lineTo(50 + te.width, 102);
    console.log('9');
    ctx.stroke();
    console.log('10');

    // Canvas.canvas is not the same as Fabric.canvas!
    canvas.toDataURL('image/png', function(err, png){
        console.log('err: ', err);
        console.log('data url: ', png);
        context.done(err, png);
    });
}
