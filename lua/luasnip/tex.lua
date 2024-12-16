local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  -- equation stuffs
  s({ trig = ';eqn', dscr = 'Insert an equation.' }, {
    fmt(
      [[
      \begin{equation}
          <>
      \end{equation}
    ]],
      { i(1) },
      { delimiters = '<>' }
    ),
  }),

  -- figures
  s({ trig = ';fig', dscr = 'Insert a figure.' }, {
    fmt(
      [[
        \begin{figure}[H]
            \begin{center}
                \includegraphics[width=\linewidth]{<>}
            \end{center}
        \renewcommand{\baselinestretch}{1}
        \small\normalsize
        \begin{quote}
            \caption{<>}
            \label{<>}
        \end{quote}
        \end{figure}
        \renewcommand{\baselinestretch}{2}
        \small\normalsize
      ]],
      { i(1), i(2), i(3) },
      { delimeters = '<>' }
    ),
  }),
}
