local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

ls.add_snippets('tex', {
  -- equation stuffs
  s({ trig = ';eqn', dscr = 'Insert an equation.' }, {
    unpack(fmta(
      [[
      \begin{equation}
          <1>
      \end{equation}
      ]],
      i(1, 'Maths go here.')
    )),
  }),
  -- symbols
  s({ trig = ';a', dscr = 'Greek lower-case letter alpha' }, {
    t '$\\alpha$',
  }),
  s({ trig = ';b', dscr = 'Greek lower-case letter beta' }, {
    t '$\\beta$',
  }),
  s({ trig = ';g', dscr = 'Greek lower-case letter gamma' }, {
    t '$\\gamma$',
  }),
  s({ trig = ';e', dscr = 'Greek lower-case letter epsilon' }, {
    t '$\\epsilon$',
  }),
  s({ trig = ';Ms', dscr = 'Insert martensite start temperature.' }, {
    t '$M_\\text{{s}}$',
  }),

  -- figures
  s({ trig = ';fig', dscr = 'Insert a figure.' }, {
    unpack(fmta(
      [[
        \begin{figure}[H]
            \begin{center}
                \includegraphics[width=<1>]{<2>}
            \end{center}
        \renewcommand{\baselinestretch}{1}
        \small\normalsize
        \begin{quote}
            \caption{<3>}
            \label{<4>}
        \end{quote}
        \end{figure}
        \renewcommand{\baselinestretch}{2}
        \small\normalsize
      ]],
      { i(1, '\\linewidth'), i(2), i(3), i(4) }
    )),
  }),
})
