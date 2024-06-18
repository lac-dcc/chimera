// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Mul (in0, in1, out0, out1);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;
    input [BIT_WIDTH-1:0] in0;
    input [BIT_WIDTH-1:0] in1;
    output [BIT_WIDTH-1:0] out0;
    output [BIT_WIDTH-1:0] out1;

    assign out0 = in0 / in1;
    assign out1 = in0 % in1;
endmodule
