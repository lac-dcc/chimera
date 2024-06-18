// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module q3 (
    input wire x,
    input wire y,
    input wire z,
    output wire out
);

    assign out = (x | y) & (~x | z);
endmodule