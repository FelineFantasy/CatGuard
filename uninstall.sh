#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
    CONFIG_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    CONFIG_FILE="$HOME/.bashrc"
else
    echo "Не удалось определить оболочку. Использую .bashrc"
    CONFIG_FILE="$HOME/.bashrc"
fi

if ! grep -q "# 🐱 CatGuard Module Start" "$CONFIG_FILE" 2>/dev/null; then
    echo "CatGuard не найден в $CONFIG_FILE"
    exit 0
fi

echo "Найден CatGuard в $CONFIG_FILE"
echo "Хотите удалить его? (y/n)"
read -r answer

if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Отмена."
    exit 0
fi

sed -i '/# 🐱 CatGuard Module Start/,/# 🐱 CatGuard Module End/d' "$CONFIG_FILE"

if [ -f "$HOME/.cat_love_score" ]; then
    rm "$HOME/.cat_love_score"
    echo "Файл любви удалён."
fi

echo "CatGuard успешно удалён из $CONFIG_FILE"
echo "Перезагрузите терминал или выполните: source $CONFIG_FILE"