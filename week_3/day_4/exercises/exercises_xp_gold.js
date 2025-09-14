<select id="genres">
  <option value="rock">Rock</option>
  <option value="blues" selected>Blues</option>
</select>

<p id="selectedValue"></p>

<script>
  const select = document.getElementById("genres");
  const display = document.getElementById("selectedValue");

  // Show initial selected value
  display.textContent = "Selected: " + select.value;

  // Update when selection changes
  select.addEventListener("change", () => {
    display.textContent = "Selected: " + select.value;
  });

  // Add new option
  const newOption = document.createElement("option");
  newOption.value = "classic";
  newOption.text = "Classic";
  newOption.selected = true; // make default
  select.appendChild(newOption);

  // Update displayed value since Classic is now selected
  display.textContent = "Selected: " + select.value;
</script>
