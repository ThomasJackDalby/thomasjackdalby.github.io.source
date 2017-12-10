---
title:  "Dragon Curves"
date:   "2017-07-30"
---

So I've taken to reading a pretty neat magazine released monthly called [Chalkdust](http://chalkdustmagazine.com/). 
In it there are various maths related articles covering the whole spectrum, but one I was particularly drawn to last month was the concept of Dragon Curves. 

Dragon curves are essentially curves, almost fractal like in nature. They take the form of a line making 90° turns clockwise or anticlockise, yet they never cross over themselves, and they also tesselate.

One way to create them, and where they realise themselves, is by folding a strip of paper inhalf multiple times. The number of folds performed can be thought of as the "order" of the curve.

The guys at Chalkdust had created a fantastic background which covered the front and back cover of the magazine, so naturally, I wanted to see if I could script something up myself!

I thought a decent platform for this was p5.js, which I've been dabbling in a lot recentely. One of the core developers, Daniel Shiffman [TheCodingTrain](http://thecodingtrain.com/), has an absolutly fantastic series of Youtube tutorials on his [channel](https://www.youtube.com/user/shiffman) and streams using the framework. I highly recommend a watch (although trying to keep up to date, given the rate at which he releases content is insane!).

Starting as with any p5.js sketch, a setup and draw function is needed. This is just in a standard javascript file, referenced by index.html.
{{< highlight javascript >}}
function setup() {
    createCanvas(400, 400);
}

function draw() {
    background(51);
}
{{< / highlight >}}

Now dragon curves can be describes as a sequence of folds, bending the paper in one direction or the other. When creating a Dragon Curve with paper, the paper gets folded 180

Calculating the curve is fairly straight forward. We can make use of the nice recursive property of the curves, and combine two smaller curves (represented by arrays), remembering to modify one slightly.

{{< highlight javascript >}}
function calculate_curve(order) {
    if (order == 0) return [1];
    var head = calculate_curve(order-1);
    var tail = head.slice(); // Copy the head section.
    tail[tail.length/2-0.5] = 0; // Invert the middle of the tail section.
    return head.concat([1]).concat(tail);
}
{{< / highlight >}}

Drawing the curve is slightly more involved. P5.js is a very easy framework to pick up, and in this situation we heavily used the ability to translate and rotate the reference frame. Once we've drawn a section, we simply transform our position to the end of that peice, and continue.

{{< highlight javascript >}}
function draw_curve(curve, index) {
    if (index >= curve.length) return;
    var x = -diameter/2.0;
    var rotation_angle = -Math.PI/2.0;
    var end_angle = 0;
    var start_angle = -Math.PI/2.0;

    if (curve[index] == 1)
        x *= -1;
        rotation_angle *= -1;
        start_angle = Math.PI;
        end_angle = 3*Math.PI/2.0;
    }
    
    arc(x, 0, diameter, diameter, start_angle, end_angle);
    y = -diameter/2.0;
    translate(x, y);
    rotate(rotation_angle);
    draw_curve(curve, ++index);    
}
{{< / highlight >}}

Once we have these two parts, we can begin to see some curves! First we need to make some minor modifications to our draw function:

{{< highlight javascript >}}
function draw() {
    background(51);
    translate(width/2, height/2); // Move the middle of the canvas
    stroke(255);
    noFill();
    strokeWeight(thickness);
    var curve = calculate_curve(4); // Create an order 4 curve.
    draw_curve(curve, 0);
    noLoop(); // No refresh needed #SaveTheCycles.
}
{{< / highlight >}}

And then, hey presto!

![An order 1 dragon curve!](/dragoncurves/curve1.png)

It's then pretty easy to create a function that will let us create a few curves in one image.

{{< highlight javascript >}}
function make_curve(order, x, y){
    push();
    translate(x, y);
    var curve = calculate_curve(order);
    draw_curve(curve, 0);
    pop();
}
{{< / highlight >}}

The push() and the pop() here, are taking a snapshot of the current reference frame, and then "popping" back to that. This allows fairly complex transforms to draw the curves, but contains those transforms inside a function, without leaking out into the rest of the script. This helps, as otherwise any transform you applied to the reference frame, would affect EVERYTHING you subsequently draw.. yeah..

![Dragon curves from order 1 to 4](/dragoncurves/curves1to4.png)

We can take this a step further though. Another great property of dragon curves is that they tesselate!

![4 curves rotated into a patch](/dragoncurves/curvespatch4.png)

We can then also tesselate the patches by offsetting them in x and y.

![Full patch](/dragoncurves/patched.png)

So naturally you can go on and on! I'll end the post here, but If you want to play with the code, the source is on [github](https://github.com/ThomasJackDalby/experimental/tree/master/dragoncurves)! Feel free to experiment!

Tom