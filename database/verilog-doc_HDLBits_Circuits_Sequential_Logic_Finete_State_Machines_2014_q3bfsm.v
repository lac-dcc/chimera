// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    parameter y0=3'd0, y1=3'd1, y2=3'd2, y3=3'd3, y4=3'd4;
    reg [2:0]	state, next_state;
    always@(*) begin
        case({state, x})
            {y0, 1'b0}:	next_state = y0;
            {y0, 1'b1}:	next_state = y1;
            {y1, 1'b0}:	next_state = y1;
            {y1, 1'b1}:	next_state = y4;
            {y2, 1'b0}:	next_state = y2;
            {y2, 1'b1}:	next_state = y1;
            {y3, 1'b0}:	next_state = y1;
            {y3, 1'b1}:	next_state = y2;
            {y4, 1'b0}:	next_state = y3;
            {y4, 1'b1}:	next_state = y4;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= y0;
        else
            state <= next_state;
    end
    
    assign z = (state == y3 || state == y4);
    
endmodule

