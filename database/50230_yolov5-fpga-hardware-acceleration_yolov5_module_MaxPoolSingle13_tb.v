// This program was cloned from: https://github.com/bunny965/yolov5-fpga-hardware-acceleration
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/04 23:43:50
// Design Name: 
// Module Name: MaxPoolSingle13_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MaxPoolSingle13_tb(

    );
    
 parameter DATA_WIDTH = 16;
        parameter InputH = 13;
        parameter InputW = 13;
        localparam Depth = 1;
        localparam s =13;
        
        reg [InputH*InputW*Depth*DATA_WIDTH-1:0] mPoolIn;
        wire [(InputH/s)*(InputW/s)*Depth*DATA_WIDTH-1:0] mPoolOut;
        
        initial begin
        #0 mPoolIn<=2704'h4000400040004000400040004000400040004000400040004000400040004000400040004000400042004000400040004000400040004000400040004000400040004000400040004000400040004000400040004000400040004200400040004000400040004000400040004000400040004000400040004000400040004000400045004000400040004000400042004000400040004000420042004200420042004000400040004000400040004000400040004000400040004000400040004000400040004000400042004000400040004000400040004000400040004000400040004000400040004000400040004000400040004000400040004200400040004000400040004000400040004000400040004000400040004000400040004000400045004000400040004000400042004000400040004000420042004200420042004200420042004200420042004200;
      #200
        $stop;
        end
         MaxPoolSingle13 m (mPoolIn,mPoolOut);

endmodule
