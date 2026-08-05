# 🐱 CatGuard

> 🇬🇧 **English version:** [README.md](README.md)

**CatGuard** — это система контроля доступа к файлам, работающая на любви к котам.

Чтобы прочитать файл, вы должны заслужить расположение кота. Чем больше любви — тем больше доступа.

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

- `pet` — увеличивает уровень любви на 1
- `love` — показывает текущий уровень любви
- `cat <файл>` — требует 3 единицы любви для чтения файла
- `grep`, `sed`, `awk`, `more`, `tail`, `head`, `tac`, `perl`, `strings` — требуют 10 единиц любви

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

---

## 👤 Автор

- **FelineFantasy**
- **Лицензия**: MIT