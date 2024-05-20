// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Splitter16 (in, out0, out1);
    parameter UUID = 0;
    parameter NAME = "";
    input [15:0] in;
    output [7:0] out0;
    output [7:0] out1;
    
    assign {out1, out0} = in;
endmodule
