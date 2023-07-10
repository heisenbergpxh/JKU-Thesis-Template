\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JKUthesis}[2021/07/19 JKU Thesis LaTeX class]

\RequirePackage{graphicx}
\RequirePackage{ifthen}

\RequirePackage[sc,osf]{mathpazo}
\renewcommand\familydefault{\sfdefault}

\newboolean{german}
\newboolean{twoside}
\newboolean{firstrefwoman}
\newboolean{secondrefwoman}
\newboolean{assistmale}
\newboolean{assistfemale}

\DeclareOption{twoside}{%
	\setboolean{twoside}{true}}

\DeclareOption{german}{%
	\setboolean{german}{true}}

\DeclareOption{firstrefwoman}{%
	\setboolean{firstrefwoman}{true}}

\DeclareOption{secondrefwoman}{%
	\setboolean{secondrefwoman}{true}}

\DeclareOption{assistmale}{%
	\setboolean{assistmale}{true}}

\DeclareOption{assistfemale}{%
	\setboolean{assistfemale}{true}}

\ProcessOptions\relax

\ifthenelse{\boolean{german}}{
	\RequirePackage[ngerman]{babel}
}
{
	\RequirePackage[english]{babel}
	\RequirePackage[en-GB]{datetime2}
}

\def\title#1{\gdef\@title{#1}}
\def\name#1{\gdef\@name{#1}}
\def\institute#1{\gdef\@institute{#1}}
\def\type#1{\gdef\@type{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\study#1{\gdef\@study{#1}}
\def\firstreferee#1{\gdef\@firstreferee{#1}}
\def\secondreferee#1{\gdef\@secondreferee{#1}}
\def\assist#1{\gdef\@assist{#1}}
\def\signature#1{\gdef\@signature{#1}}
\def\town#1{\gdef\@town{#1}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass{scrbook}

\def\Huge{\@setfontsize\Huge{30pt}{36}}

\ifthenelse{\boolean{german}}{%
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\unitlength 1cm
		\begin{picture}(16.7,0)
			\put(10.6,-1.5){\includegraphics[width=5.2cm]{General/jku_de}}
			\put(12,-3.2){\begin{minipage}[t]{3.9cm}\footnotesize%
					Eingereicht von\\
					{\bfseries\@name}%
					\vskip 4mm%
					Angefertigt am\\
					{\bfseries\@institute}%
					\ifcase\@type
					\vskip 4mm%
					\ifthenelse{\boolean{firstrefwoman}}{%
					Erstbeurteilerin\\}
					{Erstbeurteiler\\}
					{\bfseries\@firstreferee}
					\vskip 4mm%
					\ifthenelse{\boolean{secondrefwoman}}{%
					Zweitbeurteilerin\\}
					{Zweitbeurteiler\\}
					{\bfseries\@secondreferee}
					\else
					\vskip 4mm%
					\ifthenelse{\boolean{firstrefwoman}}{%
					Beurteilerin\\}
					{Beurteiler\\}
					{\bfseries\@firstreferee}
					\fi%
					\vskip 4mm
					\ifthenelse{\boolean{assistfemale}}{
					Mitbetreuerin\\
					{\bfseries\@assist}
					\vskip 4mm}
					{}
					\ifthenelse{\boolean{assistmale}}{
					Mitbetreuer\\
					{\bfseries\@assist}
					\vskip 4mm}
					{}
					{\@date}
			\end{minipage}}
			\put(12,-22.75){\begin{minipage}[t]{3.9cm}\footnotesize%
					{\bfseries JOHANNES KEPLER\\
						UNIVERSIT\"AT LINZ}\\
					Altenbergerstra{\ss}e 69\\
					4040 Linz, \"Osterreich\\
					www.jku.at\\
					DVR 0093696
			\end{minipage}}
			\put(-.45,-12.2){\begin{minipage}[b]{12cm}\Huge\bfseries\raggedright\@title\end{minipage}}
			\put(-.45,-17.2){\includegraphics[width=4.4cm]{General/arr}}
			\put(-.45,-18.3){\begin{minipage}[t]{12cm}%
					{\large\ifcase\@type Dissertation\or Diplomarbeit\or Masterarbeit\or Bachelorarbeit\fi}%
					\vskip 2mm%
					zur Erlangung des akademischen Grades%
					\vskip 3mm%
					{\large\@degree} \ifcase\@type{\large der \@study}\fi
					\vskip 3mm%
					im \ifcase\@type Doktoratsstudium der\or Diplomstudium\or Masterstudium\or Bachelorstudium\fi
					\vskip 3mm%
					{\large\@study}
			\end{minipage}}
		\end{picture}
	\end{titlepage}
}}
{%
\renewcommand{\maketitle}{
	\begin{titlepage}
		\unitlength 1cm
		\begin{picture}(16.7,0)
			\put(11.1,-1.5){\includegraphics[width=5.2cm]{General/jku_en}}
			\put(12.5,-3.2){\begin{minipage}[t]{3.9cm}\footnotesize%
					Author\\
					{\bfseries\@name}%
					\vskip 4mm%
					Submission\\
					{\bfseries\@institute}%
					\ifcase\@type
					\vskip 4mm%
					{First Supervisor\\}
					{\bfseries\@firstreferee}
					\vskip 4mm%
					{Second Supervisor\\}
					{\bfseries\@secondreferee}
					\else
					\vskip 4mm%
					{Supervisor\\}
					{\bfseries\@firstreferee}
					\fi%
					\vskip 4mm
					\ifthenelse{\boolean{assistfemale}}{
					Assist\\
					{\bfseries\@assist}
					\vskip 4mm}
					{}
					\ifthenelse{\boolean{assistmale}}{
					Assist\\
					{\bfseries\@assist}
					\vskip 4mm}
					{}
					{\@date}
			\end{minipage}}
			\put(12.5,-22.75){\begin{minipage}[t]{3.9cm}\footnotesize%
					{\bfseries JOHANNES KEPLER\\
						UNIVERSITY LINZ}\\
					Altenbergerstra{\ss}e 69\\
					4040 Linz, Austria\\
					www.jku.at\\
					DVR 0093696
			\end{minipage}}
			\put(0,-12.2){\begin{minipage}[b]{12cm}\Huge\bfseries\raggedright\@title\end{minipage}}
			\put(0,-17.2){\includegraphics[width=4.4cm]{General/arr}}
			\put(0,-18.3){\begin{minipage}[t]{12cm}%
					{\large\ifcase\@type PhD Thesis\or Diploma Thesis\or Master's Thesis \or Bachelor's Thesis\fi}%
					\vskip 2mm%
					to confer the academic degree%
					\vskip 3mm%
					{\large\@degree} \ifcase\@type{\large in \@study}\fi
					\vskip 3mm%
					in the \ifcase\@type PhD Program \or Diploma Program \or Master's Program \or Bachelor's Program\fi
					\vskip 3mm%
					{\large\@study}
			\end{minipage}}
		\end{picture}
	\end{titlepage}
}}


\ifthenelse{\boolean{german}}{
\newcommand{\printdeclaration}{
\section*{Eidesstattliche Erklärung}
Ich erkläre an Eides statt, dass ich die vorliegende \ifcase\@type PhD Program \or Diploma Program \or Master's Program \or Bachelor's Program\fi selbstständig und ohne fremde Hilfe verfasst, andere als die angegebenen Quellen und Hilfsmittel nicht benutzt bzw. die wörtlich oder sinngemäß entnommenen Stellen als solche kenntlich gemacht habe.
Die vorliegende Masterarbeit ist mit dem elektronisch übermittelten Textdokument identisch.

\vspace{1.5cm}
\noindent
\parbox{6cm}{
	\strut \@town, \today} \hfill\parbox{6cm}{\centering \includegraphics[width=6cm]{Signature/\@signature} \\ \vspace{3mm} \hrule
	\strut \@name}}
}
{
\newcommand{\printdeclaration}{
	\section*{Sworen declaration}
	I declare under oath that I have written this \ifcase\@type PhD thesis~ \or Diploma thesis~ \or Master's thesis~ \or Bachelor's thesis~\fi independently and without any third-party assistance, that I have not used any sources or aids other than those indicated, and that I have marked the passages taken verbatim or in spirit as such.
	This \ifcase\@type PhD thesis~ \or Diploma thesis~ \or Master's thesis~ \or Bachelor's thesis~\fi is identical to the electronically transmitted text document.
	
	\vspace{1.5cm}
	\noindent
	\parbox{6cm}{
		\strut \@town, \today} \hfill\parbox{6cm}{\centering \includegraphics[width=6cm]{Signature/\@signature} \\ \vspace{3mm} \hrule
		\strut \@name}}
	}

\ifthenelse{\boolean{german}}
{
	\newcommand{\printabstract}{
		\section*{Zusammenfassung}\input{abstract}
		\addcontentsline{toc}{section}{Zusammenfassung}}
}
{%
	\newcommand{\printabstract}{\section*{Abstract}\input{abstract}
	\addcontentsline{toc}{section}{Abstract}}
}


\RequirePackage[page]{appendix}
%\renewcommand{\appendixtocname}{Appendix}
\renewcommand{\appendixpagename}{\thispagestyle{empty} \vspace*{\fill}\centering Appendix\vspace*{\fill}}

\newcommand{\printdedication}[1]{
\begin{center}
	\thispagestyle{empty}
	\vspace*{\fill}
	\textit{#1}
	\vspace*{\fill}
\end{center}
}

\newcommand{\printappendices}{
\begin{appendices}
	\clearpage
	\renewcommand{\thefigure}{\Alph{chapter}.\arabic{section}.\arabic{figure}}
	\renewcommand{\thelstlisting}{\Alph{chapter}.\arabic{section}.\arabic{lstlisting}}
	\setcounter{figure}{0}
	\input{appendix}
\end{appendices}
}

\newcommand\stack[2][5cm]{\parbox{#1}{\centering#2}}

% customize captions, define floating scheme environment:
\RequirePackage{caption}
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[
fileext   = los ,
name      = Scheme ,
within    = section ,
placement = htbp
]{scheme}

\setkomafont{pagehead}{\normalfont\normalcolor}

