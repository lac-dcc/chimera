module top_module(
    input clk,
    input reset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF : next_state = (j == 1) ? ON : OFF;
            ON : next_state = (k == 1) ? OFF : ON;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with asynchronous reset
        if(reset) state <= OFF;
        else state <= next_state;
    end

    // Output logic
            assign out = (state == ON);

endmodule
