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
  {\thesection}{1em}{}[\vspace{1pt}\color{idcoreblue}\rule{\linewidth}{1.2pt}]

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
  \title{IDCORE Project Plan Review}
\else
  \title{IDCORE Annual Progress Review}
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
% Header & Footer Style (Martian Report Inspired)
% -----------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{idcoreblue!60!black}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrule}{\hbox to\headwidth{\color{idcoregray!40!white}\leaders\hrule height \footrulewidth\hfill}}

\fancyhead[L]{\footnotesize\color{idcoregray}\textbf{\@title}}
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
