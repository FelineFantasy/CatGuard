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

if grep -q "# 🐱 CatGuard Module Start" "$CONFIG_FILE" 2>/dev/null; then
    msg "Код CatGuard уже присутствует в $CONFIG_FILE" "CatGuard code already exists in $CONFIG_FILE"
    msg "Хотите перезаписать? (y/n)" "Overwrite? (y/n)"
    read -r answer
    if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
        msg "Отмена." "Canceled."
        exit 0
    fi
    sed -i '/# 🐱 CatGuard Module Start/,/# 🐱 CatGuard Module End/d' "$CONFIG_FILE"
fi

cat >> "$CONFIG_FILE" << 'EOF'

# 🐱 CatGuard Module Start
CAT_LOVE_FILE="$HOME/.cat_love_score"

_get_lang() {
    local lang=$(echo "$LANG" | cut -d'_' -f1)
    if [[ "$lang" == "ru" ]] || [[ "$lang" == "uk" ]] || [[ "$lang" == "be" ]]; then
        echo "ru"
    else
        echo "en"
    fi
}

if [ ! -f "$CAT_LOVE_FILE" ]; then
    echo "0" > "$CAT_LOVE_FILE"
fi

_get_love() {
    command cat "$CAT_LOVE_FILE" 2>/dev/null || echo "0"
}

_msg() {
    local lang=$(_get_lang)
    if [[ "$lang" == "ru" ]]; then
        echo "$1"
    else
        echo "$2"
    fi
}

_check_love() {
    local cost=$1
    local current=$(_get_love)
    if [ "$current" -lt "$cost" ]; then
        if [[ "$(_get_lang)" == "ru" ]]; then
            echo "🐾 Кот преградил вам путь! Недостаточно любви. Нужно: $cost, у вас: $current."
            echo "Погладьте кота командой 'погладить'."
        else
            echo "🐾 Cat blocked your path! Not enough love. Need: $cost, you have: $current."
            echo "Pet the cat with command 'погладить'."
        fi
        return 1
    fi
    echo $((current - cost)) > "$CAT_LOVE_FILE"
    return 0
}

погладить() {
    local current=$(_get_love)
    echo $((current + 1)) > "$CAT_LOVE_FILE"
    if [[ "$(_get_lang)" == "ru" ]]; then
        echo "🐱 Мур-р-р! Кот доволен. Любовь +1 (Всего: $((current + 1)))"
    else
        echo "🐱 Purr-r-r! Cat is happy. Love +1 (Total: $((current + 1)))"
    fi
}

любовь() {
    if [[ "$(_get_lang)" == "ru" ]]; then
        echo "🐱 Текущий уровень любви: $(_get_love)"
    else
        echo "🐱 Current love level: $(_get_love)"
    fi
}

function cat {
    if _check_love 3; then
        command cat "$@"
    fi
}

function grep {
    if _check_love 10; then
        command grep "$@"
    fi
}

function sed {
    if _check_love 10; then
        command sed "$@"
    fi
}

function awk {
    if _check_love 10; then
        command awk "$@"
    fi
}

function more {
    if _check_love 10; then
        command more "$@"
    fi
}

function tail {
    if _check_love 10; then
        command tail "$@"
    fi
}

function head {
    if _check_love 10; then
        command head "$@"
    fi
}

function tac {
    if _check_love 10; then
        command tac "$@"
    fi
}

function perl {
    if _check_love 10; then
        command perl "$@"
    fi
}
# 🐱 CatGuard Module End
EOF

msg "CatGuard модуль успешно добавлен в $CONFIG_FILE" "CatGuard module successfully added to $CONFIG_FILE"
msg "Перезагрузите терминал или выполните: source $CONFIG_FILE" "Reload terminal or run: source $CONFIG_FILE"
if [[ "$LANG_SYS" == "ru" ]]; then
    echo "Теперь вы можете использовать команду 'погладить' и любовь кота!"
else
    echo "Now you can use command 'погладить' and cat love!"
fi