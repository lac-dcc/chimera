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
// Title    : cfg_descriptor.v
// Function : This file is intended to be useful for any OpenCAPI AFU design. It provides the AFU Descriptor Template 0
//            which is a sub-piece of the Configuration Sub-system space.
//
// -------------------------------------------------------------------
// Modification History :
//                                |Version    |     |Author   |Description of change
//                                |-----------|     |-------- |---------------------
  `define CFG_DESCRIPTOR_VERSION   09_Apr_2018   //            Keep VERSION_MINOR unchanged at h05 (for change proposal 2/28/18) Use TEMPLATE_LENGTH to tell versions apart
// -------------------------------------------------------------------

`define TEMPLATE_VERSION_MAJOR  8'h01  // Update to match the spec level (i.e. version MAJOR.MINOR)
`define TEMPLATE_VERSION_MINOR  8'h01

//
// ******************************************************************************************************************************
// Functional Description
//
// This file attaches to cfg_func.v . Since it outputs all 0s on 'data' and 'data_valid' when not selected,
// a simple OR gate can be used to return data from multiple instances of cfg_descriptor into afu_config_space.
//
// All internal configuration registers are 32 bits wide, using Little Endian format and addressing. 
// This means bits are ordered [31:0] and bytes are ordered 3,2,1,0 when looking at the lowest 2 address bits.
// 
// One register is selected at a time using the 8 bit 'AFU Index' and 31 bit 'Offset'. 
// 'AFU Index' enables the AFU template, while 'Offset' selects a register within that template.
//
// All entries in this file are Read Only. 
// Reads from an address that is not implemented returns all 0s, and will raise an error signal that can be
// routed to an internal error register.
//
// Read operations are triggered by setting the 'cmd_valid' input active. Upon seeing this as 1, it immediately sets
// 'data_valid' to 0 (in the same cycle). 'AFU Index' and 'Offset' can be re-latched if the table grows in size 
// (i.e. multiple AFUs) but for a single AFU they may not need to be. Once the selected location is available on 
// the return 'data' bus, 'data_valid' is set to 1. Both signals remain at that value until the next 'cmd_valid'.
// ******************************************************************************************************************************
// Naming convention used in this file
//
// *_afu#_*  = signals related to a single AFU, with the AFU number as '#'
//
// Templates are organized in numerical order, starting with AFU0, AFU1, ..., AFUn .
// The 'define's below are determined by the template definition. 

`define TEMPLATE_OFFSET_START  8'h00
`define TEMPLATE_OFFSET_LAST   8'h5F

// ******************************************************************************************************************************

 
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module cfg_descriptor
(    
    // Miscellaneous Ports
    input             clock                             
  , input             reset                     // (positive active)

    // READ ONLY field inputs (suggested default values to tie these ports to follow each declaration)
    // Note: These need to be inputs rather than parameters because they may change values when partial reconfiguration is supported
                                                //  // 222221111111111000000000
                                                //  // 432109876543210987654321   Keep string exactly 24 characters long
  , input  [24*8-1:0] ro_name_space             //   {"IBM,LPC", {17{8'h00}} }    String must contain EXACTLY 24 characters, so pad accordingly
  , input       [7:0] ro_afu_version_major      //  = 8'h01  // Update to match the AFU  level (i.e. version MAJOR.MINOR)
  , input       [7:0] ro_afu_version_minor      //  = 8'h00
  , input       [2:0] ro_afuc_type              //  = 3'b001 // Type C1 issues commands to the host (i.e. interrupts) but does not cache host data
  , input       [2:0] ro_afum_type              //  = 3'b001 // Type M1 contains host mapped address space, which could be MMIO or memory
  , input       [7:0] ro_profile                //  = 8'h01  // Device Interface Class (see AFU documentation for additional command restrictions)
  , input     [63:16] ro_global_mmio_offset     //  = 48'h0000_0000_0000   // MMIO space start offset from BAR 0 addr ([15:0] assumed to be h0000)
  , input       [2:0] ro_global_mmio_bar        //  = 3'b000
  , input      [31:0] ro_global_mmio_size       //  = 32'h0008_0000        // MMIO size is 1 MB, with Global MMIO space of 512 KB
  , input             ro_cmd_flag_x1_supported  //  = 1'b0   // cmd_flag x1 is not supported
  , input             ro_cmd_flag_x3_supported  //  = 1'b0   // cmd_flag x3 is not supported
  , input             ro_atc_2M_page_supported  //  = 1'b0   // Address Translation Cache page size of 2MB is not supported
  , input             ro_atc_64K_page_supported //  = 1'b0   // Address Translation Cache page size of 64KB is not supported
  , input       [4:0] ro_max_host_tag_size      //  = 5'b00000  // Caching is not supported
  , input     [63:16] ro_per_pasid_mmio_offset  //  = 48'h0000_0000_0000   // PASID space start at BAR 0+512KB addr ([15:0] assumed to be h0000)
  , input       [2:0] ro_per_pasid_mmio_bar     //  = 3'b000
  , input     [31:16] ro_per_pasid_mmio_stride  //  = 16'h0001             // Minimum stride is 64KB per PASID entry ([15:0] assumed to be h0000)
  , input       [7:0] ro_mem_size               //  = 8'h14                // Default is 1 MB (2^20, x14 = 20 decimal)
  , input      [63:0] ro_mem_start_addr         //  = 64'h0000_0000_0000_0000  // At Device level, Memory Space must start at addr 0
  , input     [127:0] ro_naa_wwid               //  = 128'h0000_0000_0000_0000_0000_0000_0000_0000   // Default is AFU has no WWID
  , input      [63:0] ro_system_memory_length   //  = 64'h0000_0000_0000_0000  // General Purpose System Memory Size, [15:0] forced to h0000 to align with 64 KB boundary

    // Hardcoded 'AFU Index' number of this instance of descriptor table
  , input       [5:0] ro_afu_index              //  = 8'h00    Each AFU instance under a common Function needs a unique index number

    // Functional interface
  , input       [5:0] cfg_desc_afu_index
  , input      [30:0] cfg_desc_offset
  , input             cfg_desc_cmd_valid
  , output     [31:0] desc_cfg_data
  , output            desc_cfg_data_valid
  , output            desc_cfg_echo_cmd_valid

    // Error indicator
  , output            err_unimplemented_addr
) ;

// -----------------------------------------------------------
// Register inputs to prevent backflowed timing issues
// -----------------------------------------------------------
reg   [5:0] afu_index_q;
reg  [30:0] offset_q;
reg         cmd_valid_q;

always @(posedge(clock))
  begin
    afu_index_q <= cfg_desc_afu_index;  
    offset_q    <= cfg_desc_offset;
    cmd_valid_q <= cfg_desc_cmd_valid;
  end

// ------------------------------------
// Check for bad address
// ------------------------------------
wire upper_offset_is_zero = (offset_q[30:8] == 23'b0) ? 1'b1 : 1'b0;
wire addr_is_valid;

assign addr_is_valid = (cmd_valid_q == 1'b1          && 
                        upper_offset_is_zero == 1'b1 &&      
                        afu_index_q == ro_afu_index  &&
                        (offset_q[7:0] >= `TEMPLATE_OFFSET_START && offset_q[7:0] <= `TEMPLATE_OFFSET_LAST )
                       ) ? 1'b1 : 1'b0;

assign err_unimplemented_addr = (cmd_valid_q == 1'b1 && addr_is_valid == 1'b0) ? 1'b1 : 1'b0;


// -------------------------------------------------------------------------
// Select target register using address ('afu0' = AFU descriptor template 0)
// -------------------------------------------------------------------------
wire sel_afu00_000;   
wire sel_afu00_004;
wire sel_afu00_008;
wire sel_afu00_00C;
wire sel_afu00_010; 
wire sel_afu00_014;
wire sel_afu00_018;
wire sel_afu00_01C;
wire sel_afu00_020; 
wire sel_afu00_024;
wire sel_afu00_028;
wire sel_afu00_02C;
wire sel_afu00_030; 
wire sel_afu00_034;
wire sel_afu00_038;
wire sel_afu00_03C;
wire sel_afu00_040;
wire sel_afu00_044;
wire sel_afu00_048;
wire sel_afu00_04C;
wire sel_afu00_050;
wire sel_afu00_054;
wire sel_afu00_058;
wire sel_afu00_05C;

assign sel_afu00_000 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h00 && offset_q[7:0] < 8'h04) ? 1'b1 : 1'b0;
assign sel_afu00_004 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h04 && offset_q[7:0] < 8'h08) ? 1'b1 : 1'b0;
assign sel_afu00_008 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h08 && offset_q[7:0] < 8'h0C) ? 1'b1 : 1'b0;
assign sel_afu00_00C = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h0C && offset_q[7:0] < 8'h10) ? 1'b1 : 1'b0;
assign sel_afu00_010 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h10 && offset_q[7:0] < 8'h14) ? 1'b1 : 1'b0;
assign sel_afu00_014 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h14 && offset_q[7:0] < 8'h18) ? 1'b1 : 1'b0;
assign sel_afu00_018 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h18 && offset_q[7:0] < 8'h1C) ? 1'b1 : 1'b0;
assign sel_afu00_01C = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h1C && offset_q[7:0] < 8'h20) ? 1'b1 : 1'b0;
assign sel_afu00_020 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h20 && offset_q[7:0] < 8'h24) ? 1'b1 : 1'b0;
assign sel_afu00_024 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h24 && offset_q[7:0] < 8'h28) ? 1'b1 : 1'b0;
assign sel_afu00_028 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h28 && offset_q[7:0] < 8'h2C) ? 1'b1 : 1'b0;
assign sel_afu00_02C = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h2C && offset_q[7:0] < 8'h30) ? 1'b1 : 1'b0;
assign sel_afu00_030 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h30 && offset_q[7:0] < 8'h34) ? 1'b1 : 1'b0;
assign sel_afu00_034 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h34 && offset_q[7:0] < 8'h38) ? 1'b1 : 1'b0;
assign sel_afu00_038 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h38 && offset_q[7:0] < 8'h3C) ? 1'b1 : 1'b0;
assign sel_afu00_03C = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h3C && offset_q[7:0] < 8'h40) ? 1'b1 : 1'b0;
assign sel_afu00_040 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h40 && offset_q[7:0] < 8'h44) ? 1'b1 : 1'b0;
assign sel_afu00_044 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h44 && offset_q[7:0] < 8'h48) ? 1'b1 : 1'b0;
assign sel_afu00_048 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h48 && offset_q[7:0] < 8'h4C) ? 1'b1 : 1'b0;
assign sel_afu00_04C = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h4C && offset_q[7:0] < 8'h50) ? 1'b1 : 1'b0;
assign sel_afu00_050 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h50 && offset_q[7:0] < 8'h54) ? 1'b1 : 1'b0;
assign sel_afu00_054 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h54 && offset_q[7:0] < 8'h58) ? 1'b1 : 1'b0;
assign sel_afu00_058 = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h58 && offset_q[7:0] < 8'h5C) ? 1'b1 : 1'b0;
assign sel_afu00_05C = (afu_index_q == ro_afu_index && upper_offset_is_zero == 1'b1 && offset_q[7:0] >= 8'h5C && offset_q[7:0] < 8'h60) ? 1'b1 : 1'b0;


// ..............................................
// @@@ AFU0
// ..............................................

wire [31:0] reg_afu00_000_q;
wire [31:0] reg_afu00_004_q;
wire [31:0] reg_afu00_008_q;
wire [31:0] reg_afu00_00C_q;
wire [31:0] reg_afu00_010_q;
wire [31:0] reg_afu00_014_q;
wire [31:0] reg_afu00_018_q;
wire [31:0] reg_afu00_01C_q;
wire [31:0] reg_afu00_020_q;
wire [31:0] reg_afu00_024_q;
wire [31:0] reg_afu00_028_q;
wire [31:0] reg_afu00_02C_q;
wire [31:0] reg_afu00_030_q;
wire [31:0] reg_afu00_034_q;
wire [31:0] reg_afu00_038_q;
wire [31:0] reg_afu00_03C_q;
wire [31:0] reg_afu00_040_q;
wire [31:0] reg_afu00_044_q;
wire [31:0] reg_afu00_048_q;
wire [31:0] reg_afu00_04C_q;
wire [31:0] reg_afu00_050_q;
wire [31:0] reg_afu00_054_q;
wire [31:0] reg_afu00_058_q;
wire [31:0] reg_afu00_05C_q;

wire [31:0] reg_afu00_000_rdata;
wire [31:0] reg_afu00_004_rdata;
wire [31:0] reg_afu00_008_rdata;
wire [31:0] reg_afu00_00C_rdata;
wire [31:0] reg_afu00_010_rdata;
wire [31:0] reg_afu00_014_rdata;
wire [31:0] reg_afu00_018_rdata;
wire [31:0] reg_afu00_01C_rdata;
wire [31:0] reg_afu00_020_rdata;
wire [31:0] reg_afu00_024_rdata;
wire [31:0] reg_afu00_028_rdata;
wire [31:0] reg_afu00_02C_rdata;
wire [31:0] reg_afu00_030_rdata;
wire [31:0] reg_afu00_034_rdata;
wire [31:0] reg_afu00_038_rdata;
wire [31:0] reg_afu00_03C_rdata;
wire [31:0] reg_afu00_040_rdata;
wire [31:0] reg_afu00_044_rdata;
wire [31:0] reg_afu00_048_rdata;
wire [31:0] reg_afu00_04C_rdata;
wire [31:0] reg_afu00_050_rdata;
wire [31:0] reg_afu00_054_rdata;
wire [31:0] reg_afu00_058_rdata;
wire [31:0] reg_afu00_05C_rdata;


assign reg_afu00_000_q[31:16] = { 8'h00, `TEMPLATE_OFFSET_LAST + 8'h01 };   
assign reg_afu00_000_q[15: 8] = `TEMPLATE_VERSION_MAJOR;     
assign reg_afu00_000_q[ 7: 0] = `TEMPLATE_VERSION_MINOR;
assign reg_afu00_000_rdata = (sel_afu00_000 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_000_q : 32'h00000000;


// ro_name_space is a string of characters. The left most char goes into field 'Name Space[0]'. e.g. "IBM,LPC                 "
assign reg_afu00_004_q[ 7: 0] = ro_name_space[8*23+7:8*23]; // e.g. 'I'
assign reg_afu00_004_q[15: 8] = ro_name_space[8*22+7:8*22]; // e.g. 'B'
assign reg_afu00_004_q[23:16] = ro_name_space[8*21+7:8*21]; // e.g. 'M'
assign reg_afu00_004_q[31:24] = ro_name_space[8*20+7:8*20]; // e.g. ','
assign reg_afu00_004_rdata = (sel_afu00_004 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_004_q : 32'h00000000;


assign reg_afu00_008_q[ 7: 0] = ro_name_space[8*19+7:8*19];
assign reg_afu00_008_q[15: 8] = ro_name_space[8*18+7:8*18];
assign reg_afu00_008_q[23:16] = ro_name_space[8*17+7:8*17];
assign reg_afu00_008_q[31:24] = ro_name_space[8*16+7:8*16];
assign reg_afu00_008_rdata = (sel_afu00_008 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_008_q : 32'h00000000;


assign reg_afu00_00C_q[ 7: 0] = ro_name_space[8*15+7:8*15];
assign reg_afu00_00C_q[15: 8] = ro_name_space[8*14+7:8*14];
assign reg_afu00_00C_q[23:16] = ro_name_space[8*13+7:8*13];
assign reg_afu00_00C_q[31:24] = ro_name_space[8*12+7:8*12];
assign reg_afu00_00C_rdata = (sel_afu00_00C == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_00C_q : 32'h00000000;


assign reg_afu00_010_q[ 7: 0] = ro_name_space[8*11+7:8*11];
assign reg_afu00_010_q[15: 8] = ro_name_space[8*10+7:8*10];
assign reg_afu00_010_q[23:16] = ro_name_space[8*9 +7:8*9 ];
assign reg_afu00_010_q[31:24] = ro_name_space[8*8 +7:8*8 ];
assign reg_afu00_010_rdata = (sel_afu00_010 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_010_q : 32'h00000000;


assign reg_afu00_014_q[ 7: 0] = ro_name_space[8*7 +7:8*7 ];
assign reg_afu00_014_q[15: 8] = ro_name_space[8*6 +7:8*6 ];
assign reg_afu00_014_q[23:16] = ro_name_space[8*5 +7:8*5 ];
assign reg_afu00_014_q[31:24] = ro_name_space[8*4 +7:8*4 ];
assign reg_afu00_014_rdata = (sel_afu00_014 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_014_q : 32'h00000000;


assign reg_afu00_018_q[ 7: 0] = ro_name_space[8*3 +7:8*3 ];
assign reg_afu00_018_q[15: 8] = ro_name_space[8*2 +7:8*2 ];
assign reg_afu00_018_q[23:16] = ro_name_space[8*1 +7:8*1 ];
assign reg_afu00_018_q[31:24] = ro_name_space[8*0 +7:8*0 ];
assign reg_afu00_018_rdata = (sel_afu00_018 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_018_q : 32'h00000000;


assign reg_afu00_01C_q[31:24] = ro_afu_version_major;   
assign reg_afu00_01C_q[23:16] = ro_afu_version_minor;     
assign reg_afu00_01C_q[15:13] = ro_afuc_type;
assign reg_afu00_01C_q[12:10] = ro_afum_type;
assign reg_afu00_01C_q[ 9: 8] = 2'h0;
assign reg_afu00_01C_q[ 7: 0] = ro_profile;
assign reg_afu00_01C_rdata = (sel_afu00_01C == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_01C_q : 32'h00000000;


assign reg_afu00_020_q[31:16] = ro_global_mmio_offset[31:16];   
assign reg_afu00_020_q[15: 3] = 13'b0000_0000_0000_0;
assign reg_afu00_020_q[ 2: 0] = ro_global_mmio_bar;     
assign reg_afu00_020_rdata = (sel_afu00_020 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_020_q : 32'h00000000;


assign reg_afu00_024_q[31: 0] = ro_global_mmio_offset[63:32];   
assign reg_afu00_024_rdata = (sel_afu00_024 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_024_q : 32'h00000000;


assign reg_afu00_028_q[31: 0] = ro_global_mmio_size;   
assign reg_afu00_028_rdata = (sel_afu00_028 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_028_q : 32'h00000000;


assign reg_afu00_02C_q[   31] = ro_cmd_flag_x1_supported;
assign reg_afu00_02C_q[   30] = ro_cmd_flag_x3_supported;
assign reg_afu00_02C_q[29:23] = 7'b00_0000_0;    
assign reg_afu00_02C_q[   22] = ro_atc_2M_page_supported;
assign reg_afu00_02C_q[   21] = ro_atc_64K_page_supported;
assign reg_afu00_02C_q[20:16] = ro_max_host_tag_size;
assign reg_afu00_02C_q[15: 0] = 16'h0000;   
assign reg_afu00_02C_rdata = (sel_afu00_02C == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_02C_q : 32'h00000000;


assign reg_afu00_030_q[31:16] = ro_per_pasid_mmio_offset[31:16];   
assign reg_afu00_030_q[15: 3] = 13'b0000_0000_0000_0;
assign reg_afu00_030_q[ 2: 0] = ro_per_pasid_mmio_bar;     
assign reg_afu00_030_rdata = (sel_afu00_030 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_030_q : 32'h00000000;


assign reg_afu00_034_q[31: 0] = ro_per_pasid_mmio_offset[63:32];   
assign reg_afu00_034_rdata = (sel_afu00_034 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_034_q : 32'h00000000;


assign reg_afu00_038_q[31:16] = ro_per_pasid_mmio_stride; 
assign reg_afu00_038_q[15: 0] = 16'h0000;
assign reg_afu00_038_rdata = (sel_afu00_038 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_038_q : 32'h00000000;


assign reg_afu00_03C_q[31: 8] = 24'h0000_00;   
assign reg_afu00_03C_q[ 7: 0] = ro_mem_size;     
assign reg_afu00_03C_rdata = (sel_afu00_03C == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_03C_q : 32'h00000000;


assign reg_afu00_040_q[31: 0] = ro_mem_start_addr[31:0];   
assign reg_afu00_040_rdata = (sel_afu00_040 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_040_q : 32'h00000000;


assign reg_afu00_044_q[31: 0] = ro_mem_start_addr[63:32];   
assign reg_afu00_044_rdata = (sel_afu00_044 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_044_q : 32'h00000000;


assign reg_afu00_048_q[31: 0] = ro_naa_wwid[31:0];   
assign reg_afu00_048_rdata = (sel_afu00_048 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_048_q : 32'h00000000;


assign reg_afu00_04C_q[31: 0] = ro_naa_wwid[63:32];   
assign reg_afu00_04C_rdata = (sel_afu00_04C == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_04C_q : 32'h00000000;


assign reg_afu00_050_q[31: 0] = ro_naa_wwid[95:64];   
assign reg_afu00_050_rdata = (sel_afu00_050 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_050_q : 32'h00000000;


assign reg_afu00_054_q[31: 0] = ro_naa_wwid[127:96];   
assign reg_afu00_054_rdata = (sel_afu00_054 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_054_q : 32'h00000000;


assign reg_afu00_058_q[31: 0] = { ro_system_memory_length[31:16], 16'h0000 };   // Align to 64KB boundary
assign reg_afu00_058_rdata = (sel_afu00_058 == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_058_q : 32'h00000000;


assign reg_afu00_05C_q[31: 0] = ro_system_memory_length[63:32];  
assign reg_afu00_05C_rdata = (sel_afu00_05C == 1'b1 && cmd_valid_q == 1'b1) ? reg_afu00_05C_q : 32'h00000000;



// ------------------------------------
// Select source for ultimate read data
// ------------------------------------
wire [31:0] final_rdata_d;
reg  [31:0] final_rdata_q;
reg         final_rdata_vld_q;
reg         final_echo_cmd_valid_q;

// Use a big OR gate to combine all the read data sources. When source is not selected, the 'rdata' vector should be all 0.
assign final_rdata_d = reg_afu00_000_rdata | reg_afu00_004_rdata | reg_afu00_008_rdata | reg_afu00_00C_rdata | 
                       reg_afu00_010_rdata | reg_afu00_014_rdata | reg_afu00_018_rdata | reg_afu00_01C_rdata | 
                       reg_afu00_020_rdata | reg_afu00_024_rdata | reg_afu00_028_rdata | reg_afu00_02C_rdata | 
                       reg_afu00_030_rdata | reg_afu00_034_rdata | reg_afu00_038_rdata | reg_afu00_03C_rdata | 
                       reg_afu00_040_rdata | reg_afu00_044_rdata | reg_afu00_048_rdata | reg_afu00_04C_rdata |  
                       reg_afu00_050_rdata | reg_afu00_054_rdata | reg_afu00_058_rdata | reg_afu00_05C_rdata
                       ;                      

always @(posedge(clock))
  begin
    final_rdata_q          <= final_rdata_d;                // Latch the result of the big OR gate before sending out of the module
    final_rdata_vld_q      <= cmd_valid_q & addr_is_valid;  // Indicates 'rdata' contains valid read data (i.e. from a real register)
    final_echo_cmd_valid_q <= cmd_valid_q;                  // Indicates command has been processed
  end

// Drive outputs
assign desc_cfg_data           = final_rdata_q;
assign desc_cfg_data_valid     = final_rdata_vld_q;
assign desc_cfg_echo_cmd_valid = final_echo_cmd_valid_q;

endmodule

