# 🐱 CatGuard

**CatGuard** is a file access control system powered by a love for cats.

To read a file, you must earn the cat's affection. The more love you have, the more access you get.

---

## 📦 Installation

```bash
git clone https://github.com
cd CatGuard
chmod +x install.sh
./install.sh
```

---

## 🎮 How It Works

- `pet` — increases the love level by 1
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
🐾 A cat has blocked your path! Not enough love. Required: 3, you have: 0.
Pet the cat using the 'pet' command.

$ pet
🐱 Purr! The cat is pleased. Love +1 (Total: 1)

$ cat notes.txt
1. Water the cat
2. Plant the dishes
3. Feed the flowers
```

---

## 📁 Project Structure

```text
CatGuard/
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