// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Add (in0, in1, ci, out, co);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;
    input [BIT_WIDTH-1:0] in0;
    input [BIT_WIDTH-1:0] in1;
    input ci;
    output [BIT_WIDTH-1:0] out;
    output co;

    assign {co, out} = in0 + in1 + ci;
endmodule
