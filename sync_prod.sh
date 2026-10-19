#!/usr/bin/env bash
# sync_prod.sh — Alinha branch prod com upstream/main e faz push
# Uso: ./sync_prod.sh
# Local: /home/valdir/000_VALDIR/00_CAE/FemEDSS/OpenCourant

set -euo pipefail

REPO_DIR="/home/valdir/000_VALDIR/00_CAE/FemEDSS/OpenCourant"

cd "$REPO_DIR"

echo "=== OpenCourant sync_prod ==="
echo "Diretório: $REPO_DIR"
echo "Branch atual: $(git branch --show-current)"
echo

# Garante que está em prod
if [[ "$(git branch --show-current)" != "prod" ]]; then
  echo "Mudando para branch prod..."
  git checkout prod
fi

echo "[1/3] Fetch upstream..."
git fetch upstream

echo "[2/3] Merge upstream/main..."
if git merge upstream/main --no-edit; then
  echo "Merge concluído."
else
  echo "ERRO: conflito no merge. Resolva manualmente e rode de novo."
  exit 1
fi

echo "[3/3] Push origin prod..."
git push origin prod

echo
echo "=== Sincronizado ==="
git log -1 --oneline
echo
