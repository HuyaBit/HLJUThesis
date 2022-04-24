%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %% <UTF-8>
%% %% 黑大研究生毕业论文模板 - LaTeX 04-24-2022
%% %% 论文样式参考自《黑龙江大学研究生学位论文撰写规范》(理科适用版)
%% %% 基于ctexbook
%% %%
%% %% 初始版本作者:
%% %%   HuyaBit (2201610@hlju.edu.cn)
%% %% 
%% %% fork自:
%% %%   Qiao Junfeng (qiaojunfeng@outlook.com)
%% %%
%% %% Versions:
%% %%   v1.0  HuyaBit (01-24-2022)
%% %%
%% %% 建议采用等宽字体查看本文档
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 模板标识
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hlju}[2022/04/24 v1.0 HLJU thesis class]
\typeout{This is LaTeX template hlju. Version 1.0 (based on CTeX) 01-24-2022}


%% 打印设置
\DeclareOption{oneside}{\gdef\@printtype{oneside}} % 单面打印
\DeclareOption{twoside}{\gdef\@printtype{twoside}} % 双面打印
\DeclareOption{printtype}{\ClassWarning{hlju}{%
  You have not specified the PRINTTYPE option. The word printtype should be replaced by one of the following thesis type: oneside, twoside.
}}

%% 系统设置
\DeclareOption{win}{\gdef\@ostype{win}}     % windows
\DeclareOption{linux}{\gdef\@ostype{linux}} % linux
\DeclareOption{max}{\gdef\@ostype{mac}}     % mac
\DeclareOption{ostype}{\ClassWarning{hlju}{%
  You have not specified the OSTYPE option. The word ostype should be replaced by one of the following thesis type: win, linux, mac.
}}

%% 适应首字母大写
\DeclareOption{Oneside}{\gdef\@printtype{oneside}}
\DeclareOption{Twoside}{\gdef\@printtype{twoside}}
\DeclareOption{Win}{\gdef\@ostype{win}}
\DeclareOption{Linux}{\gdef\@ostype{linux}}
\DeclareOption{Max}{\gdef\@ostype{mac}}

%% 选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

%% 默认选项配置
\ExecuteOptions{master,public,oneside,win,a4paper,sub4section}
\ProcessOptions\relax

%% 引用ctexbook: 小4,1.5倍行距
\LoadClass[UTF8,zihao=-4,linespread=1.7,fontset=fandol]{ctexbook}%1.5+0.2行间距
\setcounter{secnumdepth}{5}

%% HLJUThesis字样及版本信息
\usepackage{graphicx}
\def\HLJUThesisVer{v1.0 04-23-2022}
\def\HLJUThesis{%
 H%
 {\fontsize{0.8em}{\baselineskip}\selectfont
 \kern-.12em\lower.5ex\hbox{L}%
 \kern-.46em\raise.47ex\hbox{J}%
 \kern-.12em U%
}
 \kern-.35emT%
 \kern-.22em\lower.5ex\hbox{H}%
 \kern-.08em E%
 \kern-.05em\lower.5ex\hbox{S}%
 \kern-.26em I%
 \kern-.26em\raise.5ex\hbox{\rotatebox[origin=c]{180}{S}}%
}

%% 预声明
\RequirePackage{tabularray,ulem,arydshln}%表格宏包  下划线   虚线
\RequirePackage{ifthen}       % ifthenelse/equal/isundefined等判断比较命令
\RequirePackage{etoolbox}     % \AtBeginDocument等宏命令
\RequirePackage{titletoc}     % 目录
\RequirePackage{titlesec}     % 标题格式
\RequirePackage{remreset}     % 计数器设置
\RequirePackage{geometry}     % 设置页边距
\RequirePackage{fancyhdr}     % 设置页眉页脚
\RequirePackage{setspace}     % 设置行间距
\RequirePackage{float}        % 图片
\RequirePackage{graphicx}     % 图片
\RequirePackage{subfigure}    % 图片
\RequirePackage{epstopdf}     % 图片
\RequirePackage{array}        % 列举
\RequirePackage{enumitem}     % 列举
\RequirePackage{booktabs}     % 表格上下粗线
\RequirePackage{longtable}    % 长表格
\RequirePackage{multirow}     % 多行表格
\RequirePackage{caption}      % 标题设置
\RequirePackage{listings}     % 代码环境
\RequirePackage{algorithm2e}  % 算法环境
\RequirePackage{amsmath}      % 数学
\RequirePackage{amsthm}       % 定理
\RequirePackage{hyperref}     % 超链接
\RequirePackage{pifont}       % 画五角星
\RequirePackage{color}        % To provide color for soul
\RequirePackage{soul}         % To highlight text
\RequirePackage[sort&compress]{natbib}              % BibTex
\RequirePackage{pdfpages}     %用于拼接pdf
\RequirePackage{fontspec}     %用于导入字体
\DeclareGraphicsExtensions{.eps,.ps,.png,.jpg,.bmp} % 声明使用图像格式
\newcommand{\highlight}[1]{\colorbox{yellow}{#1}}   % 高亮注释

%载入字体
%https://zhuanlan.zhihu.com/p/111368138


% 根据不同系统调整
\ifthenelse{\equal{\@ostype}{win}}{ % win 配置
  \RequirePackage{times}        % Times New Roman字体
}{}
\ifthenelse{\equal{\@ostype}{linux}}{ % linux 配置
  \RequirePackage{newtxtext}    % Times New Roman字体
  \RequirePackage{newtxmath}    % 公式的Times New Roman字体 (!After package amsthm!)
}{}
\ifthenelse{\equal{\@ostype}{mac}}{ % mac 配置
  \RequirePackage{times}        % Times New Roman字体
  \RequirePackage{fontspec}     % 字体设置 (!Only for XeLaTeX!)
}{}

% 根据不同编译系统选择正确的 Times New Roman字体
\usepackage{iftex}
\ifpdftex
\else
\setmainfont{Times New Roman}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 数学环境
% 数学符号：
\newcommand\eu{\mathrm{e}}
\newcommand\iu{\mathrm{i}}
\newcommand*{\diff}{\mathop{}\!\mathrm{d}}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% 数学定理：
% 以下定义数学定理环境默认风格为 hlju
\newtheoremstyle{hlju}%
{0pt}% measure of space to leave above the theorem.
{0pt}% measure of space to leave below the theorem.
{}% name of font to use in the body of the theorem.
{2\ccwd}% measure of space to indent.
{\bfseries}% name of head font.
{.}% punctuation between head and body.
{\ccwd}% space after theorem head; " " = normal interword space
{}% manually specify head (can be left empty, meaning `normal').
\theoremstyle{hlju}

% 定义新的定理
\newcommand{\theoremname}{定理}
\newcommand{\assertionname}{断言}
\newcommand{\axiomname}{公理}
\newcommand{\corollaryname}{推论}
\newcommand{\lemmaname}{引理}
\newcommand{\propositionname}{命题}
\newcommand{\definitionname}{定义}
\newcommand{\examplename}{例}
\newcommand{\remarkname}{注}
\renewcommand{\proofname}{证明}
\renewcommand{\lstlistingname}{代码}
\renewcommand{\algorithmcfname}{算法}

\newtheorem{theorem}                {\theoremname}     [chapter]
\newtheorem{assertion}  [theorem]   {\assertionname}
\newtheorem{axiom}      [theorem]   {\axiomname}
\newtheorem{corollary}  [theorem]   {\corollaryname}
\newtheorem{lemma}      [theorem]   {\lemmaname}
\newtheorem{proposition}[theorem]   {\propositionname}
\newtheorem{definition}             {\definitionname}  [chapter]
\newtheorem{example}                {\examplename}     [chapter]
\newtheorem*{remark}                {\remarkname}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%修改“Figure”为“图”
\renewcommand\figurename{图} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% From MDPI.cls
%\renewcommand{\qed}{\unskip\nobreak\quad\qedsymbol} %% This places the symbol right after the text instead of placing it at the end on the line.
\renewenvironment{proof}[1][\proofname]{\par %% \proofname allows to have "Proof of my theorem"
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries %% "Proof" is bold
    #1\@addpunct{.}]\ignorespaces %% Period instead of colon
}{%
  \popQED\endtrivlist\@endpefalse
}

% 代码环境
\lstset{
    basicstyle=\small\ttfamily,
    xleftmargin=2pc,
    xrightmargin=2pc,
    frame=single,
    columns=flexible,
    numbers=left,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 输入
\def\@refcolor{} % 给注释及引用使用颜色 on/off
\newcommand{\refcolor}[1]{\gdef\@refcolor{#1}}
\def\@emptypagewords{} % 空白页留字
\newcommand{\emptypagewords}[1]{\gdef\@emptypagewords{#1}}
\def\@beginright{} % 摘要、目录、第一章右侧页起 on/off
\newcommand{\beginright}[1]{\gdef\@beginright{#1}}

\newcommand{\Title}[2]{\gdef\@titlecn{#1} \gdef\@titleen{#2}}
\newcommand{\Subtitle}[2]{\gdef\@subtitlecn{#1} \gdef\@subtitleen{#2}}
\newcommand{\Department}[1]{\gdef\@department{#1}}
\def\@branch{工学} % 学科大类
\newcommand{\Branch}[1]{\gdef\@branch{#1}}
\newcommand{\Major}[1]{\gdef\@major{#1}}
\newcommand{\Feild}[1]{\gdef\@feild{#1}}
\newcommand{\Tutor}[3]{\gdef\@tutorcn{#1} \gdef\@tutoren{#2} \gdef\@tutordegree{#3}}
\newcommand{\Cotutor}[3]{%
  \gdef\@cotutorcn{#1}
  \gdef\@cotutoren{#2}
  \gdef\@cotutordegree{#3}}
\newcommand{\Author}[2]{\gdef\@authorcn{#1} \gdef\@authoren{#2}}
\newcommand{\StudentID}[1]{\gdef\@studentid{#1}}

\newcommand{\CLC}[1]{\gdef\@clc{#1}}
\newcommand{\DateEnroll}[3]{%
  \gdef\@dateenrollm{#1}
  \gdef\@dateenrolld{#2}
  \gdef\@dateenrolly{#3}}
\newcommand{\DateGraduate}[3]{%
  \gdef\@dategraduatem{#1}
  \gdef\@dategraduated{#2}
  \gdef\@dategraduatey{#3}}
\newcommand{\DateSubmit}[3]{%
  \gdef\@datesubmitm{#1}
  \gdef\@datesubmitd{#2}
  \gdef\@datesubmity{#3}}
\newcommand{\DateDefence}[3]{%
  \gdef\@datedefencem{#1}
  \gdef\@datedefenced{#2}
  \gdef\@datedefencey{#3}}

\newcommand{\Abstract}[2]{\gdef\@abstrctcn{#1} \gdef\@abstrcten{#2}}
\newcommand{\Keyword}[2]{\gdef\@keywordcn{#1} \gdef\@keyworden{#2}}
\newcommand{\Listfigtab}[1]{\gdef\@listfigtab{#1}} % on/off
\newcommand{\Abbreviations}[1]{\gdef\@abbreviations{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CTeX调整

%titleformat 和  ctexset冲突 不要使用tetleformat   中文环境下推荐全部使用ctexset设置
% 标题样式修改
\ctexset{%
  chapter={%章标题 : 小四黑体居中 单倍行距 段前/段后0.5行 另起新页
    format+={\zihao{-2} \heiti \bfseries \centering \thispagestyle{fancy}},
    fixskip=true,
    beforeskip=-7pt,
    %afterskip=23.4pt,
    aftertitle  = {\songti\zihao{-4} ~\par},
    break=\clearpage,
    number = \arabic{chapter},
  },
  section={%节标题 : 四号黑体居左 单倍行距 段前/段后0.5行
    format=\zihao{-3} \heiti \raggedright,
    beforeskip=8.43pt,
    afterskip=11.24pt,
    number = \arabic{chapter}.\arabic{section},
  },
  subsection={%条标题 : 小四号黑体居左 单倍行距 段前/段后0.5行
    format=\zihao{4} \heiti \raggedright,
    beforeskip=3.61pt,
    afterskip=3.61pt,
    number = \arabic{chapter}.\arabic{section}.\arabic{subsection},
  },
  subsubsection={% 附加4级标题 : 小四号宋体加粗居左
    format=\zihao{-4} \heiti \raggedright,
    number = \arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
  },
  paragraph={% 附加5级标题 : 小四号宋体居左
    format=\zihao{-4} \songti \raggedright,
    number = \arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph},
  },
  subparagraph={% 附加6级标题 : 小四号宋体居左
    format=\zihao{-4} \songti \raggedright,
    number = \arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}.\arabic{subparagraph},
  },
  punct=quanjiao, % 全角
  autoindent=2,  % 缩进
  linestretch=2, % 行伸缩
  % 部分标题修改
  contentsname={目~~~~录},
  listfigurename={图~清~单},
  listtablename={表~清~单},
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页面设置
% 设置页面大小
% A4纸页边距均40/35/30/30m
% 打印留边平移0mm
\geometry{papersize={210mm,297mm}}
\ifthenelse{\equal{\@printtype}{twoside}}{% 双面面
  \geometry{top=40mm,bottom=35mm,inner=30mm,outer=30mm}
}{%
  \ifthenelse{\equal{\@printtype}{oneside}}{% 单面
    \geometry{top=40mm,bottom=35mm,left=30mm,right=30mm}
    \geometry{layouthoffset=0mm}}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置空白页眉页脚
 \pagestyle{fancy}
 \fancyhf{}
 \renewcommand{\headrulewidth}{0pt}

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置目录格式   
\titlecontents{chapter}[0pt]{\bf\heiti\zihao{-4}\settowidth{\hangindent}{\thecontentslabel\ \ }}
{\thecontentslabel\ \ }{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{section}[2em]{\settowidth{\hangindent}{\thecontentslabel\ \ }\songti\zihao{-4}}
{\thecontentslabel\ \ }{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{subsection}[3em]{\settowidth{\hangindent}{\thecontentslabel\ \ }\songti\zihao{-4}}
{\thecontentslabel\ \ }{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage}


\titlecontents{figure}[0pt]{\settowidth{\hangindent}{图~\thecontentslabel\ \ }\songti\zihao{-4}}
{图~\thecontentslabel\ \ }{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{table}[0pt]{\settowidth{\hangindent}{表~\thecontentslabel\ \ }\songti\zihao{-4}}
{表~\thecontentslabel\ \ }{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图表环境设置
\let\org@table\table
\let\org@endtable\endtable
\renewenvironment{table}[1][h!]
{\begin{spacing}{1.2} \org@table[#1] \songti\zihao{5}}
{\org@endtable \end{spacing}}

\let\org@longtable\longtable
\let\org@endlongtable\endlongtable
\renewenvironment{longtable}[1][h!]
{\begin{spacing}{1.2} \songti\zihao{5}\org@longtable[#1]}
{\org@endlongtable \end{spacing}}

\@removefromreset{table}{chapter}
\@removefromreset{figure}{chapter}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\p@subfigure}{\thefigure}

\DeclareCaptionFormat{tabfigformat}{\songti\zihao{5}{#1~~#3}}

%设置图表标题
\captionsetup[figure]{
  font={rm,md},labelfont={rm,md},name={图\thechapter{}-\hspace{-.25em}}, %hspace是为了解决数字间空格问题
  position=bottom, margin=0mm, format=tabfigformat,
  aboveskip=6pt, belowskip=-15pt, justification=centerlast,font={small}}
\captionsetup[table]{
  font={rm,md},labelfont={rm,md},name={表\thechapter{}-\hspace{-.25em}},
  position=top, margin=0mm, format=tabfigformat,
  aboveskip=0pt, belowskip=0pt, justification=centerlast,font={small}}

%出现在页面中间的浮动对象与上下方文本之间的垂直距离
%缺省为 12pt plus 2pt minus 2pt。
%\setlength{\intextsep}{12pt \@plus2pt \@minus 2pt}

%出现在页面的顶部或底部的浮动对象之间的垂直距离
%缺省为 12pt plus 2pt minus 2pt
%\setlength{\floatsep}{12pt \@plus2pt \@minus2pt}

%出现在页面的顶部或底部的浮动对象与文本之间的垂直距离
% 缺省为 20pt plus 2pt minus 4pt。
%\setlength{\textfloatsep}{20bp \@plus2pt \@minus4pt}

% 列表间接设置
\setlist{
  topsep=0pt, % 列表环境与上文距离
  itemsep=0pt, % 条目间距离
  parsep=\parskip, % 条目内段落距离
  partopsep=0pt % 列表环境与下文距离
}

% 设置参考文献格式
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% 设置PDF
\hypersetup{%
  colorlinks=true,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdffitwindow=true,
  pdfsubject={HLJU thesis},
  pdfcreator={LaTeXed~By~WeiQM}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 工具函数
\newcommand{\checkinput}{%检测输入元素
  \ifthenelse{\isundefined{\@titlecn}}{\errmessage{%
    Please set title by 'Title'.}}{}
  \ifthenelse{\isundefined{\@department}}{\errmessage{%
    Please set department by 'Department'.}}{}
  \ifthenelse{\isundefined{\@major}}{\errmessage{%
    Please set major by 'Major'.}}{}
  \ifthenelse{\isundefined{\@feild}}{\errmessage{%
    Please set feild by 'Feild'.}}{}
  \ifthenelse{\isundefined{\@tutorcn}}{\errmessage{%
    Please set tutor name by 'Tutor'.}}{}
  \ifthenelse{\isundefined{\@authorcn}}{\errmessage{%
    Please set author name by 'Author'.}}{}
  \ifthenelse{\isundefined{\@studentid}}{\errmessage{%
    Please set student ID date by 'StudentID'.}}{}
  \ifthenelse{\isundefined{\@dateenrolly}}{\errmessage{%
    Please set enroll date by 'DateEnroll'.}}{}
  \ifthenelse{\isundefined{\@dategraduatey}}{\errmessage{%
    Please set graduate date by 'DateGraduate'.}}{}
  \ifthenelse{\isundefined{\@datesubmity}}{\errmessage{%
    Please set submite date by 'DateSubmit'.}}{}
  \ifthenelse{\isundefined{\@datedefencey}}{\errmessage{%
    Please set defence date by 'DateDefence'.}}{}
  \ifthenelse{\equal{\@refcolor}{\empty}}{}{%
    \ifthenelse{\equal{\@refcolor}{on} \OR \equal{\@refcolor}{off}}{}{
    \errmessage{Please use 'on' of 'off' for refcolor.}}
  }
  \ifthenelse{\equal{\@beginright}{\empty}}{}{%
    \ifthenelse{\equal{\@beginright}{on} \OR \equal{\@beginright}{off}}{}{
    \errmessage{Please use 'on' of 'off' for beginright.}}
  }
  \ifthenelse{\isundefined{\@listfigtab}}{}{%
    \ifthenelse{\equal{\@listfigtab}{on} \OR \equal{\@listfigtab}{off}}{}{
    \errmessage{Please use 'on' of 'off' for listfigtab.}}
  }
}
\newcommand{\clearautopage}{%右侧起新页
  \clearpage
  \ifthenelse{\equal{\@printtype}{twoside}}{% 双面
    \ifodd\c@page
    \else
      \hbox{}
      \vspace*{\fill}
      \begin{center}
        {\textcolor[rgb]{0.75,0.75,0.75}{\@emptypagewords}}
      \end{center}
      \vspace{\fill}
      \thispagestyle{empty}
      \newpage
      \if@twocolumn \hbox{} \newpage \fi
    \fi
  }{}
}
\newcommand{\sethyper}{%设置链接引用颜色
  \hypersetup{%
    pdftitle={\@titlecn},
    pdfkeywords={\@keywordcn},
    pdfauthor={\@authorcn}
  }
  \ifthenelse{\equal{\@refcolor}{on}}{%
    \hypersetup{
      allcolors=blue,
    }
  }{%
    \hypersetup{
      allcolors=black,
    }
  }
}
\newcommand{\TranSecretLevel}[1]{%密级翻译
  \ifthenelse{\equal{\@permission}{public}}{\relax}{
  \ifthenelse{\equal{\@permission}{privacy}}{内~~部}{
  \ifthenelse{\equal{\@permission}{secret3}}{秘密~\ding{73}~{\bfseries 3}年}{
  \ifthenelse{\equal{\@permission}{secret5}}{秘密~\ding{73}~{\bfseries 5}年}{
  \ifthenelse{\equal{\@permission}{secret10}}{秘密~\ding{73}~{\bfseries 10}年}{
  \ifthenelse{\equal{\@permission}{secret*}}{秘密~\ding{73}~永久}{
  \ifthenelse{\equal{\@permission}{classified3}}{机密~\ding{73}~{\bfseries 3}年}{
  \ifthenelse{\equal{\@permission}{classified5}}{机密~\ding{73}~{\bfseries 5}年}{
  \ifthenelse{\equal{\@permission}{classified10}}{机密~\ding{73}~{\bfseries 10}年}{
  \ifthenelse{\equal{\@permission}{classified*}}{机密~\ding{73}~永久}{
  \ifthenelse{\equal{\@permission}{topsecret3}}{绝密~\ding{73}~{\bfseries 3}年}{
  \ifthenelse{\equal{\@permission}{topsecret5}}{绝密~\ding{73}~{\bfseries 5}年}{
  \ifthenelse{\equal{\@permission}{topsecret10}}{绝密~\ding{73}~{\bfseries 10}年}{
  \ifthenelse{\equal{\@permission}{topsecret*}}{绝密~\ding{73}~永久}{
  \ifthenelse{\equal{\@permission}{permission*}}{密级~\ding{73}~保密期限}{
  }}}}}}}}}}}}}}}
}
\newcommand{\TranDegree}[1]{%职称翻译
  \frenchspacing
  \ifthenelse{\equal{#1}{教授}}{Prof.}{%
  \ifthenelse{\equal{#1}{副教授}}{Prof.}{%
  \ifthenelse{\equal{#1}{讲师}}{Teacher}{%
  \ifthenelse{\equal{#1}{高工}}{Engineer}{%
  \ifthenelse{\equal{#1}{研究员}}{Researcher}{%
  \ifthenelse{\equal{#1}{副研究员}}{Researcher}{%
  }}}}}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AfterPreamble = AtBeginDocument
% AtEndPreamble -> AtBeginDocument -> AfterEndPreamble -> AtEndDocument -> AfterEndDocument
\AtBeginDocument{%
  \checkinput
  \sethyper
}

\AfterEndPreamble{%
  \makecovercn    %制作中文封面
  \makestatement  %声明
  \callHF         %召唤页眉页脚出现  并且设置页码为罗马
  \abstructkeyword%摘要及关键字
  \makecontextlist%列表
  \denotation     %缩写定义
  \setAlb     %设置标题序号为阿拉伯
}

%设置章节标记为阿拉伯数字
\newcommand{\setAlb}{
  %%%%%%%%%%%%%%
  %设置页码为阿拉伯
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

%召唤页眉页脚
\newcommand{\callHF}{
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %设置页眉页脚都显示
  \fancypagestyle{plain}{
    \pagestyle{fancy}}
  \newcommand{\makeheadrule}{
    \makebox[-2pt][l]{\rule[.75\baselineskip]{\linewidth}{.8mm}}
    \rule[1\baselineskip]{\linewidth}{0.2mm}}
  \renewcommand{\headrule}{
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
    \makeheadrule}}
  \makeatother
  \fancyfoot[C]{\zihao{5} \uppercase\expandafter{\romannumeral \thepage}} %脚注
  \renewcommand{\headrulewidth}{0.4pt}
  \fancyfoot[C]{\songti \zihao{-5} -\thepage -}
  \fancyhead[CE]{\heiti \zihao{5} \leftmark}
  \fancyhead[CO]{\heiti\zihao{5} 黑龙江大学硕士学位论文}
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %重置页码 变为罗马数字
  \setcounter{page}{1}
  \pagenumbering{Roman}
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
}

%% 制作封面
\newcommand{\makecovercn}{% 中文封面
  % \includepdf{covercn.pdf}[begin-stop]
  % 下边这些都注释掉，用{pdfpages}包来实现封面拼接
  {\pdfbookmark[0]{中文封面}{makecovercn}
    \includepdf[page={1-1}]{convercn/convercn.pdf}
  }
  %\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}

\newcommand{\makestatement}{% 声明
  {\pdfbookmark[0]{声明}{makestatement}
    \begin{spacing}{1.7}%1.5+0.2
      {\zihao{-2} \heiti \centerline {关于学位论文的独创性声明}}
      {\zihao{-4} \songti ~\par
          本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研
        究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他
        人已经发表或撰写过的研究成果，也不包含为获得\underline{黑龙江大学}或其他教育机构的
        学位或证书而使用过的材料。\\
        
          { \setlength{\parindent}{0cm}  %取消这个括号内的首行缩进
            \zihao{-4}学位论文作者签名：\hspace{7\ccwd}\hspace{4\ccwd}
          签字日期：\hspace{3\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日}\\
      }

      {\zihao{-2} \heiti \centerline {学位论文版权使用授权书}}
      {\zihao{-4} \songti ~\par
        本人完全了解\underline{黑龙江大学}有关保留、使用学位论文的规定，同意学校保留并
        向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授
        权\underline{黑龙江大学}可以将学位论文的全部或部分内容编入有关数据库进行检索，
        可以采用影印、缩印或其他复制手段保存、汇编本学位论文。 \\     

        { \setlength{\parindent}{0cm}
          \zihao{-4}学位论文作者签名：\hspace{10\ccwd}导师签名：\\

          签字日期：\hspace{3\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日\\

          学位论文作者毕业后去向：\\

          工作单位：\hspace{14\ccwd}电话：\\
          通讯地址：\hspace{14\ccwd}邮编：
        }
      }

    \end{spacing}
    \clearautopage
  }
}



\newcommand{\abstructkeyword}{% 摘要
\pdfbookmark[0]{摘~~~要}{Abstract}
  \begin{spacing}{1.7}%1.5行距应设置为1.7
    {\zihao{-2} \heiti  \ctexset{chapter/numbering=false} \chaptera{摘~~~~要}}
    {\zihao{-4} \songti %~\par% ~ 表示强制空格
      \@abstrctcn \par ~\par
      {\heiti 关键字：} \@keywordcn
    }
    \clearpage
    {\zihao{-2} \heiti \ctexset{chapter/numbering=false} \chaptera{Absctract}}
    {\zihao{-4} %~\par 
      \@abstrcten \par ~\par
      {\bfseries Key words:} \@keyworden
    }
  \end{spacing}
}

\newcommand{\denotation}{% 缩写定义
{\ifthenelse{\isundefined{\@abbreviations}}{}{%
    \pdfbookmark[0]{主要符号表}{denotation}
    \chapter*{主要符号表}
    %\centering
    %\begin{tabular}{cl}
      \@abbreviations
    %\end{tabular}%
  }
}
}

\newcommand{\makecontextlist}{% 目录
{ 
  \pdfbookmark[0]{目录}{makecontextlist}
  \tableofcontents
  \renewcommand\addvspace[1]{}
  \ifthenelse{\isundefined{\@listfigtab}}{}{%
    \ifthenelse{\equal{\@listfigtab}{on}}{%
      \renewcommand{\addvspace}[1]{}
      \clearpage
      \pdfbookmark[0]{图目录}{listoffigures}
      \listoffigures
      \clearpage
      \pdfbookmark[0]{表目录}{listoftables}
      \listoftables
    }{}
  }
}}

\newcommand{\chaptera}[1]{%无章号但编入目录

  \ctexset{chapter/numbering=false}
  \chapter{#1}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %
  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  %
  \renewcommand{\thefigure}{A\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{A\arabic{table}}
  \setcounter{table}{0}
  \renewcommand{\theequation}{A\arabic{equation}}
  \setcounter{equation}{0}
}

\newcommand{\summary}{%结论
  \ctexset{chapter/numbering=false}
  \chaptera{结~~~~论}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %
  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  %

  \renewcommand{\thefigure}{A\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{A\arabic{table}}
  \setcounter{table}{0}
  \renewcommand{\theequation}{A\arabic{equation}}
  \setcounter{equation}{0}
}
\newcommand{\Bib}[2]{%参考文献
  \bibliographystyle{#1}
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{参考文献}
  \bibliography{#2}
}
\renewcommand{\appendix}{% 附录
  \ctexset{chapter/numbering=false}
  \chaptera{附~~~~录}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %
  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  %

  \renewcommand{\thefigure}{A\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{A\arabic{table}}
  \setcounter{table}{0}
  \renewcommand{\theequation}{A\arabic{equation}}
  \setcounter{equation}{0}
}
\newcommand{\achievement}{%学术成果
  \ctexset{chapter/numbering=false}
  \chapter{攻读硕士学位期间取得的学术成果}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %
  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  %

  \renewcommand{\thefigure}{A\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{A\arabic{table}}
  \setcounter{table}{0}
  \renewcommand{\theequation}{A\arabic{equation}}
  \setcounter{equation}{0}
}

\newcommand{\acknowledgments}{%致谢
  \ctexset{chapter/numbering=false}
  \chaptera{致~~~~谢}
  %
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %
  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  %

  \renewcommand{\thefigure}{A\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{A\arabic{table}}
  \setcounter{table}{0}
  \renewcommand{\theequation}{A\arabic{equation}}
  \setcounter{equation}{0}
}
\newcommand{\biography}{%作者简介
  \ctexset{chapter/numbering=false}
  \chaptera{作者简介}

  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %
  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
  %

  \renewcommand{\thefigure}{A\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{A\arabic{table}}
  \setcounter{table}{0}
  \renewcommand{\theequation}{A\arabic{equation}}
  \setcounter{equation}{0}
}   

%功能区
%定义一个用来插图的函数，  第一个参数输入图片中文名  第二个为英文名  第三个为label名(用于交叉引用)
\newcommand{\chaTu}[3]{\zihao{5}\songti\rmfamily
  %\centering%居中
  \caption{#1}
  \begin{center}
    \zihao{5}\songti\rmfamily
    Fig.\thechapter -\thefigure ~~~#2
  \end{center}
  \label{#3}
  }

%定义一个用来插表的函数，  第一个参数输入图片来源  第二个中文名字  第三个为英文
  \newcommand{\chaBiao}[3]{\zihao{5}\songti\rmfamily
  %\centering%居中
  \begin{center}
    \caption{#1}
    \zihao{5}\songti\rmfamily 
    Table \thechapter -\thetable ~~~#2
    \vspace{-1em}
  \end{center}
  \label{#3}
  }
%% --END--
\endinput
