// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    
    assign mux_in[0] = c | d;
    assign mux_in[1] = 0;
    assign mux_in[2] = ~d;
    assign mux_in[3] = c & d;

endmodule
