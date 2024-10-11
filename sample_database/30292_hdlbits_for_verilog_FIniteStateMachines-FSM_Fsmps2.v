// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg[1:0] state,next_state;
    //reg inp= in[3];
    parameter A=0, B=1, C=2, D=3;
    always @(*) begin
        case(state)
            A: next_state <= (in[3])?B:A;
            B: next_state <= C;
            C: next_state <= D;
            D: next_state <= (in[3])?B:A;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            state <=A;
        else
            state<=next_state;
    end
    assign done = (state == D);
    // State transition logic (combinational)

    // State flip-flops (sequential)
 
    // Output logic

endmodule

