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

//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*************************************************************************/
module seg_scan(
	input           clk,
	input           rst_n,
	output reg[5:0] seg_sel,      //digital led chip select
	output reg[7:0] seg_data,     //eight segment digital tube output,MSB is the decimal point
	input[7:0]      seg_data_0,
	input[7:0]      seg_data_1,
	input[7:0]      seg_data_2,
	input[7:0]      seg_data_3,
	input[7:0]      seg_data_4,
	input[7:0]      seg_data_5
);
parameter SCAN_FREQ = 200;     //scan frequency
parameter CLK_FREQ = 50000000; //clock frequency

parameter SCAN_COUNT = CLK_FREQ /(SCAN_FREQ * 6) - 1;

reg[31:0] scan_timer;  //scan time counter
reg[3:0] scan_sel;     //Scan select counter
always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		scan_timer <= 32'd0;
		scan_sel <= 4'd0;
	end
	else if(scan_timer >= SCAN_COUNT)
	begin
		scan_timer <= 32'd0;
		if(scan_sel == 4'd5)
			scan_sel <= 4'd0;
		else
			scan_sel <= scan_sel + 4'd1;
	end
	else
		begin
			scan_timer <= scan_timer + 32'd1;
		end
end
always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		seg_sel <= 6'b111111;
		seg_data <= 8'hff;
	end
	else
	begin
		case(scan_sel)
			//first digital led
			4'd0:
			begin
				seg_sel <= 6'b11_1110;
				seg_data <= seg_data_0;
			end
			//second digital led
			4'd1:
			begin
				seg_sel <= 6'b11_1101;
				seg_data <= seg_data_1;
			end
			//...
			4'd2:
			begin
				seg_sel <= 6'b11_1011;
				seg_data <= seg_data_2;
			end
			4'd3:
			begin
				seg_sel <= 6'b11_0111;
				seg_data <= seg_data_3;
			end
			4'd4:
			begin
				seg_sel <= 6'b10_1111;
				seg_data <= seg_data_4;
			end
			4'd5:
			begin
				seg_sel <= 6'b01_1111;
				seg_data <= seg_data_5;
			end
			default:
			begin
				seg_sel <= 6'b11_1111;
				seg_data <= 8'hff;
			end
		endcase
	end
end

endmodule