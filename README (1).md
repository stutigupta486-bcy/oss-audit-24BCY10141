<div align="center">

# The Open Source Audit
### LibreOffice — OSS Capstone Project

![Course](https://img.shields.io/badge/Course-Open%20Source%20Software-6C63FF?style=for-the-badge&logo=bookstack&logoColor=white)
![University](https://img.shields.io/badge/VIT%20Bhopal-University-48CAE4?style=for-the-badge&logo=mortarboard&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![License](https://img.shields.io/badge/License-MPL%202.0-FF6B6B?style=for-the-badge&logo=mozilla&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

<br/>

*"The tools we rely on every day deserve to be understood — not just used."*

</div>

---

## Student Details

<div align="center">

| Field | Details |
|:------|:--------|
| **Name** | Stuti Gupta |
| **Registration** | 24BCY10141 |
| **University** | VIT Bhopal University |
| **Faculty** | Adarsh Patel |
| **Course** | Open Source Software (OSS NGMC) |
| **Submission** | March 2026 |

</div>

---

## About This Project

This capstone project is a comprehensive open source audit of **LibreOffice** — the free, community-driven office suite born when developers refused to let Oracle's acquisition erase years of shared work. The audit covers:

- The **full origin story** of LibreOffice (OpenOffice → Oracle → community fork)
- **License analysis** — MPL 2.0 vs GPL vs MIT, what they mean in practice
- How LibreOffice **integrates with a Linux system** — directories, permissions, updates
- Its **role in the FOSS ecosystem** — dependencies, governance, global impact
- A head-to-head **comparison with Microsoft Office**
- **Five original bash shell scripts** for Linux system administration

---

## Chosen Software — LibreOffice

<div align="center">

![LibreOffice](https://img.shields.io/badge/LibreOffice-18A303?style=for-the-badge&logo=libreoffice&logoColor=white)

</div>

<br/>

LibreOffice is a full-featured, free, and open source office productivity suite maintained by **The Document Foundation**. Licensed under **MPL 2.0** and available natively on Linux, Windows, and macOS.

| Application | Purpose |
|:------------|:--------|
| **Writer** | Word processor |
| **Calc** | Spreadsheets |
| **Impress** | Presentations |
| **Draw** | Vector graphics |
| **Base** | Databases |
| **Math** | Formula editor |

---

## Repository Structure

```
oss-audit-24BCY10141/
 ├── README.md
 ├── scripts/
 │   ├── 01_system_identity.sh        ← System snapshot report
 │   ├── 02_package_inspector.sh      ← Check if LibreOffice is installed
 │   ├── 03_disk_auditor.sh           ← Directory permissions & disk usage
 │   ├── 04_log_analyzer.sh           ← Keyword search through log files
 │   └── 05_manifesto_generator.sh    ← Interactive personal manifesto
 └── report/
     └── OSS_Audit_Report_Stuti_Gupta.pdf
```

---

## Shell Scripts

<details>
<summary><b>Script 1 — System Identity Report</b></summary>
<br/>

**File:** `01_system_identity.sh`

Collects live system information and prints a clean formatted report — kernel version, current user, distro name, uptime, home directory, and timestamp. Designed as a first-contact audit tool that gives an immediate snapshot of any Linux environment.

**Concepts used:**
- Shell variables and command substitution `$(...)`
- `uname`, `whoami`, `uptime`, `lsb_release`, `date`
- Formatted `echo` output with separator lines

```bash
./01_system_identity.sh
```

</details>

<details>
<summary><b>Script 2 — Package Inspector</b></summary>
<br/>

**File:** `02_package_inspector.sh`

Checks whether LibreOffice is installed using `dpkg`. If found, it retrieves the version and description. If not, it provides the exact install command. A `case` statement prints context-aware messages for different packages.

**Concepts used:**
- `dpkg -l` and `dpkg -s` for package metadata
- `if-else` branching and `case` statements
- `grep -E` for regex field filtering
- `&>/dev/null` for clean output suppression

```bash
./02_package_inspector.sh
```

</details>

<details>
<summary><b>Script 3 — Disk & Permission Auditor</b></summary>
<br/>

**File:** `03_disk_auditor.sh`

Loops through key Linux directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/usr/lib/libreoffice`) and reports permissions, ownership, size, and filesystem usage. Also checks for LibreOffice's user config at `~/.config/libreoffice`.

**Concepts used:**
- Bash arrays and `for` loops
- `-d` directory existence test
- `ls -ld` piped through `awk` for targeted field extraction
- `du -sh` with `cut`, `df -h` with `awk NR==2`

```bash
./03_disk_auditor.sh
```

</details>

<details>
<summary><b>Script 4 — Log File Analyzer</b></summary>
<br/>

**File:** `04_log_analyzer.sh`

Accepts a log file path and an optional keyword (defaults to `"error"`). Reads the file line by line, counts keyword occurrences, and displays the last 5 matching lines. Handles missing or empty files with retry logic and clear messages.

**Concepts used:**
- Positional parameters `$1`, `$2` with default `${2:-"error"}`
- `while IFS= read -r` for safe line-by-line reading
- `grep -iq` for case-insensitive matching
- Arithmetic expansion `$((COUNT + 1))`
- `tail -n 5` to surface the most recent matches

```bash
./04_log_analyzer.sh /var/log/syslog error
```

</details>

<details>
<summary><b>Script 5 — Open Source Manifesto Generator</b></summary>
<br/>

**File:** `05_manifesto_generator.sh`

An interactive script that prompts three questions about open source and weaves the answers into a personalized manifesto paragraph. Saves the output as `manifesto_<username>.txt` and prints it to the terminal immediately.

**Concepts used:**
- `read -p` for interactive terminal input
- String interpolation with user-provided variables
- `date '+%d %B %Y'` for formatted timestamps
- Grouped output redirection `{ } > file`
- `cat` for display, `whoami` for filename personalization

```bash
./05_manifesto_generator.sh
```

</details>

---

## Requirements

```
OS      →  Linux (Ubuntu 22.04 LTS recommended) or Git Bash on Windows
Shell   →  bash 4.0+
Tools   →  dpkg · lsb_release · uname · whoami · uptime
           df · du · awk · cut · grep · tail · date
Optional → LibreOffice installed (for Scripts 2 & 3 full output)
```

---

## Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/oss-audit-24BCY10141.git
cd oss-audit-24BCY10141/scripts

# 2. Make all scripts executable
chmod +x *.sh

# 3. Run them
./01_system_identity.sh
./02_package_inspector.sh
./03_disk_auditor.sh
./04_log_analyzer.sh /var/log/syslog error
./05_manifesto_generator.sh
```

> **Note:** On Windows, run these using Git Bash (MINGW64). All five scripts are tested and working on both Linux and Git Bash.

> **Note:** For Script 4, if `/var/log/syslog` is unavailable, `/var/log/dpkg.log` works well as a test file.

---

## Personal Reflection

> When I started this project, LibreOffice was just the free word processor I had installed. By the end, I saw something far more interesting — a community that refused to surrender its work to corporate uncertainty, a license carefully designed to protect the commons, and a philosophy that treats knowledge as something to be shared rather than sold.
>
> Writing the shell scripts was humbling at first. But by the fifth one, something had clicked. Chaining `grep` into `awk` into `tail` stopped feeling like code and started feeling like asking the system a question in its own language.
>
> — *Stuti Gupta, 24BCY10141*

---

## License

Shell scripts in this repository are original work by **Stuti Gupta (24BCY10141)**, released under the **MIT License** for educational use.
LibreOffice itself is licensed under the **Mozilla Public License 2.0** by The Document Foundation.

---

<div align="center">

**Stuti Gupta · 24BCY10141 · VIT Bhopal University · March 2026**

![Made with](https://img.shields.io/badge/Made%20with-Bash%20%26%20curiosity-6C63FF?style=flat-square&logo=gnubash&logoColor=white)
![Open Source](https://img.shields.io/badge/Open%20Source-for%20the%20love%20of%20it-48CAE4?style=flat-square&logo=opensourceinitiative&logoColor=white)

</div>
