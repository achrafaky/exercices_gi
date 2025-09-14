
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Daily Challenge: Letters Only</title>
  <style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    label { font-weight: bold; }
    input { padding: 8px; width: 250px; }
    p { color: gray; font-size: 14px; }
  </style>
</head>
<body>

  <h1>Letters Only Input</h1>

  <label for="lettersOnly">Enter text (letters only):</label>
  <input type="text" id="lettersOnly" placeholder="Type here...">
  <p>Numbers and special characters will be removed automatically.</p>

  <script>
    const input = document.getElementById("lettersOnly");

    // Listen for input changes
    input.addEventListener("input", function() {
      // Replace everything that is not a letter
      this.value = this.value.replace(/[^a-zA-Z]/g, "");
    });
  </script>

</body>
</html>
