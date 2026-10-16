# 🐱 CatGuard

[![Лицензия: MIT](https://img.shields.io/badge/Лицензия-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Оболочка: Bash](https://img.shields.io/badge/Оболочка-Bash-4EAA25.svg?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Платформа: Linux](https://img.shields.io/badge/Платформа-Linux-FCC624.svg?logo=linux&logoColor=black)](https://www.kernel.org/)
[![DonationAlerts](https://img.shields.io/badge/DonationAlerts-Поддержать-blue.svg)](https://www.donationalerts.com/r/FelineFantasy)
[![Звёзды GitHub](https://img.shields.io/github/stars/FelineFantasy/CatGuard?style=social)](https://github.com/FelineFantasy/CatGuard/stargazers)
[![Форки GitHub](https://img.shields.io/github/forks/FelineFantasy/CatGuard?style=social)](https://github.com/FelineFantasy/CatGuard/network/members)
[![Issues GitHub](https://img.shields.io/github/issues/FelineFantasy/CatGuard)](https://github.com/FelineFantasy/CatGuard/issues)
[![PRs приветствуются](https://img.shields.io/badge/PRs-приветствуются-brightgreen.svg)](https://github.com/FelineFantasy/CatGuard/pulls)

> 🇬🇧 **English version:** [README.md](README.md)

**CatGuard** — это система контроля доступа к файлам, работающая на любви к котам.

Чтобы прочитать файл, вы должны завоевать доверие кота. Чем больше любви — тем больше доступа.

---

## 📦 Установка

```bash
git clone https://github.com/FelineFantasy/CatGuard
cd CatGuard
chmod +x install.sh
./install.sh
```

---

## 🎮 Как это работает

· погладить — увеличивает уровень любви на 1
· любовь — показывает текущий уровень любви
· cat <файл> — требует 3 единицы любви для чтения файла
· grep, sed, awk, more, tail, head, tac, perl, strings — требуют 10 единиц любви

---

## 🧹 Удаление

```bash
./uninstall.sh
```

---

## 🧠 Пример

```bash
$ cat notes.txt
🐾 Кот преградил путь! Недостаточно любви. Нужно: 3, у вас: 1.
Погладьте кота командой 'погладить'.

$ погладить
🐱 Мур-р-р! Кот доволен. Любовь +1 (Всего: 1)

$ cat notes.txt
1. Полить кота
2. Помыть посуду
3. Покормить цветы
```

---

## 📁 Структура проекта

```text
CatGuard/
├── .github/
│   └── FUNDING.yml
├── install.sh
├── uninstall.sh
├── README.md
├── README.ru.md
├── LICENSE
└── .gitignore
```

## 💖 Поддержать проект

Если тебе нравится CatGuard и ты хочешь помочь проекту жить, ты можешь поддержать меня здесь:

https://img.shields.io/badge/DonationAlerts-Поддержать-blue.svg

Твоя поддержка поможет мне:

· 🐱 Добавлять новые фичи и кошачьи взаимодействия
· 🛠️ Исправлять баги и улучшать производительность
· ☕ Не засыпать за кодом в 4 утра

Даже маленькая помощь много значит! ❤️

## 👤 Автор

· FelineFantasy
· Лицензия: MIT
