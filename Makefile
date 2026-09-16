FILE := MAD_SwiftExercise.playground/Pages/Swift Exercises 1.xcplaygroundpage/Contents.swift

.DEFAULT_GOAL := run
.PHONY: run check lint format help

run: ## Code ausführen
	swift "$(FILE)"

check: ## Nur auf Compiler-Fehler prüfen, ohne auszuführen
	swiftc -typecheck "$(FILE)"

lint: ## Style-Probleme anzeigen (ohne etwas zu ändern)
	swift format lint "$(FILE)"

format: ## Style-Probleme direkt in der Datei beheben
	swift format -i "$(FILE)"

help: ## Verfügbare Befehle anzeigen
	@grep -E '^[a-z]+:.*## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  make %-6s %s\n", $$1, $$2}'
