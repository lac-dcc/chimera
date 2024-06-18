// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (input a, input b, input c, output out);//
	reg q;
    andgate inst1 ( q,a,b,c,1,1 );
	assign out = !q;
endmodule

