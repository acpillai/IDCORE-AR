%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% idcore-ar.cls
%
% LaTeX Document Class for IDCORE Annual Review Reports
% (Year 1: Project Plan Review; Years 2 & 3: Annual Progress Review)
%
% Copyright (c) 2026 IDCORE (EPSRC & NERC CDT for Offshore Renewable Energy)
% Developed for IDCORE by Ajit Pillai
%
% Inspired by The Martian Report aesthetic:
% - Clean modern sans-serif typography
% - Exact 2cm margins on all sides
% - Crisp headers, footers, and rule styling
% - Official cover page matching IDCORE supervisory requirements
% - Built-in toggleable guidance callout boxes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idcore-ar}[2026/10/12 v1.0 IDCORE Annual Review Document Class by Ajit Pillai (c) 2026 IDCORE]

% -----------------------------------------------------------------------------
% Class Options
% -----------------------------------------------------------------------------
\newif\if@yearone    \@yearonetrue
\newif\if@yeartwo    \@yeartwofalse
\newif\if@yearthree  \@yearthreefalse
\newif\if@hideguidance \@hideguidancefalse

\def\idcore@year{1}

\DeclareOption{year1}{%
  \@yearonetrue \@yeartwofalse \@yearthreefalse
  \def\idcore@year{1}%
}
\DeclareOption{year2}{%
  \@yearonefalse \@yeartwotrue \@yearthreefalse
  \def\idcore@year{2}%
}
\DeclareOption{year3}{%
  \@yearonefalse \@yeartwofalse \@yearthreetrue
  \def\idcore@year{3}%
}

% Allow key-value style year=1, year=2, year=3 via basic options
\DeclareOption{year=1}{\ExecuteOptions{year1}}
\DeclareOption{year=2}{\ExecuteOptions{year2}}
\DeclareOption{year=3}{\ExecuteOptions{year3}}

\DeclareOption{hideguidance}{\@hideguidancetrue}

% Pass any remaining options to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load base class: 11pt, A4 paper
\LoadClass[11pt, a4paper]{article}

% -----------------------------------------------------------------------------
% Required Packages
% -----------------------------------------------------------------------------
% 2cm margins on all sides as specified by user
\RequirePackage[a4paper, margin=2cm]{geometry}

\RequirePackage{graphicx}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage{titlesec}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage[round, sort, comma, authoryear]{natbib}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\RequirePackage[hidelinks]{hyperref}

% -----------------------------------------------------------------------------
% Typography & Colors (The Martian Report Aesthetic)
% -----------------------------------------------------------------------------
\renewcommand{\sfdefault}{phv}          % Helvetica / Arial clone
\renewcommand{\familydefault}{\sfdefault} % Modern sans-serif body text

% Define IDCORE Brand Colors
\definecolor{idcoreblue}{RGB}{29, 79, 145}      % Deep Marine Blue
\definecolor{idcorecyan}{RGB}{0, 163, 224}      % Cyan Accent
\definecolor{idcoregray}{RGB}{90, 95, 105}      % Slate Gray
\definecolor{idcorelight}{RGB}{245, 247, 250}   % Background tint
\definecolor{tableborder}{RGB}{191, 191, 191}   % Border gray matching Word doc

% Section headings styling
\titleformat{\section}
  {\normalfont\Large\bfseries\color{idcoreblue}}
  {\thesection}{1em}{}[\vspace{-16pt}\color{idcoreblue}\rule{\linewidth}{1.2pt}]

\titleformat{\subsection}
  {\normalfont\large\bfseries\color{idcoreblue!90!black}}
  {\thesubsection}{0.8em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\color{idcoregray}}
  {\thesubsubsection}{0.6em}{}

% -----------------------------------------------------------------------------
% Metadata Commands
% -----------------------------------------------------------------------------
\def\@studentnumber{~}
\def\@projecttitle{~}
\def\@leadsupervisor{~}
\def\@cosupervisorone{~}
\def\@cosupervisortwo{~}
\def\@independentreviewer{~}
\def\@industrialsupervisor{~}
\def\@company{~}
\def\@logopath{../assets/idcore_logo.png}

% Year 1 Ethics metadata
\def\@ethicsrequired{No}
\def\@ethicsattached{No}

% Document Control
\def\@docversion{1.0}
\def\@docdate{\today}
\def\@docamendment{Initial draft}

% Signatures & Approvals
\def\@studentsignature{~}
\def\@signaturedate{\today}
\def\@industrialsupervisorsignature{~}
\def\@industrialsupervisordate{~}
\def\@horiname{Prof Alasdair McDonald}
\def\@horisignature{~}
\def\@horidate{~}

\newcommand{\studentnumber}[1]{\def\@studentnumber{#1}}
\newcommand{\projecttitle}[1]{\def\@projecttitle{#1}}
\newcommand{\leadsupervisor}[1]{\def\@leadsupervisor{#1}}
\newcommand{\cosupervisorone}[1]{\def\@cosupervisorone{#1}}
\newcommand{\cosupervisortwo}[1]{\def\@cosupervisortwo{#1}}
\newcommand{\independentreviewer}[1]{\def\@independentreviewer{#1}}
\newcommand{\industrialsupervisor}[1]{\def\@industrialsupervisor{#1}}
\newcommand{\company}[1]{\def\@company{#1}}
\newcommand{\logopath}[1]{\def\@logopath{#1}}

\newcommand{\ethicsrequired}[1]{\def\@ethicsrequired{#1}}
\newcommand{\ethicsattached}[1]{\def\@ethicsattached{#1}}

\newcommand{\docversion}[1]{\def\@docversion{#1}}
\newcommand{\docdate}[1]{\def\@docdate{#1}}
\newcommand{\docamendment}[1]{\def\@docamendment{#1}}

\newcommand{\studentsignature}[1]{\def\@studentsignature{#1}}
\newcommand{\signaturedate}[1]{\def\@signaturedate{#1}}
\newcommand{\industrialsupervisorsignature}[1]{\def\@industrialsupervisorsignature{#1}}
\newcommand{\industrialsupervisordate}[1]{\def\@industrialsupervisordate{#1}}
\newcommand{\horiname}[1]{\def\@horiname{#1}}
\newcommand{\horisignature}[1]{\def\@horisignature{#1}}
\newcommand{\horidate}[1]{\def\@horidate{#1}}

% Command to manage multiple document control revision lines
\def\idcore@revisions{%
  1.0 & \today & Sent to supervisors for review \\\hline
  2.0 & \today & Updated following review discussion \\\hline
}
\newcommand{\clearrevisions}{\gdef\idcore@revisions{}}
\newcommand{\addrevision}[3]{%
  \g@addto@macro\idcore@revisions{%
    #1 & #2 & #3 \\\hline
  }%
}

% Default titles based on year
\if@yearone
  \title{IDCORE \\Project Plan Review}
\else
  \title{IDCORE \\Annual Progress Review}
\fi

% -----------------------------------------------------------------------------
% Guidance Callout Environment
% -----------------------------------------------------------------------------
\if@hideguidance
  \NewDocumentEnvironment{guidance}{o +b}{}{}
\else
  \newtcolorbox{guidance}[1][]{
    enhanced,
    breakable,
    colback=idcorelight,
    colframe=idcoreblue,
    coltitle=white,
    fonttitle=\bfseries\sffamily\small,
    title={IDCORE Guidance \& Requirements \ifstrempty{#1}{}{(#1)}},
    boxrule=0.8pt,
    leftrule=4pt,
    arc=1.5mm,
    top=6pt, bottom=6pt, left=8pt, right=8pt,
    before skip=10pt,
    after skip=12pt,
    fontupper=\small\sffamily\color{black!85}
  }
\fi

\newcommand{\hideguidance}{\@hideguidancetrue}

% -----------------------------------------------------------------------------
% Centralised Year-Aware Guidance Engine
% -----------------------------------------------------------------------------
\newcommand{\printguidance}[1]{%
  \if@hideguidance\relax\else
    \csname idcore@guidance@#1\endcsname
  \fi
}

% 1. Literature Review
\newcommand{\idcore@guidance@litreview}{%
  \if@yearone
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Critical review of current literature and state of the art.\\
      \textbf{Guidance Points:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Write for a technical, but non-specialist reader.
        \item Establish where current knowledge ends and where your research question begins.
        \item Synthesise existing academic and industrial methodologies, highlighting limitations and research gaps that your EngD project will address.
        \item Maintain consistent Harvard referencing throughout (e.g., author-date format).
      \end{itemize}
    \end{guidance}
  \else\if@yeartwo
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Update your literature review based on developments in the field and refinement of your research scope.\\
      \textbf{Guidance Points:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Integrate new papers published over the past year.
        \item Focus more specifically on the narrowed technical domain of your current experimental or numerical work.
        \item Maintain consistent Harvard referencing throughout.
      \end{itemize}
    \end{guidance}
  \else
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Final update of the research context and literature synthesis before thesis drafting.\\
      \textbf{Guidance Points:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Present a mature critical synthesis of the state of the art.
        \item Clearly position your project's novel contribution to knowledge within this literature.
        \item Maintain consistent Harvard referencing throughout.
      \end{itemize}
    \end{guidance}
  \fi\fi
}
\expandafter\def\csname idcore@guidance@literature-review\endcsname{\idcore@guidance@litreview}

% 2. Progress Summary (Years 2 & 3)
\newcommand{\idcore@guidance@progress}{%
  \if@yeartwo
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Provide a detailed technical summary of what has been achieved during Year 2.\\
      \textbf{Guidance Points:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Outline experimental campaigns conducted (facilities used, test setups, data collected).
        \item Report on numerical simulation or analytical models created and validated.
        \item Highlight conference presentations given (1 funded conference per year), draft papers, and industrial deliverables.
        \item Discuss obstacles encountered and how they were overcome.
      \end{itemize}
    \end{guidance}
  \else\if@yearthree
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Comprehensive summary of research achievements to date across Years 1--3.\\
      \textbf{Guidance Points:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Detail completed experimental campaigns, data analysis, and numerical validations.
        \item List outputs: conference presentations (mandatory to present in Years 2+), peer-reviewed publications, technical reports, and software/experimental artifacts delivered to the sponsor.
        \item Summarise how the research questions defined in Year 1 have been answered.
      \end{itemize}
    \end{guidance}
  \fi\fi
}
\expandafter\def\csname idcore@guidance@progress-summary\endcsname{\idcore@guidance@progress}

% 3. Project Plan
\newcommand{\idcore@guidance@projectplan}{%
  \if@yearone
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Define your research strategy for the remaining 3 years of the EngD.\\
      \textbf{Key Areas to Cover:}
      \begin{enumerate}\setlength{\itemsep}{1pt}
        \item \textbf{What do you plan to do and why?} Anticipated contribution to knowledge, novelty, deliverables (kit, code, or theory), alignment with UK Net Zero targets, and clear statement of overall Aims.
        \item \textbf{How will you achieve this?} Specific stages and precise list of measurable objectives.
        \item \textbf{What resources are required?} Lab facilities (e.g., FloWave, FastBlade), HPC access, equipment, data sets, software licences, travel funds, external partner reliance.
        \item \textbf{Risks to successful completion:} Realistic evaluation of dependencies, unexpected experimental results, delays in data or materials, and mitigation alternatives.
      \end{enumerate}
    \end{guidance}
  \else\if@yeartwo
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Detail the plan of future work, with primary focus on the upcoming year (Year 3).\\
      \textbf{Guidance Points:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Set out concrete stages and measurable objectives for the next 12 months.
        \item Detail remaining testing, computational simulations, or field trials required.
        \item Confirm availability of required facilities and resources.
      \end{itemize}
    \end{guidance}
  \else
    \begin{guidance}[Page Limit: 3 pages only | Minimum 11pt font]
      \textbf{Purpose:} Plan the final phase of research and establish an agreed thesis structure and review roadmap.\\
      \textbf{Key Requirements from IDCORE Guidance:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item \textbf{Thesis Format:} An EngD thesis may follow a traditional monograph format or a \textbf{portfolio format} (covering more than one area of industrial investigation with a connecting philosophy).
        \item \textbf{Narrative \& Chapters:} Outline the proposed chapter structure, estimated word counts, and completion timeline.
        \item \textbf{Confidentiality \& Embargo:} Address how commercial data will be handled (non-dimensionalising variables, redacting sensitive sections, or requesting an embargo of up to 5 years).
        \item \textbf{Supervisory Review Schedule:} Agree on a chapter-by-chapter review workflow with supervisors (allowing up to 3 weeks for critical review).
        \item \textbf{Notice of Intention to Submit:} Diarise submission of NITS to Edinburgh College SharePoint approx.\ 2 months prior to thesis submission.
      \end{itemize}
    \end{guidance}
  \fi\fi
}
\expandafter\def\csname idcore@guidance@project-plan\endcsname{\idcore@guidance@projectplan}

% 4. Impact Summary
\newcommand{\idcore@guidance@impact}{%
  \begin{guidance}[Page Limit: 1 page only]
    \textbf{Purpose:} Detail the industrial, academic, and societal impact of the research and progress towards UK Net Zero targets.\\
    \textbf{Guidance Points:}
    \begin{itemize}\setlength{\itemsep}{1pt}
      \item Articulate commercial, technological, and environmental benefits to your sponsor company and the UK offshore renewable energy sector.
      \item Quantify progress towards \textbf{UK Net Zero targets} (e.g., accelerated offshore wind/marine energy deployment, levelised cost of energy [LCOE] reduction, carbon abatement, grid integration, and supply chain competitiveness across the UK).
      \item Impact assessment toolkits and research frameworks (e.g., UKRI Net Zero pathways, carbon accounting tools, and research impact toolkits) can be used to help quantify these contributions.
    \end{itemize}
  \end{guidance}
}
\expandafter\def\csname idcore@guidance@impact-summary\endcsname{\idcore@guidance@impact}

% 5. References
\newcommand{\idcore@guidance@references}{%
  \begin{guidance}[Page Limit: 1 page only]
    All IDCORE students must use the \textbf{Harvard Referencing Style} (author-date format).
    Ensure consistent formatting throughout your written work all the way through to your final EngD thesis.
  \end{guidance}
}

% 6. Gantt Chart
\newcommand{\idcore@guidance@gantt}{%
  \begin{guidance}[Page Limit: 1 page only]
    \textbf{Requirements:}
    \begin{itemize}\setlength{\itemsep}{1pt}
      \item Show \if@yearthree final phase and roadmap to thesis submission and viva examination \else upcoming 6--12 months \fi in reasonable detail.
      \item All research work and thesis writing must be achievable within the prescribed period of study.
      \item \textbf{Mandatory Requirement:} Your plans must include an explicit allocation of time for writing up your thesis/portfolio --- \textbf{ideally at least 6 months}.
    \end{itemize}
  \end{guidance}
}
\expandafter\def\csname idcore@guidance@gantt-chart\endcsname{\idcore@guidance@gantt}

% 7. Risk Assessment
\newcommand{\idcore@guidance@risks}{%
  \if@yearone
    \begin{guidance}[Requirement: 5 key project risks]
      Identify and evaluate the \textbf{5 key risks} to successfully completing your research project within the prescribed 3-year research window, detailing clear avoidance and mitigation plans for each.
    \end{guidance}
  \else
    \begin{guidance}[Requirement: Updated Project Risk Assessment]
      Provide an updated evaluation of project risks reflecting the current stage of your research, remaining technical obstacles, and schedule dependencies.
    \end{guidance}
  \fi
}
\expandafter\def\csname idcore@guidance@risk-assessment\endcsname{\idcore@guidance@risks}

% 8. Health & Safety
\newcommand{\idcore@guidance@hs}{%
  \begin{guidance}[Length: Not restricted in length]
    Detail all relevant Health \& Safety considerations for your project:
    \begin{itemize}\setlength{\itemsep}{1pt}
      \item Company-specific workplace, lab, and offshore site visit policies.
      \item Laboratory or test tank testing protocols (electrical safety, high pressure, heavy lifting, flume operations).
      \item Lone working and fieldwork risk assessments.
    \end{itemize}
  \end{guidance}
}
\expandafter\def\csname idcore@guidance@health-and-safety\endcsname{\idcore@guidance@hs}

% 9. RRI & Ethics
\newcommand{\idcore@guidance@rri}{%
  \if@yearone
    \begin{guidance}[Length: Not restricted in length]
      The RRI report reflects on the broader societal, environmental, ethical, and economic implications of your research.\\
      \textbf{Key Guidance:}
      \begin{itemize}\setlength{\itemsep}{1pt}
        \item Address the AREA framework: \textbf{Anticipate} outcomes, \textbf{Reflect} on motivations and assumptions, \textbf{Engage} with stakeholders and industry, and \textbf{Act} accordingly.
        \item If the RRI or Project Plan indicate ethical issues with your research, you \textbf{must} complete an additional Research Ethics and Integrity form (see Cover Sheet and School requirements at \url{http://www.eng.ed.ac.uk/research/ethics/}).
      \end{itemize}
    \end{guidance}
  \else
    \begin{guidance}[Requirement: Updated from end of Year 1]
      Provide an updated Responsible Research and Innovation (RRI) and Ethics assessment reflecting your full project findings, stakeholder engagement, and environmental/social implications.
    \end{guidance}
  \fi
}

% 10. TR&I / Data Security / Data Management Plan
\newcommand{\idcore@guidance@tri}{%
  \if@yearone
    \begin{guidance}[Requirement: Initial Data & Security Governance | Lighter Touch]
      The IDCORE Industrial Advisory Board (IAB) requires all research engineers to establish strong data governance, IP protection, and research security protocols from project kick-off.\\
      \textbf{Key Planning Areas:}
      \begin{enumerate}\setlength{\itemsep}{1pt}
        \item \textbf{Data Management Plan (DMP):} Types and estimated volumes of data (experimental, sensor logs, numerical simulations, CAD models); file formats; backup redundancy and storage location (company secure drives, university cloud).
        \item \textbf{Sponsor Intellectual Property (IP) Baseline:} Agreed treatment of background IP, ownership of anticipated foreground IP, non-disclosure agreements (NDAs), and boundaries of commercial confidentiality.
        \item \textbf{Trusted Research Screening:} Initial screening under UK Government / NPSA Trusted Research principles (\url{https://www.npsa.gov.uk/specialised-guidance/trusted-research}) regarding international collaborations, sensitive software, or external data sharing.
      \end{enumerate}
    \end{guidance}
  \else\if@yeartwo
    \begin{guidance}[Page Limit: 1 page only | Trusted Research Protocols]
      \textbf{Context:} For Year 2, this provides a comprehensive assessment under the UK Government / NPSA \emph{Trusted Research and Innovation (TR\&I)} protocols (\url{https://www.npsa.gov.uk/specialised-guidance/trusted-research}).\\
      Address the following core questions:
      \begin{enumerate}\setlength{\itemsep}{2pt}
        \item \textbf{Sponsor IP Policies:} A broad description of and reflection on your sponsor company's policies and procedures for securing and managing IP.
        \item \textbf{Project IP \& Data Protection:} Describe the concrete actions you are taking in your project to protect IP and research data from both being leaked to industrial competitors and from attacks and/or theft by hostile actors.
        \item \textbf{International Conferences \& Travel Security:} Describe what protocols you would or will use if or when attending an international conference (e.g., clean travel devices, VPNs, public Wi-Fi precautions, pre-presentation IP clearance).
        \item \textbf{Data Management Health Check:} Brief update on project data storage, version control, and backup verification.
      \end{enumerate}
    \end{guidance}
  \else
    \begin{guidance}[Requirement: Final Phase TR&I, Handover & Archival | Lighter Touch]
      The IDCORE Industrial Advisory Board (IAB) requires all completing research engineers to establish clear IP protection for thesis submission, formal sponsor clearance, and research data archiving.\\
      \textbf{Key Focus Areas:}
      \begin{enumerate}\setlength{\itemsep}{1pt}
        \item \textbf{Thesis Confidentiality \& IP Protection:} Strategy for protecting sensitive company data within the thesis (e.g., non-dimensionalising variables, redaction of specific chapters/appendices, or requesting a formal University/British Library embargo of up to 5 years).
        \item \textbf{Sponsor IP Clearance Protocols:} Timeline for providing thesis and paper drafts to the industrial supervisor and company line management for review and written sign-off prior to formal submission.
        \item \textbf{Data Handover \& Long-Term Archiving:} Protocols for handing over clean models, code repositories, simulation databases, and experimental raw data to the sponsor company, alongside deposit of non-confidential data in university open repositories in compliance with funder open research mandates.
      \end{enumerate}
    \end{guidance}
  \fi\fi
}
\expandafter\def\csname idcore@guidance@data-security\endcsname{\idcore@guidance@tri}
\expandafter\def\csname idcore@guidance@data-plan\endcsname{\idcore@guidance@tri}

% Convenience Shorthand Aliases
\newcommand{\guidancelitreview}{\printguidance{litreview}}
\newcommand{\guidanceprogress}{\printguidance{progress}}
\newcommand{\guidanceprojectplan}{\printguidance{projectplan}}
\newcommand{\guidanceimpact}{\printguidance{impact}}
\newcommand{\guidancereferences}{\printguidance{references}}
\newcommand{\guidancegantt}{\printguidance{gantt}}
\newcommand{\guidancerisks}{\printguidance{risks}}
\newcommand{\guidancehs}{\printguidance{hs}}
\newcommand{\guidancerri}{\printguidance{rri}}
\newcommand{\guidancetri}{\printguidance{tri}}

% -----------------------------------------------------------------------------
% Header & Footer Style (Martian Report Inspired)
% -----------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{idcoreblue!60!black}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrule}{\hbox to\headwidth{\color{idcoregray!40!white}\leaders\hrule height \footrulewidth\hfill}}

\fancyhead[L]{\footnotesize\color{idcoregray}\textbf{{\let\\=\space\@title}}}
\fancyhead[R]{\footnotesize\color{idcoregray}\@author\ (\@studentnumber)}

\fancyfoot[L]{\footnotesize\color{idcoregray}IDCORE EngD --- Year \idcore@year}
\fancyfoot[C]{}
\fancyfoot[R]{\footnotesize\color{idcoreblue}\textbf{Page \thepage}}

% -----------------------------------------------------------------------------
% Cover Page Generation (\makecoverpage)
% -----------------------------------------------------------------------------
\newcommand{\makecoverpage}{%
  \thispagestyle{empty}
  \begin{titlepage}
    \vspace*{-1cm}
    % Header block with logo
    \begin{minipage}[c]{0.55\textwidth}
      {\fontsize{18pt}{22pt}\selectfont\bfseries\color{idcoreblue}\@title\par}
      \vspace{2mm}
      {\small\color{idcoregray}Engineering Doctorate (EngD) Programme\par}
    \end{minipage}%
    \hfill
    \begin{minipage}[c]{0.42\textwidth}
      \raggedleft
      \IfFileExists{\@logopath}{%
        \includegraphics[width=0.95\linewidth]{\@logopath}%
      }{%
        \fbox{\parbox[c][1.5cm][c]{0.9\linewidth}{\centering\bfseries\color{idcoreblue} IDCORE Logo}}%
      }
    \end{minipage}

    \vspace{4mm}

    % Metadata Table
    \setlength{\tabcolsep}{6pt}
    \renewcommand{\arraystretch}{1.25}
    \begin{tabularx}{\linewidth}{|>{\bfseries\small}p{4.2cm}|>{\small}X|}
      \hline
      Author & \@author \\ \hline
      Student Number & \@studentnumber \\ \hline
      Title of Project & \@projecttitle \\ \hline
      Supervisor (Lead) & \@leadsupervisor \\ \hline
      Supervisor & \@cosupervisorone \\ \hline
      Supervisor & \@cosupervisortwo \\ \hline
      Independent Reviewer & \@independentreviewer \\ \hline
      Industrial Supervisor / Company & \@industrialsupervisor\ (\@company) \\ \hline
    \end{tabularx}

    \vspace{3mm}

    % Year 1 Specific: Research Ethics & Integrity Box
    \if@yearone
      \begin{tabularx}{\linewidth}{|X|}
        \hline
        \textbf{\small Research Ethics and Integrity}\\[1pt]
        \footnotesize Ethical issues must be assessed and identified and all students must read and follow the School requirements described at \href{http://www.eng.ed.ac.uk/research/ethics/}{\color{idcoreblue}\texttt{http://www.eng.ed.ac.uk/research/ethics/}}. If you answer yes to any of the ethical concerns identified on this web page, a Research Ethics \& Integrity Form must be completed and attached to this plan. \\ \hline
      \end{tabularx}
      \vspace{-1pt}
      \begin{tabularx}{\linewidth}{|>{\small}X|>{\small\centering\arraybackslash}p{2.5cm}|}
        \hline
        Research Ethics \& Integrity assessment is required. & \textbf{\@ethicsrequired} \\ \hline
        Research Ethics \& Integrity form is attached. & \textbf{\@ethicsattached} \\ \hline
      \end{tabularx}
      \vspace{3mm}
    \fi

    % Document Control Table
    \begin{tabularx}{\linewidth}{|>{\bfseries\small}X|}
      \hline
      Document Control \\ \hline
    \end{tabularx}
    \vspace{-1pt}
    \begin{tabularx}{\linewidth}{|>{\small}p{2.2cm}|>{\small}p{2.5cm}|>{\small}X|}
      \hline
      \textbf{Version} & \textbf{Date} & \textbf{Amendment} \\ \hline
      \ifx\idcore@revisions\@empty
        \@docversion & \@docdate & \@docamendment \\\hline
      \else
        \idcore@revisions
      \fi
    \end{tabularx}

    \vspace{3mm}

    % Signatures and Approval Block
    \if@yearone
      % Year 1 Signatures
      \begin{tabularx}{\linewidth}{|>{\bfseries\small}p{3.8cm}|>{\small}X|>{\bfseries\small}p{1.5cm}|>{\small}p{3.2cm}|}
        \hline
        Student Signature: & \@studentsignature & Date: & \@signaturedate \\ \hline
      \end{tabularx}

      \vspace{3mm}

      \begin{tabularx}{\linewidth}{|X|}
        \hline
        \textbf{\small Industrial Supervisor and Head of Research Institute Confirmation}\\[2pt]
        \footnotesize By signing below, we confirm that we have reviewed the plan and:
        \begin{itemize}\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
          \item believe that the research plan is achievable within the prescribed period of study (3 years for a full-time EngD);
          \item the resources required for the project (including any collaboration with industrial partners) are available and have been agreed with the student.
        \end{itemize}
        \\ \hline
      \end{tabularx}
      \vspace{-1pt}
      \begin{tabularx}{\linewidth}{|>{\bfseries\small}p{3.8cm}|>{\small}X|>{\bfseries\small}p{1.5cm}|>{\small}p{3.2cm}|}
        \hline
        \multicolumn{4}{|l|}{\textbf{\small Industrial Supervisor}} \\ \hline
        Name: \@industrialsupervisor & Signature: \@industrialsupervisorsignature & Date: & \@industrialsupervisordate \\ \hline
        \multicolumn{4}{|l|}{\textbf{\small Head of Research Institute}} \\ \hline
        Name: \@horiname & Signature: \@horisignature & Date: & \@horidate \\ \hline
      \end{tabularx}

    \else
      % Years 2 and 3 Signatures
      \begin{tabularx}{\linewidth}{|>{\bfseries\small}p{3.8cm}|>{\small}X|>{\bfseries\small}p{1.5cm}|>{\small}p{3.2cm}|}
        \hline
        Author Signature: & \@studentsignature & Date: & \@signaturedate \\ \hline
      \end{tabularx}

      \vspace{3mm}

      \begin{tabularx}{\linewidth}{|X|}
        \hline
        \textbf{\small Industrial Supervisor Approval} \\ \hline
      \end{tabularx}
      \vspace{-1pt}
      \begin{tabularx}{\linewidth}{|>{\small}X|>{\small}X|>{\small}p{3.2cm}|}
        \hline
        \textbf{Name:} \@industrialsupervisor & \textbf{Signature:} \@industrialsupervisorsignature & \textbf{Date:} \@industrialsupervisordate \\ \hline
      \end{tabularx}
    \fi

  \end{titlepage}
  \newpage
  \setcounter{page}{1}
}

\endinput
