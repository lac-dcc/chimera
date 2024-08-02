// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

// Dummy implementation, does nothing
module TC_DotMatrixDisplay (clk, rst, en_y, en_x, color_info, pixel_info);
    parameter UUID = 0;
    parameter NAME = "";
    input clk;
    input rst;
    input en_y;
    input en_x;
    input [31:0] color_info;
    input [63:0] pixel_info;
endmodule
