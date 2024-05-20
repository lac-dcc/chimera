// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Maker8 (in0, in1, in2, in3, in4, in5, in6, in7, out);
    parameter UUID = 0;
    parameter NAME = "";
    input in0;
    input in1;
    input in2;
    input in3;
    input in4;
    input in5;
    input in6;
    input in7;
    output [7:0] out;
    
    assign out = {in7, in6, in5, in4, in3, in2, in1, in0};
endmodule
