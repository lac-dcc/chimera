// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );

    always@(posedge clk) begin
        if(a==b)
            state <= a;
        else
            state <= state;
    end
    
    assign	q = (a==b)?state:(~state);
    
endmodule

