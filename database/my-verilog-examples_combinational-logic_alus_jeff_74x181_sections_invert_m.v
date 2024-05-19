// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module invert_m (   
    input   a,
    output  y);

assign y = ~a;

endmodule