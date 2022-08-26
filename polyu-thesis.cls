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
\ProvidesClass{polyu-thesis}[2022/08/26 PolyU thesis document class]

% Load book class as basis
\newif\ifinitial
\DeclareOption{initial}{\initialtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt]{book}

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
\RequirePackage{csquotes}
\RequirePackage{emptypage}
\RequirePackage{morewrites}
\RequirePackage{titling}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\usepackage{longtable}
\usepackage{multirow}
\RequirePackage[en-US]{datetime2}
% \RequirePackage{footnote}
% \RequirePackage[bottom]{footmisc}

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
\setCJKsansfont[%
    Path=fonts/NotoSerifTC/,%
    Extension=.otf,%
    UprightFont=*-Medium,%
]{NotoSerifTC}
\setCJKmonofont[%
    Path=fonts/NotoSerifTC/,%
    Extension=.otf,%
    UprightFont=*-Medium,%
]{NotoSerifTC}

% Spacing between lines
% The Hong Kong Polytechnic University imposes a space of 1.5 or 2
\RequirePackage[nodisplayskipstretch]{setspace}
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
\titleformat{\paragraph}[runin]{\normalfont\regularheader}{}{1pc}{\color{NavyBlue}#1}[\phantomsection]

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

% Enhanced support for graphics
% Note: graphicx must be imported before utils/mathematics.tex.
\RequirePackage[final]{graphicx}

% Mathematical expressions
\input{utils/mathematics}

% Set up SI units
\RequirePackage{siunitx}
\sisetup{%
    group-separator={,},%
}

% Index processing
\RequirePackage{imakeidx}
\newcommand{\tb}[1]{#1\kern.15em t}  % indicates a table
\newcommand{\fb}[1]{#1\kern.15em f}  % indicates a figure
\newcommand{\nb}[1]{#1\kern.15em n}  % indicates a footnote
\makeindex[intoc]

% Nomenclature processing
\RequirePackage[refpage,nocfg,intoc]{nomencl}
\setlength{\nomitemsep}{-\parsep}
\setlength{\nomlabelwidth}{0.12\textwidth}
\makenomenclature

% Cross-referencing and colorization
% Note: hyperref must be imported after utils/mathematics.tex and imakeidx
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
% Note: glossaries-extra must be imported after hyperref
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

% Environments for writing algorithms
\RequirePackage[%
    ruled,%
    algochapter,%
    lined,%
    longend,%
    linesnumbered,%
]{algorithm2e}
\SetKwInput{KwNote}{Note}
\newcommand{\algorithmfootnote}[2][\footnotesize]{%
    \let\old@algocf@finish\@algocf@finish
    \def\@algocf@finish{%
        \old@algocf@finish%
        \leavevmode\rlap{%
            \begin{minipage}{\linewidth}
                #1#2
            \end{minipage}%
        }%
    }%
}
\let\oldnl\nl
\newcommand{\nonl}{\renewcommand{\nl}{\let\nl\oldnl}}
% \renewenvironment{algorithm}[1][htbp]{\begin{algocf@algorithm}[#1]\begin{onehalfspace}}{\end{onehalfspace}\end{algocf@algorithm}}
\renewenvironment{algomathdisplay}{\begin{equation*}}{\@endalgocfline\end{equation*}\ifthenelse{\boolean{algocf@linesnumbered}}{\vspace{-\baselineskip}}{\relax}\;}
\newenvironment{algomathdisplaynumbered}{\begin{equation}}{\@endalgocfline\end{equation}\ifthenelse{\boolean{algocf@linesnumbered}}{\vspace{-\baselineskip}}{\relax}\;}
\newenvironment{algomathalign}[1]{\align #1}{\@endalgocfline\endalign\ifthenelse{\boolean{algocf@linesnumbered}}{\vspace{-\baselineskip}}{\relax}\;}
\newenvironment{algomathalign*}[1]{\start@align\@ne\st@rredtrue\m@ne #1}{\@endalgocfline\endalign\ifthenelse{\boolean{algocf@linesnumbered}}{\vspace{-\baselineskip}}{\relax}\;}
\newenvironment{algoempheq}[2][]{\empheq[#1]{#2}}{\@endalgocfline\endempheq\ifthenelse{\boolean{algocf@linesnumbered}}{\vspace{-\baselineskip}}{\relax}\;}
\renewcommand{\listofalgorithms}{%
    \chapter*{\listalgorithmcfname\markboth{\listalgorithmcfname}{\listalgorithmcfname}}%
    \addcontentsline{toc}{chapter}{\listalgorithmcfname}%
    \@starttoc{loa}%
}

% Automatic references
% Note: cleveref must be imported after hyperref and algorithm2e
\RequirePackage[noabbrev,capitalize]{cleveref}
\newcommand{\creflastconjunction}{, and\nobreakspace}
\crefname{equation}{}{}
\Crefname{equation}{}{}
\crefname{lstlisting}{Listing}{Listings}
\Crefname{lstlisting}{Listing}{Listings}

% Plots and graphs
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\pgfplotsset{%
    compat=1.18,%
}
\usetikzlibrary{arrows,calc,patterns,shapes}
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
        label style={font=\footnotesize},%
        legend cell align=left,%
        legend style={%
            rounded corners,%
            thick,%
            draw=black!15,%
            % fill opacity=0.8,%
            % draw opacity=1,%
            % text opacity=1,%
            font=\scriptsize,%
        },%
        tick label style={font=\footnotesize},%
    },%
}
\pgfkeys{/pgf/images/include external/.code=\includegraphics{#1}}
\tikzexternalize[%
    prefix=figures/,%
]
\tikzstyle{decision} = [diamond,draw,text width=2.5cm,text badly centered,inner sep=0pt]
\tikzstyle{block} = [rectangle,draw,text width=5.5cm,text centered,rounded corners,minimum height=1.5cm]
\tikzstyle{line} = [draw,-latex']

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
\if@todonotes@disabled
\else
\renewcommand{\listoftodos}[1][\@todonotes@todolistname]{%
    \chapter*{#1\markboth{#1}{#1}}%
    \addcontentsline{toc}{chapter}{#1}%
    \@starttoc{tdo}%
}
\fi

% Initial submission
% \ifinitial
%     \usepackage[%
%         firstpageonly,%
%         fontsize=0.06\paperwidth,%
%         text={INITIAL SUBMISSION FOR\\[0.5em] EXAMINATION PURPOSE},%
%         colorspec=0.88,%
%     ]{draftwatermark}
% \fi

% Bibliography information processing
\RequirePackage[%
    style=numeric-comp,%
    sorting=nyt,%
    sortcites=false,%
    maxbibnames=99,%
    backref,%
    backrefstyle=three,%
    abbreviate=false,%
]{biblatex}
\DefineBibliographyStrings{american}{%
    backrefpage={Cited on page},%
    backrefpages={Cited on pages},%
}
\defbibheading{bibintoc}[\bibname]{%
    \chapter*{#1\markboth{#1}{#1}}%
    \addcontentsline{toc}{chapter}{#1}%
}
\apptocmd{\sloppy}{\hbadness 10000\relax}{}{}
\appto{\bibsetup}{\sloppy}

% Customize listings environments
\usepackage[final]{listings}
\usepackage{lstautogobble}
\lstset{
    autogobble=true,
    basicstyle=\normalsize\ttfamily,
    belowcaptionskip=\bigskipamount,
    breakautoindent=true,
    breakatwhitespace=false,
    breaklines=true,
    commentstyle=\itshape\color{black!50},
    frame=tb,
    keywordstyle=\bfseries\color{Maroon},
    % numbers=left,
    % numberstyle=\scriptsize\bfseries,
    postbreak=\space,
    showstringspaces=false,
    stepnumber=1,
    stringstyle=\itshape,
    tabsize=4,
}
\lstnewenvironment{lstmatlab}[1][]{
    \lstset{
        language=matlab,
        % morekeywords={},
        #1,
    }
}{}
\lstnewenvironment{lstpython}[1][]{
    \lstset{
        language=python,
        % morekeywords={},
        #1,
    }
}{}

% Captions in floating environments
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup[figure]{position=below}
\captionsetup[table]{position=above}

% Repair contents and lists from the book class
\RequirePackage{etoolbox}
\patchcmd{\@chapter}{\addtocontents}{\addtocontents{lol}{\protect\addvspace{10\p@}}\addtocontents}{}{}
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
\renewcommand{\lstlistoflistings}{%
    \chapter*{\lstlistlistingname\markboth{\lstlistlistingname}{\lstlistlistingname}}%
    \addcontentsline{toc}{chapter}{\lstlistlistingname}%
    \@starttoc{lol}%
}

% Insert the text 'This page intentionally left blank' on blank pages
\renewcommand{\cleardoublepage}{%
    \clearpage%
    \if@twoside%
        \ifodd%
            \c@page%
        \else%
            \vspace*{5em}%
            \hfill%
            \begin{center}%
                \large\textit{This page intentionally left blank}%
            \end{center}%
            \vspace{\fill}%
            \thispagestyle{empty}%
            \newpage%
            \if@twocolumn%
                \hbox{}\newpage%
            \fi%
        \fi%
    \fi%
}

% Insert coverpage and titlepage
\renewcommand{\maketitle}{%
    \hypersetup{pageanchor=false}%
    \include{utils/coverpage}%
    \include{utils/typeset}%
    \include{utils/titlepage}%
    \hypersetup{pageanchor=true}%
}

% Insert document metadata
\AtBeginDocument{%
    \hypersetup{%
        pdftitle=\thetitle,%
        pdfauthor=\theauthor,%
        pdfsubject={Ph.D. thesis},%
        pdfkeywords={},%
    }%
}
