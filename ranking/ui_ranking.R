tabItem_ranking <- tabItem(
    tabName = "ui_ranking",
    fluidRow(
        box(
            title ="Graph",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = '100%',
            plotOutput(
                outputId = 'ui_ranking_graph',
                width = '100%'
            )
        ),
        box(
            title ="action",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = '100%',
            actionButton(
                inputId = 'ui_ranking_action',
                label = 'ui_ranking_action',
                icon = icon('start'),
                width = '300px'
            )
        ),
    ),
    fluidRow(
        h1("Ranking"),
        box(
            title ="group_size",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_group_size',
                label = 'group_size',
                10,
                min = 10,
                max = NA,
                step = 1
            )
        ),
        box(
            title ="the_number_of_times",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_the_number_of_times',
                label = 'the_number_of_times',
                1,
                min = 1,
                max = NA,
                step = 1
            )
        ),
        box(
            title ="generation",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_generation',
                label = 'generation',
                100,
                min = 1,
                max = NA,
                step = 1
            )
        ),
        box(
            title ="win_point",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_win_point',
                label = 'win_point',
                10,
                min = 0,
                max = NA,
                step = 1
            )
        ),
        box(
            title ="lose_point",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_lose_point',
                label = 'lose_point',
                0,
                min = 0,
                max = NA,
                step = 1
            )
        ),
        box(
            title ="draw_point",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_draw_point',
                label = 'draw_point',
                1,
                min = 0,
                max = NA,
                step = 1
            )
        ),
        box(
            title ="ratio",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            numericInput(
                inputId = 'ui_ranking_ratio',
                label = 'ratio',
                0.9,
                min = 0,
                max = 1,
                step = 0.01
            )
        ),
        box(
            title ="how_to_generate",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            selectInput(
                inputId = 'ui_ranking_how_to_generate',
                label = 'how_to_generate',
                choices = c(
                    'random' = '1',
                    'ratio' = '2'
                )
            ),
            conditionalPanel(
                condition = "input.ui_ranking_how_to_generate == '2'",
                numericInput(
                    inputId = 'ui_ranking_equal_ratio',
                    label = 'equal_ratio',
                    0.5,
                    min = 0,
                    max = 1,
                    step = 0.01
                )
            )
        )
    ),
    #TODO 頭狂っているポイント
    fluidRow(
        box(
            title ="strategy_pattern",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = '100%',
            selectInput(
                inputId = 'ui_ranking_strategy_pattern',
                label = 'strategy_pattern',
                choices = c(
                    '1' = 'ui_ranking_1',
                    '2' = 'ui_ranking_2',
                    '3' = 'ui_ranking_3',
                    '4' = 'ui_ranking_4',
                    '5' = 'ui_ranking_5',
                    '6' = 'ui_ranking_6',
                    '7' = 'ui_ranking_7',
                    '8' = 'ui_ranking_8',
                    '9' = 'ui_ranking_9',
                    '10' = 'ui_ranking_10'
                )
            )
            # width = '90%'
        ),
        #TODO ここから分岐
        #TODO: 1
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_1'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                        'strategy_uniform_random' = 'strategy_uniform_random',
                        'strategy_all_the_same' = 'strategy_all_the_same',
                        'strategy_cycle' = 'strategy_cycle'
                    )
                )
            )
        ),
        #TODO: 2
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_2'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      'strategy_uniform_random' = 'strategy_uniform_random',
                      'strategy_all_the_same' = 'strategy_all_the_same',
                      'strategy_cycle' = 'strategy_cycle'
                    )
                ),
            )
        ),
        #TODO: 3
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_3'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 4
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_4'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 5
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_5'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 6
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_6'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 7
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_7'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 8
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_8'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 9
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_9'",
            box(
                title = '',
                selectInput(
                    inputId = '1',
                    label = '1',
                    choices = c(
                      '1' = '1',
                      '2' = '2'
                    )
                )
            )
        ),
        #TODO: 10
        conditionalPanel(
            condition = "input.ui_ranking_strategy_pattern == 'ui_ranking_10'",
            #TODO: 10 pattern_1
            box(
                title = 'pattern 1',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_1',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_1_strategy_uniform_random' = 'ui_ranking_10_pattern_1_strategy_uniform_random',
                        'ui_ranking_10_pattern_1_strategy_all_the_same' = 'ui_ranking_10_pattern_1_strategy_all_the_same',
                        'ui_ranking_10_pattern_1_strategy_cycle' = 'ui_ranking_10_pattern_1_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_1 == 'ui_ranking_10_pattern_1_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_1_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_1 == 'ui_ranking_10_pattern_1_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_1_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_1_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_2
            box(
                title = 'pattern 2',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_2',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_2_strategy_uniform_random' = 'ui_ranking_10_pattern_2_strategy_uniform_random',
                        'ui_ranking_10_pattern_2_strategy_all_the_same' = 'ui_ranking_10_pattern_2_strategy_all_the_same',
                        'ui_ranking_10_pattern_2_strategy_cycle' = 'ui_ranking_10_pattern_2_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_2 == 'ui_ranking_10_pattern_2_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_2_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_2 == 'ui_ranking_10_pattern_2_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_2_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_2_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_3
            box(
                title = 'pattern 3',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_3',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_3_strategy_uniform_random' = 'ui_ranking_10_pattern_3_strategy_uniform_random',
                        'ui_ranking_10_pattern_3_strategy_all_the_same' = 'ui_ranking_10_pattern_3_strategy_all_the_same',
                        'ui_ranking_10_pattern_3_strategy_cycle' = 'ui_ranking_10_pattern_3_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_3 == 'ui_ranking_10_pattern_3_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_3_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_3 == 'ui_ranking_10_pattern_3_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_3_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_3_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_4
            box(
                title = 'pattern 4',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_4',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_4_strategy_uniform_random' = 'ui_ranking_10_pattern_4_strategy_uniform_random',
                        'ui_ranking_10_pattern_4_strategy_all_the_same' = 'ui_ranking_10_pattern_4_strategy_all_the_same',
                        'ui_ranking_10_pattern_4_strategy_cycle' = 'ui_ranking_10_pattern_4_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_4 == 'ui_ranking_10_pattern_4_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_4_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_4 == 'ui_ranking_10_pattern_4_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_4_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_4_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_5
            box(
                title = 'pattern 5',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_5',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_5_strategy_uniform_random' = 'ui_ranking_10_pattern_5_strategy_uniform_random',
                        'ui_ranking_10_pattern_5_strategy_all_the_same' = 'ui_ranking_10_pattern_5_strategy_all_the_same',
                        'ui_ranking_10_pattern_5_strategy_cycle' = 'ui_ranking_10_pattern_5_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_5 == 'ui_ranking_10_pattern_5_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_5_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_5 == 'ui_ranking_10_pattern_5_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_5_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_5_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_6
            box(
                title = 'pattern 6',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_6',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_6_strategy_uniform_random' = 'ui_ranking_10_pattern_6_strategy_uniform_random',
                        'ui_ranking_10_pattern_6_strategy_all_the_same' = 'ui_ranking_10_pattern_6_strategy_all_the_same',
                        'ui_ranking_10_pattern_6_strategy_cycle' = 'ui_ranking_10_pattern_6_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_6 == 'ui_ranking_10_pattern_6_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_6_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_6 == 'ui_ranking_10_pattern_6_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_6_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_6_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_7
            box(
                title = 'pattern 7',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_7',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_7_strategy_uniform_random' = 'ui_ranking_10_pattern_7_strategy_uniform_random',
                        'ui_ranking_10_pattern_7_strategy_all_the_same' = 'ui_ranking_10_pattern_7_strategy_all_the_same',
                        'ui_ranking_10_pattern_7_strategy_cycle' = 'ui_ranking_10_pattern_7_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_7 == 'ui_ranking_10_pattern_7_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_7_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_7 == 'ui_ranking_10_pattern_7_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_7_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_7_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_8
            box(
                title = 'pattern 8',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_8',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_8_strategy_uniform_random' = 'ui_ranking_10_pattern_8_strategy_uniform_random',
                        'ui_ranking_10_pattern_8_strategy_all_the_same' = 'ui_ranking_10_pattern_8_strategy_all_the_same',
                        'ui_ranking_10_pattern_8_strategy_cycle' = 'ui_ranking_10_pattern_8_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_8 == 'ui_ranking_10_pattern_8_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_8_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_8 == 'ui_ranking_10_pattern_8_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_8_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_8_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_9
            box(
                title = 'pattern 9',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_9',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_9_strategy_uniform_random' = 'ui_ranking_10_pattern_9_strategy_uniform_random',
                        'ui_ranking_10_pattern_9_strategy_all_the_same' = 'ui_ranking_10_pattern_9_strategy_all_the_same',
                        'ui_ranking_10_pattern_9_strategy_cycle' = 'ui_ranking_10_pattern_9_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_9 == 'ui_ranking_10_pattern_9_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_9_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_9 == 'ui_ranking_10_pattern_9_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_9_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_9_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            ),
            #TODO: 10 pattern_10
            box(
                title = 'pattern 10',
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                    inputId = 'ui_ranking_10_pattern_10',
                    label = '',
                    choices = c(
                        'ui_ranking_10_pattern_10_strategy_uniform_random' = 'ui_ranking_10_pattern_10_strategy_uniform_random',
                        'ui_ranking_10_pattern_10_strategy_all_the_same' = 'ui_ranking_10_pattern_10_strategy_all_the_same',
                        'ui_ranking_10_pattern_10_strategy_cycle' = 'ui_ranking_10_pattern_10_strategy_cycle'
                    )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_10 == 'ui_ranking_10_pattern_10_strategy_all_the_same'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_10_strategy_all_the_same',
                            label = 'number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                ),
                conditionalPanel(
                    condition = "input.ui_ranking_10_pattern_10 == 'ui_ranking_10_pattern_10_strategy_cycle'",
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_10_strategy_cycle_cycle',
                            label = 'cycle',
                            1,
                            min = 1,
                            max = NA,
                            step = 1
                        ),
                        numericInput(
                            inputId = 'ui_ranking_10_pattern_10_strategy_cycle_first_number',
                            label = 'first_number',
                            1,
                            min = 1,
                            max = 3,
                            step = 1
                        )
                )
            )
        )
    )
)