// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Maker16 (in0, in1, out);
    parameter UUID = 0;
    parameter NAME = "";
    input [7:0] in0;
    input [7:0] in1;
    output [15:0] out;
    
    assign out = {in1, in0};
endmodule
