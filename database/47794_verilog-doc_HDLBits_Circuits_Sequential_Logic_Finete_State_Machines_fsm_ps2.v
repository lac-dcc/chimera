// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter b1 = 2'd0, b2 = 2'd1, b3 = 2'd2, dn = 2'd3;
    reg	[1:0]	state, next_state;
    
    // State transition logic (combinational)
    always@(*) begin
        case({state, in[3]})
            {b1, 1'b0}:	next_state = b1;
            {b1, 1'b1}:	next_state = b2;
            {b2, 1'b0}:	next_state = b3;
            {b2, 1'b1}:	next_state = b3;
            {b3, 1'b0}:	next_state = dn;
            {b3, 1'b1}:	next_state = dn;
            {dn, 1'b0}:	next_state = b1;
            {dn, 1'b1}:	next_state = b2;
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk) begin
        if(reset)
            state <= b1;
        else
            state <= next_state;
    end
    // Output logic
    assign	done = (state == dn);
    
endmodule

