% ==================== accidents.cls ====================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{accidents}[2025/12/13 ACCIDENTS CORPORELS SIG - Quarto/XeLaTeX v2.0]

\LoadClass[10pt,a4paper,twocolumn]{article}

% ---- Packages essentiels ----
\RequirePackage{fontspec}
\PassOptionsToPackage{french,bidi=default}{babel}
\RequirePackage{babel}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{lettrine}
\RequirePackage{mdframed}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{ragged2e}
\RequirePackage{float}
\RequirePackage{placeins}
\RequirePackage{multicol}
\RequirePackage{fancyvrb}
\RequirePackage{listings}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{makecell}

% ---- Gestion des tableaux ----
\RequirePackage{etoolbox}
\RequirePackage{longtable}

% Ne forcer onecolumn que pour les TRÈS longs tableaux (>30 lignes)
% Les tableaux normaux restent en twocolumn

% ---- Gestion robuste des figures ----
\AtBeginEnvironment{figure}{\FloatBarrier}
\AtEndEnvironment{figure}{\FloatBarrier}
\AtBeginEnvironment{figure*}{\FloatBarrier}
\AtEndEnvironment{figure*}{\FloatBarrier}

% ---- Palette de couleurs thématique sécurité routière ----
\definecolor{RubineRed}{RGB}{231,76,60}
\definecolor{AccentBlue}{RGB}{52,152,219}
\definecolor{SafeGreen}{RGB}{46,204,113}
\definecolor{AlertOrange}{RGB}{243,156,18}
\definecolor{LightGray}{RGB}{245,245,245}
\definecolor{DarkGray}{RGB}{52,73,94}
\definecolor{CodeBg}{RGB}{250,250,250}
\definecolor{SectionBg}{RGB}{255,248,240}

% ---- Géométrie optimisée pour deux colonnes ----
\geometry{
  paper=a4paper,
  twocolumn,
  columnsep=0.85cm,
  textwidth=17.2cm,
  textheight=24.8cm,
  left=2.4cm,
  right=2.4cm,
  top=2.3cm,
  bottom=2.3cm,
  headheight=0pt,
  headsep=0pt,
  footskip=1.3cm
}

% ---- Polices professionnelles ----
\setmainfont{Latin Modern Roman}
\setsansfont{Latin Modern Sans}
\setmonofont[Scale=0.88]{Latin Modern Mono}

\renewcommand\normalsize{\fontsize{9.5}{13}\selectfont}
\renewcommand\small{\fontsize{8.5}{11.5}\selectfont}
\renewcommand\footnotesize{\fontsize{8}{10.5}\selectfont}
\normalsize

% ---- Configuration avancée des flottants ----
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.75}
\renewcommand{\textfraction}{0.12}
\renewcommand{\floatpagefraction}{0.80}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{6}
\setlength{\floatsep}{10pt plus 3pt minus 2pt}
\setlength{\textfloatsep}{12pt plus 4pt minus 3pt}
\setlength{\intextsep}{12pt plus 4pt minus 3pt}

% ---- Espacement des paragraphes ----
\setlength{\parskip}{0.35em plus 0.1em minus 0.05em}
\setlength{\parindent}{0em}

% ---- Formatage hiérarchique des sections ----
\titleformat{\section}
  {\sffamily\Large\bfseries\color{RubineRed}\raggedright}
  {}{0em}{}[\vspace{-0.3em}{\color{RubineRed}\titlerule[0.8pt]}]

\titleformat{\subsection}
  {\sffamily\large\bfseries\color{DarkGray}\raggedright}
  {}{0em}{}

\titleformat{\subsubsection}
  {\sffamily\normalsize\bfseries\itshape\color{DarkGray}\raggedright}
  {}{0em}{}

\titlespacing*{\section}{0pt}{12pt plus 3pt minus 2pt}{7pt plus 2pt minus 1pt}
\titlespacing*{\subsection}{0pt}{9pt plus 2pt minus 1pt}{5pt plus 1pt minus 1pt}
\titlespacing*{\subsubsection}{0pt}{7pt plus 1pt minus 1pt}{4pt plus 1pt minus 1pt}

\setcounter{secnumdepth}{-1}

% ---- Page de titre style rapport scientifique ----
\renewcommand{\maketitle}{%
  \twocolumn[{%
    \vspace*{0.3cm}
    \begin{mdframed}[
      backgroundcolor=SectionBg,
      linewidth=2pt,
      linecolor=RubineRed,
      innerleftmargin=15pt,
      innerrightmargin=15pt,
      innertopmargin=12pt,
      innerbottommargin=12pt,
      skipabove=0pt,
      skipbelow=15pt
    ]
    {\centering\sffamily\Huge\color{RubineRed}\bfseries\@title\par}
    \vspace{0.5cm}
    \ifx\@subtitle\undefined\else
      {\centering\sffamily\Large\color{DarkGray}\itshape\@subtitle\par}
      \vspace{0.4cm}
    \fi
    {\centering\large\sffamily\color{DarkGray}\@author\par}
    \vspace{0.25cm}
    {\centering\normalsize\sffamily\color{DarkGray}\@date\par}
    \end{mdframed}
    \vspace{0.5cm}
  }]%
}

% ---- Résumé type publication scientifique ----
\mdfdefinestyle{scientificabstract}{
  leftline=true,
  linewidth=4pt,
  linecolor=RubineRed,
  innerleftmargin=18pt,
  innerrightmargin=12pt,
  innertopmargin=12pt,
  innerbottommargin=12pt,
  skipabove=12pt,
  skipbelow=15pt,
  backgroundcolor=LightGray,
  roundcorner=2pt
}

\newenvironment{scientificresume}{%
  \begin{mdframed}[style=scientificabstract]%
  \lettrine[lines=3,loversize=0.18,nindent=0pt,findent=0.3em]{%
    \color{RubineRed}\sffamily\bfseries\Huge E%
  }{}%
  \justifying\small\noindent\ignorespaces
}{%
  \end{mdframed}%
}

\renewenvironment{abstract}{\begin{scientificresume}}{\end{scientificresume}}

% ---- Configuration professionnelle des blocs de code ----
\lstset{
  basicstyle=\ttfamily\scriptsize,
  backgroundcolor=\color{CodeBg},
  frame=leftline,
  framerule=2pt,
  rulecolor=\color{AccentBlue},
  framesep=5pt,
  breaklines=true,
  breakatwhitespace=true,
  columns=flexible,
  keepspaces=true,
  showstringspaces=false,
  numbers=none,
  xleftmargin=8pt,
  xrightmargin=5pt,
  aboveskip=7pt,
  belowskip=7pt,
  tabsize=2
}

% ---- Légendes améliorées ----
\captionsetup{
  font={small,sf},
  labelsep=period,
  justification=justified,
  singlelinecheck=false,
  skip=6pt,
  margin=5pt
}

\captionsetup[figure]{
  labelfont={bf,color=RubineRed},
  textfont={it,color=DarkGray},
  position=below
}

\captionsetup[table]{
  labelfont={bf,color=RubineRed},
  textfont={color=DarkGray},
  position=above
}

% ---- Environnement pour blocs R avec style cohérent ----
\newenvironment{Rcode}{%
  \par\vspace{6pt}\noindent%
  \begin{mdframed}[
    backgroundcolor=CodeBg,
    linewidth=0pt,
    leftline=true,
    linecolor=AccentBlue,
    linewidth=2pt,
    innerleftmargin=8pt,
    innerrightmargin=6pt,
    innertopmargin=5pt,
    innerbottommargin=5pt,
    skipabove=6pt,
    skipbelow=6pt
  ]%
  \small\ttfamily\raggedright%
}{%
  \end{mdframed}%
  \par\vspace{4pt}%
}

% ---- Tableaux professionnels ----
\renewcommand{\arraystretch}{1.15}
\setlength{\tabcolsep}{6pt}

% ---- Hyperlinks ----
\hypersetup{
  colorlinks=true,
  linkcolor=RubineRed,
  citecolor=AccentBlue,
  urlcolor=AccentBlue,
  unicode,
  pdfborder={0 0 0},
  pdftitle={Accidents corporels France 2023},
  pdfauthor={Analyse SIG},
  pdfsubject={Sécurité routière}
}

% ---- Commandes personnalisées enrichies ----
\newcommand{\source}[1]{%
  \par\vspace{3pt}%
  {\footnotesize\sffamily\textit{Source :} #1}%
}

\newcommand{\champ}[1]{%
  \par\vspace{2pt}%
  {\footnotesize\sffamily\textit{Champ :} #1}%
}

\newcommand{\lecture}[1]{%
  \par\vspace{2pt}%
  {\footnotesize\sffamily\textit{Lecture :} #1}%
}

\newcommand{\note}[1]{%
  \par\vspace{2pt}%
  {\footnotesize\sffamily\textit{Note :} #1}%
}

% ---- Environnement encadré pour points clés ----
\newenvironment{keypoints}{%
  \par\vspace{5pt}%
  \begin{mdframed}[
    backgroundcolor=SectionBg,
    linewidth=1pt,
    linecolor=AlertOrange,
    innerleftmargin=10pt,
    innerrightmargin=10pt,
    innertopmargin=8pt,
    innerbottommargin=8pt,
    skipabove=8pt,
    skipbelow=8pt,
    roundcorner=3pt
  ]%
  \small\sffamily%
}{%
  \end{mdframed}%
  \par\vspace{5pt}%
}

% ---- Empêcher veuves, orphelines et lignes isolées ----
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\brokenpenalty=10000

% ---- Améliorer la justification et césure ----
\tolerance=1500
\emergencystretch=3em
\hyphenpenalty=800
\exhyphenpenalty=200
\doublehyphendemerits=10000
\finalhyphendemerits=5000

% ---- Éviter débordements horizontaux ----
\sloppy

\endinput