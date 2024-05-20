// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_MUX_2 #(
    parameter WIDTH = 8
)(  input [WIDTH-1:0] d0, d1,
    input s,
    output[WIDTH-1:0] y);

    assign y = s ? d1 : d0;

endmodule