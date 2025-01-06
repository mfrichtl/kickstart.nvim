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
  -- Maths symbols
  s({ trig = ';deg', dscr = 'Degree symbol.' }, {
    t '^\\circ',
  }),
  -- Greek letters
  s({ trig = ';a', dscr = 'Greek lower-case letter alpha' }, {
    t '\\alpha',
  }),
  s({ trig = ';b', dscr = 'Greek lower-case letter beta' }, {
    t '\\beta',
  }),
  s({ trig = ';g', dscr = 'Greek lower-case letter gamma' }, {
    t '\\gamma',
  }),
  s({ trig = ';e', dscr = 'Greek lower-case letter epsilon' }, {
    t '\\epsilon',
  }),
  -- General materials science stuffs
  s({ trig = ';Gm', dscr = 'Molar Gibbs energy' }, {
    t 'G_\\text{m}',
  }),
  s({ trig = ';k2s2o5', dscr = 'Potassium metabisulfite' }, {
    t '\\BPChem{K\\_2S\\_2O\\_5}',
  }),
  s({ trig = ';na2s2o5', dscr = 'Sodium metabisulfite' }, {
    t '\\BPChem{Na\\_2S\\_2O\\_5}',
  }),
  -- Requires defining \wtpercent in siunitx and BPChem package
  s({ trig = ';wt%', dscr = 'Element by weight percent' }, {
    unpack(fmta('\\qty{<1>}{\\wtpercent}~\\BPChem{<2>}', { i(1), i(2) })),
  }),
  -- steel-related symbols
  s({ trig = ';Ac1', dscr = 'Ac1 Temperature.' }, {
    t 'A_\\text{c1}',
  }),
  s({ trig = ';Ac3', dscr = 'Ac3 Temperature.' }, {
    t 'A_\\text{c3}',
  }),
  s({ trig = ';Ae1', dscr = 'Ae1 Temperature.' }, {
    t 'A_\\text{e1}',
  }),
  s({ trig = ';Ae3', dscr = 'Ae3 Temperature.' }, {
    t 'A_\\text{e3}',
  }),
  s({ trig = ';DGa', dscr = 'Driving Force for lath/plate martensite.' }, {
    t '\\Delta G_\\text{m}^{\\alpha \\rightarrow \\gamma}',
  }),
  s({ trig = ';DGe', dscr = 'Driving Force for epsilon martensite.' }, {
    t '\\Delta G_\\text{m}^{\\epsilon \\rightarrow \\gamma}',
  }),
  s({ trig = ';M7C3', dscr = 'Insert M7C3 (carbide).' }, {
    t '\\BPChem{M\\_7C\\_3}',
  }),
  s({ trig = ';M23C6', dscr = 'Insert M23C6 (carbide).' }, {
    t '\\BPChem{M\\_{23}C\\_6',
  }),
  s({ trig = ';Ms', dscr = 'Insert martensite start temperature.' }, {
    t 'M_\\text{s}',
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
            \label{figure:<4>}
        \end{quote}
        \end{figure}
        \renewcommand{\baselinestretch}{2}
        \small\normalsize

      ]],
      { i(1, '\\linewidth'), i(2), i(3), i(4) }
    )),
  }),

  -- Tables
  s({ trig = ';tab', dscr = 'Insert a table.' }, {
    unpack(fmta(
      [[

        \begin{table}[h]
            \caption{<1>}
            \label{table:<2>}
            \begin{center}
                \begin{tabular}{<3>}
                    \toprule
                    <4>
                    \midrule
                    <5>
                    \bottomrule
                \end{tabular}
            \end{center}
        \end{table}

      ]],
      { i(1), i(2), i(3), i(4), i(5) }
    )),
  }),
  s({ trig = ';tn', dscr = 'Insert siunitx tablenum.' }, {
    unpack(fmta('\\tablenum{<1>}', { i(1) })),
  }),
  s({ trig = ';tq', dscr = 'Insert siunitx tableqty.' }, {
    unpack(fmta('\\tableqty{<1>}{<2>}', { i(1), i(2) })),
  }),
})
