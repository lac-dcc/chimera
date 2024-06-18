// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    parameter idle=3'd0, s1=3'd1, s11=3'd2, s110=3'd3, s1101=3'd4;
    reg	[2:0]	state, next_state;
    
    always@(*) begin
        case({state, data})
            {idle, 1'b0}:	next_state = idle;
            {idle, 1'b1}:	next_state = s1;
            {s1, 1'b0}:		next_state = idle;
            {s1, 1'b1}:		next_state = s11;
            {s11, 1'b0}:	next_state = s110;
            {s11, 1'b1}:	next_state = s11;
            {s110, 1'b0}:	next_state = idle;
            {s110, 1'b1}:	next_state = s1101;
            {s1101, 1'b0}:	next_state = s1101;
            {s1101, 1'b1}:	next_state = s1101;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next_state;
    end
    
    assign	start_shifting = (state == s1101);
    
endmodule

