#!/bin/bash

# Przejście do katalogu, w którym znajduje się skrypt
cd "$PWD"

# Pobranie najnowszych zmian z GitHub
git pull origin main

# Dodanie wszystkich nowych/zmienionych plików do repozytorium
git add .

# Sprawdzenie, czy są zmiany do commitu
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
else
    # Stworzenie commitu z automatycznym opisem
    git commit -m "Automated commit"

    # Wypchnięcie zmian do zdalnego repozytorium
    git push origin main
fi
