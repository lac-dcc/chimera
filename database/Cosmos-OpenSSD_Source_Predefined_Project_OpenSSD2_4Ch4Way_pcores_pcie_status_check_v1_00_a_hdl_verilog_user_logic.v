//////////////////////////////////////////////////////////////////////////////////
// user_logic.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Kibin Park <kbpark@enc.hanyang.ac.kr>
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
// Engineer: Kibin park <kbpark@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: pcie status checker
// Module Name: user_logic
// File Name: user_logic.v
//
// Version: v1.0.0
//
// Description: 
//   - pcie status checker
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.0
//   - first draft 
//////////////////////////////////////////////////////////////////////////////////
`uselib lib=unisims_ver
`uselib lib=proc_common_v3_00_a

module user_logic
#
(
	parameter C_NUM_REG                      = 1,
	parameter C_SLV_DWIDTH                   = 32
)
(
	input pcie_mmcm_lock,

	input                             Bus2IP_Clk,
	input                             Bus2IP_Resetn,
	input      [0 : 31]               Bus2IP_Addr,
	input                             Bus2IP_CS,
	input                             Bus2IP_RNW,
	input      [C_SLV_DWIDTH-1 : 0]   Bus2IP_Data,
	input      [C_SLV_DWIDTH/8-1 : 0] Bus2IP_BE,
	input      [C_NUM_REG-1 : 0]      Bus2IP_RdCE,
	input      [C_NUM_REG-1 : 0]      Bus2IP_WrCE,
	output     [C_SLV_DWIDTH-1 : 0]   IP2Bus_Data,
	output                            IP2Bus_RdAck,
	output                            IP2Bus_WrAck,
	output                            IP2Bus_Error
);

	reg sig;
	
	always @ (posedge Bus2IP_Clk, negedge Bus2IP_Resetn)
		if (!Bus2IP_Resetn)
			sig <= 1'b0;
		else
			sig <= pcie_mmcm_lock;

	assign IP2Bus_Data = sig;
	assign IP2Bus_WrAck = 1'b1;
	assign IP2Bus_RdAck = 1'b1;
	assign IP2Bus_Error = 0;

endmodule
