document.addEventListener("DOMContentLoaded", function(){

  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "purple";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100000, 10, 0,52, true);
  ctx.strokeStyle = "red";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();
});
