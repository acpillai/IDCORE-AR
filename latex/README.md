# IDCORE Annual Review --- LaTeX Template

This folder contains the official, minimalist LaTeX document class (`idcore-ar.cls`) and report templates for IDCORE Engineering Doctorate (EngD) Annual Review submissions.

The design is inspired by **The Martian Report**, featuring clean sans-serif typography, crisp accent rules, 2cm margins on all sides, 11pt font, and automated cover pages matching IDCORE supervisory regulations.

---

## Quick Start

### 1. Structure
```
latex/
├── idcore-ar.cls                # Document class file
├── main.tex                     # Universal master document
├── references.bib               # Sample Harvard-format bibliography
├── templates/
│   ├── annual_review_year1.tex  # Complete Year 1 template (Project Planning & TR&I Data Management)
│   ├── annual_review_year2.tex  # Complete Year 2 template (Progress Review, UK Net Zero, TR&I Assessment)
│   └── annual_review_year3.tex  # Complete Year 3 template (Progress Review, Draft Thesis Plan, TR&I Archival)
└── README.md
```

### 2. Selecting the Review Year
Specify the review year in the `\documentclass` options:

```latex
% For Year 1 (Project Plan Review):
\documentclass[year1]{idcore-ar}

% For Year 2 (Annual Progress Review):
\documentclass[year2]{idcore-ar}

% For Year 3 (Annual Progress Review & Thesis Plan):
\documentclass[year3]{idcore-ar}
```

The class automatically selects:
- The appropriate document title (*IDCORE Project Plan Review* for Year 1; *IDCORE Annual Progress Review* for Years 2 and 3).
- The correct cover page structure (including the Research Ethics & Integrity assessment and the dual Industrial Supervisor + Head of Research Institute confirmation for Year 1; Industrial Supervisor approval for Years 2/3).

### 3. Managing Document Control (Multiple Revision Lines)
You can include as many revision rows as needed using the `\addrevision{version}{date}{amendment}` command. By default, the templates provide:
```latex
\clearrevisions
\addrevision{1.0}{15/07/2026}{Sent to supervisors for review}
\addrevision{2.0}{20/08/2026}{Updated following review discussion}
```
To append another version (e.g., version 2.1 or 3.0), simply add another line:
```latex
\addrevision{2.1}{28/08/2026}{Minor corrections before final upload}
```

### 4. Centralised Guidance Engine & Toggling Guidance
Official guidance and regulations from the *IDCORE Supervision Best Practice Document* are centralised directly inside `idcore-ar.cls`. Templates call `\printguidance{<section-key>}` (or shorthand aliases), which automatically adapt the guidance text, requirements, and page budgets based on the chosen review year (`year1`, `year2`, or `year3`):

```latex
\section{Updated Literature Review}
\printguidance{literature-review}   % Automatically shows Y1, Y2, or Y3 guidance!
```

#### Available Guidance Keys and Shorthands:
- `literature-review` (or `\guidancelitreview`)
- `progress-summary` (or `\guidanceprogress`)
- `project-plan` (or `\guidanceprojectplan`)
- `impact-summary` (or `\guidanceimpact`)
- `references` (or `\guidancereferences`)
- `gantt-chart` (or `\guidancegantt`)
- `risk-assessment` (or `\guidancerisks`)
- `health-and-safety` (or `\guidancehs`)
- `rri` (or `\guidancerri`)
- `tri` (or `data-security`, `data-plan`, `\guidancetri`)

When you are ready to produce your final, clean PDF for submission to EUCLID, you can suppress all guidance callout boxes globally with the `hideguidance` class option:

```latex
\documentclass[year1, hideguidance]{idcore-ar}
```


---

## Copyright & Credits
- **Document Class**: `idcore-ar.cls`
- **Copyright**: © 2026 IDCORE (EPSRC & NERC Industrial CDT for Offshore Renewable Energy)
- **Developer Credit**: Developed for IDCORE by Ajit Pillai

---

## Compiling Your Report

### Local Compilation (PDFLaTeX)
From the `latex/` directory:
```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Or for a specific year template:
```bash
cd templates
pdflatex annual_review_year1.tex
bibtex annual_review_year1
pdflatex annual_review_year1.tex
pdflatex annual_review_year1.tex
```

### Overleaf
1. Create a **New Project** $\rightarrow$ **Upload Project**.
2. Upload the `latex/` folder contents along with `assets/idcore_logo.png`.
3. Set `main.tex` (or the relevant template in `templates/`) as the main document.
4. Compile with **pdfLaTeX**.

---

## Year-by-Year Requirements Summary

| Section | Year 1 (Project Planning) | Year 2 (Progress Review) | Year 3 (Thesis Plan Phase) |
| :--- | :--- | :--- | :--- |
| **Cover Sheet** | Dual sign-off (Industry + HoRI) + Ethics check | Industrial Supervisor approval | Industrial Supervisor approval |
| **Literature Review** | 3 pages max | Updated (3 pages max) | Updated (3 pages max) |
| **Progress Summary** | *N/A (Start of project)* | 3 pages max | 3 pages max |
| **Project Plan** | 3 pages max (Aims, Objectives, Resources, Risks) | Updated (3 pages max, focus on next year) | Updated with **Draft Thesis Plan** (3 pages max) |
| **Impact Summary** | *N/A* | 1 page (**Contribution to UK Net Zero & Industry**) | 1 page (**Contribution to UK Net Zero & Industry**) |
| **References** | 1 page (Harvard style) | 1 page (Harvard style) | 1 page (Harvard style) |
| **Gantt Chart** | 1 page (Year 1 detail, $\ge 6$ mos write-up) | 1 page ($\ge 6$ mos write-up) | 1 page (path to viva, $\ge 6$ mos write-up) |
| **Risk Assessment** | 5 key risks | Updated risks | Updated risks |
| **Health & Safety** | Not restricted in length | Updated | Updated |
| **RRI / Ethics** | Full RRI report (+ Ethics form if needed) | *Addressed in Y1 & Y3; TR&I focus in Y2* | Updated RRI/Ethics (from Year 1) |
| **TR&I / Data Plan** | **TR&I & Data Management Plan** *(DMP, storage, backups, baseline IP)* | **TR&I & Data Security Assessment** *(1 page: Sponsor IP, hostile actors, conferences)* | **TR&I, Data Security & Archiving Plan** *(Thesis embargo/redaction, sponsor handover, archiving)* |
