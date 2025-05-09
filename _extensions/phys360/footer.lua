function Meta(meta)
  if meta.author then
    local author_name = pandoc.utils.stringify(meta.author)

    meta["header-includes"] = meta["header-includes"] or {}
    table.insert(meta["header-includes"],
      pandoc.RawBlock("latex", string.format([[
\usepackage{fancyhdr}
\usepackage{lastpage}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[L]{\footnotesize{%s}}
\fancyfoot[C]{\footnotesize{PHYS 360 REPORT}}
\fancyfoot[R]{\footnotesize{\thepage\ of \pageref{LastPage}}}
      ]], author_name))
    )
  end
  return meta
end
