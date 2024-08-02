// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
	
    wire [7:0]min1,min2;
    assign min1=(a<b?a:b);
    
    assign min2 = (min1<c?min1:c);
    
    assign min = (min2<d?min2:d);
endmodule

