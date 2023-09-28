shinyServer(function(input, output) {
    #読み込み
    output$ui_ranking_graph <- renderPlot({
        source('./ranking/server_ranking.R', local = TRUE)
        #actionbuttonが押されたら、実行される
        ranking_result <- ui_ranking_action_func()
        #*重要な奴
        # #list(server_ranking_result_data, server_ranking_generation_vector)っていうリターンを各変数に格納
        # #~[[i]]とすることで、本来の型で取り出せる
        # #~[i]とすると、list型になってしまう
        server_ranking_data <- ranking_result[[1]]
        server_ranking_group_size <- ranking_result[[2]]
        server_ranking_the_number_of_times <- ranking_result[[3]]
        server_ranking_strategy_pattern <- ranking_result[[4]]
        server_ranking_how_to_generate <- ranking_result[[5]]
        server_ranking_equal_ratio <- ranking_result[[6]]
        server_ranking_ratio <- ranking_result[[7]]
        server_ranking_win_point <- ranking_result[[8]]
        server_ranking_lose_point <- ranking_result[[9]]
        server_ranking_draw_point <- ranking_result[[10]]
        server_ranking_generation <- ranking_result[[11]]

        if (server_ranking_strategy_pattern == 1) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1'))
        } else if (server_ranking_strategy_pattern == 2) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2'))
        } else if (server_ranking_strategy_pattern == 3) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2,
                        server_ranking_pattern_3
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3'))
        } else if (server_ranking_strategy_pattern == 4) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2,
                        server_ranking_pattern_3,
                        server_ranking_pattern_4
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4'))
        } else if (server_ranking_strategy_pattern == 5) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            server_ranking_pattern_5 <- ranking_result[[16]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2,
                        server_ranking_pattern_3,
                        server_ranking_pattern_4,
                        server_ranking_pattern_5
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_ranking_result_data[,5], colour = '5'))
        } else if (server_ranking_strategy_pattern == 6) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            server_ranking_pattern_5 <- ranking_result[[16]]
            server_ranking_pattern_6 <- ranking_result[[17]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2,
                        server_ranking_pattern_3,
                        server_ranking_pattern_4,
                        server_ranking_pattern_5,
                        server_ranking_pattern_6
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_ranking_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_ranking_result_data[,6], colour = '6'))
        } else if (server_ranking_strategy_pattern == 7) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            server_ranking_pattern_5 <- ranking_result[[16]]
            server_ranking_pattern_6 <- ranking_result[[17]]
            server_ranking_pattern_7 <- ranking_result[[18]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2,
                        server_ranking_pattern_3,
                        server_ranking_pattern_4,
                        server_ranking_pattern_5,
                        server_ranking_pattern_6,
                        server_ranking_pattern_7
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_ranking_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_ranking_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_ranking_result_data[,7], colour = '7'))
        } else if (server_ranking_strategy_pattern == 8) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            server_ranking_pattern_5 <- ranking_result[[16]]
            server_ranking_pattern_6 <- ranking_result[[17]]
            server_ranking_pattern_7 <- ranking_result[[18]]
            server_ranking_pattern_8 <- ranking_result[[19]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
                        server_ranking_pattern_1,
                        server_ranking_pattern_2,
                        server_ranking_pattern_3,
                        server_ranking_pattern_4,
                        server_ranking_pattern_5,
                        server_ranking_pattern_6,
                        server_ranking_pattern_7,
                        server_ranking_pattern_8
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_ranking_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_ranking_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_ranking_result_data[,7], colour = '7')) +
                geom_line(aes(y = server_ranking_result_data[,8], colour = '8'))
        } else if (server_ranking_strategy_pattern == 9) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            server_ranking_pattern_5 <- ranking_result[[16]]
            server_ranking_pattern_6 <- ranking_result[[17]]
            server_ranking_pattern_7 <- ranking_result[[18]]
            server_ranking_pattern_8 <- ranking_result[[19]]
            server_ranking_pattern_9 <- ranking_result[[20]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
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
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_ranking_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_ranking_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_ranking_result_data[,7], colour = '7')) +
                geom_line(aes(y = server_ranking_result_data[,8], colour = '8')) +
                geom_line(aes(y = server_ranking_result_data[,9], colour = '9'))
        } else if (server_ranking_strategy_pattern == 10) {
            server_ranking_pattern_1 <- ranking_result[[12]]
            server_ranking_pattern_2 <- ranking_result[[13]]
            server_ranking_pattern_3 <- ranking_result[[14]]
            server_ranking_pattern_4 <- ranking_result[[15]]
            server_ranking_pattern_5 <- ranking_result[[16]]
            server_ranking_pattern_6 <- ranking_result[[17]]
            server_ranking_pattern_7 <- ranking_result[[18]]
            server_ranking_pattern_8 <- ranking_result[[19]]
            server_ranking_pattern_9 <- ranking_result[[20]]
            server_ranking_pattern_10 <- ranking_result[[21]]
            #TODO 実験領域 ######################################################
            server_ranking_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_ranking_generation) {
                    server_ranking_data <- ga_ranking(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size,
                        the_number_of_times = server_ranking_the_number_of_times,
                        strategy_pattern = server_ranking_strategy_pattern,
                        how_to_generate = server_ranking_how_to_generate,
                        equal_ratio = server_ranking_equal_ratio,
                        ratio = server_ranking_ratio,
                        win_point = server_ranking_win_point,
                        lose_point = server_ranking_lose_point,
                        draw_point = server_ranking_draw_point,
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
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_ranking_data,
                        group_size = server_ranking_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_ranking_survivor_number <- survivor(
                        ratio = server_ranking_ratio,
                        group_size = server_ranking_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_ranking_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_ranking_strategy_pattern,
                        survivor_number = server_ranking_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_ranking_result_data <- result(
                        result_data = server_ranking_result_data,
                        graph_data_vector = server_ranking_graph_data_vector
                    )
                    incProgress(1/server_ranking_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_ranking_result_data) <- c(1:server_ranking_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_ranking_generation_vector <- 1:server_ranking_generation
            #*元々の部分
            ggplot(data = server_ranking_result_data, aes(server_ranking_generation_vector)) +
                geom_line(aes(y = server_ranking_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_ranking_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_ranking_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_ranking_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_ranking_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_ranking_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_ranking_result_data[,7], colour = '7')) +
                geom_line(aes(y = server_ranking_result_data[,8], colour = '8')) +
                geom_line(aes(y = server_ranking_result_data[,9], colour = '9')) +
                geom_line(aes(y = server_ranking_result_data[,10], colour = '10'))
        } else {
            stop('An expected error.')
        }
    })
#!##########################################################################################################
#TODO#######################################################################################################
#*##########################################################################################################
#TODO#######################################################################################################
#!##########################################################################################################
    #読み込み
    output$ui_roulette_graph <- renderPlot({
        source('./roulette/server_roulette.R', local = TRUE)
        #actionbuttonが押されたら、実行される
        roulette_result <- ui_roulette_action_func()
        #*重要な奴
        # #list(server_roulette_result_data, server_roulette_generation_vector)っていうリターンを各変数に格納
        # #~[[i]]とすることで、本来の型で取り出せる
        # #~[i]とすると、list型になってしまう
        server_roulette_data <- roulette_result[[1]]
        server_roulette_group_size <- roulette_result[[2]]
        server_roulette_the_number_of_times <- roulette_result[[3]]
        server_roulette_strategy_pattern <- roulette_result[[4]]
        server_roulette_how_to_generate <- roulette_result[[5]]
        server_roulette_equal_ratio <- roulette_result[[6]]
        server_roulette_ratio <- roulette_result[[7]]
        server_roulette_win_point <- roulette_result[[8]]
        server_roulette_lose_point <- roulette_result[[9]]
        server_roulette_draw_point <- roulette_result[[10]]
        server_roulette_generation <- roulette_result[[11]]

        if (server_roulette_strategy_pattern == 1) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1'))
        } else if (server_roulette_strategy_pattern == 2) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2'))
        } else if (server_roulette_strategy_pattern == 3) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2,
                        server_roulette_pattern_3
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3'))
        } else if (server_roulette_strategy_pattern == 4) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2,
                        server_roulette_pattern_3,
                        server_roulette_pattern_4
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4'))
        } else if (server_roulette_strategy_pattern == 5) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            server_roulette_pattern_5 <- roulette_result[[16]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2,
                        server_roulette_pattern_3,
                        server_roulette_pattern_4,
                        server_roulette_pattern_5
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_roulette_result_data[,5], colour = '5'))
        } else if (server_roulette_strategy_pattern == 6) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            server_roulette_pattern_5 <- roulette_result[[16]]
            server_roulette_pattern_6 <- roulette_result[[17]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2,
                        server_roulette_pattern_3,
                        server_roulette_pattern_4,
                        server_roulette_pattern_5,
                        server_roulette_pattern_6
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_roulette_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_roulette_result_data[,6], colour = '6'))
        } else if (server_roulette_strategy_pattern == 7) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            server_roulette_pattern_5 <- roulette_result[[16]]
            server_roulette_pattern_6 <- roulette_result[[17]]
            server_roulette_pattern_7 <- roulette_result[[18]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2,
                        server_roulette_pattern_3,
                        server_roulette_pattern_4,
                        server_roulette_pattern_5,
                        server_roulette_pattern_6,
                        server_roulette_pattern_7
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_roulette_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_roulette_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_roulette_result_data[,7], colour = '7'))
        } else if (server_roulette_strategy_pattern == 8) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            server_roulette_pattern_5 <- roulette_result[[16]]
            server_roulette_pattern_6 <- roulette_result[[17]]
            server_roulette_pattern_7 <- roulette_result[[18]]
            server_roulette_pattern_8 <- roulette_result[[19]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
                        server_roulette_pattern_1,
                        server_roulette_pattern_2,
                        server_roulette_pattern_3,
                        server_roulette_pattern_4,
                        server_roulette_pattern_5,
                        server_roulette_pattern_6,
                        server_roulette_pattern_7,
                        server_roulette_pattern_8
                    )
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_roulette_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_roulette_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_roulette_result_data[,7], colour = '7')) +
                geom_line(aes(y = server_roulette_result_data[,8], colour = '8'))
        } else if (server_roulette_strategy_pattern == 9) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            server_roulette_pattern_5 <- roulette_result[[16]]
            server_roulette_pattern_6 <- roulette_result[[17]]
            server_roulette_pattern_7 <- roulette_result[[18]]
            server_roulette_pattern_8 <- roulette_result[[19]]
            server_roulette_pattern_9 <- roulette_result[[20]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
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
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_roulette_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_roulette_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_roulette_result_data[,7], colour = '7')) +
                geom_line(aes(y = server_roulette_result_data[,8], colour = '8')) +
                geom_line(aes(y = server_roulette_result_data[,9], colour = '9'))
        } else if (server_roulette_strategy_pattern == 10) {
            server_roulette_pattern_1 <- roulette_result[[12]]
            server_roulette_pattern_2 <- roulette_result[[13]]
            server_roulette_pattern_3 <- roulette_result[[14]]
            server_roulette_pattern_4 <- roulette_result[[15]]
            server_roulette_pattern_5 <- roulette_result[[16]]
            server_roulette_pattern_6 <- roulette_result[[17]]
            server_roulette_pattern_7 <- roulette_result[[18]]
            server_roulette_pattern_8 <- roulette_result[[19]]
            server_roulette_pattern_9 <- roulette_result[[20]]
            server_roulette_pattern_10 <- roulette_result[[21]]
            #TODO 実験領域 ######################################################
            server_roulette_result_data <- data.frame()
            #結果をdata.frameに格納
            result <- function(result_data, graph_data_vector) {
                result_data <- rbind(result_data, graph_data_vector)
            }
            withProgress(message = 'Making plot...', value = 0, {
                #! ここからループ ####################################################
                for (i in 1:server_roulette_generation) {
                    server_roulette_data <- ga_roulette(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size,
                        the_number_of_times = server_roulette_the_number_of_times,
                        strategy_pattern = server_roulette_strategy_pattern,
                        how_to_generate = server_roulette_how_to_generate,
                        equal_ratio = server_roulette_equal_ratio,
                        ratio = server_roulette_ratio,
                        win_point = server_roulette_win_point,
                        lose_point = server_roulette_lose_point,
                        draw_point = server_roulette_draw_point,
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
                    ###########
                    #グラフ出力
                    ###########
                    #data.frameに変換
                    change_data_frame <- function(group, group_size) {
                        group_data_frame <- data.frame()
                        for (i in 1:group_size) {
                            group_data_frame <- rbind(group_data_frame, group[i])
                        }
                        colnames(group_data_frame) <- c('strategy_number')
                        return(group_data_frame)
                    }
                    #実行
                    change_data_frame_data <- change_data_frame(
                        group = server_roulette_data,
                        group_size = server_roulette_group_size
                    )

                    #集計
                    #上位グループの数を調べる
                    survivor <- function(ratio, group_size) {
                        #rationのエラーハンドリング
                        #!0 < ratio < 1
                        if (0 >= ratio || 1 <= ratio) {
                            stop('ratio can only input 0 < ratio < 1.')
                        }
                        #IEC 60559規格の四捨五入で、整数値にする
                        survivor_number <- round(group_size * ratio)
                        #エラーハンドリング
                        #四捨五入でsurvor == 0 || 1 の時
                        if (survivor_number == 0) {
                            survivor_number <- 1
                            warning('The ratio`s number is 0. You should input ratio larger than your input data.')
                        } else if (survivor_number == group_size) {
                            survivor_number <- group_size - 1
                            warning('The ratio`s number is 1. You should input ratio less than your input data.')
                        }
                        return(survivor_number)
                    }
                    #実行
                    server_roulette_survivor_number <- survivor(
                        ratio = server_roulette_ratio,
                        group_size = server_roulette_group_size
                    )
                    #各戦略の数を数え上げ
                    graph_data <- function(change_data_frame_data, strategy_pattern, survivor_number) {
                        graph_data_vector <- c()
                        for (i in 1:strategy_pattern) {
                            strategy_items <- sum(change_data_frame_data$strategy_number[1:survivor_number] == i)
                            graph_data_vector <- append(graph_data_vector, strategy_items)
                        }
                        return(graph_data_vector)
                    }
                    #実行
                    server_roulette_graph_data_vector <- graph_data(
                        change_data_frame_data = change_data_frame_data,
                        strategy_pattern = server_roulette_strategy_pattern,
                        survivor_number = server_roulette_survivor_number
                    )

                    # #結果をdata.frameに格納
                    result <- function(result_data, graph_data_vector) {
                        result_data <- rbind(result_data, graph_data_vector)
                    }
                    #実行
                    server_roulette_result_data <- result(
                        result_data = server_roulette_result_data,
                        graph_data_vector = server_roulette_graph_data_vector
                    )
                    incProgress(1/server_roulette_generation, detail = paste("Now generation: ", i))
                }
                #! ここまでループ ####################################################
            })
            colnames(server_roulette_result_data) <- c(1:server_roulette_strategy_pattern)
            #TODO 実験領域 ######################################################

            server_roulette_generation_vector <- 1:server_roulette_generation
            #*元々の部分
            ggplot(data = server_roulette_result_data, aes(server_roulette_generation_vector)) +
                geom_line(aes(y = server_roulette_result_data[,1], colour = '1')) +
                geom_line(aes(y = server_roulette_result_data[,2], colour = '2')) +
                geom_line(aes(y = server_roulette_result_data[,3], colour = '3')) +
                geom_line(aes(y = server_roulette_result_data[,4], colour = '4')) +
                geom_line(aes(y = server_roulette_result_data[,5], colour = '5')) +
                geom_line(aes(y = server_roulette_result_data[,6], colour = '6')) +
                geom_line(aes(y = server_roulette_result_data[,7], colour = '7')) +
                geom_line(aes(y = server_roulette_result_data[,8], colour = '8')) +
                geom_line(aes(y = server_roulette_result_data[,9], colour = '9')) +
                geom_line(aes(y = server_roulette_result_data[,10], colour = '10'))
        } else {
            stop('An expected error.')
        }
    })
})