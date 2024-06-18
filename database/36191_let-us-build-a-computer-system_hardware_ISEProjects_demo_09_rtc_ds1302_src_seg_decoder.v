// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*******************************************************************************/
module seg_decoder
(
	input[3:0]      bin_data,     // bin data input
	output reg[6:0] seg_data      // seven segments LED output
);

always@(*)
begin
	case(bin_data)
		4'd0:seg_data <= 7'b100_0000;
		4'd1:seg_data <= 7'b111_1001;
		4'd2:seg_data <= 7'b010_0100;
		4'd3:seg_data <= 7'b011_0000;
		4'd4:seg_data <= 7'b001_1001;
		4'd5:seg_data <= 7'b001_0010;
		4'd6:seg_data <= 7'b000_0010;
		4'd7:seg_data <= 7'b111_1000;
		4'd8:seg_data <= 7'b000_0000;
		4'd9:seg_data <= 7'b001_0000;
		4'ha:seg_data <= 7'b000_1000;
		4'hb:seg_data <= 7'b000_0011;
		4'hc:seg_data <= 7'b100_0110;
		4'hd:seg_data <= 7'b010_0001;
		4'he:seg_data <= 7'b000_0110;
		4'hf:seg_data <= 7'b000_1110;
		default:seg_data <= 7'b111_1111;
	endcase
end
endmodule