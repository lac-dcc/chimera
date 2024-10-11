// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module ADD4(PC,PC4);
//interface
    input [31:0] PC;

    output [31:0] PC4;

//combinational logic
    assign PC4=PC+4;

endmodule