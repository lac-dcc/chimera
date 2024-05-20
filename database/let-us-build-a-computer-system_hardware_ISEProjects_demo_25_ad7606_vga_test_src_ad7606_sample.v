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
//2017/8/28                   1.0          Original
//*******************************************************************************/
module ad7606_sample(
	input                       adc_clk,
	input                       rst,
	input[15:0]                 adc_data,
	input                       adc_data_valid,
	output                      adc_buf_wr,
	output[11:0]                adc_buf_addr,
	output[7:0]                 adc_buf_data
);

//`define TRIGGER

localparam       S_IDLE    = 0;
localparam       S_SAMPLE  = 1;
localparam       S_WAIT    = 2;

reg signed[16:0] adc_data_offset;
reg[7:0] adc_data_narrow;
reg[7:0] adc_data_narrow_d0;
reg[10:0] sample_cnt;
reg[31:0] wait_cnt;
reg[2:0] state;
assign adc_buf_addr = sample_cnt;
assign adc_buf_data = adc_data_narrow;
assign adc_buf_wr = (state == S_SAMPLE && adc_data_valid == 1'b1) ? 1'b1 : 1'b0;//ram write data enable
always@(posedge adc_clk or posedge rst)
begin
	if(rst == 1'b1)
		adc_data_offset <= 13'd0;
	else if(adc_data_valid == 1'b1)
		adc_data_offset <= {adc_data[15],adc_data} + 17'd32768;
end

always@(posedge adc_clk or posedge rst)
begin
	if(rst == 1'b1)
		adc_data_narrow <= 8'd0;
	else if(adc_data_valid == 1'b1)
		adc_data_narrow <= adc_data_offset[15:8];
end

always@(posedge adc_clk or posedge rst)
begin
	if(rst == 1'b1)
		adc_data_narrow_d0 <= 8'd0;
	else if(adc_data_valid == 1'b1)
		adc_data_narrow_d0 <= adc_data_narrow;
end
always@(posedge adc_clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		state <= S_IDLE;
		wait_cnt <= 32'd0;
		sample_cnt <= 11'd0;
	end
	else
		case(state)
			S_IDLE:
			begin
				state <= S_SAMPLE;
			end
			S_SAMPLE:
			begin
				if(adc_data_valid == 1'b1)
				begin
					if(sample_cnt == 11'd1023)
					begin
						sample_cnt <= 11'd0;
						state <= S_WAIT;
					end
					else
					begin
						sample_cnt <= sample_cnt + 11'd1;
					end
				end
			end		
			S_WAIT:
			begin
`ifdef  TRIGGER				
				if(adc_data_valid == 1'b1 && adc_data_narrow_d0 < 8'd127 && adc_data_narrow >= 8'd127)
					state <= S_SAMPLE;
`else
				if(wait_cnt == 32'd25_000_000)
				begin
					state <= S_SAMPLE;
					wait_cnt <= 32'd0;
				end
				else
				begin
					wait_cnt <= wait_cnt + 32'd1;
				end
`endif					
			end	
			default:
				state <= S_IDLE;
		endcase
end

endmodule 