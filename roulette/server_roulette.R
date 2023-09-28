#読み込み
source('./roulette/server_roulette_env.R', local = TRUE)

ui_roulette_action_func <- eventReactive(
    input$ui_roulette_action,
    {
        if (input$ui_roulette_strategy_pattern == 'ui_roulette_1') {
            #!server roulette 1
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 1
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_1_pattern_1 == 'ui_roulette_1_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_1_pattern_1 == 'ui_roulette_1_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_1_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_1_pattern_1 == 'ui_roulette_1_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_1_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_1_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_2') {
            #!server roulette 2
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 2
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_2_pattern_1 == 'ui_roulette_2_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_2_pattern_1 == 'ui_roulette_2_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_2_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_2_pattern_1 == 'ui_roulette_2_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_2_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_2_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_2_pattern_2 == 'ui_roulette_2_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_2_pattern_2 == 'ui_roulette_2_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_2_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_2_pattern_2 == 'ui_roulette_2_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_2_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_2_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_3') {
            #!server roulette 3
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 3
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_3_pattern_1 == 'ui_roulette_3_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_3_pattern_1 == 'ui_roulette_3_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_3_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_3_pattern_1 == 'ui_roulette_3_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_3_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_3_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_3_pattern_2 == 'ui_roulette_3_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_3_pattern_2 == 'ui_roulette_3_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_3_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_3_pattern_2 == 'ui_roulette_3_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_3_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_3_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_3_pattern_3 == 'ui_roulette_3_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_3_pattern_3 == 'ui_roulette_3_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_3_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_3_pattern_3 == 'ui_roulette_3_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_3_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_3_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_4') {
            #!server roulette 4
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 4
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_4_pattern_1 == 'ui_roulette_4_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_4_pattern_1 == 'ui_roulette_4_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_4_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_4_pattern_1 == 'ui_roulette_4_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_4_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_4_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_4_pattern_2 == 'ui_roulette_4_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_4_pattern_2 == 'ui_roulette_4_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_4_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_4_pattern_2 == 'ui_roulette_4_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_4_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_4_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_4_pattern_3 == 'ui_roulette_4_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_4_pattern_3 == 'ui_roulette_4_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_4_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_4_pattern_3 == 'ui_roulette_4_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_4_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_4_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_4_pattern_4 == 'ui_roulette_4_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_4_pattern_4 == 'ui_roulette_4_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_4_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_4_pattern_4 == 'ui_roulette_4_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_4_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_4_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_5') {
            #!server roulette 5
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 5
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_5_pattern_1 == 'ui_roulette_5_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_5_pattern_1 == 'ui_roulette_5_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_5_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_5_pattern_1 == 'ui_roulette_5_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_5_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_5_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_5_pattern_2 == 'ui_roulette_5_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_5_pattern_2 == 'ui_roulette_5_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_5_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_5_pattern_2 == 'ui_roulette_5_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_5_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_5_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_5_pattern_3 == 'ui_roulette_5_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_5_pattern_3 == 'ui_roulette_5_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_5_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_5_pattern_3 == 'ui_roulette_5_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_5_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_5_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_5_pattern_4 == 'ui_roulette_5_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_5_pattern_4 == 'ui_roulette_5_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_5_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_5_pattern_4 == 'ui_roulette_5_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_5_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_5_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_roulette_5_pattern_5 == 'ui_roulette_5_pattern_5_strategy_uniform_random') {
                server_roulette_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_5_pattern_5 == 'ui_roulette_5_pattern_5_strategy_all_the_same') {
                server_roulette_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_5_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_roulette_5_pattern_5 == 'ui_roulette_5_pattern_5_strategy_cycle') {
                server_roulette_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_5_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_roulette_5_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4,
                    server_roulette_pattern_5
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_6') {
            #!server roulette 6
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 6
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_6_pattern_1 == 'ui_roulette_6_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_6_pattern_1 == 'ui_roulette_6_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_6_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_6_pattern_1 == 'ui_roulette_6_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_6_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_6_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_6_pattern_2 == 'ui_roulette_6_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_6_pattern_2 == 'ui_roulette_6_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_6_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_6_pattern_2 == 'ui_roulette_6_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_6_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_6_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_6_pattern_3 == 'ui_roulette_6_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_6_pattern_3 == 'ui_roulette_6_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_6_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_6_pattern_3 == 'ui_roulette_6_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_6_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_6_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_6_pattern_4 == 'ui_roulette_6_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_6_pattern_4 == 'ui_roulette_6_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_6_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_6_pattern_4 == 'ui_roulette_6_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_6_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_6_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_roulette_6_pattern_5 == 'ui_roulette_6_pattern_5_strategy_uniform_random') {
                server_roulette_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_6_pattern_5 == 'ui_roulette_6_pattern_5_strategy_all_the_same') {
                server_roulette_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_6_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_roulette_6_pattern_5 == 'ui_roulette_6_pattern_5_strategy_cycle') {
                server_roulette_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_6_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_roulette_6_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_roulette_6_pattern_6 == 'ui_roulette_6_pattern_6_strategy_uniform_random') {
                server_roulette_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_6_pattern_6 == 'ui_roulette_6_pattern_6_strategy_all_the_same') {
                server_roulette_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_6_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_roulette_6_pattern_6 == 'ui_roulette_6_pattern_6_strategy_cycle') {
                server_roulette_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_6_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_roulette_6_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4,
                    server_roulette_pattern_5,
                    server_roulette_pattern_6
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_7') {
            #!server roulette 7
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 7
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_7_pattern_1 == 'ui_roulette_7_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_1 == 'ui_roulette_7_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_1 == 'ui_roulette_7_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_7_pattern_2 == 'ui_roulette_7_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_2 == 'ui_roulette_7_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_2 == 'ui_roulette_7_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_7_pattern_3 == 'ui_roulette_7_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_3 == 'ui_roulette_7_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_3 == 'ui_roulette_7_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_7_pattern_4 == 'ui_roulette_7_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_4 == 'ui_roulette_7_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_4 == 'ui_roulette_7_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_roulette_7_pattern_5 == 'ui_roulette_7_pattern_5_strategy_uniform_random') {
                server_roulette_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_5 == 'ui_roulette_7_pattern_5_strategy_all_the_same') {
                server_roulette_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_5 == 'ui_roulette_7_pattern_5_strategy_cycle') {
                server_roulette_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_roulette_7_pattern_6 == 'ui_roulette_7_pattern_6_strategy_uniform_random') {
                server_roulette_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_6 == 'ui_roulette_7_pattern_6_strategy_all_the_same') {
                server_roulette_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_6 == 'ui_roulette_7_pattern_6_strategy_cycle') {
                server_roulette_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_roulette_7_pattern_7 == 'ui_roulette_7_pattern_7_strategy_uniform_random') {
                server_roulette_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_7_pattern_7 == 'ui_roulette_7_pattern_7_strategy_all_the_same') {
                server_roulette_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_7_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_roulette_7_pattern_7 == 'ui_roulette_7_pattern_7_strategy_cycle') {
                server_roulette_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_7_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_roulette_7_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4,
                    server_roulette_pattern_5,
                    server_roulette_pattern_6,
                    server_roulette_pattern_7
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_8') {
            #!server roulette 8
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 8
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_8_pattern_1 == 'ui_roulette_8_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_1 == 'ui_roulette_8_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_1 == 'ui_roulette_8_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_8_pattern_2 == 'ui_roulette_8_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_2 == 'ui_roulette_8_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_2 == 'ui_roulette_8_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_8_pattern_3 == 'ui_roulette_8_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_3 == 'ui_roulette_8_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_3 == 'ui_roulette_8_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_8_pattern_4 == 'ui_roulette_8_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_4 == 'ui_roulette_8_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_4 == 'ui_roulette_8_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_roulette_8_pattern_5 == 'ui_roulette_8_pattern_5_strategy_uniform_random') {
                server_roulette_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_5 == 'ui_roulette_8_pattern_5_strategy_all_the_same') {
                server_roulette_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_5 == 'ui_roulette_8_pattern_5_strategy_cycle') {
                server_roulette_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_roulette_8_pattern_6 == 'ui_roulette_8_pattern_6_strategy_uniform_random') {
                server_roulette_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_6 == 'ui_roulette_8_pattern_6_strategy_all_the_same') {
                server_roulette_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_6 == 'ui_roulette_8_pattern_6_strategy_cycle') {
                server_roulette_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_roulette_8_pattern_7 == 'ui_roulette_8_pattern_7_strategy_uniform_random') {
                server_roulette_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_7 == 'ui_roulette_8_pattern_7_strategy_all_the_same') {
                server_roulette_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_7 == 'ui_roulette_8_pattern_7_strategy_cycle') {
                server_roulette_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_8
            if (input$ui_roulette_8_pattern_8 == 'ui_roulette_8_pattern_8_strategy_uniform_random') {
                server_roulette_pattern_8 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_8_pattern_8 == 'ui_roulette_8_pattern_8_strategy_all_the_same') {
                server_roulette_pattern_8 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_8_pattern_8_strategy_all_the_same
                )
            } else if (input$ui_roulette_8_pattern_8 == 'ui_roulette_8_pattern_8_strategy_cycle') {
                server_roulette_pattern_8 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_8_pattern_8_strategy_cycle_cycle,
                    first_number = input$ui_roulette_8_pattern_8_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4,
                    server_roulette_pattern_5,
                    server_roulette_pattern_6,
                    server_roulette_pattern_7,
                    server_roulette_pattern_8
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_9') {
            #!sever ranking 9 
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 9
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_9_pattern_1 == 'ui_roulette_9_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_1 == 'ui_roulette_9_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_1 == 'ui_roulette_9_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_9_pattern_2 == 'ui_roulette_9_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_2 == 'ui_roulette_9_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_2 == 'ui_roulette_9_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_9_pattern_3 == 'ui_roulette_9_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_3 == 'ui_roulette_9_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_3 == 'ui_roulette_9_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_9_pattern_4 == 'ui_roulette_9_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_4 == 'ui_roulette_9_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_4 == 'ui_roulette_9_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_roulette_9_pattern_5 == 'ui_roulette_9_pattern_5_strategy_uniform_random') {
                server_roulette_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_5 == 'ui_roulette_9_pattern_5_strategy_all_the_same') {
                server_roulette_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_5 == 'ui_roulette_9_pattern_5_strategy_cycle') {
                server_roulette_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_roulette_9_pattern_6 == 'ui_roulette_9_pattern_6_strategy_uniform_random') {
                server_roulette_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_6 == 'ui_roulette_9_pattern_6_strategy_all_the_same') {
                server_roulette_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_6 == 'ui_roulette_9_pattern_6_strategy_cycle') {
                server_roulette_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_roulette_9_pattern_7 == 'ui_roulette_9_pattern_7_strategy_uniform_random') {
                server_roulette_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_7 == 'ui_roulette_9_pattern_7_strategy_all_the_same') {
                server_roulette_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_7 == 'ui_roulette_9_pattern_7_strategy_cycle') {
                server_roulette_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_8
            if (input$ui_roulette_9_pattern_8 == 'ui_roulette_9_pattern_8_strategy_uniform_random') {
                server_roulette_pattern_8 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_8 == 'ui_roulette_9_pattern_8_strategy_all_the_same') {
                server_roulette_pattern_8 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_8_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_8 == 'ui_roulette_9_pattern_8_strategy_cycle') {
                server_roulette_pattern_8 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_8_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_8_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_9
            if (input$ui_roulette_9_pattern_9 == 'ui_roulette_9_pattern_9_strategy_uniform_random') {
                server_roulette_pattern_9 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_9_pattern_9 == 'ui_roulette_9_pattern_9_strategy_all_the_same') {
                server_roulette_pattern_9 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_9_pattern_9_strategy_all_the_same
                )
            } else if (input$ui_roulette_9_pattern_9 == 'ui_roulette_9_pattern_9_strategy_cycle') {
                server_roulette_pattern_9 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_9_pattern_9_strategy_cycle_cycle,
                    first_number = input$ui_roulette_9_pattern_9_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4,
                    server_roulette_pattern_5,
                    server_roulette_pattern_6,
                    server_roulette_pattern_7,
                    server_roulette_pattern_8,
                    server_roulette_pattern_9
                )
            )

        } else if (input$ui_roulette_strategy_pattern == 'ui_roulette_10') {
            #!server roulette 10
            #TODO 設定パラメーター
            server_roulette_group_size <- input$ui_roulette_group_size
            server_roulette_the_number_of_times <- input$ui_roulette_the_number_of_times
            server_roulette_strategy_pattern <- 10
            server_roulette_how_to_generate <- as.integer(input$ui_roulette_how_to_generate)
            server_roulette_equal_ratio <- input$ui_roulette_equal_ratio
            server_roulette_ratio <- input$ui_roulette_ratio
            server_roulette_win_point <- input$ui_roulette_win_point
            server_roulette_lose_point <- input$ui_roulette_lose_point
            server_roulette_draw_point <- input$ui_roulette_draw_point
            server_roulette_generation <- input$ui_roulette_generation
            #*戦略データの生成
            #pattern_1
            if (input$ui_roulette_10_pattern_1 == 'ui_roulette_10_pattern_1_strategy_uniform_random') {
                server_roulette_pattern_1 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_1 == 'ui_roulette_10_pattern_1_strategy_all_the_same') {
                server_roulette_pattern_1 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_1_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_1 == 'ui_roulette_10_pattern_1_strategy_cycle') {
                server_roulette_pattern_1 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_1_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_1_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_2
            if (input$ui_roulette_10_pattern_2 == 'ui_roulette_10_pattern_2_strategy_uniform_random') {
                server_roulette_pattern_2 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_2 == 'ui_roulette_10_pattern_2_strategy_all_the_same') {
                server_roulette_pattern_2 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_2_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_2 == 'ui_roulette_10_pattern_2_strategy_cycle') {
                server_roulette_pattern_2 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_2_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_2_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_3
            if (input$ui_roulette_10_pattern_3 == 'ui_roulette_10_pattern_3_strategy_uniform_random') {
                server_roulette_pattern_3 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_3 == 'ui_roulette_10_pattern_3_strategy_all_the_same') {
                server_roulette_pattern_3 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_3_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_3 == 'ui_roulette_10_pattern_3_strategy_cycle') {
                server_roulette_pattern_3 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_3_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_3_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_4
            if (input$ui_roulette_10_pattern_4 == 'ui_roulette_10_pattern_4_strategy_uniform_random') {
                server_roulette_pattern_4 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_4 == 'ui_roulette_10_pattern_4_strategy_all_the_same') {
                server_roulette_pattern_4 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_4_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_4 == 'ui_roulette_10_pattern_4_strategy_cycle') {
                server_roulette_pattern_4 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_4_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_4_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_5
            if (input$ui_roulette_10_pattern_5 == 'ui_roulette_10_pattern_5_strategy_uniform_random') {
                server_roulette_pattern_5 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_5 == 'ui_roulette_10_pattern_5_strategy_all_the_same') {
                server_roulette_pattern_5 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_5_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_5 == 'ui_roulette_10_pattern_5_strategy_cycle') {
                server_roulette_pattern_5 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_5_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_5_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_6
            if (input$ui_roulette_10_pattern_6 == 'ui_roulette_10_pattern_6_strategy_uniform_random') {
                server_roulette_pattern_6 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_6 == 'ui_roulette_10_pattern_6_strategy_all_the_same') {
                server_roulette_pattern_6 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_6_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_6 == 'ui_roulette_10_pattern_6_strategy_cycle') {
                server_roulette_pattern_6 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_6_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_6_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_7
            if (input$ui_roulette_10_pattern_7 == 'ui_roulette_10_pattern_7_strategy_uniform_random') {
                server_roulette_pattern_7 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_7 == 'ui_roulette_10_pattern_7_strategy_all_the_same') {
                server_roulette_pattern_7 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_7_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_7 == 'ui_roulette_10_pattern_7_strategy_cycle') {
                server_roulette_pattern_7 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_7_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_7_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_8
            if (input$ui_roulette_10_pattern_8 == 'ui_roulette_10_pattern_8_strategy_uniform_random') {
                server_roulette_pattern_8 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_8 == 'ui_roulette_10_pattern_8_strategy_all_the_same') {
                server_roulette_pattern_8 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_8_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_8 == 'ui_roulette_10_pattern_8_strategy_cycle') {
                server_roulette_pattern_8 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_8_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_8_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_9
            if (input$ui_roulette_10_pattern_9 == 'ui_roulette_10_pattern_9_strategy_uniform_random') {
                server_roulette_pattern_9 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_9 == 'ui_roulette_10_pattern_9_strategy_all_the_same') {
                server_roulette_pattern_9 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_9_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_9 == 'ui_roulette_10_pattern_9_strategy_cycle') {
                server_roulette_pattern_9 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_9_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_9_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }
            #pattern_10
            if (input$ui_roulette_10_pattern_10 == 'ui_roulette_10_pattern_10_strategy_uniform_random') {
                server_roulette_pattern_10 <- strategy_uniform_random(
                    the_number_of_times = server_roulette_the_number_of_times
                )
            } else if (input$ui_roulette_10_pattern_10 == 'ui_roulette_10_pattern_10_strategy_all_the_same') {
                server_roulette_pattern_10 <- strategy_all_the_same(
                    the_number_of_times = server_roulette_the_number_of_times,
                    number = input$ui_roulette_10_pattern_10_strategy_all_the_same
                )
            } else if (input$ui_roulette_10_pattern_10 == 'ui_roulette_10_pattern_10_strategy_cycle') {
                server_roulette_pattern_10 <- strategy_cycle(
                    the_number_of_times = server_roulette_the_number_of_times,
                    cycle = input$ui_roulette_10_pattern_10_strategy_cycle_cycle,
                    first_number = input$ui_roulette_10_pattern_10_strategy_cycle_first_number
                )
            } else {
                stop('An expected error.')
            }

            #初期集団の生成
            server_roulette_data <- server_roulette_gen_group(
                group_size = server_roulette_group_size,
                strategy_pattern = server_roulette_strategy_pattern
            )
            return(
                list(
                    server_roulette_data,
                    server_roulette_group_size,
                    server_roulette_the_number_of_times,
                    server_roulette_strategy_pattern,
                    server_roulette_how_to_generate,
                    server_roulette_equal_ratio,
                    server_roulette_ratio,
                    server_roulette_win_point,
                    server_roulette_lose_point,
                    server_roulette_draw_point,
                    server_roulette_generation,
                    server_roulette_pattern_1,
                    server_roulette_pattern_2,
                    server_roulette_pattern_3,
                    server_roulette_pattern_4,
                    server_roulette_pattern_5,
                    server_roulette_pattern_6,
                    server_roulette_pattern_7,
                    server_roulette_pattern_8,
                    server_roulette_pattern_9,
                    server_roulette_pattern_10
                )
            )
        } else {
            stop('An expected error!')
        }
    }
)
