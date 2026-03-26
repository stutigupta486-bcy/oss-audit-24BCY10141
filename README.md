<div align="center">

<h1> The Open Source Audit — LibreOffice <h1/>

<!-- BADGES -->
<br/>

![Course](https://img.shields.io/badge/Course-Open%20Source%20Software-6C63FF?style=for-the-badge&logo=bookstack&logoColor=white)
![University](https://img.shields.io/badge/VIT%20Bhopal-University-48CAE4?style=for-the-badge&logo=mortarboard&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![License](https://img.shields.io/badge/Software%20License-MPL%202.0-FF6B6B?style=for-the-badge&logo=mozilla&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

<br/>


</div>

---

##  Student Details

<div align="center">

|  Field |  Details |
|:----------|:-----------|
| **Name** | Stuti Gupta |
| **Registration** | 24BCY10141 |
| **University** | VIT Bhopal University |
| **Faculty** | Adarsh Patel |
| **Course** | Open Source Software (OSS NGMC) |
| **Submission** | March 2026 |

</div>

---

##  What Is This Project?

This capstone project is a deep-dive **open source audit** of **LibreOffice** — the free, community-driven office suite that was born when a group of developers refused to let Oracle swallow their work whole. The project covers:

- The **full origin story** of LibreOffice (OpenOffice → Oracle → community fork)
- **License analysis** — MPL 2.0 vs GPL vs MIT, what they mean in practice
- How LibreOffice **lives on a Linux system** — directories, permissions, updates
- Its **role in the FOSS ecosystem** — dependencies, governance, global impact
- A head-to-head **comparison with Microsoft Office**
- **Five original bash scripts** for Linux system administration

---

## 🔬 Chosen Software — LibreOffice

<div align="center">
<img src="https://img.shields.io/badge/LibreOffice-18A303?style=for-the-badge&logo=libreoffice&logoColor=white"/>
</div>

<br/>

LibreOffice is a full-featured, free, and open source office productivity suite maintained by **The Document Foundation**. It includes:

| App | Purpose |
|-----|---------|
| **Writer** | Word processor |
| **Calc** | Spreadsheets |
| **Impress** | Presentations |
| **Draw** | Vector graphics |
| **Base** | Databases |
| **Math** | Formula editor |

Licensed under **MPL 2.0** · Runs on Linux, Windows & macOS · Trusted by millions worldwide.

---

## 📁 Repository Structure

```
oss-audit-24BCY10141/
 ┣ README.md
 ┣ scripts/
 ┃ ┣  01_system_identity.sh       ← System snapshot report
 ┃ ┣  02_package_inspector.sh      ← Check if LibreOffice is installed
 ┃ ┣  03_disk_auditor.sh           ← Directory permissions & disk usage
 ┃ ┣  04_log_analyzer.sh           ← Keyword search through log files
 ┃ ┗  05_manifesto_generator.sh    ← Interactive personal manifesto
 ┗ report/
    ┗ OSS_Audit_Report_Stuti_Gupta.pdf
```

---

## 🛠️ Shell Scripts Breakdown

<details>
<summary><b> Script 1 — System Identity Report</b></summary>
<br/>

**File:** `01_system_identity.sh`

Collects live system information and prints a clean, formatted report — kernel version, current user, distro name, uptime, home directory, and timestamp. Think of it as the first thing a sysadmin runs on an unfamiliar machine.

**Concepts used:**
- Shell variables & command substitution `$(...)`
- `uname`, `whoami`, `uptime`, `lsb_release`, `date`
- Formatted `echo` output

```bash
./01_system_identity.sh
```

</details>

<details>
<summary><b> Script 2 — Package Inspector</b></summary>
<br/>

**File:** `02_package_inspector.sh`

Checks if LibreOffice is installed using `dpkg`. If found, it pulls the version and description. If not, it tells you exactly how to install it. Uses a `case` statement to print smart contextual messages per package.

**Concepts used:**
- `dpkg -l` and `dpkg -s` for package metadata
- `if-else` branching + `case` statements
- `grep -E` for regex field filtering
- `&>/dev/null` output suppression

```bash
./02_package_inspector.sh
```

</details>

<details>
<summary><b> Script 3 — Disk & Permission Auditor</b></summary>
<br/>

**File:** `03_disk_auditor.sh`

Loops through key Linux directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/usr/lib/libreoffice`) and reports permissions, ownership, size, and filesystem usage. Also specifically checks for LibreOffice's user config at `~/.config/libreoffice`.

**Concepts used:**
- Bash arrays + `for` loops
- `-d` directory existence test
- `ls -ld` piped through `awk` for field extraction
- `du -sh` + `cut`, `df -h` + `awk NR==2`

```bash
./03_disk_auditor.sh
```

</details>

<details>
<summary><b> Script 4 — Log File Analyzer</b></summary>
<br/>

**File:** `04_log_analyzer.sh`

Accepts a log file and an optional keyword (defaults to `"error"`). Reads line by line, counts how many times the keyword appears, and displays the last 5 matching lines. Handles missing or empty files gracefully with retry logic.

**Concepts used:**
- Positional parameters `$1`, `$2` with default `${2:-"error"}`
- `while IFS= read -r` for safe file reading
- `grep -iq` for case-insensitive matching
- Arithmetic expansion `$((COUNT + 1))`
- `tail -n 5` for recent matches

```bash
./04_log_analyzer.sh /var/log/syslog error
```

</details>

<details>
<summary><b> Script 5 — Open Source Manifesto Generator</b></summary>
<br/>

**File:** `05_manifesto_generator.sh`

An interactive script that asks you three questions about open source and weaves your answers into a personalized manifesto. Saves it as `manifesto_<username>.txt` and prints it immediately.

**Concepts used:**
- `read -p` for interactive terminal input
- String interpolation with user variables
- `date '+%d %B %Y'` for formatted timestamps
- Grouped output redirection `{ } > file`
- `cat` for display, `whoami` for personalization

```bash
./05_manifesto_generator.sh
```

</details>

---

## ⚙️ Requirements

```
OS      →  Linux (Ubuntu 22.04 LTS recommended) or Git Bash on Windows
Shell   →  bash 4.0+
Tools   →  dpkg · lsb_release · uname · whoami · uptime
           df · du · awk · cut · grep · tail · date
Optional → LibreOffice installed (for Scripts 2 & 3 full output)
```

---

## 🚀 Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/oss-audit-24BCY10141.git
cd oss-audit-24BCY10141/scripts

# 2. Make all scripts executable
chmod +x *.sh

# 3. Run them!
./01_system_identity.sh
./02_package_inspector.sh
./03_disk_auditor.sh
./04_log_analyzer.sh /var/log/syslog error
./05_manifesto_generator.sh
```

> 💡 **Tip:** On Windows, run these using **Git Bash** (MINGW64). All five scripts are tested and working on both Linux and Git Bash environments.

> 💡 **Tip:** For Script 4, if you don't have a syslog, try `/var/log/dpkg.log` — it always has content on Ubuntu/Debian.

---

## 💭 Personal Reflection

> When I started this project, LibreOffice was just "the free Word processor I had installed." By the end of it, I saw a piece of software with a genuinely fascinating history — a community refusing to surrender their tools to corporate uncertainty, a license designed to protect the commons, and a philosophy that says knowledge should be shared.
>
> Writing the shell scripts was humbling at first. But by Script 5, something had clicked. Piping `grep` into `awk` into `tail` felt less like writing code and more like asking a question in a language the machine actually understands.
>
> — *Stuti Gupta, 24BCY10141*

---

## 📜 License

The shell scripts in this repository are original work released under the **MIT License** for educational use.
LibreOffice itself is licensed under the **Mozilla Public License 2.0 (MPL 2.0)** by The Document Foundation.

---

<div align="center">


**Made by Stuti Gupta · VIT Bhopal University · March 2026**

![Visitors](https://img.shields.io/badge/Open%20Source-for%20the%20love%20of%20it-FF6B6B?style=flat-square&logo=opensourceinitiative&logoColor=white)

</div>
