module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] next_state;
    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= 2'b01;
        else
            state <= next_state;
    end
    always @(*) begin
        if (train_valid) begin
            if (train_taken && state < 3)
                next_state = state + 1'b01;
            else if (!train_taken && state > 0)
                next_state = state - 1'b01;
            else
                next_state = state;
        end
        else
            next_state = state;
    end
endmodule
