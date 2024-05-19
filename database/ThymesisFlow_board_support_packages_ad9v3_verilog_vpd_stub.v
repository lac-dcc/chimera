// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ps / 1ps
// -------------------------------------------------------------------
//
// Title    : vpd_stub.v
// Function : This file is intended to be a temporary replacement for an I2C controller attached to a serial EEPROM
//            where the real card's VPD information is stored. This file can be attached to the afu_config_space.v
//            VPD interface instead. It is intended for use during simulation, not FPGA synthesis & implementation.
//
// -------------------------------------------------------------------
// Modification History :
//                                |Version    |     |Author   |Description of change
//                                |-----------|     |-------- |---------------------
  `define vpd_stub_VERSION         12_Sep_2017   //            Change items reported by HAL check
// -------------------------------------------------------------------

//
// ******************************************************************************************************************************
// Functional Description
//
// All internal configuration registers are 32 bits wide, using Little Endian format and addressing. 
// This means bits are ordered [31:0] and bytes are ordered 3,2,1,0 when looking at the lowest 2 address bits.
// 
// One register is selected at a time using the 'vpd_addr'. 
//
// Reads from an address that is not implemented returns all 0s. Writes to an address that is not implemented or read only are dropped.
// Either type of access to an unimplemented address raises an error signal that can be routed to an internal error register.
//
// Write operations are triggered by setting the 'wren' input active. 
// Read  operations are triggered by setting the 'rden' input active. 
// When either the write is complete or the read data is available on 'rdata', 'done' is pulsed for 1 cycle.
// ******************************************************************************************************************************
// Notes about the VPD data content:
//   The content of the VPD fields was copied from the PCI Local Bus Specification, version 3.0, dated Feb 3, 2004. This was
//   used to ensure the example has valid VPD information in it. (reference section "I.3.2 VPD Example")
// ******************************************************************************************************************************
 
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module vpd_stub
(    
    // Miscellaneous Ports
    input         clock                             
  , input         reset                      // (positive active)

  , input  [14:0] cfg_vpd_addr               // Address for write or read
  , input         cfg_vpd_wren               // Held at 1 to write a location until it sees vpd_done = 1 then clear to 0
  , input  [31:0] cfg_vpd_wdata              // Contains data to write to VPD register (valid while wren=1)
  , input         cfg_vpd_rden               // Held at 1 to read  a location until it sees vpd_done = 1 then clear to 0
  , output [31:0] vpd_cfg_rdata              // Contains data read back from VPD register (valid when rden=1 and vpd_done=1)
  , output        vpd_cfg_done               // VPD pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results

    // Error indicator
  , output        vpd_err_unimplemented_addr // Connect into internal error vector if desired
) ;

// -----------------------------------------------------------
// Register inputs to prevent backflowed timing issues
// -----------------------------------------------------------
reg         reset_q;
reg  [14:0] addr_q;
reg         wren_q;
reg  [31:0] wdata_q;
reg         rden_q;

always @(posedge(clock))
  begin
    reset_q     <= reset;
    addr_q      <= cfg_vpd_addr;
    wren_q      <= cfg_vpd_wren;
    wdata_q     <= cfg_vpd_wdata;
    rden_q      <= cfg_vpd_rden;
  end


reg  prev_wren_q;
reg  prev_rden_q;
reg  wren_pulse;
reg  rden_pulse;
always @(posedge(clock))
  begin
    prev_wren_q <= wren_q;   // Create latched copy of enable inputs so can detect when they change
    prev_rden_q <= rden_q;
    if (prev_wren_q == 1'b0 && wren_q == 1'b1)  wren_pulse <= 1'b1;   // Look for rising edge (0->1)
    else                                        wren_pulse <= 1'b0;
    if (prev_rden_q == 1'b0 && rden_q == 1'b1)  rden_pulse <= 1'b1;
    else                                        rden_pulse <= 1'b0;
  end

// ------------------------------------
// Check for bad address
// ------------------------------------
wire upper_addr_is_zero = (addr_q[14:8] == 7'b0) ? 1'b1 : 1'b0;

assign vpd_err_unimplemented_addr = ( (wren_pulse == 1'b1 && upper_addr_is_zero == 1'b0 && (addr_q[7:0] < 8'h80 || addr_q[7:0] > 8'hFF)) ? 1'b1 : 1'b0 ) 
                                 || ( (rden_pulse == 1'b1 && upper_addr_is_zero == 1'b0 && (addr_q[7:0] < 8'h00 || addr_q[7:0] > 8'hFF)) ? 1'b1 : 1'b0 );


// ------------------------------------
// Select target register using address
// ------------------------------------
wire sel_00, sel_04, sel_08, sel_0C;
wire sel_10, sel_14, sel_18, sel_1C;
wire sel_20, sel_24, sel_28, sel_2C;
wire sel_30, sel_34, sel_38, sel_3C;
wire sel_40, sel_44, sel_48, sel_4C;
wire sel_50, sel_54, sel_58, sel_5C;
wire sel_60, sel_64, sel_68, sel_6C;
wire sel_70, sel_74, sel_78, sel_7C;
wire sel_80, sel_84, sel_88, sel_8C;
wire sel_90, sel_94, sel_98, sel_9C;
wire sel_A0, sel_A4, sel_A8, sel_AC;
wire sel_B0, sel_B4, sel_B8, sel_BC;
wire sel_C0, sel_C4, sel_C8, sel_CC;
wire sel_D0, sel_D4, sel_D8, sel_DC;
wire sel_E0, sel_E4, sel_E8, sel_EC;
wire sel_F0, sel_F4, sel_F8, sel_FC;

assign sel_00 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h00 && addr_q[7:0] < 8'h04) ? 1'b1 : 1'b0;
assign sel_04 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h04 && addr_q[7:0] < 8'h08) ? 1'b1 : 1'b0;
assign sel_08 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h08 && addr_q[7:0] < 8'h0C) ? 1'b1 : 1'b0;
assign sel_0C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h0C && addr_q[7:0] < 8'h10) ? 1'b1 : 1'b0;
assign sel_10 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h10 && addr_q[7:0] < 8'h14) ? 1'b1 : 1'b0;
assign sel_14 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h14 && addr_q[7:0] < 8'h18) ? 1'b1 : 1'b0;
assign sel_18 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h18 && addr_q[7:0] < 8'h1C) ? 1'b1 : 1'b0;
assign sel_1C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h1C && addr_q[7:0] < 8'h20) ? 1'b1 : 1'b0;
assign sel_20 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h20 && addr_q[7:0] < 8'h24) ? 1'b1 : 1'b0;
assign sel_24 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h24 && addr_q[7:0] < 8'h28) ? 1'b1 : 1'b0;
assign sel_28 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h28 && addr_q[7:0] < 8'h2C) ? 1'b1 : 1'b0;
assign sel_2C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h2C && addr_q[7:0] < 8'h30) ? 1'b1 : 1'b0;
assign sel_30 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h30 && addr_q[7:0] < 8'h34) ? 1'b1 : 1'b0;
assign sel_34 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h34 && addr_q[7:0] < 8'h38) ? 1'b1 : 1'b0;
assign sel_38 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h38 && addr_q[7:0] < 8'h3C) ? 1'b1 : 1'b0;
assign sel_3C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h3C && addr_q[7:0] < 8'h40) ? 1'b1 : 1'b0;
assign sel_40 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h40 && addr_q[7:0] < 8'h44) ? 1'b1 : 1'b0;
assign sel_44 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h44 && addr_q[7:0] < 8'h48) ? 1'b1 : 1'b0;
assign sel_48 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h48 && addr_q[7:0] < 8'h4C) ? 1'b1 : 1'b0;
assign sel_4C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h4C && addr_q[7:0] < 8'h50) ? 1'b1 : 1'b0;
assign sel_50 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h50 && addr_q[7:0] < 8'h54) ? 1'b1 : 1'b0;
assign sel_54 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h54 && addr_q[7:0] < 8'h58) ? 1'b1 : 1'b0;
assign sel_58 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h58 && addr_q[7:0] < 8'h5C) ? 1'b1 : 1'b0;
assign sel_5C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h5C && addr_q[7:0] < 8'h60) ? 1'b1 : 1'b0;
assign sel_60 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h60 && addr_q[7:0] < 8'h64) ? 1'b1 : 1'b0;
assign sel_64 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h64 && addr_q[7:0] < 8'h68) ? 1'b1 : 1'b0;
assign sel_68 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h68 && addr_q[7:0] < 8'h6C) ? 1'b1 : 1'b0;
assign sel_6C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h6C && addr_q[7:0] < 8'h70) ? 1'b1 : 1'b0;
assign sel_70 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h70 && addr_q[7:0] < 8'h74) ? 1'b1 : 1'b0;
assign sel_74 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h74 && addr_q[7:0] < 8'h78) ? 1'b1 : 1'b0;
assign sel_78 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h78 && addr_q[7:0] < 8'h7C) ? 1'b1 : 1'b0;
assign sel_7C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h7C && addr_q[7:0] < 8'h80) ? 1'b1 : 1'b0;
assign sel_80 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h80 && addr_q[7:0] < 8'h84) ? 1'b1 : 1'b0;
assign sel_84 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h84 && addr_q[7:0] < 8'h88) ? 1'b1 : 1'b0;
assign sel_88 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h88 && addr_q[7:0] < 8'h8C) ? 1'b1 : 1'b0;
assign sel_8C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h8C && addr_q[7:0] < 8'h90) ? 1'b1 : 1'b0;
assign sel_90 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h90 && addr_q[7:0] < 8'h94) ? 1'b1 : 1'b0;
assign sel_94 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h94 && addr_q[7:0] < 8'h98) ? 1'b1 : 1'b0;
assign sel_98 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h98 && addr_q[7:0] < 8'h9C) ? 1'b1 : 1'b0;
assign sel_9C = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'h9C && addr_q[7:0] < 8'hA0) ? 1'b1 : 1'b0;
assign sel_A0 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hA0 && addr_q[7:0] < 8'hA4) ? 1'b1 : 1'b0;
assign sel_A4 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hA4 && addr_q[7:0] < 8'hA8) ? 1'b1 : 1'b0;
assign sel_A8 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hA8 && addr_q[7:0] < 8'hAC) ? 1'b1 : 1'b0;
assign sel_AC = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hAC && addr_q[7:0] < 8'hB0) ? 1'b1 : 1'b0;
assign sel_B0 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hB0 && addr_q[7:0] < 8'hB4) ? 1'b1 : 1'b0;
assign sel_B4 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hB4 && addr_q[7:0] < 8'hB8) ? 1'b1 : 1'b0;
assign sel_B8 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hB8 && addr_q[7:0] < 8'hBC) ? 1'b1 : 1'b0;
assign sel_BC = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hBC && addr_q[7:0] < 8'hC0) ? 1'b1 : 1'b0;
assign sel_C0 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hC0 && addr_q[7:0] < 8'hC4) ? 1'b1 : 1'b0;
assign sel_C4 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hC4 && addr_q[7:0] < 8'hC8) ? 1'b1 : 1'b0;
assign sel_C8 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hC8 && addr_q[7:0] < 8'hCC) ? 1'b1 : 1'b0;
assign sel_CC = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hCC && addr_q[7:0] < 8'hD0) ? 1'b1 : 1'b0;
assign sel_D0 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hD0 && addr_q[7:0] < 8'hD4) ? 1'b1 : 1'b0;
assign sel_D4 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hD4 && addr_q[7:0] < 8'hD8) ? 1'b1 : 1'b0;
assign sel_D8 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hD8 && addr_q[7:0] < 8'hDC) ? 1'b1 : 1'b0;
assign sel_DC = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hDC && addr_q[7:0] < 8'hE0) ? 1'b1 : 1'b0;
assign sel_E0 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hE0 && addr_q[7:0] < 8'hE4) ? 1'b1 : 1'b0;
assign sel_E4 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hE4 && addr_q[7:0] < 8'hE8) ? 1'b1 : 1'b0;
assign sel_E8 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hE8 && addr_q[7:0] < 8'hEC) ? 1'b1 : 1'b0;
assign sel_EC = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hEC && addr_q[7:0] < 8'hF0) ? 1'b1 : 1'b0;
assign sel_F0 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hF0 && addr_q[7:0] < 8'hF4) ? 1'b1 : 1'b0;
assign sel_F4 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hF4 && addr_q[7:0] < 8'hF8) ? 1'b1 : 1'b0;
assign sel_F8 = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hF8 && addr_q[7:0] < 8'hFC) ? 1'b1 : 1'b0;
assign sel_FC = (upper_addr_is_zero == 1'b1 && addr_q[7:0] >= 8'hFC && addr_q[7:0] <= 8'hFF) ? 1'b1 : 1'b0;


// ..............................................
// @@@ VPD
// ..............................................

wire [31:0] reg_00_q, reg_04_q, reg_08_q, reg_0C_q;
wire [31:0] reg_10_q, reg_14_q, reg_18_q, reg_1C_q;
wire [31:0] reg_20_q, reg_24_q, reg_28_q, reg_2C_q;
wire [31:0] reg_30_q, reg_34_q, reg_38_q, reg_3C_q;
wire [31:0] reg_40_q, reg_44_q, reg_48_q, reg_4C_q;
wire [31:0] reg_50_q, reg_54_q, reg_58_q, reg_5C_q;
wire [31:0] reg_60_q, reg_64_q, reg_68_q, reg_6C_q;
wire [31:0] reg_70_q, reg_74_q, reg_78_q, reg_7C_q;
reg  [31:0] reg_80_q, reg_84_q, reg_88_q, reg_8C_q;
reg  [31:0] reg_90_q, reg_94_q, reg_98_q, reg_9C_q;
reg  [31:0] reg_A0_q, reg_A4_q, reg_A8_q, reg_AC_q;
reg  [31:0] reg_B0_q, reg_B4_q, reg_B8_q, reg_BC_q;
reg  [31:0] reg_C0_q, reg_C4_q, reg_C8_q, reg_CC_q;
reg  [31:0] reg_D0_q, reg_D4_q, reg_D8_q, reg_DC_q;
reg  [31:0] reg_E0_q, reg_E4_q, reg_E8_q, reg_EC_q;
reg  [31:0] reg_F0_q, reg_F4_q, reg_F8_q, reg_FC_q;


wire [31:0] reg_00_rdata, reg_04_rdata, reg_08_rdata, reg_0C_rdata;
wire [31:0] reg_10_rdata, reg_14_rdata, reg_18_rdata, reg_1C_rdata;
wire [31:0] reg_20_rdata, reg_24_rdata, reg_28_rdata, reg_2C_rdata;
wire [31:0] reg_30_rdata, reg_34_rdata, reg_38_rdata, reg_3C_rdata;
wire [31:0] reg_40_rdata, reg_44_rdata, reg_48_rdata, reg_4C_rdata;
wire [31:0] reg_50_rdata, reg_54_rdata, reg_58_rdata, reg_5C_rdata;
wire [31:0] reg_60_rdata, reg_64_rdata, reg_68_rdata, reg_6C_rdata;
wire [31:0] reg_70_rdata, reg_74_rdata, reg_78_rdata, reg_7C_rdata;
wire [31:0] reg_80_rdata, reg_84_rdata, reg_88_rdata, reg_8C_rdata;
wire [31:0] reg_90_rdata, reg_94_rdata, reg_98_rdata, reg_9C_rdata;
wire [31:0] reg_A0_rdata, reg_A4_rdata, reg_A8_rdata, reg_AC_rdata;
wire [31:0] reg_B0_rdata, reg_B4_rdata, reg_B8_rdata, reg_BC_rdata;
wire [31:0] reg_C0_rdata, reg_C4_rdata, reg_C8_rdata, reg_CC_rdata;
wire [31:0] reg_D0_rdata, reg_D4_rdata, reg_D8_rdata, reg_DC_rdata;
wire [31:0] reg_E0_rdata, reg_E4_rdata, reg_E8_rdata, reg_EC_rdata;
wire [31:0] reg_F0_rdata, reg_F4_rdata, reg_F8_rdata, reg_FC_rdata;

// Read Only section
assign reg_00_q[ 7: 0] = 8'h82;    // Large Resource Type ID String Tag (02h)
assign reg_00_q[15: 8] = 8'h00;    // Length 0021h
assign reg_00_q[23:16] = 8'h21;
assign reg_00_q[31:24] = "A";      // Data
assign reg_00_rdata = (sel_00 == 1'b1 && rden_pulse == 1'b1) ? reg_00_q : 32'h00000000;

assign reg_04_q[ 7: 0] = "B";
assign reg_04_q[15: 8] = "C";
assign reg_04_q[23:16] = "D";
assign reg_04_q[31:24] = " ";
assign reg_04_rdata = (sel_04 == 1'b1 && rden_pulse == 1'b1) ? reg_04_q : 32'h00000000;

assign reg_08_q[ 7: 0] = "S";
assign reg_08_q[15: 8] = "u";
assign reg_08_q[23:16] = "p";
assign reg_08_q[31:24] = "e";
assign reg_08_rdata = (sel_08 == 1'b1 && rden_pulse == 1'b1) ? reg_08_q : 32'h00000000;

assign reg_0C_q[ 7: 0] = "r";
assign reg_0C_q[15: 8] = "-";
assign reg_0C_q[23:16] = "F";
assign reg_0C_q[31:24] = "a";
assign reg_0C_rdata = (sel_0C == 1'b1 && rden_pulse == 1'b1) ? reg_0C_q : 32'h00000000;

assign reg_10_q[ 7: 0] = "s";
assign reg_10_q[15: 8] = "t";
assign reg_10_q[23:16] = " ";
assign reg_10_q[31:24] = "W";
assign reg_10_rdata = (sel_10 == 1'b1 && rden_pulse == 1'b1) ? reg_10_q : 32'h00000000;

assign reg_14_q[ 7: 0] = "i";
assign reg_14_q[15: 8] = "d";
assign reg_14_q[23:16] = "g";
assign reg_14_q[31:24] = "e";
assign reg_14_rdata = (sel_14 == 1'b1 && rden_pulse == 1'b1) ? reg_14_q : 32'h00000000;

assign reg_18_q[ 7: 0] = "g";
assign reg_18_q[15: 8] = " ";
assign reg_18_q[23:16] = "C";
assign reg_18_q[31:24] = "o";
assign reg_18_rdata = (sel_18 == 1'b1 && rden_pulse == 1'b1) ? reg_18_q : 32'h00000000;

assign reg_1C_q[ 7: 0] = "n";
assign reg_1C_q[15: 8] = "t";
assign reg_1C_q[23:16] = "r";
assign reg_1C_q[31:24] = "o";
assign reg_1C_rdata = (sel_1C == 1'b1 && rden_pulse == 1'b1) ? reg_1C_q : 32'h00000000;

assign reg_20_q[ 7: 0] = "l";
assign reg_20_q[15: 8] = "l";
assign reg_20_q[23:16] = "e";
assign reg_20_q[31:24] = "r";
assign reg_20_rdata = (sel_20 == 1'b1 && rden_pulse == 1'b1) ? reg_20_q : 32'h00000000;

assign reg_24_q[ 7: 0] = 8'h90;
assign reg_24_q[15: 8] = 8'h00;
assign reg_24_q[23:16] = 8'h59;
assign reg_24_q[31:24] = "P";
assign reg_24_rdata = (sel_24 == 1'b1 && rden_pulse == 1'b1) ? reg_24_q : 32'h00000000;

assign reg_28_q[ 7: 0] = "N";
assign reg_28_q[15: 8] = 8'h08;
assign reg_28_q[23:16] = "6";
assign reg_28_q[31:24] = "1";
assign reg_28_rdata = (sel_28 == 1'b1 && rden_pulse == 1'b1) ? reg_28_q : 32'h00000000;

assign reg_2C_q[ 7: 0] = "8";
assign reg_2C_q[15: 8] = "1";
assign reg_2C_q[23:16] = "6";
assign reg_2C_q[31:24] = "8";
assign reg_2C_rdata = (sel_2C == 1'b1 && rden_pulse == 1'b1) ? reg_2C_q : 32'h00000000;

assign reg_30_q[ 7: 0] = "2";
assign reg_30_q[15: 8] = "A";
assign reg_30_q[23:16] = "E";
assign reg_30_q[31:24] = "C";
assign reg_30_rdata = (sel_30 == 1'b1 && rden_pulse == 1'b1) ? reg_30_q : 32'h00000000;

assign reg_34_q[ 7: 0] = 8'h0A;
assign reg_34_q[15: 8] = "4";
assign reg_34_q[23:16] = "9";
assign reg_34_q[31:24] = "5";
assign reg_34_rdata = (sel_34 == 1'b1 && rden_pulse == 1'b1) ? reg_34_q : 32'h00000000;

assign reg_38_q[ 7: 0] = "0";
assign reg_38_q[15: 8] = "2";
assign reg_38_q[23:16] = "6";
assign reg_38_q[31:24] = "2";
assign reg_38_rdata = (sel_38 == 1'b1 && rden_pulse == 1'b1) ? reg_38_q : 32'h00000000;

assign reg_3C_q[ 7: 0] = "5";
assign reg_3C_q[15: 8] = "3";
assign reg_3C_q[23:16] = "6";
assign reg_3C_q[31:24] = "S";
assign reg_3C_rdata = (sel_3C == 1'b1 && rden_pulse == 1'b1) ? reg_3C_q : 32'h00000000;

assign reg_40_q[ 7: 0] = "N";
assign reg_40_q[15: 8] = 8'h08;
assign reg_40_q[23:16] = "0";
assign reg_40_q[31:24] = "0";
assign reg_40_rdata = (sel_40 == 1'b1 && rden_pulse == 1'b1) ? reg_40_q : 32'h00000000;

assign reg_44_q[ 7: 0] = "0";
assign reg_44_q[15: 8] = "0";
assign reg_44_q[23:16] = "0";
assign reg_44_q[31:24] = "1";
assign reg_44_rdata = (sel_44 == 1'b1 && rden_pulse == 1'b1) ? reg_44_q : 32'h00000000;

assign reg_48_q[ 7: 0] = "9";
assign reg_48_q[15: 8] = "4";
assign reg_48_q[23:16] = "M";
assign reg_48_q[31:24] = "N";
assign reg_48_rdata = (sel_48 == 1'b1 && rden_pulse == 1'b1) ? reg_48_q : 32'h00000000;

assign reg_4C_q[ 7: 0] = 8'h04;
assign reg_4C_q[15: 8] = "1";
assign reg_4C_q[23:16] = "0";
assign reg_4C_q[31:24] = "3";
assign reg_4C_rdata = (sel_4C == 1'b1 && rden_pulse == 1'b1) ? reg_4C_q : 32'h00000000;

assign reg_50_q[ 7: 0] = "7";
assign reg_50_q[15: 8] = "R";
assign reg_50_q[23:16] = "V";
assign reg_50_q[31:24] = 8'h2C;
assign reg_50_rdata = (sel_50 == 1'b1 && rden_pulse == 1'b1) ? reg_50_q : 32'h00000000;

assign reg_54_q[ 7: 0] = 8'h00;  // Checksum    TODO: Fill in with correct value
assign reg_54_q[15: 8] = 8'h00;
assign reg_54_q[23:16] = 8'h00;
assign reg_54_q[31:24] = 8'h00;
assign reg_54_rdata = (sel_54 == 1'b1 && rden_pulse == 1'b1) ? reg_54_q : 32'h00000000;

assign reg_58_q[ 7: 0] = 8'h00;
assign reg_58_q[15: 8] = 8'h00;
assign reg_58_q[23:16] = 8'h00;
assign reg_58_q[31:24] = 8'h00;
assign reg_58_rdata = (sel_58 == 1'b1 && rden_pulse == 1'b1) ? reg_58_q : 32'h00000000;

assign reg_5C_q[ 7: 0] = 8'h00;
assign reg_5C_q[15: 8] = 8'h00;
assign reg_5C_q[23:16] = 8'h00;
assign reg_5C_q[31:24] = 8'h00;
assign reg_5C_rdata = (sel_5C == 1'b1 && rden_pulse == 1'b1) ? reg_5C_q : 32'h00000000;

assign reg_60_q[ 7: 0] = 8'h00;
assign reg_60_q[15: 8] = 8'h00;
assign reg_60_q[23:16] = 8'h00;
assign reg_60_q[31:24] = 8'h00;
assign reg_60_rdata = (sel_60 == 1'b1 && rden_pulse == 1'b1) ? reg_60_q : 32'h00000000;

assign reg_64_q[ 7: 0] = 8'h00;  
assign reg_64_q[15: 8] = 8'h00;
assign reg_64_q[23:16] = 8'h00;
assign reg_64_q[31:24] = 8'h00;
assign reg_64_rdata = (sel_64 == 1'b1 && rden_pulse == 1'b1) ? reg_64_q : 32'h00000000;

assign reg_68_q[ 7: 0] = 8'h00;
assign reg_68_q[15: 8] = 8'h00;
assign reg_68_q[23:16] = 8'h00;
assign reg_68_q[31:24] = 8'h00;
assign reg_68_rdata = (sel_68 == 1'b1 && rden_pulse == 1'b1) ? reg_68_q : 32'h00000000;

assign reg_6C_q[ 7: 0] = 8'h00;
assign reg_6C_q[15: 8] = 8'h00;
assign reg_6C_q[23:16] = 8'h00;
assign reg_6C_q[31:24] = 8'h00;
assign reg_6C_rdata = (sel_6C == 1'b1 && rden_pulse == 1'b1) ? reg_6C_q : 32'h00000000;

assign reg_70_q[ 7: 0] = 8'h00;
assign reg_70_q[15: 8] = 8'h00;
assign reg_70_q[23:16] = 8'h00;
assign reg_70_q[31:24] = 8'h00;
assign reg_70_rdata = (sel_70 == 1'b1 && rden_pulse == 1'b1) ? reg_70_q : 32'h00000000;

assign reg_74_q[ 7: 0] = 8'h00;  
assign reg_74_q[15: 8] = 8'h00;
assign reg_74_q[23:16] = 8'h00;
assign reg_74_q[31:24] = 8'h00;
assign reg_74_rdata = (sel_74 == 1'b1 && rden_pulse == 1'b1) ? reg_74_q : 32'h00000000;

assign reg_78_q[ 7: 0] = 8'h00;
assign reg_78_q[15: 8] = 8'h00;
assign reg_78_q[23:16] = 8'h00;
assign reg_78_q[31:24] = 8'h00;
assign reg_78_rdata = (sel_78 == 1'b1 && rden_pulse == 1'b1) ? reg_78_q : 32'h00000000;

assign reg_7C_q[ 7: 0] = 8'h00;
assign reg_7C_q[15: 8] = 8'h00;
assign reg_7C_q[23:16] = 8'h00;
assign reg_7C_q[31:24] = 8'h00;
assign reg_7C_rdata = (sel_7C == 1'b1 && rden_pulse == 1'b1) ? reg_7C_q : 32'h00000000;


// Begin Read/Write section

// Load initial value during reset. When selected and write pulse is active, load write data into register. Hold it's value otherwise.

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_80_q <= {8'h91, 16'h007C, "V"}; 
  else if (sel_80 == 1'b1 && wren_pulse == 1'b1)  reg_80_q <= wdata_q;                        
  else                                            reg_80_q <= reg_80_q;
assign reg_80_rdata = (sel_80 == 1'b1 && rden_pulse == 1'b1) ? reg_80_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_84_q <= {"1", 8'h05, "65"};
  else if (sel_84 == 1'b1 && wren_pulse == 1'b1)  reg_84_q <= wdata_q;                        
  else                                            reg_84_q <= reg_84_q;
assign reg_84_rdata = (sel_84 == 1'b1 && rden_pulse == 1'b1) ? reg_84_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_88_q <= {"A01Y"};
  else if (sel_88 == 1'b1 && wren_pulse == 1'b1)  reg_88_q <= wdata_q;                        
  else                                            reg_88_q <= reg_88_q;
assign reg_88_rdata = (sel_88 == 1'b1 && rden_pulse == 1'b1) ? reg_88_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_8C_q <= {"1", 8'h0D, "Er"};
  else if (sel_8C == 1'b1 && wren_pulse == 1'b1)  reg_8C_q <= wdata_q;                        
  else                                            reg_8C_q <= reg_8C_q;
assign reg_8C_rdata = (sel_8C == 1'b1 && rden_pulse == 1'b1) ? reg_8C_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_90_q <= {"ror "};
  else if (sel_90 == 1'b1 && wren_pulse == 1'b1)  reg_90_q <= wdata_q;                        
  else                                            reg_90_q <= reg_90_q;
assign reg_90_rdata = (sel_90 == 1'b1 && rden_pulse == 1'b1) ? reg_90_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_94_q <= {"Code"};
  else if (sel_94 == 1'b1 && wren_pulse == 1'b1)  reg_94_q <= wdata_q;                        
  else                                            reg_94_q <= reg_94_q;
assign reg_94_rdata = (sel_94 == 1'b1 && rden_pulse == 1'b1) ? reg_94_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_98_q <= {" 26R"};
  else if (sel_98 == 1'b1 && wren_pulse == 1'b1)  reg_98_q <= wdata_q;                        
  else                                            reg_98_q <= reg_98_q;
assign reg_98_rdata = (sel_98 == 1'b1 && rden_pulse == 1'b1) ? reg_98_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_9C_q <= {"W", 8'h61, 16'h0000};
  else if (sel_9C == 1'b1 && wren_pulse == 1'b1)  reg_9C_q <= wdata_q;                        
  else                                            reg_9C_q <= reg_9C_q;
assign reg_9C_rdata = (sel_9C == 1'b1 && rden_pulse == 1'b1) ? reg_9C_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_A0_q <= {32'h00000000};
  else if (sel_A0 == 1'b1 && wren_pulse == 1'b1)  reg_A0_q <= wdata_q;                        
  else                                            reg_A0_q <= reg_A0_q;
assign reg_A0_rdata = (sel_A0 == 1'b1 && rden_pulse == 1'b1) ? reg_A0_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_A4_q <= {32'h00000000};
  else if (sel_A4 == 1'b1 && wren_pulse == 1'b1)  reg_A4_q <= wdata_q;                        
  else                                            reg_A4_q <= reg_A4_q;
assign reg_A4_rdata = (sel_A4 == 1'b1 && rden_pulse == 1'b1) ? reg_A4_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_A8_q <= {32'h00000000};
  else if (sel_A8 == 1'b1 && wren_pulse == 1'b1)  reg_A8_q <= wdata_q;                        
  else                                            reg_A8_q <= reg_A8_q;
assign reg_A8_rdata = (sel_A8 == 1'b1 && rden_pulse == 1'b1) ? reg_A8_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_AC_q <= {32'h00000000};
  else if (sel_AC == 1'b1 && wren_pulse == 1'b1)  reg_AC_q <= wdata_q;                        
  else                                            reg_AC_q <= reg_AC_q;
assign reg_AC_rdata = (sel_AC == 1'b1 && rden_pulse == 1'b1) ? reg_AC_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_B0_q <= {32'h00000000};
  else if (sel_B0 == 1'b1 && wren_pulse == 1'b1)  reg_B0_q <= wdata_q;                        
  else                                            reg_B0_q <= reg_B0_q;
assign reg_B0_rdata = (sel_B0 == 1'b1 && rden_pulse == 1'b1) ? reg_B0_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_B4_q <= {32'h00000000};
  else if (sel_B4 == 1'b1 && wren_pulse == 1'b1)  reg_B4_q <= wdata_q;                        
  else                                            reg_B4_q <= reg_B4_q;
assign reg_B4_rdata = (sel_B4 == 1'b1 && rden_pulse == 1'b1) ? reg_B4_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_B8_q <= {32'h00000000};
  else if (sel_B8 == 1'b1 && wren_pulse == 1'b1)  reg_B8_q <= wdata_q;                        
  else                                            reg_B8_q <= reg_B8_q;
assign reg_B8_rdata = (sel_B8 == 1'b1 && rden_pulse == 1'b1) ? reg_B8_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_BC_q <= {32'h00000000};
  else if (sel_BC == 1'b1 && wren_pulse == 1'b1)  reg_BC_q <= wdata_q;                        
  else                                            reg_BC_q <= reg_BC_q;
assign reg_BC_rdata = (sel_BC == 1'b1 && rden_pulse == 1'b1) ? reg_BC_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_C0_q <= {32'h00000000};
  else if (sel_C0 == 1'b1 && wren_pulse == 1'b1)  reg_C0_q <= wdata_q;                        
  else                                            reg_C0_q <= reg_C0_q;
assign reg_C0_rdata = (sel_C0 == 1'b1 && rden_pulse == 1'b1) ? reg_C0_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_C4_q <= {32'h00000000};
  else if (sel_C4 == 1'b1 && wren_pulse == 1'b1)  reg_C4_q <= wdata_q;                        
  else                                            reg_C4_q <= reg_C4_q;
assign reg_C4_rdata = (sel_C4 == 1'b1 && rden_pulse == 1'b1) ? reg_C4_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_C8_q <= {32'h00000000};
  else if (sel_C8 == 1'b1 && wren_pulse == 1'b1)  reg_C8_q <= wdata_q;                        
  else                                            reg_C8_q <= reg_C8_q;
assign reg_C8_rdata = (sel_C8 == 1'b1 && rden_pulse == 1'b1) ? reg_C8_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_CC_q <= {32'h00000000};
  else if (sel_CC == 1'b1 && wren_pulse == 1'b1)  reg_CC_q <= wdata_q;                        
  else                                            reg_CC_q <= reg_CC_q;
assign reg_CC_rdata = (sel_CC == 1'b1 && rden_pulse == 1'b1) ? reg_CC_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_D0_q <= {32'h00000000};
  else if (sel_D0 == 1'b1 && wren_pulse == 1'b1)  reg_D0_q <= wdata_q;                        
  else                                            reg_D0_q <= reg_D0_q;
assign reg_D0_rdata = (sel_D0 == 1'b1 && rden_pulse == 1'b1) ? reg_D0_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_D4_q <= {32'h00000000};
  else if (sel_D4 == 1'b1 && wren_pulse == 1'b1)  reg_D4_q <= wdata_q;                        
  else                                            reg_D4_q <= reg_D4_q;
assign reg_D4_rdata = (sel_D4 == 1'b1 && rden_pulse == 1'b1) ? reg_D4_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_D8_q <= {32'h00000000};
  else if (sel_D8 == 1'b1 && wren_pulse == 1'b1)  reg_D8_q <= wdata_q;                        
  else                                            reg_D8_q <= reg_D8_q;
assign reg_D8_rdata = (sel_D8 == 1'b1 && rden_pulse == 1'b1) ? reg_D8_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_DC_q <= {32'h00000000};
  else if (sel_DC == 1'b1 && wren_pulse == 1'b1)  reg_DC_q <= wdata_q;                        
  else                                            reg_DC_q <= reg_DC_q;
assign reg_DC_rdata = (sel_DC == 1'b1 && rden_pulse == 1'b1) ? reg_DC_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_E0_q <= {32'h00000000};
  else if (sel_E0 == 1'b1 && wren_pulse == 1'b1)  reg_E0_q <= wdata_q;                        
  else                                            reg_E0_q <= reg_E0_q;
assign reg_E0_rdata = (sel_E0 == 1'b1 && rden_pulse == 1'b1) ? reg_E0_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_E4_q <= {32'h00000000};
  else if (sel_E4 == 1'b1 && wren_pulse == 1'b1)  reg_E4_q <= wdata_q;                        
  else                                            reg_E4_q <= reg_E4_q;
assign reg_E4_rdata = (sel_E4 == 1'b1 && rden_pulse == 1'b1) ? reg_E4_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_E8_q <= {32'h00000000};
  else if (sel_E8 == 1'b1 && wren_pulse == 1'b1)  reg_E8_q <= wdata_q;                        
  else                                            reg_E8_q <= reg_E8_q;
assign reg_E8_rdata = (sel_E8 == 1'b1 && rden_pulse == 1'b1) ? reg_E8_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_EC_q <= {32'h00000000};
  else if (sel_EC == 1'b1 && wren_pulse == 1'b1)  reg_EC_q <= wdata_q;                        
  else                                            reg_EC_q <= reg_EC_q;
assign reg_EC_rdata = (sel_EC == 1'b1 && rden_pulse == 1'b1) ? reg_EC_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_F0_q <= {32'h00000000};
  else if (sel_F0 == 1'b1 && wren_pulse == 1'b1)  reg_F0_q <= wdata_q;                        
  else                                            reg_F0_q <= reg_F0_q;
assign reg_F0_rdata = (sel_F0 == 1'b1 && rden_pulse == 1'b1) ? reg_F0_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_F4_q <= {32'h00000000};
  else if (sel_F4 == 1'b1 && wren_pulse == 1'b1)  reg_F4_q <= wdata_q;                        
  else                                            reg_F4_q <= reg_F4_q;
assign reg_F4_rdata = (sel_F4 == 1'b1 && rden_pulse == 1'b1) ? reg_F4_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_F8_q <= {32'h00000000};
  else if (sel_F8 == 1'b1 && wren_pulse == 1'b1)  reg_F8_q <= wdata_q;                        
  else                                            reg_F8_q <= reg_F8_q;
assign reg_F8_rdata = (sel_F8 == 1'b1 && rden_pulse == 1'b1) ? reg_F8_q : 32'h00000000;

always @(posedge(clock))
  if (reset_q == 1'b1)                            reg_FC_q <= {24'h000000, 8'h78};
  else if (sel_FC == 1'b1 && wren_pulse == 1'b1)  reg_FC_q <= wdata_q;                        
  else                                            reg_FC_q <= reg_FC_q;
assign reg_FC_rdata = (sel_FC == 1'b1 && rden_pulse == 1'b1) ? reg_FC_q : 32'h00000000;



// ------------------------------------
// Select source for ultimate read data
// ------------------------------------
wire [31:0] final_rdata_d;
reg  [31:0] final_rdata_q;
reg         final_rdata_vld_q;

// Use a big OR gate to combine all the read data sources. When source is not selected, the 'rdata' vector should be all 0.
assign final_rdata_d = reg_00_rdata | reg_04_rdata | reg_08_rdata | reg_0C_rdata | 
                       reg_10_rdata | reg_14_rdata | reg_18_rdata | reg_1C_rdata | 
                       reg_20_rdata | reg_24_rdata | reg_28_rdata | reg_2C_rdata | 
                       reg_30_rdata | reg_34_rdata | reg_38_rdata | reg_3C_rdata | 
                       reg_40_rdata | reg_44_rdata | reg_48_rdata | reg_4C_rdata | 
                       reg_50_rdata | reg_54_rdata | reg_58_rdata | reg_5C_rdata | 
                       reg_60_rdata | reg_64_rdata | reg_68_rdata | reg_6C_rdata | 
                       reg_70_rdata | reg_74_rdata | reg_78_rdata | reg_7C_rdata | 
                       reg_80_rdata | reg_84_rdata | reg_88_rdata | reg_8C_rdata | 
                       reg_90_rdata | reg_94_rdata | reg_98_rdata | reg_9C_rdata | 
                       reg_A0_rdata | reg_A4_rdata | reg_A8_rdata | reg_AC_rdata | 
                       reg_B0_rdata | reg_B4_rdata | reg_B8_rdata | reg_BC_rdata | 
                       reg_C0_rdata | reg_C4_rdata | reg_C8_rdata | reg_CC_rdata | 
                       reg_D0_rdata | reg_D4_rdata | reg_D8_rdata | reg_DC_rdata | 
                       reg_E0_rdata | reg_E4_rdata | reg_E8_rdata | reg_EC_rdata | 
                       reg_F0_rdata | reg_F4_rdata | reg_F8_rdata | reg_FC_rdata 
                       ;                      

always @(posedge(clock))
  final_rdata_q <= final_rdata_d;     // Latch the result of the big OR gate before sending out of the module

always @(posedge(clock))
  final_rdata_vld_q <= rden_pulse || wren_pulse;   // Synchronize rdata_valid with data


assign vpd_cfg_rdata = final_rdata_q;
assign vpd_cfg_done  = final_rdata_vld_q;

endmodule

