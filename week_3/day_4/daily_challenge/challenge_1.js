<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Challenge: Mad Libs</title>
  <style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    form { margin-bottom: 20px; }
    label { display: inline-block; width: 120px; }
    input { margin-bottom: 10px; }
    button { margin-top: 10px; }
    #story { font-weight: bold; color: darkblue; }
  </style>
</head>
<body>

  <h1>Mad Libs</h1>

  <form id="libform">
    <label for="noun">Noun:</label><input type="text" id="noun"><br>
    <label for="adjective">Adjective:</label><input type="text" id="adjective"><br>
    <label for="person">Someone's Name:</label><input type="text" id="person"><br>
    <label for="verb">Verb:</label><input type="text" id="verb"><br>
    <label for="place">A place:</label><input type="text" id="place"><br>
    <button id="lib-button" type="submit">Lib it!</button>
  </form>

  <button id="shuffle-button">Shuffle Story</button>

  <p>Generated story: 
    <span id="story"></span>
  </p>

  <script>
    const form = document.getElementById("libform");
    const storySpan = document.getElementById("story");
    const shuffleBtn = document.getElementById("shuffle-button");

    let values = {};
    let stories = [];

    form.addEventListener("submit", function(e) {
      e.preventDefault();

      const noun = document.getElementById("noun").value.trim();
      const adjective = document.getElementById("adjective").value.trim();
      const person = document.getElementById("person").value.trim();
      const verb = document.getElementById("verb").value.trim();
      const place = document.getElementById("place").value.trim();

      if (!noun || !adjective || !person || !verb || !place) {
        alert("Please fill in all fields!");
        return;
      }

      // Store values for shuffle use
      values = { noun, adjective, person, verb, place };

      // Define multiple possible stories
      stories = [
        `${person} decided to ${verb} with a ${adjective} ${noun} in ${place}.`,
        `In ${place}, ${person} found a ${adjective} ${noun} and started to ${verb}.`,
        `The ${adjective} ${noun} wanted to ${verb}, but ${person} stopped it in ${place}.`
      ];

      // Display first story
      storySpan.textContent = stories[0];
    });

    shuffleBtn.addEventListener("click", function() {
      if (!stories.length) {
        alert("Please generate a story first!");
        return;
      }

      // Pick a random story
      const randomIndex = Math.floor(Math.random() * stories.length);
      storySpan.textContent = stories[randomIndex];
    });
  </script>

</body>
</html>

