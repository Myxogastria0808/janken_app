tabItem_roulette <- tabItem(
    tabName = 'ui_roulette',
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
    fluidRow(
      h1('Roulette'),
      box(
        title='Hello, this is a box component.'
      )
    )
)