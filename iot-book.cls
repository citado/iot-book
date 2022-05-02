\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iot-book}
              [03/01/2022 v0.5
 Persian thesis document class in XeLaTeX for University of Amirkabir projects/theses/dissertations]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions%
\LoadClass[a4paper,10pt]{book}

\ProcessOptions

\def\titlepage{
  \newpage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\AtBeginDocument{%
  \crefname{equation}{برابری}{equations}%
  \crefname{chapter}{فصل}{chapters}%
  \crefname{section}{بخش}{sections}%
  \crefname{appendix}{پیوست}{appendices}%
  \crefname{enumi}{مورد}{items}%
  \crefname{footnote}{زیرنویس}{footnotes}%
  \crefname{figure}{شکل}{figures}%
  \crefname{table}{جدول}{tables}%
  \crefname{theorem}{قضیه}{theorems}%
  \crefname{lemma}{لم}{lemmas}%
  \crefname{corollary}{نتیجه}{corollaries}%
  \crefname{proposition}{گزاره}{propositions}%
  \crefname{definition}{تعریف}{definitions}%
  \crefname{result}{نتیجه}{results}%
  \crefname{example}{مثال}{examples}%
  \crefname{remark}{نکته}{remarks}%
  \crefname{note}{یادداشت}{notes}%
}

\setcounter{secnumdepth}{3}

\usepackage{amsthm,amssymb,amsmath,amsfonts}
\usepackage[top=30mm, bottom=30mm, left=25mm, right=30mm]{geometry}
\usepackage{graphicx}
\usepackage{color}
\usepackage{titleps}
\usepackage{titletoc}
\usepackage{tocloft}
\usepackage{multirow}
\usepackage{tabularx}
\usepackage{datatool}
\usepackage{booktabs}
\usepackage{enumitem}
\usepackage[pagebackref=false,colorlinks,linkcolor=blue,citecolor=red]{hyperref}
\usepackage[nameinlink]{cleveref}%capitalize,,noabbrev

\usepackage{fancyhdr}
\usepackage[nottoc,notlof,notlot]{tocbibind}
\usepackage{makeidx,multicol}
\setlength{\columnsep}{1.5cm}
% rotating tables and figures
\usepackage{rotating}
\usepackage[all]{xy}
\usepackage{tikz}
\usepackage{verbatim}
\usetikzlibrary{arrows}

\makeindex
\usepackage[%
  localise,%
  fontsize={11,13},%
  % perpagefootnote=on,%
]{xepersian}
\SepMark{-}

\settextfont[
  Path = fonts/,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Variable
]{Vazir}

\setlatintextfont[
  Path = fonts/,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic
]{Neuton}

\renewcommand{\baselinestretch}{1.5}
\renewcommand{\labelitemi}{$\bullet$}

\defpersianfont\chapternumber[
  Scale=3,
  Path=fonts/,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Variable
]{Vazir}

\renewcommand\proofname{\textbf{برهان}}

\renewcommand{\bibname}{منابع و مراجع}

\tocloftpagestyle{plain}

\setlength{\cftbeforetoctitleskip}{-1.2em}
\setlength{\cftbeforelottitleskip}{-1.2em}
\setlength{\cftbeforeloftitleskip}{-1.2em}
\setlength{\cftaftertoctitleskip}{-1em}
\setlength{\cftafterlottitleskip}{-1em}
\setlength{\cftafterloftitleskip}{-1em}

\newcommand\tocheading{\par عنوان\hfill صفحه \par}
\newcommand\lofheading{\hspace*{.5cm}\figurename\hfill صفحه \par}
\newcommand\lotheading{\hspace*{.5cm}\tablename\hfill صفحه \par}

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\LARGE\bfseries}%\Large
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\LARGE\bfseries}%\Large
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\LARGE\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}

\theoremstyle{definition}
\newtheorem{definition}{تعریف}[section]
\newtheorem{remark}[definition]{نکته}
\newtheorem{note}[definition]{یادداشت}
\newtheorem{example}[definition]{نمونه}
\newtheorem{question}[definition]{سوال}
\newtheorem{remember}[definition]{یاداوری}
%\theoremstyle{theorem}
\newtheorem{theorem}[definition]{قضیه}
\newtheorem{lemma}[definition]{لم}
\newtheorem{proposition}[definition]{گزاره}
\newtheorem{corollary}[definition]{نتیجه}

\eqcommand{خط‌بالا}{toprule}
\eqcommand{خط‌پایین}{bottomrule}
\eqcommand{خط‌میان}{midrule}
\eqcommand{چندسطری}{multirow}

\makeatletter

\newcommand\mycustomraggedright{%
 \if@RTL\raggedleft%
 \else\raggedright%
 \fi
}

\def\@makechapterhead#1{%
  \thispagestyle{plain}

  \vspace*{20\p@}%
  {
    \parindent \z@ \mycustomraggedright %\@mycustomfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \bfseries{\Huge \@chapapp}\small\space {\chapternumber\thechapter}
        \par\nobreak
        \vskip 0\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 120\p@
  }

  %\thispagestyle{empty}
  \newpage
}
\bidi@patchcmd{\@makechapterhead}{\thechapter}{\tartibi{chapter}}{}{}
\bidi@patchcmd{\chaptermark}{\thechapter}{\tartibi{chapter}}{}{}
\makeatother

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\tartibi{chapter}: #1}{}}

\setlength{\headheight}{13pt}

\fancypagestyle{main}{%
  \fancyhf{}
  \fancyfoot[c]{\thepage}
  \fancyhead[R]{\leftmark}
  \renewcommand{\headrulewidth}{1.2pt}
}

\fancypagestyle{abstract}{
  \fancyhf{}
  \fancyhead[R]{چکیده}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{1.2pt}
}

\fancypagestyle{index}{
  \fancyhf{}
  \fancyhead[R]{نمایه}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{1.2pt}
}

\fancypagestyle{references}{
  \fancyhf{}
  \fancyhead[R]{منابع و مراجع}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{1.2pt}
}

\renewcommand{\listfigurename}{فهرست اشکال}
\renewcommand{\listtablename}{فهرست جداول}
