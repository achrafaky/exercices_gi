<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>DOM Timer & Animation</title>
  <style>
    p {
      background: yellow;
      color: red;
    }
    #container {
      width: 400px;
      height: 400px;
      position: relative;
      background: yellow;
      margin-top: 20px;
    }
    #animate {
      width: 50px;
      height: 50px;
      position: absolute;
      background-color: red;
    }
  </style>
</head>
<body>
  <h2>🌟 Exercice 1 : Timer</h2>
  <div id="container-timer"></div>
  <button id="clear">Clear Interval</button>

  <h2>🌟 Exercice 2 : Move the Box</h2>
  <p><button onclick="myMove()">Click Me</button></p>
  <div id="container">
    <div id="animate"></div>
  </div>

  <script>
    // ---------------- Exercice 1 : Timer ----------------
    // Part I : Alert après 2s
    setTimeout(() => {
      alert("Hello World");
    }, 2000);

    // Part II : Ajouter un <p>Hello World</p> après 2s
    setTimeout(() => {
      const container = document.getElementById("container-timer");
      const p = document.createElement("p");
      p.textContent = "Hello World";
      container.appendChild(p);
    }, 2000);

    // Part III : Ajouter un <p>Hello World</p> toutes les 2s (max 5 fois)
    const containerTimer = document.getElementById("container-timer");
    const clearBtn = document.getElementById("clear");

    let count = 0;
    let interval = setInterval(() => {
      if (count >= 5) {
        clearInterval(interval);
        return;
      }
      const p = document.createElement("p");
      p.textContent = "Hello World";
      containerTimer.appendChild(p);
      count++;
    }, 2000);

    clearBtn.addEventListener("click", () => {
      clearInterval(interval);
    });

    // ---------------- Exercice 2 : Move the Box ----------------
    function myMove() {
      const elem = document.getElementById("animate");
      let pos = 0; // position de départ
      const container = document.getElementById("container");
      const limit = container.offsetWidth - elem.offsetWidth;

      const id = setInterval(() => {
        if (pos >= limit) {
          clearInterval(id); // stop à droite
        } else {
          pos++;
          elem.style.left = pos + "px";
        }
      }, 1); // déplacement toutes les 1 ms
    }
  </script>
</body>
</html>
