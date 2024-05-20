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
//2017/8/20                    1.0          Original
//*******************************************************************************/
module grid_display(
	input                       rst_n,   
	input                       pclk,
	input                       i_hs,    
	input                       i_vs,    
	input                       i_de,	
	input[23:0]                 i_data,  
	output                      o_hs,    
	output                      o_vs,    
	output                      o_de,    
	output[23:0]                o_data
);
wire[11:0] pos_x;
wire[11:0] pos_y;
wire       pos_hs;
wire       pos_vs;
wire       pos_de;
wire[23:0] pos_data;
reg[23:0]  v_data;
reg[8:0]   grid_x;
reg        region_active;

assign o_data = v_data;
assign o_hs = pos_hs;
assign o_vs = pos_vs;
assign o_de = pos_de;
always@(posedge pclk)
begin
	if(pos_y >= 12'd9 && pos_y <= 12'd308 && pos_x >= 12'd9 && pos_x  <= 12'd1018)
		region_active <= 1'b1;
	else
		region_active <= 1'b0;
end

always@(posedge pclk)
begin
	if(region_active == 1'b1 && pos_de == 1'b1)
		grid_x <= (grid_x == 9'd9) ? 9'd0 : grid_x + 9'd1;
	else
		grid_x <= 9'd0;
end

always@(posedge pclk)
begin
	if(region_active == 1'b1)
		if(pos_y == 12'd287 || pos_y == 12'd32 || pos_y == 12'd159 || (pos_y < 12'd287 && pos_y > 12'd32 &&grid_x == 9'd9 && pos_y[0] == 1'b1))
			v_data <= {8'd255,8'd255,8'd255};
		else
			v_data <= 24'h000000;
	else
		v_data <= pos_data;
end

timing_gen_xy timing_gen_xy_m0
(
	.rst_n    (rst_n    ),
	.clk      (pclk     ),
	.i_hs     (i_hs     ),
	.i_vs     (i_vs     ),
	.i_de     (i_de     ),
	.i_data   (i_data   ),
	.o_hs     (pos_hs   ),
	.o_vs     (pos_vs   ),
	.o_de     (pos_de   ),
	.o_data   (pos_data ),
	.x        (pos_x    ),
	.y        (pos_y    )
);
endmodule 