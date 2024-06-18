// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module bintogrey (
    input [3:0] bin_in,
    output [3:0] grey_out
);
    assign grey_out[0] = bin_in[0];
    assign grey_out[1] = bin_in[0] ^ bin_in[1];
    assign grey_out[2] = bin_in[1] ^ bin_in[2];
    assign grey_out[3] = bin_in[2] ^ bin_in[3]; 
endmodule
