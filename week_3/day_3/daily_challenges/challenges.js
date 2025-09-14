
// 🌍 Liste des planètes avec couleurs et nombre de lunes
const planets = [
  { name: "Mercury", color: "gray", moons: 0 },
  { name: "Venus", color: "yellow", moons: 0 },
  { name: "Earth", color: "blue", moons: 1 },
  { name: "Mars", color: "red", moons: 2 },
  { name: "Jupiter", color: "orange", moons: 79 },
  { name: "Saturn", color: "goldenrod", moons: 83 },
  { name: "Uranus", color: "lightblue", moons: 27 },
  { name: "Neptune", color: "darkblue", moons: 14 }
];

// Sélection de la section où placer les planètes
const section = document.querySelector(".listPlanets");

planets.forEach(planet => {
  // Création de la planète
  const planetDiv = document.createElement("div");
  planetDiv.classList.add("planet");
  planetDiv.style.backgroundColor = planet.color;
  planetDiv.textContent = planet.name;

  // Ajouter les lunes
  for (let i = 0; i < planet.moons; i++) {
    const moon = document.createElement("div");
    moon.classList.add("moon");

    // Positionnement des lunes autour de la planète
    const angle = (i / planet.moons) * 2 * Math.PI;
    const radius = 60; // distance planète-lune
    moon.style.left = 50 + radius * Math.cos(angle) + "px";
    moon.style.top = 50 + radius * Math.sin(angle) + "px";

    planetDiv.appendChild(moon);
  }

  // Ajouter la planète à la section
  section.appendChild(planetDiv);
});
