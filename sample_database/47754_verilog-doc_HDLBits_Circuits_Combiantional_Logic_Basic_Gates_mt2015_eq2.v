// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = ((A[1]==B[1])&&(A[0]==B[0]))?1:0;
endmodule

