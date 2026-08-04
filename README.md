# 🐱 CatGuard

> 🇷🇺 **Русская версия:** [README.ru.md](README.ru.md)

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

- `pet` — increases the love level by 1
- `love` - shows the current level of love
- `cat <file>` — requires 3 love units to read the file
- `grep`, `sed`, `awk`, `more`, `tail`, `head`, `tac`, `perl`, `strings` — require 10 love units

---

## 🧹 Uninstallation

```bash
./uninstall.sh
```

---

## 🧠 Example

```bash
$ cat notes.txt
🐾 Cat blocked your path! Not enough love. Need: 3, you have: 1.
Pet the cat with command 'pet'.

$ pet
🐱 Purr-r-r! Cat is happy. Love +1 (Total: 1)

$ cat notes.txt
1. Water the cat
2. Wash the dishes
3. Feed the flowers
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
├── README.ru.md
├── LICENSE
└── .gitignore
```

---

## 👤 Author

- **FelineFantasy**
- **License**: MIT