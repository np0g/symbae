\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2019/08/24 Vanilla Homework Class]
\LoadClass[10pt,reqno]{amsart}

% Package requirements.
\RequirePackage[left=.75in,right=.75in,top=.75in,bottom=.75in]{geometry}
\RequirePackage{npjg}
\RequirePackage[inline]{enumitem}
\RequirePackage{xparse}
\RequirePackage{xstring}
\RequirePackage{calc}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{array}
\RequirePackage{mathtools}

% Page layout.
\parindent 0pt
\pagestyle{empty}
\newcommand{\Line}[1]{\raise -4pt \hbox to #1in {\hrulefill}}
\newcommand{\DS}{\displaystyle}
\newcommand{\tb}{\hspace{1in}}

% Property definitions.
% make title optional; don't show it if it is.
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\term}[1]{\def\@term{#1}}
\newcommand{\type}[1]{\def\@type{#1}}
\newcommand{\period}[1]{\def\@period{#1}}
\newcommand{\lector}[1]{\def\@lector{#1}}

% Homework title.
\makeatletter
\def\@maketitle{%
\textbf{\begin{center}
    \@type\space\@period\hfill
    \@course\hfill
    \@lector\hfill
  \end{center}
  \vspace{4pt}
  \@author\hfill\@date}
\vspace{8pt}
\hrule width 7in depth 1pt
\vspace{4pt}}
\makeatother

% Enumerate refinement.
% Make the item take an argument that sets the number there.
% If it's a symbol, check the symbol
\newcommand\citem[1]{\item[{(#1)}] }
\let\latexitem\item
\NewDocumentCommand{\varnumitem}{o}{%
    \IfValueT{#1}{%
        \IfInteger{#1}{%
            \setcounter{enumi}{#1-1}%
        }{%
            \setcounter{enumi}{1}%
            \fnsymbol{enumi}
        }
    }
    \latexitem
  }

\NewDocumentEnvironment{problems}{O{}}
 {\begin{enumerate}[label={(\arabic*)},topsep=2ex,#1]\setlength\itemsep{1em}\let\item\varnumitem}%
 {\end{enumerate}}


% Simple proof environment.
% (the `amsthm' environment breaks on an `hspace' error in the `problem' environment)
\renewenvironment{proof}{\vspace{1ex}\paragraph{\textit{Proof.}}}{\hfill$\square$}
