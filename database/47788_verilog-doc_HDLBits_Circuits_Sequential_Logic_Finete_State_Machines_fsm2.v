// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case (state)
            OFF: next_state <= j ? ON : OFF;
            ON: next_state <= k ? OFF : ON;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    assign out = (state == ON);
endmodule

