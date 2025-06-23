#!/usr/bin/env bash
# setup_webapps.sh
CHROME="/usr/bin/google-chrome"
ICON_DIR="$HOME/.local/share/icons/webapps"
DESKTOP_DIR="$HOME/.local/share/applications"

# Nome | URL | nome-do-ícone-png (opcional)
apps=(
  "Gmail|https://mail.google.com|gmail"
  "Calendar|https://calendar.google.com|calendar"
  "Notion|https://notion.so|notion"
)

mkdir -p "$ICON_DIR" "$DESKTOP_DIR"

for entry in "${apps[@]}"; do
  IFS="|" read -r NAME URL ICON <<<"$entry"
  SAFE=$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '_')
  ICON_PATH="$ICON_DIR/${SAFE}.png"

  # favicon 64 px (muda se quiser ícones próprios)
  wget -q "https://www.google.com/s2/favicons?sz=64&domain_url=${URL}" -O "$ICON_PATH"

  cat >"$DESKTOP_DIR/${SAFE}.desktop" <<EOF
[Desktop Entry]
Name=${NAME}
Exec=${CHROME} --profile-directory=Default --app=${URL}
Terminal=false
Type=Application
Icon=${ICON_PATH}
StartupNotify=true
EOF
done

update-desktop-database "$DESKTOP_DIR"
