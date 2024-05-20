// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always@(posedge clk) begin
        if(shift_ena)
            q <= {q[2:0], data};
        else if(count_ena)
            q <= q - 1'b1;
        else
            q <= q;
    end
    
endmodule

