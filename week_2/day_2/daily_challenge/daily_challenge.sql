-- =======================================
-- Correction SQL Puzzle
-- Tables : FirstTab, SecondTab
-- =======================================

-- Q1 : Compter les lignes de FirstTab dont l'id n'est pas dans (NULL)
SELECT COUNT(*) AS Q1_Result
FROM FirstTab AS ft
WHERE ft.id NOT IN (
  SELECT id FROM SecondTab WHERE id IS NULL
);
-- Résultat attendu : 0
-- Explication : sous-requête = {NULL}, donc NOT IN (NULL) = UNKNOWN pour tous.

-- =======================================

-- Q2 : Compter les lignes de FirstTab dont l'id n'est pas dans (5)
SELECT COUNT(*) AS Q2_Result
FROM FirstTab AS ft
WHERE ft.id NOT IN (
  SELECT id FROM SecondTab WHERE id = 5
);
-- Résultat attendu : 2
-- Explication : sous-requête = {5}, on enlève id=5, restent id=6 et id=7.

-- =======================================

-- Q3 : Compter les lignes de FirstTab dont l'id n'est pas dans (5, NULL)
SELECT COUNT(*) AS Q3_Result
FROM FirstTab AS ft
WHERE ft.id NOT IN (
  SELECT id FROM SecondTab
);
-- Résultat attendu : 0
-- Explication : sous-requête = {5, NULL}, présence de NULL => toute comparaison devient UNKNOWN.

-- =======================================

-- Q4 : Compter les lignes de FirstTab dont l'id n'est pas dans (5)
SELECT COUNT(*) AS Q4_Result
FROM FirstTab AS ft
WHERE ft.id NOT IN (
  SELECT id FROM SecondTab WHERE id IS NOT NULL
);
-- Résultat attendu : 2
-- Explication : sous-requête = {5}, on enlève id=5, restent id=6 et id=7.

-- =======================================
-- Résumé :
-- Q1 = 0
-- Q2 = 2
-- Q3 = 0
-- Q4 = 2
-- =======================================
