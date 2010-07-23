if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

"formatings
exec "Snippet b \\textbf{".st.et."} ".st.et
exec "Snippet i \\textit{".st.et."} ".st.et
exec "Snippet tt \\texttt{".st.et."} ".st.et

exec "Snippet $$ \\[<CR>".st.et."<CR>\\]<CR>".st.et

"sections and subsections
exec "Snippet sec \\section{".st."name".et."}\\label{sec:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
exec "Snippet sub \\subsection{".st."name".et."}\\label{sub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
exec "Snippet ssub \\subsubsection{".st."name".et."}\\label{ssub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et

"itemlists and enumerations
exec "Snippet it \\item ".st.et
exec "Snippet item \\begin{itemize}<CR>\\item ".st.et."<CR>\\end{itemize}<CR>".st.et
exec "Snippet enum \\begin{enumerate}<CR>\\item ".st.et."<CR>\\end{enumerate}<CR>".st.et

"tables and figures
exec "Snippet tab \\begin{table}[htbp]<CR>\\centering<CR>\\begin{tabular}{".st."dimension".et."}<CR>".st.et."<CR>\\end{tabular}<CR>\\caption{".st."description".et."}<CR>\\label{tab:".st."name".et."}<CR>\\end{table}<CR>".st.et
exec "Snippet fig \\begin{figure}[htbp]<CR>\\begin{center}<CR>\\includegraphics[width=".st."factor".et."\\textwidth]{".st."imagefile".et."}<CR>\\caption{".st."description".et."}<CR>\\label{fig:".st."name".et."}<CR>\\end{center}<CR>\\end{figure}<CR>".st.et
