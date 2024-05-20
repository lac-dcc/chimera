// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

/*
mux 2 to 1
*/

module mux #(
    parameter DATA_LENGTH = 8
) (
    input sel,
    input [DATA_LENGTH-1 : 0] ina, 
    input [(DATA_LENGTH-1) : 0]  inb,
    output [DATA_LENGTH-1 : 0] out
);
    assign out=(sel==0)?ina:inb;
endmodule