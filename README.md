# oss-audit-24BCY10141

## The Open Source Audit — Capstone Project

**Course:** Open Source Software (OSS NGMC)  
**University:** VIT Bhopal University  
**Faculty:** Adarsh Patel  

---

## Student Details

| Field | Details |
|-------|---------|
| **Student Name** | Stuti Gupta |
| **Registration Number** | 24BCY10141 |
| **University** | VIT Bhopal University |
| **Faculty** | Adarsh Patel |
| **Course** | Open Source Software |
| **Submission Date** | March 2026 |

---

## Chosen Software: LibreOffice

LibreOffice is a free and open source office productivity suite developed and maintained by **The Document Foundation**. It includes Writer (word processor), Calc (spreadsheets), Impress (presentations), Draw (vector graphics), Base (databases), and Math (formula editor). It is licensed under the **Mozilla Public License 2.0 (MPL 2.0)** and runs natively on Linux, Windows, and macOS.

---

## Project Description

This capstone project is a comprehensive open source audit of LibreOffice. The audit covers the software's origin story — from its roots as OpenOffice.org under Sun Microsystems, through Oracle's acquisition, to the community-driven fork that became LibreOffice — and examines the philosophy behind free and open source software in depth.

The project includes four major components:
- A full written research report covering LibreOffice's history, Linux integration, FOSS ecosystem role, and a comparison with Microsoft Office
- Five practical bash shell scripts demonstrating Linux system administration and scripting concepts
- This GitHub repository organizing all deliverables
- A project description for the submission form

The goal of this project was not just to fulfill an academic requirement but to genuinely understand *why* open source software matters — as a licensing model, as a philosophy, and as a practical alternative for millions of users worldwide.

---

## Repository Structure

```
oss-audit-24BCY10141/
├── README.md                        # This file
├── scripts/
│   ├── 01_system_identity.sh        # System Identity Report
│   ├── 02_package_inspector.sh      # Package Inspector
│   ├── 03_disk_auditor.sh           # Disk and Permission Auditor
│   ├── 04_log_analyzer.sh           # Log File Analyzer
│   └── 05_manifesto_generator.sh    # Open Source Manifesto Generator
└── report/
    └── OSS_Audit_Report_Stuti_Gupta.pdf
```

---

## Shell Scripts — Overview

### Script 1: System Identity Report (`01_system_identity.sh`)
Collects and displays key information about the host Linux system — kernel version, current user, distribution name, uptime, home directory, and date/time. Uses command substitution (`$(...)`) to gather live system data and formats the output neatly. Designed as a first-contact audit tool that gives an immediate snapshot of the environment.

**Key concepts:** Shell variables, command substitution, `uname`, `whoami`, `uptime`, `lsb_release`

---

### Script 2: Package Inspector (`02_package_inspector.sh`)
Checks whether LibreOffice is installed on the system using `dpkg`. If installed, it retrieves the version and description. If not, it informs the user and provides the install command. Uses a `case` statement to print a tailored contextual message for the detected package.

**Key concepts:** `dpkg -l` and `dpkg -s`, `if-else` branching, `case` statements, `grep -E` for field filtering, output redirection with `&>/dev/null`

---

### Script 3: Disk and Permission Auditor (`03_disk_auditor.sh`)
Loops over a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/usr/lib/libreoffice`) and reports the permissions, owner, directory size, and filesystem disk usage for each. Also checks whether LibreOffice's user configuration directory (`~/.config/libreoffice`) exists.

**Key concepts:** Bash arrays, `for` loops, `-d` directory test, `ls -ld`, `awk` for field extraction, `du -sh`, `df -h`, `cut`

---

### Script 4: Log File Analyzer (`04_log_analyzer.sh`)
Accepts a log file path and an optional keyword (defaults to `"error"`) as command-line arguments. Reads the file line by line, counts keyword occurrences, and displays the last five matching lines. Handles missing or empty files with clear error messages.

**Key concepts:** Positional parameters (`$1`, `$2`), default values with `${2:-"default"}`, `while IFS= read -r`, `grep -iq` for case-insensitive search, arithmetic expansion, `tail -n`

---

### Script 5: Manifesto Generator (`05_manifesto_generator.sh`)
An interactive script that prompts the user to answer three short questions about open source. It combines the answers into a personalized manifesto paragraph, saves it to a `.txt` file named after the current user, and prints it to the terminal.

**Key concepts:** `read -p` for interactive input, string interpolation, `date` formatting, grouped output redirection with `{ } > file`, `cat` for display, `whoami` for personalization

---

## Requirements

- Operating System: **Linux** (Ubuntu 22.04 LTS recommended; works on any Debian-based distro)
- Shell: **bash** (version 4.0 or higher)
- Tools used: `dpkg`, `lsb_release`, `uname`, `whoami`, `uptime`, `df`, `du`, `awk`, `cut`, `grep`, `tail`, `date`
- LibreOffice installed (for Scripts 2 and 3 to give full output): `sudo apt install libreoffice`

---

## How to Run the Scripts

### Step 1 — Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/oss-audit-24BCY10141.git
cd oss-audit-24BCY10141/scripts
```

### Step 2 — Make scripts executable

```bash
chmod +x *.sh
```

### Step 3 — Run each script

```bash
# Script 1: System Identity Report
./01_system_identity.sh

# Script 2: Package Inspector
./02_package_inspector.sh

# Script 3: Disk and Permission Auditor
./03_disk_auditor.sh

# Script 4: Log File Analyzer (pass log file path and optional keyword)
./04_log_analyzer.sh /var/log/syslog error

# Script 5: Manifesto Generator (interactive)
./05_manifesto_generator.sh
```

> **Note:** Script 3 uses `du -sh` on system directories like `/var/log`. If you encounter permission errors for some subdirectories, this is expected — the script handles them gracefully using `2>/dev/null`.

> **Note:** For Script 4, you can use any readable log file. On a system without LibreOffice logs, `/var/log/syslog` or `/var/log/dpkg.log` work well for testing.

---

## Personal Reflection

Starting this project, I thought of LibreOffice as just a budget substitute for Microsoft Word. Finishing it, I see a piece of software with a genuinely fascinating story — one about a community refusing to let corporate acquisition erase years of shared work, and about the practical power of copyleft licensing to protect the commons.

The shell scripting portion taught me that Linux tools are not complicated individually. What makes them powerful is how they connect. Chaining `grep`, `awk`, `cut`, and `tail` together to answer specific questions felt like solving puzzles, and by the fifth script, it felt genuinely natural.

I chose LibreOffice because I use it, and I believe the tools we rely on every day deserve to be understood — not just used.

---

## License

All shell scripts in this repository are original work by **Stuti Gupta (24BCY10141)** and are released under the **MIT License** for educational use.

---

*VIT Bhopal University | Open Source Software — Capstone Project | March 2026*
