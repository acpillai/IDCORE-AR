# IDCORE Annual Review Templates (LaTeX & Word)

This repository provides modern, minimalist **LaTeX** and **Microsoft Word** templates for Engineering Doctorate (EngD) Annual Review submissions for the **IDCORE** programme (EPSRC & NERC Industrial CDT for Offshore Renewable Energy).

All templates are designed in accordance with the official **IDCORE Supervision & Annual Review Guidance (May 2026)** and the official cover sheets.

---

## Key Template Features

- **2.0 cm Margins**: Applied strictly across all pages on A4 paper.
- **11pt Font Size**: Fully compliant with the minimum 11pt font examination requirement.
- **Minimalist Aesthetic**: Inspired by *The Martian Report*—clean sans-serif typography, crisp accent rules, and professional structure.
- **Official Cover Sheets**: Built-in automated cover pages with high-resolution IDCORE branding:
  - **Year 1**: *IDCORE Project Plan Review* (includes Research Ethics & Integrity assessment and dual Industrial Supervisor + Head of Research Institute sign-off).
  - **Years 2 & 3**: *IDCORE Annual Progress Review* (includes Industrial Supervisor approval).
- **Built-in Guidance Scaffolding**: Every section contains built-in callouts with the exact guidance, required questions, and strict page limits from the IDCORE Best Practice document.
- **Toggleable Guidance in LaTeX**: Easily hide all guidance callout boxes in the final submission PDF via the `hideguidance` class option.
- **Harvard Referencing**: Pre-configured author-year citation styles as required by IDCORE.

---

## Directory Structure

```
IDCORE-AR/
├── assets/
│   ├── idcore_logo.png               # Official IDCORE logo (high-res transparent PNG)
│   └── idcore_logo.pdf               # Vector/lossless PDF version of logo
├── latex/
│   ├── idcore-ar.cls                 # Minimalist LaTeX document class (year1/year2/year3 options)
│   ├── main.tex                      # Master LaTeX document with year switcher
│   ├── references.bib                # Sample Harvard-format BibTeX file
│   ├── templates/
│   │   ├── annual_review_year1.tex   # Year 1 template: Project Planning & TR&I Data Management
│   │   ├── annual_review_year2.tex   # Year 2 template: Progress Review, UK Net Zero, TR&I Assessment
│   │   └── annual_review_year3.tex   # Year 3 template: Progress Review, Draft Thesis Plan, TR&I Archival
│   └── README.md                     # LaTeX compilation and usage guide
├── word/
│   ├── IDCORE_Annual_Review_Year_1.docx # Complete Word template for Year 1
│   ├── IDCORE_Annual_Review_Year_2.docx # Complete Word template for Year 2
│   ├── IDCORE_Annual_Review_Year_3.docx # Complete Word template for Year 3
│   └── README.md                     # Word template documentation
├── ref/                              # Original reference materials
│   ├── Cover Sheet - Project Planning V2.doc
│   ├── Cover Sheet - Years 2 and 3 - V2.doc
│   └── IDCORE Supervision - Best Practice Document V4 (IDCORE 3).pdf
└── README.md
```

---

## Review Year Comparison & Section Requirements

| Section | Year 1: Project Planning | Year 2: Progress Review | Year 3: Progress & Thesis Plan |
| :--- | :--- | :--- | :--- |
| **Credits** | 10 research credits | 10 research credits | 10 research credits |
| **Report Title** | *IDCORE Project Plan Review* | *IDCORE Annual Progress Review* | *IDCORE Annual Progress Review* |
| **Cover Sheet** | Dual sign-off (Industry + HoRI) + Ethics check | Industrial Supervisor approval | Industrial Supervisor approval |
| **Literature Review** | 3 pages only | Updated (3 pages only) | Updated (3 pages max) |
| **Progress Summary** | *N/A (Start of project)* | 3 pages only | 3 pages only |
| **Project Plan** | 3 pages only (What/Why, How, Resources, Risks) | Updated (3 pages only; focus on Year 3) | Updated with **Draft Thesis Plan** (3 pages only) |
| **Impact Summary** | *Not required* | 1 page (**Contribution to UK Net Zero & Industry**) | 1 page (**Contribution to UK Net Zero & Industry**) |
| **References** | 1 page only (Harvard Style) | 1 page (Harvard Style) | 1 page (Harvard Style) |
| **Gantt Chart** | 1 page (Year 1 detail + $\ge 6$ mos write-up) | 1 page (6--12 mos detail + $\ge 6$ mos write-up) | 1 page (path to viva + $\ge 6$ mos write-up) |
| **Risk Assessment** | 5 key project risks | Updated risks | Updated risks |
| **Health & Safety** | Not restricted in length | Updated H&S | Updated H&S |
| **RRI / Ethics** | Full RRI report (+ Ethics form if needed) | *Addressed in Y1 & Y3; TR&I focus in Y2* | Updated RRI/Ethics (from Year 1) |
| **TR&I / Data Plan** | **TR&I & Data Management Plan** *(DMP, storage, backups, baseline IP)* | **TR&I & Data Security Assessment** *(1 page: Sponsor IP, hostile actors, conferences)* | **TR&I, Data Security & Archiving Plan** *(Thesis embargo/redaction, sponsor handover, archiving)* |

---

## Annual Review Process & Deadlines

1. **1st May**: Online Annual Review opens automatically on **EUCLID**.
2. **May -- August**: Complete document revisions with supervisory team. Obtain signature on Cover Sheet from Industrial Supervisor (and HoRI for Year 1).
3. **Mid-August**: Convene Review Meeting with all supervisors and the Independent Reviewer (IR).
4. **31st August**: Deadline to upload final document with cover sheet to EUCLID for formal supervisor recommendation and exam board endorsement.

---

## Copyright & Credits

- **Copyright**: © 2026 IDCORE (EPSRC & NERC Industrial CDT for Offshore Renewable Energy)
- **Class & Template Development**: Developed for IDCORE by **Ajit Pillai**
