%% polyu-thesis.cls
%% Copyright 2021-2022 Tom M. Ragonneau
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Tom M. Ragonneau.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyu-thesis}[2022/03/31 PolyU thesis document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

% General packages
\RequirePackage[%
    a4paper,%
    includemp,%
    top=33.48mm,%
    left=25.20mm,%
    right=4.80mm,%
    bottom=33.48mm,%
    marginparwidth=30mm,%
    marginparsep=3mm,%
    footskip=15mm,%
]{geometry}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[american]{babel}
\RequirePackage[final]{graphicx}
\RequirePackage{csquotes}
\RequirePackage{emptypage}
\RequirePackage{morewrites}

% Latin and Chinese fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\newfontfamily{\regularheader}[%
    Path=fonts/Roboto/,%
    Extension=.ttf,%
    UprightFont=*-Regular,%
    BoldFont=*-Bold,%
    ItalicFont=*-Italic,%
    BoldItalicFont=*-BoldItalic,%
]{Roboto}
\setmainfont{TeX Gyre Pagella}
\setCJKmainfont[%
    Path=fonts/NotoSerifTC/,%
    Extension=.otf,%
    UprightFont=*-Medium,%
    BoldFont=*-Bold,%
]{NotoSerifTC}
\setCJKmonofont[%
    Path=fonts/NotoSerifTC/,%
    Extension=.otf,%
    UprightFont=*-Medium,%
]{NotoSerifTC}

% Spacing between lines
% The Hong Kong Polytechnic University imposes a space of 1.5 or 2
\RequirePackage{setspace}
\onehalfspacing

% Page headers and footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\newcommand{\textmark}[2]{\textbf{#1}\quad\color{NavyBlue}#2}
\renewcommand*{\chaptermark}[1]{\markboth{\textmark{\chaptername\ \thechapter}{#1}}{}}
\renewcommand*{\sectionmark}[1]{\markright{\textmark{\thesection}{#1}}}
\fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyfootoffset[OR]{1.85cm}%
    \fancyfoot[OR]{\ \regularheader{\color{NavyBlue}\rule[-18.48mm]{1.25pt}{21.98mm}}\hspace*{10pt}\begin{minipage}[b]{1.5cm}\normalsize\textbf{\thepage}\end{minipage}}%
    \fancyfootoffset[EL]{1.85cm}%
    \fancyfoot[EL]{\regularheader\begin{minipage}[b]{1.5cm}\raggedleft\normalsize\textbf{\thepage}\end{minipage}\hspace*{10pt}{\color{NavyBlue}\rule[-18.48mm]{1.25pt}{21.98mm}}}%
}
\fancypagestyle{main}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyfootoffset[OR]{1.85cm}%
    \fancyfoot[OR]{\ \regularheader\footnotesize\rightmark\hspace*{1pc}{\color{NavyBlue}\rule[-18.48mm]{1.25pt}{21.98mm}}\hspace*{10pt}\begin{minipage}[b]{1.5cm}\normalsize\textbf{\thepage}\end{minipage}}%
    \fancyfootoffset[EL]{1.85cm}%
    \fancyfoot[EL]{\regularheader\footnotesize\begin{minipage}[b]{1.5cm}\raggedleft\normalsize\textbf{\thepage}\end{minipage}\hspace*{10pt}{\color{NavyBlue}\rule[-18.48mm]{1.25pt}{21.98mm}}\hspace*{1pc}\leftmark}%
}
\pagestyle{main}

% Titles and sectioning
\RequirePackage[explicit]{titlesec}
\titleformat{\chapter}[display]{\normalfont\regularheader}{\raggedleft\vspace{-\dimexpr\baselineskip+33.48mm\relax}\color{NavyBlue}\rule[-2mm]{2pt}{45.48mm}\quad\fontsize{60}{60}\selectfont\thechapter}{-12mm}{\parbox[t]{\dimexpr\textwidth-35mm\relax}{\raggedright\huge#1}}[\phantomsection]
\titlespacing*{\chapter}{0pt}{0pt}{3em}
\titleformat{\section}{\normalfont\regularheader\Large}{\thesection}{1pc}{\color{NavyBlue}#1}[\phantomsection]
\titleformat{\subsection}{\normalfont\regularheader\large}{\thesubsection}{1pc}{\color{NavyBlue}#1}[\phantomsection]

% Customize list environments
\RequirePackage{enumitem}
\setitemize{%
    topsep=\parsep,%
    itemsep=0pt,%
}
\setenumerate{%
    topsep=\parsep,%
    itemsep=0pt,%
}

% Mathematical expressions
\input{utils/mathematics}

% Cross-referencing and colorization
% Note: hyperref must be imported after utils/mathematics.tex
\RequirePackage[final]{hyperref}
\RequirePackage{url}
\hypersetup{%
    colorlinks=true,%
    linkcolor=OliveGreen,%
    anchorcolor=black,%
    citecolor=DarkOrchid,%
    filecolor=black,%
    menucolor=black,%
    runcolor=black,%
    urlcolor=black,%
    linktoc=page,%
}

% Terms and acronyms processing
\RequirePackage[%
    acronym,%
    nopostdot=false,%
    nogroupskip,%
    indexonlyfirst,%
]{glossaries-extra}
\setabbreviationstyle[acronym]{long-short}
\setglossarystyle{alttree}
\glssetcategoryattribute{\acronymtype}{glossdesc}{firstuc}
\renewcommand*{\glsfirstlongdefaultfont}[1]{\emph{#1}}
\glsxtrinsertinsidetrue
\glsdisablehyper
\makeglossaries
\loadglsentries{utils/glossary}

% Index processing
\RequirePackage{makeidx}
\RequirePackage[columns=2,totoc]{idxlayout}
\newcommand{\tb}[1]{#1\kern.15em t}  % indicates a table
\newcommand{\fb}[1]{#1\kern.15em f}  % indicates a figure
\newcommand{\nb}[1]{#1\kern.15em n}  % indicates a footnote
\makeindex

% Nomenclature processing
\RequirePackage[refpage,nocfg,intoc]{nomencl}
\setlength{\nomitemsep}{-\parsep}
\setlength{\nomlabelwidth}{0.08\textwidth}
\makenomenclature

% Environments for writing algorithms
\RequirePackage[%
    ruled,%
    algochapter,%
    lined,%
    longend,%
    linesnumbered,%
]{algorithm2e}
\renewenvironment{algomathdisplay}{\begin{equation*}}{\@endalgocfline\end{equation*}\ifthenelse{\boolean{algocf@linesnumbered}}{\vspace{-\baselineskip}}{\relax}\;}

% Automatic references
% Note: cleveref must be imported after hyperref and algorithm2e
\RequirePackage[noabbrev]{cleveref}
\crefname{equation}{}{}
\Crefname{equation}{}{}

% Enhanced support for graphics
% Note: graphicx has already been imported to avoid option's conflicts
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\pgfplotsset{compat=1.18}
\usetikzlibrary{calc,patterns}
\usepgfplotslibrary{external}
\pgfplotscreateplotcyclelist{profiles}{%
    thick,mark=none,NavyBlue,solid\\%
    thick,mark=none,BurntOrange,dashed\\%
    thick,mark=none,OliveGreen,dotted\\%
    thick,mark=none,BrickRed,dashdotted\\%
    thick,mark=none,Purple,densely dashed\\%
    thick,mark=none,Mahogan,densely dashed\\%
    thick,mark=none,Rhodamine,densely dashdotted\\%
    thick,mark=none,Gray,loosely dashed\\%
    thick,mark=none,LimeGreen,loosely dotted\\%
    thick,mark=none,JungleGreen,loosely dashdotted\\%
}
\pgfplotsset{%
    every axis/.append style={%
        label style={font=\small},%
        legend cell align=left,%
        legend style={rounded corners,thick,draw=black!15,font=\small},%
        tick label style={font=\small},%
    },%
}
\pgfkeys{/pgf/images/include external/.code=\includegraphics{#1}}
\tikzexternalize[%
    prefix=figures/,%
]

% Drafting packages
\RequirePackage{ifdraft}
\RequirePackage[%
    obeyDraft,%
    english,%
    colorinlistoftodos,%
    color=Apricot,%
    textsize=scriptsize,%
]{todonotes}
\renewcommand{\todo}[2][]{\tikzexternaldisable\@todo[#1]{#2}\tikzexternalenable}

% Bibliography information processing
\RequirePackage[%
    style=numeric-comp,%
    sorting=nyt,%
    sortcites,%
    backref,%
    backrefstyle=three,%
]{biblatex}
\DefineBibliographyStrings{american}{%
    backrefpage={Cited on p.},%
    backrefpages={Cited on pp.},%
}
\defbibheading{bibintoc}[\bibname]{%
    \chapter*{#1\markboth{#1}{#1}}%
    \addcontentsline{toc}{chapter}{#1}%
}
\appto{\bibsetup}{\sloppy}

% Repair contents and lists from the book class and the algorithm2e package
\renewcommand{\tableofcontents}{%
    \chapter*{\contentsname\markboth{\contentsname}{\contentsname}}%
    \addcontentsline{toc}{chapter}{\contentsname}%
    \@starttoc{toc}%
}
\renewcommand{\listoffigures}{%
    \chapter*{\listfigurename\markboth{\listfigurename}{\listfigurename}}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
    \@starttoc{lof}%
}
\renewcommand{\listoftables}{%
    \chapter*{\listtablename\markboth{\listtablename}{\listtablename}}%
    \addcontentsline{toc}{chapter}{\listtablename}%
    \@starttoc{lot}%
}
\renewcommand{\listofalgorithms}{%
    \chapter*{\listalgorithmcfname\markboth{\listalgorithmcfname}{\listalgorithmcfname}}%
    \addcontentsline{toc}{chapter}{\listalgorithmcfname}%
    \@starttoc{loa}%
}
