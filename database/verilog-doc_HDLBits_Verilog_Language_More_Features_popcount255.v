// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    reg [7:0]count;
    always @(*) begin
        
	count=0;
        for(i=0;i<=254;i=i+1) begin
            if(in[i] == 1) begin
                count = count + 7'b1;
            end
        end
    end
    assign out = count;
endmodule

