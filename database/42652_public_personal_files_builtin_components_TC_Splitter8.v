// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Splitter8 (in, out0, out1, out2, out3, out4, out5, out6, out7);
    parameter UUID = 0;
    parameter NAME = "";
    input [7:0] in;
    output out0;
    output out1;
    output out2;
    output out3;
    output out4;
    output out5;
    output out6;
    output out7;
    
    assign {out7, out6, out5, out4, out3, out2, out1, out0} = in;
endmodule
