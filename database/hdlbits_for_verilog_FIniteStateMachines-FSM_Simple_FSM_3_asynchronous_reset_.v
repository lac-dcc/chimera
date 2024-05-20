// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    // State transition logic
    always @(*) begin
        case(state)
            A: next_state<=(in)?B:A;
            B: next_state<=(in)?B:C;
            C: next_state<=(in)?D:A;
            D: next_state<=(in)?B:C;
        endcase
    end


    // State flip-flops with asynchronous reset
    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=A;
        else
            state<=next_state;
    end

    // Output logic
    assign out = (state==D)?1:0;

endmodule
