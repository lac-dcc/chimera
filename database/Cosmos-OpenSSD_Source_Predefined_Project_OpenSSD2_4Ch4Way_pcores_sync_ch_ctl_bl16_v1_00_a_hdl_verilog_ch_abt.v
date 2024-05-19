// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// ch_abt.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
//                Kibin Park <kbpark@enc.hanyang.ac.kr>
//                Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//
// This file is part of Cosmos OpenSSD.
//
// Cosmos OpenSSD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// Cosmos OpenSSD is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Cosmos OpenSSD; see the file COPYING.
// If not, see <http://www.gnu.org/licenses/>. 
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: ENC Lab. <http://enc.hanyang.ac.kr>
// Engineer: Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>, Kibin park <kbpark@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: channel arbiter
// Module Name: ch_arbiter
// File Name: ch_abt.v
//
// Version: v1.1.0
//
// Description: 
//   - control bus io in round-robin scheduling
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.0
//   - minor modification
//
// * v1.0.0
//   - first draft 
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module ch_arbiter (
input		i_nc_clk,
input		i_nc_rstn,

input		[`WAY-1:0]	i_ch_req,
output	[`WAY-1:0]	o_ch_grt
);

reg	[7:0]	o_ch_grt;

// shift i_ch_req to round robin the current priority

/////////////////////////////////////////////////////////////////
  parameter         IDLE                 = 4'b0000;
  parameter         GNT_0                = 4'b0001;
  parameter         GNT_1                = 4'b0011;
  parameter         GNT_2                = 4'b0010;
  parameter         GNT_3                = 4'b0110;
  parameter         GNT_4                = 4'b0111;
  parameter         GNT_5                = 4'b0101;
  parameter         GNT_6                = 4'b0100;
  parameter         GNT_7                = 4'b1100;

reg [3:0]   cur_state;
reg [3:0]   next_state;
reg [7:0]   arbiter_ptr;

always @ (posedge i_nc_clk, negedge i_nc_rstn) begin
	if (!i_nc_rstn)
		cur_state <= IDLE;
	else
		cur_state <= next_state;
end

always @ (*)
begin
	case (cur_state)	
		IDLE : begin
			casex (i_ch_req)
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;
				8'bxxxx_x1xx : next_state <= GNT_2;
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_0 : begin
			casex (i_ch_req)
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;
				8'bxxxx_x1xx : next_state <= GNT_2;
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_1 : begin
			casex (i_ch_req)
				8'bxxxx_xx1x : next_state <= GNT_1;
				8'bxxxx_x1xx : next_state <= GNT_2;
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_2 : begin
			casex (i_ch_req)
				8'bxxxx_x1xx : next_state <= GNT_2;
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_3 : begin
			casex (i_ch_req)
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;
				8'bxxxx_x1xx : next_state <= GNT_2;		
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_4 : begin
			casex (i_ch_req)
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;	
				8'bxxxx_x1xx : next_state <= GNT_2;	
				8'bxxxx_1xxx : next_state <= GNT_3;			
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_5 : begin
			casex (i_ch_req)
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;	
				8'bxxxx_x1xx : next_state <= GNT_2;	
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_6 : begin
			casex (i_ch_req)
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;	
				8'bxxxx_x1xx : next_state <= GNT_2;	
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		GNT_7 : begin
			casex (i_ch_req)
				8'b1xxx_xxxx : next_state <= GNT_7;
				8'bxxxx_xxx1 : next_state <= GNT_0;
				8'bxxxx_xx1x : next_state <= GNT_1;	
				8'bxxxx_x1xx : next_state <= GNT_2;	
				8'bxxxx_1xxx : next_state <= GNT_3;
				8'bxxx1_xxxx : next_state <= GNT_4;
				8'bxx1x_xxxx : next_state <= GNT_5;
				8'bx1xx_xxxx : next_state <= GNT_6;
				8'b0000_0000 : next_state <= IDLE;
			endcase
		end
		default:
			next_state <= IDLE;
	endcase	
end

always @ (*) begin
	case (cur_state)
	GNT_0 : o_ch_grt <= 8'b0000_0001;
	GNT_1 : o_ch_grt <= 8'b0000_0010;
	GNT_2 : o_ch_grt <= 8'b0000_0100;
	GNT_3 : o_ch_grt <= 8'b0000_1000;
	GNT_4 : o_ch_grt <= 8'b0001_0000;
	GNT_5 : o_ch_grt <= 8'b0010_0000;
	GNT_6 : o_ch_grt <= 8'b0100_0000;
	GNT_7 : o_ch_grt <= 8'b1000_0000;
	default :	 o_ch_grt <= 8'b0;
	endcase
end

endmodule
