<!doctype html> 
<html lang="en"> 
  <head> 
    <meta charset="utf-8"> 
    <title>Volume of a Sphere</title> 
    <style>  
      body { padding-top:30px; }
      label,input { display:block; margin-bottom:10px; }
    </style> 
  </head> 
  <body> 
    <p>Input radius value and get the volume of a sphere.</p> 
    <form id="MyForm"> 
      <label for="radius">Radius</label>
      <input type="text" name="radius" id="radius" required> 
      <label for="volume">Volume</label>
      <input type="text" name="volume" id="volume" readonly> 
      <input type="submit" value="Calculate" id="submit">    
    </form> 

    <script>
      const form = document.getElementById("MyForm");

      form.addEventListener("submit", (e) => {
        e.preventDefault();

        const radius = document.getElementById("radius").value;
        const volumeInput = document.getElementById("volume");

        const r = parseFloat(radius);
        if (isNaN(r) || r <= 0) {
          alert("Please enter a valid radius");
          return;
        }

        const volume = (4/3) * Math.PI * Math.pow(r, 3);
        volumeInput.value = volume.toFixed(2);
      });
    </script>
  </body> 
</html>
