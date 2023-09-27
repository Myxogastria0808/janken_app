library(shiny)
library(shinydashboard)

#読み込み
source('./ranking/ui_ranking.R', local = TRUE)
source('./roulette/ui_roulette.R', local = TRUE)

#header
header <- dashboardHeader(
    title='janken'
)

#sidebar
sidebar <- dashboardSidebar(
    sidebarUserPanel(
        "Source Code",
        subtitle = a(href = "https://github.com/Myxogastria0808", icon("github", class='fa-fw'), 'githubリンク'),
        image = "janken-gu.ico"
    ),
    sidebarMenu(
        menuItem(
            'ranking',
            tabName = 'ui_ranking',
            icon = icon('ranking-star')
        ),
        menuItem(
            'roulette',
            tabName = 'ui_roulette',
            icon = icon('percent')
        )
    )
)

#body
body <- dashboardBody(
    tags$head(
        tags$link(rel = "shortcut icon", href = "janken-gu.ico"),
        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
        tabItem_ranking,
        tabItem_roulette
    )
)

#render
shinyUI(dashboardPage(header, sidebar, body, skin='blue'))
