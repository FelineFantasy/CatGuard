#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
    CONFIG_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    CONFIG_FILE="$HOME/.bashrc"
else
    echo "Не удалось определить оболочку. Использую .bashrc"
    CONFIG_FILE="$HOME/.bashrc"
fi

if grep -q "# 🐱 CatGuard Module Start" "$CONFIG_FILE" 2>/dev/null; then
    echo "Код CatGuard уже присутствует в $CONFIG_FILE"
    echo "Хотите перезаписать? (y/n)"
    read -r answer
    if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
        echo "Отмена."
        exit 0
    fi
    sed -i '/# 🐱 CatGuard Module Start/,/# 🐱 CatGuard Module End/d' "$CONFIG_FILE"
fi

cat >> "$CONFIG_FILE" << 'EOF'

# 🐱 CatGuard Module Start
CAT_LOVE_FILE="$HOME/.cat_love_score"

if [ ! -f "$CAT_LOVE_FILE" ]; then
    echo "0" > "$CAT_LOVE_FILE"
fi

_get_love() {
    command cat "$CAT_LOVE_FILE" 2>/dev/null || echo "0"
}

_check_love() {
    local cost=$1
    local current=$(_get_love)
    if [ "$current" -lt "$cost" ]; then
        echo "🐾 Кот преградил вам путь! Недостаточно любви. Нужно: $cost, у вас: $current."
        echo "Погладьте кота командой 'погладить'."
        return 1
    fi
    echo $((current - cost)) > "$CAT_LOVE_FILE"
    return 0
}

погладить() {
    local current=$(_get_love)
    echo $((current + 1)) > "$CAT_LOVE_FILE"
    echo "🐱 Мур-р-р! Кот доволен. Любовь +1 (Всего: $((current + 1)))"
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

echo "CatGuard модуль успешно добавлен в $CONFIG_FILE"
echo "Перезагрузите терминал или выполните: source $CONFIG_FILE"
echo "Теперь вы можете использовать команду 'погладить' и любовь кота!"