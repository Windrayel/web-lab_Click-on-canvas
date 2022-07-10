let chart = document.getElementById('canvas');

const canvas = document.querySelector('#canvas')

let ctx = canvas.getContext('2d');

color =  '#2f9aff';
colorLine = "black";
size = chart.getAttribute('width')

ctx.fillStyle = colorLine;
ctx.strokeRect(0, 0, chart.width, chart.height);
ctx.fillStyle = color;


ctx.beginPath();
ctx.moveTo(size*0.3, size*0.5);
ctx.lineTo(size*0.5, size*0.5);
ctx.lineTo(size*0.5, size*0.3);
ctx.fill();

ctx.beginPath();
ctx.moveTo(size*0.1, size*0.5);
ctx.lineTo(size*0.1, size*0.7);
ctx.lineTo(size*0.5, size*0.7);
ctx.lineTo(size*0.5, size*0.5);
ctx.fill();

ctx.beginPath();
ctx.arc(size*0.5, size*0.5, size*0.4, 3*Math.PI/2, 2*Math.PI, false);
ctx.moveTo(size*0.9, size*0.5);
ctx.lineTo(size*0.5, size*0.1);
ctx.lineTo(size*0.5, size*0.5);
ctx.fillStyle = color;
ctx.fill();

ctx.fillStyle = colorLine;
let y = [" R ", "R/2", "", "-R/2", " -R"];
for(let i = 0; i < 5; i++) {
    ctx.fillText(y[i], size*0.53, size*0.1 + i*size*0.2);
    ctx.beginPath();
    ctx.moveTo(size*0.48,size*0.1 + i*size*0.2);
    ctx.lineTo(size*0.52, size*0.1 + i*size*0.2);
    ctx.stroke();
}
ctx.fillText("y", size*0.53, size*0.04);

let x = [" -R", "-R/2", "", " R/2", "  R"];
for(let i = 0; i < 5; i++) {
    ctx.fillText(x[i], size*0.08 + i*size*0.2,size*0.47);
    ctx.beginPath();
    ctx.moveTo(size*0.1+ i*size*0.2,size*0.48);
    ctx.lineTo(size*0.1+ i*size*0.2,size*0.52);
    ctx.stroke();
}
ctx.fillText("x", size*0.96, size*0.47);

ctx.beginPath();
ctx.moveTo(size*0.96, size*0.48);
ctx.lineTo(size*0.98, size*0.5);
ctx.lineTo(size*0.96, size*0.52);
ctx.fill();

ctx.beginPath();
ctx.moveTo(size*0.48, size*0.04);
ctx.lineTo(size*0.5, size*0.02);
ctx.lineTo(size*0.52, size*0.04);
ctx.fill();

ctx.lineWidth = 2.0;
ctx.beginPath();
ctx.moveTo(size*0.5, size*0.02);
ctx.lineTo(size*0.5, size*0.98);
ctx.stroke();

ctx.beginPath();
ctx.moveTo(size*0.02,size*0.5);
ctx.lineTo(size*0.98, size*0.5);
ctx.stroke();

canvas.addEventListener('click', handlerClickCanvas)
let dotsDisabled = true;
let RR = 0;


function enableDots(a){
    dotsDisabled = false;
    RR = a;
}

function handlerClickCanvas(e){
    if (dotsDisabled) {
        alert("Радиус не выбран!");
    }else {
        var rect = canvas.getBoundingClientRect();
        let x = e.clientX - rect.left;
        x = (x - 200) / 160 * RR;
        let y = e.clientY - rect.top;

        document.getElementById("hiddenButton").value = x;
        y = -((y - 200)/ 160 * RR);
        document.getElementById("y").value = y;
        showError();
    }
}
function drawDot(x, y, r){
    x = 200 + 160/r * x;
    y = 200 - 160/r * y;
    ctx.beginPath();
    ctx.fillStyle = '#FF0000';
    ctx.arc(x, y, 3, 0, 2 * Math.PI)
    ctx.fill();
}