// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module( 
    input [2:0] in,
    output [1:0] out );
    reg [1:0]num;
    integer i;
    always @(*) begin
        num = 0;
        for(i=0;i<3;i=i+1) begin
            if(in[i] == 1) begin
                num = num + 2'b1;          
            end
        end       
    end
    assign out = num;
endmodule

