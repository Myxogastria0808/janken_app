#読み込み
source('./ranking/server_ranking_env.R', local = TRUE)

ui_ranking_action_func <- eventReactive(
    input$ui_ranking_action,
    {
        if (input$ui_ranking_strategy_pattern == 'ui_ranking_1') {
            #!server ranking 1
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 1
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_1_pattern_1 == 'ui_ranking_1_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_1_pattern_1 == 'ui_ranking_1_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_1_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_1_pattern_1 == 'ui_ranking_1_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_1_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_1_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_2') {
            #!server ranking 2
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 2
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_2_pattern_1 == 'ui_ranking_2_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_2_pattern_1 == 'ui_ranking_2_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_2_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_2_pattern_1 == 'ui_ranking_2_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_2_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_2_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_2_pattern_2 == 'ui_ranking_2_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_2_pattern_2 == 'ui_ranking_2_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_2_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_2_pattern_2 == 'ui_ranking_2_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_2_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_2_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_3') {
            #!server ranking 3
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 3
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_3_pattern_1 == 'ui_ranking_3_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_3_pattern_1 == 'ui_ranking_3_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_3_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_3_pattern_1 == 'ui_ranking_3_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_3_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_3_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_3_pattern_2 == 'ui_ranking_3_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_3_pattern_2 == 'ui_ranking_3_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_3_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_3_pattern_2 == 'ui_ranking_3_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_3_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_3_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_3_pattern_3 == 'ui_ranking_3_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_3_pattern_3 == 'ui_ranking_3_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_3_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_3_pattern_3 == 'ui_ranking_3_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_3_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_3_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_4') {
            #!server ranking 4
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 4
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_4_pattern_1 == 'ui_ranking_4_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_4_pattern_1 == 'ui_ranking_4_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_4_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_4_pattern_1 == 'ui_ranking_4_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_4_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_4_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_4_pattern_2 == 'ui_ranking_4_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_4_pattern_2 == 'ui_ranking_4_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_4_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_4_pattern_2 == 'ui_ranking_4_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_4_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_4_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_4_pattern_3 == 'ui_ranking_4_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_4_pattern_3 == 'ui_ranking_4_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_4_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_4_pattern_3 == 'ui_ranking_4_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_4_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_4_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_4_pattern_4 == 'ui_ranking_4_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_4_pattern_4 == 'ui_ranking_4_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_4_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_4_pattern_4 == 'ui_ranking_4_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_4_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_4_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_5') {
            #!server ranking 5
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 5
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_5_pattern_1 == 'ui_ranking_5_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_5_pattern_1 == 'ui_ranking_5_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_5_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_5_pattern_1 == 'ui_ranking_5_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_5_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_5_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_5_pattern_2 == 'ui_ranking_5_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_5_pattern_2 == 'ui_ranking_5_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_5_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_5_pattern_2 == 'ui_ranking_5_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_5_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_5_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_5_pattern_3 == 'ui_ranking_5_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_5_pattern_3 == 'ui_ranking_5_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_5_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_5_pattern_3 == 'ui_ranking_5_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_5_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_5_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_5_pattern_4 == 'ui_ranking_5_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_5_pattern_4 == 'ui_ranking_5_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_5_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_5_pattern_4 == 'ui_ranking_5_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_5_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_5_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_ranking_5_pattern_5 == 'ui_ranking_5_pattern_5_strategy_uniform_random') {
                server_ranking_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_5_pattern_5 == 'ui_ranking_5_pattern_5_strategy_all_the_same') {
                server_ranking_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_5_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_ranking_5_pattern_5 == 'ui_ranking_5_pattern_5_strategy_cycle') {
                server_ranking_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_5_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_ranking_5_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4,
                    server_ranking_pattern_5
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_6') {
            #!server ranking 6
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 6
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_6_pattern_1 == 'ui_ranking_6_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_6_pattern_1 == 'ui_ranking_6_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_6_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_6_pattern_1 == 'ui_ranking_6_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_6_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_6_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_6_pattern_2 == 'ui_ranking_6_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_6_pattern_2 == 'ui_ranking_6_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_6_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_6_pattern_2 == 'ui_ranking_6_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_6_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_6_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_6_pattern_3 == 'ui_ranking_6_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_6_pattern_3 == 'ui_ranking_6_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_6_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_6_pattern_3 == 'ui_ranking_6_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_6_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_6_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_6_pattern_4 == 'ui_ranking_6_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_6_pattern_4 == 'ui_ranking_6_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_6_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_6_pattern_4 == 'ui_ranking_6_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_6_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_6_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_ranking_6_pattern_5 == 'ui_ranking_6_pattern_5_strategy_uniform_random') {
                server_ranking_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_6_pattern_5 == 'ui_ranking_6_pattern_5_strategy_all_the_same') {
                server_ranking_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_6_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_ranking_6_pattern_5 == 'ui_ranking_6_pattern_5_strategy_cycle') {
                server_ranking_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_6_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_ranking_6_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_ranking_6_pattern_6 == 'ui_ranking_6_pattern_6_strategy_uniform_random') {
                server_ranking_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_6_pattern_6 == 'ui_ranking_6_pattern_6_strategy_all_the_same') {
                server_ranking_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_6_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_ranking_6_pattern_6 == 'ui_ranking_6_pattern_6_strategy_cycle') {
                server_ranking_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_6_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_ranking_6_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4,
                    server_ranking_pattern_5,
                    server_ranking_pattern_6
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_7') {
            #!server ranking 7
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 7
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_7_pattern_1 == 'ui_ranking_7_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_1 == 'ui_ranking_7_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_1 == 'ui_ranking_7_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_7_pattern_2 == 'ui_ranking_7_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_2 == 'ui_ranking_7_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_2 == 'ui_ranking_7_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_7_pattern_3 == 'ui_ranking_7_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_3 == 'ui_ranking_7_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_3 == 'ui_ranking_7_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_7_pattern_4 == 'ui_ranking_7_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_4 == 'ui_ranking_7_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_4 == 'ui_ranking_7_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_ranking_7_pattern_5 == 'ui_ranking_7_pattern_5_strategy_uniform_random') {
                server_ranking_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_5 == 'ui_ranking_7_pattern_5_strategy_all_the_same') {
                server_ranking_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_5 == 'ui_ranking_7_pattern_5_strategy_cycle') {
                server_ranking_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_ranking_7_pattern_6 == 'ui_ranking_7_pattern_6_strategy_uniform_random') {
                server_ranking_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_6 == 'ui_ranking_7_pattern_6_strategy_all_the_same') {
                server_ranking_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_6 == 'ui_ranking_7_pattern_6_strategy_cycle') {
                server_ranking_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_ranking_7_pattern_7 == 'ui_ranking_7_pattern_7_strategy_uniform_random') {
                server_ranking_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_7_pattern_7 == 'ui_ranking_7_pattern_7_strategy_all_the_same') {
                server_ranking_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_7_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_ranking_7_pattern_7 == 'ui_ranking_7_pattern_7_strategy_cycle') {
                server_ranking_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_7_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_ranking_7_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4,
                    server_ranking_pattern_5,
                    server_ranking_pattern_6,
                    server_ranking_pattern_7
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_8') {
            #!server ranking 8
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 8
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_8_pattern_1 == 'ui_ranking_8_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_1 == 'ui_ranking_8_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_1 == 'ui_ranking_8_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_8_pattern_2 == 'ui_ranking_8_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_2 == 'ui_ranking_8_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_2 == 'ui_ranking_8_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_8_pattern_3 == 'ui_ranking_8_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_3 == 'ui_ranking_8_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_3 == 'ui_ranking_8_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_8_pattern_4 == 'ui_ranking_8_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_4 == 'ui_ranking_8_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_4 == 'ui_ranking_8_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_ranking_8_pattern_5 == 'ui_ranking_8_pattern_5_strategy_uniform_random') {
                server_ranking_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_5 == 'ui_ranking_8_pattern_5_strategy_all_the_same') {
                server_ranking_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_5 == 'ui_ranking_8_pattern_5_strategy_cycle') {
                server_ranking_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_ranking_8_pattern_6 == 'ui_ranking_8_pattern_6_strategy_uniform_random') {
                server_ranking_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_6 == 'ui_ranking_8_pattern_6_strategy_all_the_same') {
                server_ranking_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_6 == 'ui_ranking_8_pattern_6_strategy_cycle') {
                server_ranking_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_ranking_8_pattern_7 == 'ui_ranking_8_pattern_7_strategy_uniform_random') {
                server_ranking_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_7 == 'ui_ranking_8_pattern_7_strategy_all_the_same') {
                server_ranking_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_7 == 'ui_ranking_8_pattern_7_strategy_cycle') {
                server_ranking_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_8
            if (input$ui_ranking_8_pattern_8 == 'ui_ranking_8_pattern_8_strategy_uniform_random') {
                server_ranking_pattern_8 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_8_pattern_8 == 'ui_ranking_8_pattern_8_strategy_all_the_same') {
                server_ranking_pattern_8 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_8_pattern_8_strategy_all_the_same
                )
            } else if (input$ui_ranking_8_pattern_8 == 'ui_ranking_8_pattern_8_strategy_cycle') {
                server_ranking_pattern_8 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_8_pattern_8_strategy_cycle_cycle,
                    first_number = input$ui_ranking_8_pattern_8_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4,
                    server_ranking_pattern_5,
                    server_ranking_pattern_6,
                    server_ranking_pattern_7,
                    server_ranking_pattern_8
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_9') {
            #!sever ranking 9 
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 9
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_9_pattern_1 == 'ui_ranking_9_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_1 == 'ui_ranking_9_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_1 == 'ui_ranking_9_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_9_pattern_2 == 'ui_ranking_9_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_2 == 'ui_ranking_9_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_2 == 'ui_ranking_9_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_9_pattern_3 == 'ui_ranking_9_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_3 == 'ui_ranking_9_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_3 == 'ui_ranking_9_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_9_pattern_4 == 'ui_ranking_9_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_4 == 'ui_ranking_9_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_4 == 'ui_ranking_9_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_ranking_9_pattern_5 == 'ui_ranking_9_pattern_5_strategy_uniform_random') {
                server_ranking_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_5 == 'ui_ranking_9_pattern_5_strategy_all_the_same') {
                server_ranking_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_5 == 'ui_ranking_9_pattern_5_strategy_cycle') {
                server_ranking_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_ranking_9_pattern_6 == 'ui_ranking_9_pattern_6_strategy_uniform_random') {
                server_ranking_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_6 == 'ui_ranking_9_pattern_6_strategy_all_the_same') {
                server_ranking_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_6 == 'ui_ranking_9_pattern_6_strategy_cycle') {
                server_ranking_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_ranking_9_pattern_7 == 'ui_ranking_9_pattern_7_strategy_uniform_random') {
                server_ranking_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_7 == 'ui_ranking_9_pattern_7_strategy_all_the_same') {
                server_ranking_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_7 == 'ui_ranking_9_pattern_7_strategy_cycle') {
                server_ranking_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_8
            if (input$ui_ranking_9_pattern_8 == 'ui_ranking_9_pattern_8_strategy_uniform_random') {
                server_ranking_pattern_8 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_8 == 'ui_ranking_9_pattern_8_strategy_all_the_same') {
                server_ranking_pattern_8 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_8_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_8 == 'ui_ranking_9_pattern_8_strategy_cycle') {
                server_ranking_pattern_8 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_8_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_8_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_9
            if (input$ui_ranking_9_pattern_9 == 'ui_ranking_9_pattern_9_strategy_uniform_random') {
                server_ranking_pattern_9 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_9_pattern_9 == 'ui_ranking_9_pattern_9_strategy_all_the_same') {
                server_ranking_pattern_9 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_9_pattern_9_strategy_all_the_same
                )
            } else if (input$ui_ranking_9_pattern_9 == 'ui_ranking_9_pattern_9_strategy_cycle') {
                server_ranking_pattern_9 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_9_pattern_9_strategy_cycle_cycle,
                    first_number = input$ui_ranking_9_pattern_9_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4,
                    server_ranking_pattern_5,
                    server_ranking_pattern_6,
                    server_ranking_pattern_7,
                    server_ranking_pattern_8,
                    server_ranking_pattern_9
                )
            )

        } else if (input$ui_ranking_strategy_pattern == 'ui_ranking_10') {
            #!server ranking 10
            #TODO 設定パラメーター
            server_ranking_group_size <- input$ui_ranking_group_size
            server_ranking_the_number_of_times <- input$ui_ranking_the_number_of_times
            server_ranking_strategy_pattern <- 10
            server_ranking_how_to_generate <- as.integer(input$ui_ranking_how_to_generate)
            server_ranking_equal_ratio <- input$ui_ranking_equal_ratio
            server_ranking_ratio <- input$ui_ranking_ratio
            server_ranking_win_point <- input$ui_ranking_win_point
            server_ranking_lose_point <- input$ui_ranking_lose_point
            server_ranking_draw_point <- input$ui_ranking_draw_point
            server_ranking_generation <- input$ui_ranking_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_ranking_10_pattern_1 == 'ui_ranking_10_pattern_1_strategy_uniform_random') {
                server_ranking_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_1 == 'ui_ranking_10_pattern_1_strategy_all_the_same') {
                server_ranking_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_1 == 'ui_ranking_10_pattern_1_strategy_cycle') {
                server_ranking_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_ranking_10_pattern_2 == 'ui_ranking_10_pattern_2_strategy_uniform_random') {
                server_ranking_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_2 == 'ui_ranking_10_pattern_2_strategy_all_the_same') {
                server_ranking_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_2 == 'ui_ranking_10_pattern_2_strategy_cycle') {
                server_ranking_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_ranking_10_pattern_3 == 'ui_ranking_10_pattern_3_strategy_uniform_random') {
                server_ranking_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_3 == 'ui_ranking_10_pattern_3_strategy_all_the_same') {
                server_ranking_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_3 == 'ui_ranking_10_pattern_3_strategy_cycle') {
                server_ranking_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_ranking_10_pattern_4 == 'ui_ranking_10_pattern_4_strategy_uniform_random') {
                server_ranking_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_4 == 'ui_ranking_10_pattern_4_strategy_all_the_same') {
                server_ranking_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_4 == 'ui_ranking_10_pattern_4_strategy_cycle') {
                server_ranking_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_ranking_10_pattern_5 == 'ui_ranking_10_pattern_5_strategy_uniform_random') {
                server_ranking_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_5 == 'ui_ranking_10_pattern_5_strategy_all_the_same') {
                server_ranking_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_5 == 'ui_ranking_10_pattern_5_strategy_cycle') {
                server_ranking_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_ranking_10_pattern_6 == 'ui_ranking_10_pattern_6_strategy_uniform_random') {
                server_ranking_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_6 == 'ui_ranking_10_pattern_6_strategy_all_the_same') {
                server_ranking_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_6 == 'ui_ranking_10_pattern_6_strategy_cycle') {
                server_ranking_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_ranking_10_pattern_7 == 'ui_ranking_10_pattern_7_strategy_uniform_random') {
                server_ranking_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_7 == 'ui_ranking_10_pattern_7_strategy_all_the_same') {
                server_ranking_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_7 == 'ui_ranking_10_pattern_7_strategy_cycle') {
                server_ranking_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_8
            if (input$ui_ranking_10_pattern_8 == 'ui_ranking_10_pattern_8_strategy_uniform_random') {
                server_ranking_pattern_8 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_8 == 'ui_ranking_10_pattern_8_strategy_all_the_same') {
                server_ranking_pattern_8 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_8_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_8 == 'ui_ranking_10_pattern_8_strategy_cycle') {
                server_ranking_pattern_8 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_8_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_8_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_9
            if (input$ui_ranking_10_pattern_9 == 'ui_ranking_10_pattern_9_strategy_uniform_random') {
                server_ranking_pattern_9 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_9 == 'ui_ranking_10_pattern_9_strategy_all_the_same') {
                server_ranking_pattern_9 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_9_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_9 == 'ui_ranking_10_pattern_9_strategy_cycle') {
                server_ranking_pattern_9 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_9_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_9_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_10
            if (input$ui_ranking_10_pattern_10 == 'ui_ranking_10_pattern_10_strategy_uniform_random') {
                server_ranking_pattern_10 <- strategy_uniform_random(
                    the_number_of_times = server_ranking_the_number_of_times
                )
            } else if (input$ui_ranking_10_pattern_10 == 'ui_ranking_10_pattern_10_strategy_all_the_same') {
                server_ranking_pattern_10 <- strategy_all_the_same(
                    the_number_of_times = server_ranking_the_number_of_times,
                    number = input$ui_ranking_10_pattern_10_strategy_all_the_same
                )
            } else if (input$ui_ranking_10_pattern_10 == 'ui_ranking_10_pattern_10_strategy_cycle') {
                server_ranking_pattern_10 <- strategy_cycle(
                    the_number_of_times = server_ranking_the_number_of_times,
                    cycle = input$ui_ranking_10_pattern_10_strategy_cycle_cycle,
                    first_number = input$ui_ranking_10_pattern_10_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_ranking_data <- server_ranking_gen_group(
                group_size = server_ranking_group_size,
                strategy_pattern = server_ranking_strategy_pattern
            )
            return(
                list(
                    server_ranking_data,
                    server_ranking_group_size,
                    server_ranking_the_number_of_times,
                    server_ranking_strategy_pattern,
                    server_ranking_how_to_generate,
                    server_ranking_equal_ratio,
                    server_ranking_ratio,
                    server_ranking_win_point,
                    server_ranking_lose_point,
                    server_ranking_draw_point,
                    server_ranking_generation,
                    server_ranking_pattern_1,
                    server_ranking_pattern_2,
                    server_ranking_pattern_3,
                    server_ranking_pattern_4,
                    server_ranking_pattern_5,
                    server_ranking_pattern_6,
                    server_ranking_pattern_7,
                    server_ranking_pattern_8,
                    server_ranking_pattern_9,
                    server_ranking_pattern_10
                )
            )
        } else {
            stop('An expected error!')
        }
    }
)
