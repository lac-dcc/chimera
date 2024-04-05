/*
 * This IP is the core registers implementation.
 * 
 * Copyright (C) 2018  Iulian Gheorghiu (morgoth.creator@gmail.com)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

`timescale 1ns / 1ps

`include "mega-def.v"

module mega_regs #
	(
	parameter PLATFORM = "XILINX",
	parameter REGISTERED = "FALSE"
	)(
	input rst,
	input clk,
	input [4:0]rs1a,
	output reg[15:0]rs1,
	input rs1m,
	input [4:0]rs2a,
	output reg[15:0]rs2,
	input rs2m,
	input [4:0]rda,
	input [15:0]rd,
	input rdw,
	input rdm
	);

generate
if(PLATFORM == "XILINX" || PLATFORM == "iCE40UP")
begin
//(* ram_style="block" *)
reg [7:0]REGL[0:15];
//(* ram_style="block" *)
reg [7:0]REGH[0:15];

wire [3:0]rda_int = rda[4:1];
wire [3:0]rs1a_int = rs1a[4:1];
wire [3:0]rs2a_int = rs2a[4:1];

integer clear_cnt;
initial 
begin
	for(clear_cnt = 0; clear_cnt < 16; clear_cnt = clear_cnt + 1)
	begin:CLEAR
		REGL[clear_cnt] <= 8'h00;
		REGH[clear_cnt] <= 8'h00;
	end
end

always @ (posedge clk)
begin
	case({rdw, rdm, rda[0]})
	3'b100, 3'b110, 3'b111: REGL[rda_int] <= rd[7:0];
	endcase
	case({rdw, rdm, rda[0]})
	3'b101: REGH[rda_int] <= rd[7:0];
	3'b110, 3'b111: REGH[rda_int] <= rd[15:8];
	endcase
end

reg [15:0]REG_1_REG;
reg [15:0]REG_2_REG;

always @ (posedge PLATFORM == "iCE40UP" ? ~clk : clk)
begin
	if(REGISTERED == "TRUE")
	begin
		REG_1_REG = {REGH[rs1a_int], REGL[rs1a_int]};
		REG_2_REG = {REGH[rs2a_int], REGL[rs2a_int]};
	end
end

always @ *
begin
	if(REGISTERED == "TRUE")
	begin
		casex({rs1m, rs1a[0]})
		2'b00: rs1 <= {8'h00, REG_1_REG[7:0]};
		2'b01: rs1 <= {8'h00, REG_1_REG[15:8]};
		2'b1x: rs1 <= REG_1_REG;
		endcase
		casex({rs2m, rs2a[0]})
		2'b00: rs2 <= {8'h00, REG_2_REG[7:0]};
		2'b01: rs2 <= {8'h00, REG_2_REG[15:8]};
		2'b1x: rs2 <= REG_2_REG;
		endcase
	end
	else
	begin
		casex({rs1m, rs1a[0]})
		2'b00: rs1 <= {8'h00, REGL[rs1a_int]};
		2'b01: rs1 <= {8'h00, REGH[rs1a_int]};
		2'b1x: rs1 <= {REGH[rs1a_int], REGL[rs1a_int]};
		endcase
		casex({rs2m, rs2a[0]})
		2'b00: rs2 <= {8'h00, REGL[rs2a_int]};
		2'b01: rs2 <= {8'h00, REGH[rs2a_int]};
		2'b1x: rs2 <= {REGH[rs2a_int], REGL[rs2a_int]};
		endcase
	end
end

//assign rs1 = (rs1m) ? {REGH[rs1a[3:0]], REGL[rs1a[3:0]]} : (rs1a[0]) ? {8'h00, REGH[rs1a[4:1]]} : {8'h00, REGL[rs1a[4:1]]};
//assign rs2 = (rs2m) ? {REGH[rs2a[3:0]], REGL[rs2a[3:0]]} : (rs2a[0]) ? {8'h00, REGH[rs2a[4:1]]} : {8'h00, REGL[rs2a[4:1]]};
//assign rs1 = (rs1m) ? {REGH[rs1a_int], REGL[rs1a_int]} : (rs1a[0]) ? {8'h00, REGH[rs1a_int]} : {8'h00, REGL[rs1a_int]};
//assign rs2 = (rs2m) ? {REGH[rs2a_int], REGL[rs2a_int]} : (rs2a[0]) ? {8'h00, REGH[rs2a_int]} : {8'h00, REGL[rs2a_int]};

end /* PLATFORM != "XILINX" */
else
if(PLATFORM == "LATTICE_ECP5" || PLATFORM == "LATTICE_ECP3" || PLATFORM == "LATTICE_LIFMD" || PLATFORM == "LATTICE_MARCHXO2" || PLATFORM == "LATTICE_MARCHXO3L")
begin/* Lattice Diamond does not know how to implement distributed RAM with true three ports, so I implement him from individual distributed RAM cells. */
	
wire [7:0]REGLD_out;
wire [7:0]REGHD_out;
wire [7:0]REGLR_out;
wire [7:0]REGHR_out;
wire write_to_L = rdw & ((!rdm & !rda[0]) || rdm);
wire write_to_H = rdw &((!rdm & rda[0]) || rdm);
wire write_to_HL = rdw &rdm;

DPR16X4C REG_L_D_4_7(
	.DI3(rd[7]),
	.DI2(rd[6]),
	.DI1(rd[5]),
	.DI0(rd[4]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_L | write_to_HL),
	.RAD3(rs1m ? rs2a[3]:rs1a[4]),
	.RAD2(rs1m ? rs2a[2]:rs1a[3]),
	.RAD1(rs1m ? rs2a[1]:rs1a[2]),
	.RAD0(rs1m ? rs2a[0]:rs1a[1]),
	.DO3(REGLD_out[7]),
	.DO2(REGLD_out[6]),
	.DO1(REGLD_out[5]),
	.DO0(REGLD_out[4])
);
	
DPR16X4C REG_L_D_0_3(
	.DI3(rd[3]),
	.DI2(rd[2]),
	.DI1(rd[1]),
	.DI0(rd[0]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_L | write_to_HL),
	.RAD3(rs1m ? rs2a[3]:rs1a[4]),
	.RAD2(rs1m ? rs2a[2]:rs1a[3]),
	.RAD1(rs1m ? rs2a[1]:rs1a[2]),
	.RAD0(rs1m ? rs2a[0]:rs1a[1]),
	.DO3(REGLD_out[3]),
	.DO2(REGLD_out[2]),
	.DO1(REGLD_out[1]),
	.DO0(REGLD_out[0])
);
	
DPR16X4C REG_H_D_4_7(
	.DI3(write_to_HL ? rd[15] : rd[7]),
	.DI2(write_to_HL ? rd[14] : rd[6]),
	.DI1(write_to_HL ? rd[13] : rd[5]),
	.DI0(write_to_HL ? rd[12] : rd[4]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_H | write_to_HL),
	.RAD3(rs1m ? rs2a[3]:rs1a[4]),
	.RAD2(rs1m ? rs2a[2]:rs1a[3]),
	.RAD1(rs1m ? rs2a[1]:rs1a[2]),
	.RAD0(rs1m ? rs2a[0]:rs1a[1]),
	.DO3(REGHD_out[7]),
	.DO2(REGHD_out[6]),
	.DO1(REGHD_out[5]),
	.DO0(REGHD_out[4])
);
	
DPR16X4C REG_H_D_0_3(
	.DI3(write_to_HL ? rd[11] : rd[3]),
	.DI2(write_to_HL ? rd[10] : rd[2]),
	.DI1(write_to_HL ? rd[9] : rd[1]),
	.DI0(write_to_HL ? rd[8] : rd[0]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_H | write_to_HL),
	.RAD3(rs1m ? rs2a[3]:rs1a[4]),
	.RAD2(rs1m ? rs2a[2]:rs1a[3]),
	.RAD1(rs1m ? rs2a[1]:rs1a[2]),
	.RAD0(rs1m ? rs2a[0]:rs1a[1]),
	.DO3(REGHD_out[3]),
	.DO2(REGHD_out[2]),
	.DO1(REGHD_out[1]),
	.DO0(REGHD_out[0])
);
	
DPR16X4C REG_L_R_4_7(
	.DI3(rd[7]),
	.DI2(rd[6]),
	.DI1(rd[5]),
	.DI0(rd[4]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_L | write_to_HL),
	.RAD3(rs2m ? rs2a[3]:rs2a[4]),
	.RAD2(rs2m ? rs2a[2]:rs2a[3]),
	.RAD1(rs2m ? rs2a[1]:rs2a[2]),
	.RAD0(rs2m ? rs2a[0]:rs2a[1]),
	.DO3(REGLR_out[7]),
	.DO2(REGLR_out[6]),
	.DO1(REGLR_out[5]),
	.DO0(REGLR_out[4])
);
	
DPR16X4C REG_L_R_0_3(
	.DI3(rd[3]),
	.DI2(rd[2]),
	.DI1(rd[1]),
	.DI0(rd[0]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_L | write_to_HL),
	.RAD3(rs2m ? rs2a[3]:rs2a[4]),
	.RAD2(rs2m ? rs2a[2]:rs2a[3]),
	.RAD1(rs2m ? rs2a[1]:rs2a[2]),
	.RAD0(rs2m ? rs2a[0]:rs2a[1]),
	.DO3(REGLR_out[3]),
	.DO2(REGLR_out[2]),
	.DO1(REGLR_out[1]),
	.DO0(REGLR_out[0])
);
	
DPR16X4C REG_H_R_4_7(
	.DI3(write_to_HL ? rd[15] : rd[7]),
	.DI2(write_to_HL ? rd[14] : rd[6]),
	.DI1(write_to_HL ? rd[13] : rd[5]),
	.DI0(write_to_HL ? rd[12] : rd[4]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_H | write_to_HL),
	.RAD3(rs2m ? rs2a[3]:rs2a[4]),
	.RAD2(rs2m ? rs2a[2]:rs2a[3]),
	.RAD1(rs2m ? rs2a[1]:rs2a[2]),
	.RAD0(rs2m ? rs2a[0]:rs2a[1]),
	.DO3(REGHR_out[7]),
	.DO2(REGHR_out[6]),
	.DO1(REGHR_out[5]),
	.DO0(REGHR_out[4])
);
	
DPR16X4C REG_H_R_0_3(
	.DI3(write_to_HL ? rd[11] : rd[3]),
	.DI2(write_to_HL ? rd[10] : rd[2]),
	.DI1(write_to_HL ? rd[9] : rd[1]),
	.DI0(write_to_HL ? rd[8] : rd[0]),
	.WAD3(write_to_HL ? rda[3]:rda[4]),
	.WAD2(write_to_HL ? rda[2]:rda[3]),
	.WAD1(write_to_HL ? rda[1]:rda[2]),
	.WAD0(write_to_HL ? rda[0]:rda[1]),
	.WCK(clk),
	.WRE(write_to_H | write_to_HL),
	.RAD3(rs2m ? rs2a[3]:rs2a[4]),
	.RAD2(rs2m ? rs2a[2]:rs2a[3]),
	.RAD1(rs2m ? rs2a[1]:rs2a[2]),
	.RAD0(rs2m ? rs2a[0]:rs2a[1]),
	.DO3(REGHR_out[3]),
	.DO2(REGHR_out[2]),
	.DO1(REGHR_out[1]),
	.DO0(REGHR_out[0])
);
	
always @ *
begin
	case({rs1m, rs1a[0]})
	2'b00: rs1 <= {8'h00, REGLD_out};
	2'b01: rs1 <= {8'h00, REGHD_out};
	default : rs1 <= {REGHD_out, REGLD_out};
	endcase
	case({rs2m, rs2a[0]})
	2'b00: rs2 <= {8'h00, REGLR_out};
	2'b01: rs2 <= {8'h00, REGHR_out};
	default : rs2 <= {REGHR_out, REGLR_out};
	endcase
end

//assign rs1 = (rs1m) ? {REGHD_out, REGLD_out} : (rs1a[0]) ? {8'h00, REGHD_out} : {8'h00, REGLD_out};
//assign rs2 = (rs2m) ? {REGHR_out, REGLR_out} : (rs2a[0]) ? {8'h00, REGHR_out} : {8'h00, REGLR_out};

end/* PLATFORM != "LATTICE_ECP5" || PLATFORM != "LATTICE_ECP3" || PLATFORM != "LATTICE_LIFMD" || PLATFORM != "LATTICE_MARCHXO2" || PLATFORM != "LATTICE_MARCHXO3L" */
endgenerate

endmodule
