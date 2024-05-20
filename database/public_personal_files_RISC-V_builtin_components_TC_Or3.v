// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Or3(in0, in1, in2, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;
    input [BIT_WIDTH-1:0] in0;
    input [BIT_WIDTH-1:0] in1;
    input [BIT_WIDTH-1:0] in2;
    output [BIT_WIDTH-1:0] out;
    
    assign out = in0 | in1 | in2;
endmodule
