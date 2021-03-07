% luH495.cls, created from thesis.w (1.0)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{luH495}[2020/02/01 v1.0 Thesis APA for Liberty University Honors Program]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[letterpaper,oneside,12pt]{article}

% Times New Roman Fonts
% If Windows:
% \usepackage{mathspec}
% \setallmainfonts{Times New Roman}
%
% Else:
% \RequirePackage{newtxtext}
% \RequirePackage{newtxmath}

% Set Header for Table of Contents
\renewcommand{\contentsname}{}

% Double and single spacing
\linespread{2}
\newcommand{\LUHsinglespacing}{\baselineskip = 0.5\baselineskip}
\newcommand{\LUHdoublespacing}{\baselineskip = 2\baselineskip}

% APA suggests that lines not be justified
\raggedright

% Set up page spacing and margins
\setlength{\topmargin}{0in}
% \setlength{\topskip}{0in} % Specifically warned in classes.dtx not to set to zero

\setlength{\headsep}{0.2in}

\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}

\setlength{\textwidth}{6.5in}

\setlength{\textheight}{9in}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}

\setlength{\parindent}{0.5in}

% Make footnote font size the same as everything else
\let\oldfootnotesize=\footnotesize
\let\footnotesize=\normalsize

% Add \shorttitle command
\newcommand{\shorttitle}[1]{\global\def\LUHshorttitle{\MakeUppercase{#1}}}

% Add \Fall and \Spring commands
\newcommand{\Spring}{\global\def\LUHsemester{Spring}\let\Spring\relax\let\Fall\relax}
\newcommand{\Fall}{\global\def\LUHsemester{Fall}\let\Spring\relax\let\Fall\relax}

% Add a \Year command
\def\LUHyear{\number\year}
\newcommand{\Year}[1]{\global\def\LUHyear{20#1}}

% Add \Chair command
\newcommand{\Chair}[1]{\global\def\LUHchair{#1}}

% Add \Keywords command
\newcommand{\Keywords}[1]{\global\def\LUHkeywords{#1}}

% Add \FirstReader command
\newcommand{\FirstReader}[1]{\global\def\LUHfirstreader{#1}}

% Add \SecondReader command
%\newcommand{\SecondReader}[1]{\global\def\LUHsecondreader{#1}}

% Add \HonorsDirector and \HonorsAssistantDirector commands
\newcommand{\HonorsDirector}{\global\def\LUHprof{Jim Nutter, Ph.D.\\Honors Director}}
\newcommand{\HonorsAssistantDirector}[1]{\global\def\LUHprof{#1\\Assistant Honors Director}}

% Set header for the document
\pagestyle{headings}
\renewcommand{\@oddhead}{\LUHshorttitle\hss\thepage}

% Add optional subtitle (that is, the second line of a two-line title).
\newcommand{\subtitle}[1]{\global\def\LUHsubtitle{#1}}

% Add a \firstpage macro that accounts for the title and subtitle
\newcommand{\firstpage}{%
\ifx\LUHsubtitle\undefined
\noindent\makebox[\hsize]{\hss\strut\textbf{\@title}\hss}
\else
    \noindent\makebox[\hsize]{\hss\strut\textbf{\@title}\hss}
    \makebox[\hsize]{\hss\strut\LUHsubtitle\hss}
\fi
}

% Redefine \maketitle
\newlength\LUHtmpLength
\renewcommand{\maketitle}{%

% Require \shorttitle to be in the preamble
  \ifx\LUHshorttitle\undefined
    \ClassError{luH495}{%
      No short title defined!\MessageBreak
      Use \protect\shorttitle\space in your document's preamble to\MessageBreak
      define the short title for the running head}
      {You need to use the \protect\shorttitle\space command in the preamble.}
  \fi

% Require either a \Fall or \Spring command to be in the preamble
  \ifx\LUHsemester\undefined
    \ClassError{luH495}{%
      Semester not specified!\MessageBreak
      Use \protect\Spring\space or \protect\Fall\space in your
      document's preamble to \MessageBreak specify the semester you are taking
      HONR 495}
      {You need to use the \protect\Fall\space or \protect\Spring\space commands
      in the preamble.}
  \fi

% Require \Chair to be in the preamble
  \ifx\LUHchair\undefined
    \ClassError{luH495}{%
      No Thesis Chair specified!\MessageBreak
      Use \protect\Chair\space in your document's preamble to\MessageBreak
      define your Thesis Chair for the signature page}
      {You need to use the \protect\Chair\space command in the preamble.}
  \fi

% Require \FirstReader to be in the preamble
  \ifx\LUHfirstreader\undefined
    \ClassError{luH495}{%
      No Thesis First Reader specified!\MessageBreak
      Use \protect\FirstReader\space in your document's preamble to\MessageBreak
      define your Thesis First Reader for the signature page}
      {You need to use the \protect\FirstReader\space command in the preamble.}
  \fi

%% Require \SecondReader to be in the preamble
%  \ifx\LUHsecondreader\undefined
%    \ClassError{luH495}{%
%      No Thesis Second Reader specified!\MessageBreak
%      Use \protect\SecondReader\space in your document's preamble to\MessageBreak
%      define your Thesis Second Reader for the signature page}
%      {You need to use the \protect\SecondReader\space command in the preamble.}
%  \fi

% Require either a \HonorsDirector or \HonorsAssistantDirector command to be in the preamble
  \ifx\LUHprof\undefined
    \ClassError{luH495}{%
      Honor's Professor not specified!\MessageBreak
      Use \protect\HonorsDirector\space or \protect\HonorsAssistantDirector\space
      in your \MessageBreak document's preamble to specify the professor you are
      \MessageBreak taking HONR 495 with}
      {You need to use either the \protect\HonorsDirector\space or
      \protect\HonorsAssistantDirector\space commands in the preamble.}
  \fi

\newpage
\begingroup

\pagestyle{headings}
% \renewcommand{\@oddhead}{Running head: \LUHshorttitle\hss\thepage}
\renewcommand{\@oddhead}{\LUHshorttitle\hss\thepage}

\setlength{\LUHtmpLength}{1.5in}
\addtolength{\LUHtmpLength}{-\headsep}
\addtolength{\LUHtmpLength}{-\topskip}
\addtolength{\LUHtmpLength}{-\baselineskip}
%\addtolength{\LUHtmpLength}{-30bp} % pure fudge
\vspace*{\LUHtmpLength}

\ifx\LUHsubtitle\undefined
    \noindent\makebox[\hsize]{\hss}
%    \vspace{2pt}
    \makebox[\hsize]{\hss\strut\textbf{\@title}\hss}
\else
    \noindent\makebox[\hsize]{\hss\strut\textbf{\@title}\hss}
%    \vspace{2pt}
    \makebox[\hsize]{\hss\strut\LUHsubtitle\hss}
\fi

\setlength{\LUHtmpLength}{2.5in}
\addtolength{\LUHtmpLength}{-\baselineskip}
%\addtolength{\LUHtmpLength}{0.} % more pure fudge

\vspace*{\LUHtmpLength}

\begin{center}
  \@author
\end{center}


\vspace*{\LUHtmpLength}

\begin{center}
\LUHsinglespacing
A Senior Thesis submitted in partial fulfillment\\
of the requirements for graduation\\
in the Honors Program\\
Liberty University\\
\LUHsemester\ \LUHyear
\end{center}

\pagebreak
\renewcommand{\@oddhead}{\LUHshorttitle\hss\thepage}
\LUHsinglespacing



\vspace*{0.5in}
\centerline{Acceptance of Senior Honors Thesis}

\begin{center}
This Senior Honors Thesis is accepted in partial\\
fulfillment of the requirements for graduation from the\\
Honors Program of Liberty University.
\end{center}

\vspace{1.32in}
\vspace{-\baselineskip}
\vspace{-\baselineskip}
\begin{center}
{\rule{2.25in}{0.5bp}}\\
\LUHchair\\
Thesis Chair
\end{center}

\vspace{1.32in}
\vspace{-\baselineskip}
\vspace{-\baselineskip}
\begin{center}
{\rule{2.25in}{0.5bp}}\\
\LUHfirstreader\\
Committee Member
\end{center}

%\vspace{1in}
%\vspace{-\baselineskip}
%\vspace{-\baselineskip}
%\begin{center}
%\rule{2.25in}{0.5bp}\\
%\LUHsecondreader\\
%Committee Member
%\end{center}

\vspace{1.32in}
\vspace{-\baselineskip}
\vspace{-\baselineskip}
\begin{center}
\rule{2.25in}{0.5bp}\\
\LUHprof
\end{center}

\vspace{1.32in}
\vspace{-\baselineskip}
\vspace{-\baselineskip}
\begin{center}
\rule{2.25in}{0.5bp}\\
Date
\end{center}


\pagebreak
\endgroup
\let\maketitle=\relax
}

% Add abstract environment
\newenvironment{LUHabstract}{
  \part{Abstract}
  \noindent
}{
  \ifx\LUHkeywords\undefined\else
  \newline
  \indent \textit{Keywords:} \LUHkeywords
  \fi
  \pagebreak
}

% Set up sectioning commands
\def\@part[#1]#2{
\vspace{-4ex}
\addcontentsline{toc}{part}{#1}
\noindent\makebox[\hsize]{\normalsize\bfseries#2}\vspace{-0ex}\par
}
\def\@spart#1{\@part[#1]{#1}}

\setcounter{secnumdepth}{0}

\let\LUHtableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{%
\begin{center}
\bfseries\large Table of Contents
\end{center}
  \vspace*{-60pt}
  \LUHtableofcontents
}

\let\LUHappendix=\appendix
\renewcommand{\appendix}{%
%  \setcounter{secnumdepth}{2}
  \LUHappendix
}



\renewcommand\section{\@startsection {section}{2}{\z@}%
                                   %{-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {0.1ex \@plus -1ex \@minus -.2ex}%
                                   %{2.3ex \@plus.2ex}%
                                   {0.1ex \@plus.2ex}%
                                   {\normalfont\bfseries}}

\def\subsection{\secdef\LUHsubsection\sLUHsubsection}
\def\sLUHsubsection#1{\LUHsubsection[#1]{#1}}
\def\LUHsubsection[#1]#2{%
\@startsection{subsection}{3}{\parindent}%
                                     %{-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {0.001pt\@plus -1ex \@minus -.2ex}%
                                     %{1.5ex \@plus .2ex}%
                                     {-1ex \@plus .2ex}%
                                     {\normalfont\bfseries}[#1]{#2.}}

\def\subsubsection{\secdef\LUHsubsubsection\sLUHsubsubsection}
\def\sLUHsubsubsection#1{\LUHsubsubsection[#1]{#1}}
\def\LUHsubsubsection[#1]#2{%
\@startsection{subsubsection}{4}{\parindent}%
                                     %{-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {0.001pt\@plus -1ex \@minus -.2ex}%
                                     %{1.5ex \@plus .2ex}%
                                     {-1ex \@plus .2ex}%
                                     {\normalfont\bfseries\itshape}[#1]{#2.}}

\def\paragraph{\secdef\LUHparagraph\sLUHparagraph}
\def\sLUHparagraph#1{\LUHparagraph[#1]{#1}}
\def\LUHparagraph[#1]#2{%
\@startsection{paragraph}{5}{\parindent}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\itshape}[#1]{#2.}}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Added things %%%%%%%%%%%%%%%%%%%%%
