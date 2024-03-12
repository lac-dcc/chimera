module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);
    reg [31:0]predict_history_reg;
    always@(posedge clk, posedge areset)begin
        if(areset)
            predict_history_reg  <= 31'b0;
        else if(train_mispredicted)
            predict_history_reg <= {train_history[30:0],train_taken};
        else if(predict_valid)
            predict_history_reg <= {predict_history_reg[30:0],predict_taken};
        else
            predict_history_reg <= predict_history_reg;
    end
    assign predict_history = predict_history_reg;
endmodule
