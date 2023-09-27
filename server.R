shinyServer(function(input, output) {
    #読み込み
    output$ui_ranking_graph <- renderPlot({
        source('./ranking/server_ranking.R', local = TRUE)
        #actionbuttonが押されたら、実行される
        ranking_result <- ui_ranking_action_func()
        #list(server_ranking_result_data, server_ranking_generation_vector)っていうリターンを各変数に格納
        #~[[i]]とすることで、本来の型で取り出せる
        #~[i]とすると、list型になってしまう
        server_ranking_result_data <- ranking_result[[1]]
        server_ranking_generation_vector <- ranking_result[[2]]
        server_ranking_strategy_pattern <- ranking_result[[3]]
        if (server_ranking_strategy_pattern == 1) {

        } else if (server_ranking_strategy_pattern == 2) {
            
        } else if (server_ranking_strategy_pattern == 3) {
            
        } else if (server_ranking_strategy_pattern == 4) {
            
        } else if (server_ranking_strategy_pattern == 5) {
            
        } else if (server_ranking_strategy_pattern == 6) {
            
        } else if (server_ranking_strategy_pattern == 7) {
            
        } else if (server_ranking_strategy_pattern == 8) {
            
        } else if (server_ranking_strategy_pattern == 9) {
            
        } else if (server_ranking_strategy_pattern == 10) {
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
})