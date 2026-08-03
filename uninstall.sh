#!/bin/bash

detect_language() {
    local lang=$(echo "$LANG" | cut -d'_' -f1)
    if [[ "$lang" == "ru" ]] || [[ "$lang" == "uk" ]] || [[ "$lang" == "be" ]]; then
        echo "ru"
    else
        echo "en"
    fi
}

LANG_SYS=$(detect_language)

msg() {
    if [[ "$LANG_SYS" == "ru" ]]; then
        echo "$1"
    else
        echo "$2"
    fi
}

if [ -n "$ZSH_VERSION" ]; then
    CONFIG_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    CONFIG_FILE="$HOME/.bashrc"
else
    msg "Не удалось определить оболочку. Использую .bashrc" "Could not determine shell. Using .bashrc"
    CONFIG_FILE="$HOME/.bashrc"
fi

if ! grep -q "# 🐱 CatGuard Module Start" "$CONFIG_FILE" 2>/dev/null; then
    msg "CatGuard не найден в $CONFIG_FILE" "CatGuard not found in $CONFIG_FILE"
    exit 0
fi

msg "Найден CatGuard в $CONFIG_FILE" "CatGuard found in $CONFIG_FILE"
msg "Хотите удалить его? (y/n)" "Do you want to remove it? (y/n)"
read -r answer

if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    msg "Отмена." "Canceled."
    exit 0
fi

sed -i '/# 🐱 CatGuard Module Start/,/# 🐱 CatGuard Module End/d' "$CONFIG_FILE"

if [ -f "$HOME/.cat_love_score" ]; then
    rm "$HOME/.cat_love_score"
    msg "Файл любви удалён." "Love file removed."
fi

msg "CatGuard успешно удалён из $CONFIG_FILE" "CatGuard successfully removed from $CONFIG_FILE"
msg "Перезагрузите терминал или выполните: source $CONFIG_FILE" "Reload terminal or run: source $CONFIG_FILE"