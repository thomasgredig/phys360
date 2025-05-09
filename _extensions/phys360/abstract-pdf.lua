function Meta(meta)
  if meta.abstract then
    local abstract_text = pandoc.utils.stringify(meta.abstract)

    -- Add the tcolorbox package and custom abstract environment
    meta["header-includes"] = meta["header-includes"] or {}
    table.insert(meta["header-includes"],
      pandoc.RawBlock("latex", [[
\usepackage[most]{tcolorbox}

\newtcolorbox{myabstractbox}{
  colback=gray!15,
  colframe=black,
  boxrule=0.5pt,
  arc=4pt,
  left=6pt,
  right=6pt,
  top=6pt,
  bottom=6pt,
  width=\textwidth,
  enlarge left by=0mm,
  before skip=12pt,
  after skip=20pt
}
]])
    )

    -- Inject the abstract in the before-body section
    quarto.doc.include_text("before-body", string.format([[
\begin{myabstractbox}
\textbf{Abstract:} %s
\end{myabstractbox}
]], abstract_text))
  end
  return meta
end


