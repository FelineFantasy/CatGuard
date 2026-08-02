# 🐱 CatGuard

**CatGuard** is a file access control system powered by a love for cats.

To read a file, you must earn the cat's affection. The more love you have, the more access you get.

---

## 📦 Installation

```bash
git clone https://github.com/FelineFantasy/CatGuard
cd CatGuard
chmod +x install.sh
./install.sh
```

---

## 🎮 How It Works

- `погладить` — increases the love level by 1
- `cat <file>` — requires 3 love units to read the file
- `grep`, `sed`, `awk`, `more`, `tail`, `head`, `tac`, `perl` — require 10 love units

---

## 🧹 Uninstallation

```bash
./uninstall.sh
```

---

## 🧠 Example

```bash
$ cat notes.txt
🐾 Кот преградил вам путь! Недостаточно любви. Нужно: 3, у вас: 0.
Погладьте кота командой 'погладить'.

$ погладить
🐱 Мур-р-р! Кот доволен. Любовь +1 (Всего: 1)

$ cat notes.txt
1. Полить кота
2. Посадить посуду
3. покормить цветы
```

---

## 📁 Project Structure

```text
CatGuard/
├── .github/
│   └── FUNDING.yml
├── install.sh
├── uninstall.sh
├── README.md
├── LICENSE
└── .gitignore
```

---

## 👤 Author

- **FelineFantasy**
- **License**: MIT
