#!/bin/bash
set -eu

table_name=${1}

if [[ -z "$table_name" ]]; then
  echo "Le nom de la table doit être fourni.";
  exit 1
fi

if [[ -z "$DATABASE_URL" ]]; then
  echo "La variable d'environnement DATABASE_URL doit être fournie."
  exit 1
fi

psql "$DATABASE_URL" -c "UPDATE metabase_table SET visibility_type = null WHERE name = '$table_name';"
