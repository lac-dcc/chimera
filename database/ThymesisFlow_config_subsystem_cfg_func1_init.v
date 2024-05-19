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
// -------------------------------------------------------------------
//
// Title    : cfg_func_init.v
// Function : This file is included in 'cfg_func.v'.
// 
//            During simulation, it may be wasteful of cycles to always run the same configuration commands to write  
//            configuration registers with the correct value needed for the test. As a shortcut, each AFU designer or
//            verification person is allowed to override the default 'init' signal values to have them be the post-
//            configuration values. Some testing MUST be done using the real configuration command sequence, but
//            in most tests initializing the registers to their final state after 'reset' will be more efficient.
//            To enable this, the declaration and assignment of initial values for registers is broken out to 
//            a different file so someone can easily subsitute their post-configuration version for the default.
//            Include those declarations and initial value assignments here, before working with any register.
//
//            Note: Lines commented out are for registers that are entirely Read Only or Reserved. 
//            Thus an initial value does not apply.
//
// -------------------------------------------------------------------
// Modification History :
//                                |Version    |     |Author   |Description of change
//                                |-----------|     |-------- |---------------------
  `define CFG_FUNC_INIT_VERSION    12_Sep_2017   //            Change items reported by HAL check
// -------------------------------------------------------------------


// @@@ CSH

// For BARs (010-024), set initial values so if do a config_read (w/o config_write of 1s) can get MMIO size.
//re [31:0] reg_csh_000_init;    assign reg_csh_000_init = 32'h0000_0000;
wire [31:0] reg_csh_004_init;    assign reg_csh_004_init = { 11'b0, 1'b1, 18'b0, 1'b0, 1'b0 };
//re [31:0] reg_csh_008_init;    assign reg_csh_008_init = 32'h0000_0000;
//re [31:0] reg_csh_00C_init;    assign reg_csh_00C_init = { 8'b0, cfg_ro_csh_multi_function, 23'b0 };
wire [31:0] reg_csh_010_init;    assign reg_csh_010_init = { cfg_ro_csh_mmio_bar0_size[31: 4], cfg_ro_csh_mmio_bar0_prefetchable, 2'b10, 1'b0 };
wire [31:0] reg_csh_014_init;    assign reg_csh_014_init =   cfg_ro_csh_mmio_bar0_size[63:32];
wire [31:0] reg_csh_018_init;    assign reg_csh_018_init = { cfg_ro_csh_mmio_bar1_size[31: 4], cfg_ro_csh_mmio_bar1_prefetchable, 2'b10, 1'b0 };
wire [31:0] reg_csh_01C_init;    assign reg_csh_01C_init =   cfg_ro_csh_mmio_bar1_size[63:32];
wire [31:0] reg_csh_020_init;    assign reg_csh_020_init = { cfg_ro_csh_mmio_bar2_size[31: 4], cfg_ro_csh_mmio_bar2_prefetchable, 2'b10, 1'b0 };
wire [31:0] reg_csh_024_init;    assign reg_csh_024_init =   cfg_ro_csh_mmio_bar2_size[63:32];
//re [31:0] reg_csh_028_init;    assign reg_csh_028_init = 32'h0000_0000;
//re [31:0] reg_csh_02C_init;    assign reg_csh_02C_init = 32'h0000_0000;
wire [31:0] reg_csh_030_init;    assign reg_csh_030_init = { cfg_ro_csh_expansion_rom_bar[31:11], 10'b0, 1'b0 };  // [0] must init to 0
//re [31:0] reg_csh_034_init;    assign reg_csh_034_init = 32'h0000_0000;
//re [31:0] reg_csh_038_init;    assign reg_csh_038_init = 32'h0000_0000;
//re [31:0] reg_csh_03C_init;    assign reg_csh_03C_init = 32'h0000_0000;

// @@@ VPD

// @@@ DSN

// @@@ PASID

//re [31:0] reg_pasid_000_init;  assign reg_pasid_000_init = {`OFUNC_BASE, 4'h1, 16'h001B};
//re [31:0] reg_pasid_004_init;  assign reg_pasid_004_init = { 16'b0, 3'b0, cfg_ro_pasid_max_pasid_width, 8'b0 };

// @@@ OTL (TLX port num N)

// @@@ OFUNC

//re [31:0] reg_ofunc_000_init;  assign reg_ofunc_000_init = {`OINFO_BASE, 4'h1, 16'h0023};
//re [31:0] reg_ofunc_004_init;  assign reg_ofunc_004_init = {12'h010, 4'h0, 16'h1014};
wire [31:0] reg_ofunc_008_init;  assign reg_ofunc_008_init = {cfg_ro_ofunc_afu_present, 1'b0, cfg_ro_ofunc_max_afu_index, 1'b0, 7'b0, 16'hF001}; // Important that 'Function Reset' [23] initializes to 0, otherwise the logic would enter an infinite reset loop
wire [31:0] reg_ofunc_00C_init;  assign reg_ofunc_00C_init = { 4'b0, 12'h000, 4'b0, 12'h000 };

// @@@ OINFO

//re [31:0] reg_oinfo_000_init;   assign reg_oinfo_000_init = {`OCTRL00_BASE, 4'h1, 16'h0023};
//re [31:0] reg_oinfo_004_init;   assign reg_oinfo_004_init = {12'h014, 4'h0, 16'h1014};
wire [31:0] reg_oinfo_008_init;   assign reg_oinfo_008_init = {8'b0, 8'h00, 16'hF003};  // Start 'AFU Info Index' = 0
wire [31:0] reg_oinfo_00C_init;   assign reg_oinfo_00C_init = {1'b0, 31'b0};            // Start 'Data Valid'=0 and 'AFU Descriptor Offset='0
wire [31:0] reg_oinfo_010_init;   assign reg_oinfo_010_init = 32'h0000_0000;            // Initial value shouldn't matter, but use all 0s for convenience

// @@@ OCTRL00  (AFU Index 0)

//re [31:0] reg_octrl00_000_init;   assign reg_octrl00_000_init = {`OCTRL01_BASE or `OVSEC1_BASE, 4'h1, 16'h0023};
//re [31:0] reg_octrl00_004_init;   assign reg_octrl00_004_init = {12'h020, 4'h0, 16'h1014};
wire [31:0] reg_octrl00_008_init;   assign reg_octrl00_008_init = {10'b0, cfg_ro_octrl00_afu_control_index, 16'hF004};  
wire [31:0] reg_octrl00_00C_init;   assign reg_octrl00_00C_init = {4'b0, 2'b0, 1'b0, 1'b0, 1'b0, 2'b0, 1'b0, 20'b0};  // Fence=0, Enable=0, Reset=0, Terminate Valid=0, PASID Termination Value=0
wire [31:0] reg_octrl00_010_init;   assign reg_octrl00_010_init = {16'b0, 3'b0, 5'b0, 3'b0, cfg_ro_octrl00_pasid_len_supported};        
wire [31:0] reg_octrl00_014_init;   assign reg_octrl00_014_init = {cfg_ro_octrl00_metadata_supported, 1'b0, 3'b0, 7'b0, 20'b0};
wire [31:0] reg_octrl00_018_init;   assign reg_octrl00_018_init = {4'b0, 12'h000, 4'b0, cfg_ro_octrl00_actag_len_supported};
wire [31:0] reg_octrl00_01C_init;   assign reg_octrl00_01C_init = {20'h0000_0, 12'h000};  
 
`ifdef ADD_AFU_CTRL01 
// @@@ OCTRL01  (AFU Index 1)

//re [31:0] reg_octrl01_000_init;   assign reg_octrl01_000_init = {`OCTRL02_BASE or`OVSEC1_BASE, 4'h1, 16'h0023};
//re [31:0] reg_octrl01_004_init;   assign reg_octrl01_004_init = {12'h020, 4'h0, 16'h1014};
wire [31:0] reg_octrl01_008_init;   assign reg_octrl01_008_init = {10'b0, cfg_ro_octrl01_afu_control_index, 16'hF004};  
wire [31:0] reg_octrl01_00C_init;   assign reg_octrl01_00C_init = {4'b0, 2'b0, 1'b0, 1'b0, 1'b0, 2'b0, 1'b0, 20'b0};  // Fence=0, Enable=0, Reset=0, Terminate Valid=0, PASID Termination Value=0
wire [31:0] reg_octrl01_010_init;   assign reg_octrl01_010_init = {16'b0, 3'b0, 5'b0, 3'b0, cfg_ro_octrl01_pasid_len_supported};        
wire [31:0] reg_octrl01_014_init;   assign reg_octrl01_014_init = {cfg_ro_octrl01_metadata_supported, 1'b0, 3'b0, 7'b0, 20'b0};
wire [31:0] reg_octrl01_018_init;   assign reg_octrl01_018_init = {4'b0, 12'h000, 4'b0, cfg_ro_octrl01_actag_len_supported};
wire [31:0] reg_octrl01_01C_init;   assign reg_octrl01_01C_init = {20'h0000_0, 12'h000};  
`endif
 
`ifdef ADD_AFU_CTRL02 
// @@@ OCTRL02  (AFU Index 2)

//re [31:0] reg_octrl02_000_init;   assign reg_octrl02_000_init = {`OCTRL03_BASE or`OVSEC1_BASE, 4'h1, 16'h0023};
//re [31:0] reg_octrl02_004_init;   assign reg_octrl02_004_init = {12'h020, 4'h0, 16'h1014};
wire [31:0] reg_octrl02_008_init;   assign reg_octrl02_008_init = {10'b0, cfg_ro_octrl02_afu_control_index, 16'hF004};  
wire [31:0] reg_octrl02_00C_init;   assign reg_octrl02_00C_init = {4'b0, 2'b0, 1'b0, 1'b0, 1'b0, 2'b0, 1'b0, 20'b0};  // Fence=0, Enable=0, Reset=0, Terminate Valid=0, PASID Termination Value=0
wire [31:0] reg_octrl02_010_init;   assign reg_octrl02_010_init = {16'b0, 3'b0, 5'b0, 3'b0, cfg_ro_octrl02_pasid_len_supported};        
wire [31:0] reg_octrl02_014_init;   assign reg_octrl02_014_init = {cfg_ro_octrl02_metadata_supported, 1'b0, 3'b0, 7'b0, 20'b0};
wire [31:0] reg_octrl02_018_init;   assign reg_octrl02_018_init = {4'b0, 12'h000, 4'b0, cfg_ro_octrl02_actag_len_supported};
wire [31:0] reg_octrl02_01C_init;   assign reg_octrl02_01C_init = {20'h0000_0, 12'h000};  
`endif
 
`ifdef ADD_AFU_CTRL03 
// @@@ OCTRL03  (AFU Index 3)

//re [31:0] reg_octrl03_000_init;   assign reg_octrl03_000_init = {`OVSEC1_BASE, 4'h1, 16'h0023};
//re [31:0] reg_octrl03_004_init;   assign reg_octrl03_004_init = {12'h020, 4'h0, 16'h1014};
wire [31:0] reg_octrl03_008_init;   assign reg_octrl03_008_init = {10'b0, cfg_ro_octrl03_afu_control_index, 16'hF004};  
wire [31:0] reg_octrl03_00C_init;   assign reg_octrl03_00C_init = {4'b0, 2'b0, 1'b0, 1'b0, 1'b0, 2'b0, 1'b0, 20'b0};  // Fence=0, Enable=0, Reset=0, Terminate Valid=0, PASID Termination Value=0
wire [31:0] reg_octrl03_010_init;   assign reg_octrl03_010_init = {16'b0, 3'b0, 5'b0, 3'b0, cfg_ro_octrl03_pasid_len_supported};        
wire [31:0] reg_octrl03_014_init;   assign reg_octrl03_014_init = {cfg_ro_octrl03_metadata_supported, 1'b0, 3'b0, 7'b0, 20'b0};
wire [31:0] reg_octrl03_018_init;   assign reg_octrl03_018_init = {4'b0, 12'h000, 4'b0, cfg_ro_octrl03_actag_len_supported};
wire [31:0] reg_octrl03_01C_init;   assign reg_octrl03_01C_init = {20'h0000_0, 12'h000};  
`endif


// @@@ OVSEC1

//re [31:0] reg_ovsec_000_init;   assign reg_ovsec_000_init = { 12'h000, 4'h1, 16'h0023};
//re [31:0] reg_ovsec_004_init;   assign reg_ovsec_004_init = { 12'h00C, 4'h0, 16'h1014};
wire [31:0] reg_ovsec_008_init;   assign reg_ovsec_008_init = { 16'h0000, 16'hF0F0};  // [31:16] are Vendor Unique, set to 0 for now






















