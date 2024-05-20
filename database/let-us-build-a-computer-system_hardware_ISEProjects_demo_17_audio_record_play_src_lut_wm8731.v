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
//  2017/7/19     meisq          1.0         Original
//*******************************************************************************/

module lut_wm8731(
	input[9:0]             lut_index, // Look-up table index address
	output reg[31:0]       lut_data   // I2C device address register address register data
);

always@(*)
begin
	case(lut_index)
	    //To be compatible with the 16bit register address, add 8'h00
		8'd0: lut_data <= {8'h34,8'h00,8'h00,8'h97};          //(Left Line In) = 0x97: left line in mute
		8'd1: lut_data <= {8'h34,8'h00,8'h02,8'h97};          //(Right Line In) = 0x97: right line in mute
		8'd2: lut_data <= {8'h34,8'h00,8'h04,8'h7f};          //(Left Headphone out) = 0x7f :left headphone +6dB
		8'd3: lut_data <= {8'h34,8'h00,8'h06,8'h7f};          //(right Headphone out) = 0x7f :right headphone +6dB
		8'd4: lut_data <= {8'h34,8'h00,8'h08,8'h15};          //(analogue audio path control) = 0x15 : MIC select to DAC
		8'd5: lut_data <= {8'h34,8'h00,8'h0a,8'h06};          //(digital Audio path control) = 0x00
		8'd6: lut_data <= {8'h34,8'h00,8'h0c,8'h00};          //(Power down control) = 0x00
		8'd7: lut_data <= {8'h34,8'h00,8'h0e,8'h40};          //(Digital Audio interface format) = 0x40 : right channel DAC when DACLRC low
		8'd8: lut_data <= {8'h34,8'h00,8'h10,8'h00};          //(Sampling control) = 0x00  
		8'd9: lut_data <= {8'h34,8'h00,8'h12,8'h01};          //(Active control) = 0x00  
		default:lut_data <= {8'hff,16'hffff,8'hff};
	endcase
end


endmodule 