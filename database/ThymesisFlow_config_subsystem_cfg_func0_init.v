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
// Title    : cfg_func0_init.v
// Function : This file is included in 'cfg_func0.v'.
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
//                  Thus an initial value does not apply.
//
// -------------------------------------------------------------------
// Modification History :
//                                |Version    |     |Author   |Description of change
//                                |-----------|     |-------- |---------------------
  `define CFG_FUNC0_INIT_VERSION   09_Nov_2017   //            Add FLASH control registers in Vendor DVSEC
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

wire [31:0] reg_vpd_000_init;    assign reg_vpd_000_init = {1'b0, 15'b0, 8'h00, 8'h03};  
wire [31:0] reg_vpd_004_init;    assign reg_vpd_004_init = 32'h0000_0000;  

// @@@ DSN

//re [31:0] reg_dsn_000_init;    assign reg_dsn_000_init = {`OTL_BASE, 4'h1, 16'h0003}; 
//re [31:0] reg_dsn_004_init;    assign reg_dsn_004_init = cfg_ro_dsn_serial_number[31:0]
//re [31:0] reg_dsn_008_init;    assign reg_dsn_008_init = cfg_ro_dsn_serial_number[63:32];

// @@@ PASID

// Placeholder for future changes.

// @@@ OTL0 (TLX port num 0)

//re [31:0] reg_otl0_000_init;   assign reg_otl0_000_init = {`OFUNC_BASE, 4'h1, 16'h0023};
//re [31:0] reg_otl0_004_init;   assign reg_otl0_004_init = {12'h090, 4'h0, 16'h1014};
//re [31:0] reg_otl0_008_init;   assign reg_otl0_008_init = {16'h0000, 16'hF000};
//re [31:0] reg_otl0_00C_init;   assign reg_otl0_00C_init = {cfg_ro_otl0_tl_major_vers_capbl, cfg_ro_otl0_tl_minor_vers_capbl, 8'h00, 8'h00};  
wire [31:0] reg_otl0_010_init;   assign reg_otl0_010_init = {8'b0, 8'b0, 8'b0, 4'b0, 4'b0};   
//re [31:0] reg_otl0_014_init;   assign reg_otl0_014_init = 32'h0000_0000;
//re [31:0] reg_otl0_018_init;   assign reg_otl0_018_init = cfg_ro_otl0_rcv_tmpl_capbl[63:32];
//re [31:0] reg_otl0_01C_init;   assign reg_otl0_01C_init = cfg_ro_otl0_rcv_tmpl_capbl[31:0];
wire [31:0] reg_otl0_020_init;   assign reg_otl0_020_init = 32'h0000_0000;    
wire [31:0] reg_otl0_024_init;   assign reg_otl0_024_init = 32'h0000_0001;    // Template 0 default value is 1
//re [31:0] reg_otl0_028_init;   assign reg_otl0_028_init = 32'h0000_0000;
//re [31:0] reg_otl0_02C_init;   assign reg_otl0_02C_init = 32'h0000_0000;
//re [31:0] reg_otl0_030_init;   assign reg_otl0_030_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[255:224];
//re [31:0] reg_otl0_034_init;   assign reg_otl0_034_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[223:192];
//re [31:0] reg_otl0_038_init;   assign reg_otl0_038_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[191:160];
//re [31:0] reg_otl0_03C_init;   assign reg_otl0_03C_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[159:128];
//re [31:0] reg_otl0_040_init;   assign reg_otl0_040_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[127: 96];
//re [31:0] reg_otl0_044_init;   assign reg_otl0_044_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[ 95: 64];
//re [31:0] reg_otl0_048_init;   assign reg_otl0_048_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[ 63: 32];
//re [31:0] reg_otl0_04C_init;   assign reg_otl0_04C_init = cfg_ro_otl0_rcv_rate_tmpl_capbl[ 31:  0];
wire [31:0] reg_otl0_050_init;   assign reg_otl0_050_init = 32'h0000_0000;
wire [31:0] reg_otl0_054_init;   assign reg_otl0_054_init = 32'h0000_0000;
wire [31:0] reg_otl0_058_init;   assign reg_otl0_058_init = 32'h0000_0000;
wire [31:0] reg_otl0_05C_init;   assign reg_otl0_05C_init = 32'h0000_0000;
wire [31:0] reg_otl0_060_init;   assign reg_otl0_060_init = 32'h0000_0000;
wire [31:0] reg_otl0_064_init;   assign reg_otl0_064_init = 32'h0000_0000;
wire [31:0] reg_otl0_068_init;   assign reg_otl0_068_init = 32'h0000_0000;
wire [31:0] reg_otl0_06C_init;   assign reg_otl0_06C_init = 32'h0000_000F;     // Template 0 default value is '1111'
// Registers x070 through x08C are not implemented. When reading, they should return 0.

`ifdef EXPOSE_CFG_PORT_1
// @@@ OTL1 (TLX port num 1)

//re [31:0] reg_otl1_000_init;   assign reg_otl1_000_init = {`OFUNC_BASE, 4'h1, 16'h0023};
//re [31:0] reg_otl1_004_init;   assign reg_otl1_004_init = {12'h090, 4'h0, 16'h1014};
//re [31:0] reg_otl1_008_init;   assign reg_otl1_008_init = {16'h0000, 16'hF000};
//re [31:0] reg_otl1_00C_init;   assign reg_otl1_00C_init = {cfg_ro_otl1_tl_major_vers_capbl, cfg_ro_otl1_tl_minor_vers_capbl, 8'h00, 8'h00};  
wire [31:0] reg_otl1_010_init;   assign reg_otl1_010_init = {8'b0, 8'b0, 8'b0, 4'b0, 4'b0};   
//re [31:0] reg_otl1_014_init;   assign reg_otl1_014_init = 32'h0000_0000;
//re [31:0] reg_otl1_018_init;   assign reg_otl1_018_init = cfg_ro_otl1_rcv_tmpl_capbl[63:32];
//re [31:0] reg_otl1_01C_init;   assign reg_otl1_01C_init = cfg_ro_otl1_rcv_tmpl_capbl[31:0];
wire [31:0] reg_otl1_020_init;   assign reg_otl1_020_init = 32'h0000_0000;    
wire [31:0] reg_otl1_024_init;   assign reg_otl1_024_init = 32'h0000_0001;    // Template 0 default value is 1
//re [31:0] reg_otl1_028_init;   assign reg_otl1_028_init = 32'h0000_0000;
//re [31:0] reg_otl1_02C_init;   assign reg_otl1_02C_init = 32'h0000_0000;
//re [31:0] reg_otl1_030_init;   assign reg_otl1_030_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[255:224];
//re [31:0] reg_otl1_034_init;   assign reg_otl1_034_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[223:192];
//re [31:0] reg_otl1_038_init;   assign reg_otl1_038_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[191:160];
//re [31:0] reg_otl1_03C_init;   assign reg_otl1_03C_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[159:128];
//re [31:0] reg_otl1_040_init;   assign reg_otl1_040_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[127: 96];
//re [31:0] reg_otl1_044_init;   assign reg_otl1_044_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[ 95: 64];
//re [31:0] reg_otl1_048_init;   assign reg_otl1_048_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[ 63: 32];
//re [31:0] reg_otl1_04C_init;   assign reg_otl1_04C_init = cfg_ro_otl1_rcv_rate_tmpl_capbl[ 31:  0];
wire [31:0] reg_otl1_050_init;   assign reg_otl1_050_init = 32'h0000_0000;
wire [31:0] reg_otl1_054_init;   assign reg_otl1_054_init = 32'h0000_0000;
wire [31:0] reg_otl1_058_init;   assign reg_otl1_058_init = 32'h0000_0000;
wire [31:0] reg_otl1_05C_init;   assign reg_otl1_05C_init = 32'h0000_0000;
wire [31:0] reg_otl1_060_init;   assign reg_otl1_060_init = 32'h0000_0000;
wire [31:0] reg_otl1_064_init;   assign reg_otl1_064_init = 32'h0000_0000;
wire [31:0] reg_otl1_068_init;   assign reg_otl1_068_init = 32'h0000_0000;
wire [31:0] reg_otl1_06C_init;   assign reg_otl1_06C_init = 32'h0000_000F;     // Template 0 default value is '1111'
// Registers x070 through x08C are not implemented. When reading, they should return 0.
`endif


`ifdef EXPOSE_CFG_PORT_2
// @@@ OTL2 (TLX port num 2)

//re [31:0] reg_otl2_000_init;   assign reg_otl2_000_init = {`OFUNC_BASE, 4'h1, 16'h0023};
//re [31:0] reg_otl2_004_init;   assign reg_otl2_004_init = {12'h090, 4'h0, 16'h1014};
//re [31:0] reg_otl2_008_init;   assign reg_otl2_008_init = {16'h0000, 16'hF000};
//re [31:0] reg_otl2_00C_init;   assign reg_otl2_00C_init = {cfg_ro_otl2_tl_major_vers_capbl, cfg_ro_otl2_tl_minor_vers_capbl, 8'h00, 8'h00};  
wire [31:0] reg_otl2_010_init;   assign reg_otl2_010_init = {8'b0, 8'b0, 8'b0, 4'b0, 4'b0};   
//re [31:0] reg_otl2_014_init;   assign reg_otl2_014_init = 32'h0000_0000;
//re [31:0] reg_otl2_018_init;   assign reg_otl2_018_init = cfg_ro_otl2_rcv_tmpl_capbl[63:32];
//re [31:0] reg_otl2_01C_init;   assign reg_otl2_01C_init = cfg_ro_otl2_rcv_tmpl_capbl[31:0];
wire [31:0] reg_otl2_020_init;   assign reg_otl2_020_init = 32'h0000_0000;    
wire [31:0] reg_otl2_024_init;   assign reg_otl2_024_init = 32'h0000_0001;    // Template 0 default value is 1
//re [31:0] reg_otl2_028_init;   assign reg_otl2_028_init = 32'h0000_0000;
//re [31:0] reg_otl2_02C_init;   assign reg_otl2_02C_init = 32'h0000_0000;
//re [31:0] reg_otl2_030_init;   assign reg_otl2_030_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[255:224];
//re [31:0] reg_otl2_034_init;   assign reg_otl2_034_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[223:192];
//re [31:0] reg_otl2_038_init;   assign reg_otl2_038_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[191:160];
//re [31:0] reg_otl2_03C_init;   assign reg_otl2_03C_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[159:128];
//re [31:0] reg_otl2_040_init;   assign reg_otl2_040_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[127: 96];
//re [31:0] reg_otl2_044_init;   assign reg_otl2_044_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[ 95: 64];
//re [31:0] reg_otl2_048_init;   assign reg_otl2_048_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[ 63: 32];
//re [31:0] reg_otl2_04C_init;   assign reg_otl2_04C_init = cfg_ro_otl2_rcv_rate_tmpl_capbl[ 31:  0];
wire [31:0] reg_otl2_050_init;   assign reg_otl2_050_init = 32'h0000_0000;
wire [31:0] reg_otl2_054_init;   assign reg_otl2_054_init = 32'h0000_0000;
wire [31:0] reg_otl2_058_init;   assign reg_otl2_058_init = 32'h0000_0000;
wire [31:0] reg_otl2_05C_init;   assign reg_otl2_05C_init = 32'h0000_0000;
wire [31:0] reg_otl2_060_init;   assign reg_otl2_060_init = 32'h0000_0000;
wire [31:0] reg_otl2_064_init;   assign reg_otl2_064_init = 32'h0000_0000;
wire [31:0] reg_otl2_068_init;   assign reg_otl2_068_init = 32'h0000_0000;
wire [31:0] reg_otl2_06C_init;   assign reg_otl2_06C_init = 32'h0000_000F;     // Template 0 default value is '1111'
// Registers x070 through x08C are not implemented. When reading, they should return 0.
`endif

`ifdef EXPOSE_CFG_PORT_3
// @@@ OTL3 (TLX port num 3)

//re [31:0] reg_otl3_000_init;   assign reg_otl3_000_init = {`OFUNC_BASE, 4'h1, 16'h0023};
//re [31:0] reg_otl3_004_init;   assign reg_otl3_004_init = {12'h090, 4'h0, 16'h1014};
//re [31:0] reg_otl3_008_init;   assign reg_otl3_008_init = {16'h0000, 16'hF000};
//re [31:0] reg_otl3_00C_init;   assign reg_otl3_00C_init = {cfg_ro_otl3_tl_major_vers_capbl, cfg_ro_otl3_tl_minor_vers_capbl, 8'h00, 8'h00};  
wire [31:0] reg_otl3_010_init;   assign reg_otl3_010_init = {8'b0, 8'b0, 8'b0, 4'b0, 4'b0};   
//re [31:0] reg_otl3_014_init;   assign reg_otl3_014_init = 32'h0000_0000;
//re [31:0] reg_otl3_018_init;   assign reg_otl3_018_init = cfg_ro_otl3_rcv_tmpl_capbl[63:32];
//re [31:0] reg_otl3_01C_init;   assign reg_otl3_01C_init = cfg_ro_otl3_rcv_tmpl_capbl[31:0];
wire [31:0] reg_otl3_020_init;   assign reg_otl3_020_init = 32'h0000_0000;    
wire [31:0] reg_otl3_024_init;   assign reg_otl3_024_init = 32'h0000_0001;    // Template 0 default value is 1
//re [31:0] reg_otl3_028_init;   assign reg_otl3_028_init = 32'h0000_0000;
//re [31:0] reg_otl3_02C_init;   assign reg_otl3_02C_init = 32'h0000_0000;
//re [31:0] reg_otl3_030_init;   assign reg_otl3_030_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[255:224];
//re [31:0] reg_otl3_034_init;   assign reg_otl3_034_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[223:192];
//re [31:0] reg_otl3_038_init;   assign reg_otl3_038_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[191:160];
//re [31:0] reg_otl3_03C_init;   assign reg_otl3_03C_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[159:128];
//re [31:0] reg_otl3_040_init;   assign reg_otl3_040_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[127: 96];
//re [31:0] reg_otl3_044_init;   assign reg_otl3_044_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[ 95: 64];
//re [31:0] reg_otl3_048_init;   assign reg_otl3_048_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[ 63: 32];
//re [31:0] reg_otl3_04C_init;   assign reg_otl3_04C_init = cfg_ro_otl3_rcv_rate_tmpl_capbl[ 31:  0];
wire [31:0] reg_otl3_050_init;   assign reg_otl3_050_init = 32'h0000_0000;
wire [31:0] reg_otl3_054_init;   assign reg_otl3_054_init = 32'h0000_0000;
wire [31:0] reg_otl3_058_init;   assign reg_otl3_058_init = 32'h0000_0000;
wire [31:0] reg_otl3_05C_init;   assign reg_otl3_05C_init = 32'h0000_0000;
wire [31:0] reg_otl3_060_init;   assign reg_otl3_060_init = 32'h0000_0000;
wire [31:0] reg_otl3_064_init;   assign reg_otl3_064_init = 32'h0000_0000;
wire [31:0] reg_otl3_068_init;   assign reg_otl3_068_init = 32'h0000_0000;
wire [31:0] reg_otl3_06C_init;   assign reg_otl3_06C_init = 32'h0000_000F;     // Template 0 default value is '1111'
// Registers x070 through x08C are not implemented. When reading, they should return 0.
`endif

// @@@ OFUNC

//re [31:0] reg_ofunc_000_init;  assign reg_ofunc_000_init = {`OVSEC0_BASE, 4'h1, 16'h0023};
//re [31:0] reg_ofunc_004_init;  assign reg_ofunc_004_init = {12'h010, 4'h0, 16'h1014};
wire [31:0] reg_ofunc_008_init;  assign reg_ofunc_008_init = {cfg_ro_ofunc_afu_present, 1'b0, cfg_ro_ofunc_max_afu_index, 1'b0, 7'b0, 16'hF001}; // Important that 'Function Reset' [23] initializes to 0, otherwise the logic would enter an infinite reset loop
wire [31:0] reg_ofunc_00C_init;  assign reg_ofunc_00C_init = { 4'b0, 12'h000, 4'b0, 12'h000 };

// @@@ OINFO

// Placeholder for future changes.

// @@@ OCTRL00

// Placeholder for future changes.
 
// @@@ OVSEC0

//re [31:0] reg_ovsec_000_init;   assign reg_ovsec_000_init = { 12'h000, 4'h1, 16'h0023};
//re [31:0] reg_ovsec_004_init;   assign reg_ovsec_004_init = { 12'h00C, 4'h0, 16'h1014};
wire [31:0] reg_ovsec_008_init;   assign reg_ovsec_008_init = { 16'h0000, 16'hF0F0};  // [31:16] are Vendor Unique, set to 0 for now
//re [31:0] reg_ovsec_00C_init;   assign reg_ovsec_00C_init = cfg_ro_ovsec_cfg_version;
//re [31:0] reg_ovsec_010_init;   assign reg_ovsec_010_init = cfg_ro_ovsec_tlx0_version;
//re [31:0] reg_ovsec_014_init;   assign reg_ovsec_014_init = cfg_ro_ovsec_tlx1_version;
//re [31:0] reg_ovsec_018_init;   assign reg_ovsec_018_init = cfg_ro_ovsec_tlx2_version;
//re [31:0] reg_ovsec_01C_init;   assign reg_ovsec_01C_init = cfg_ro_ovsec_tlx3_version;
//re [31:0] reg_ovsec_020_init;   assign reg_ovsec_020_init = cfg_ro_ovsec_dlx0_version;
//re [31:0] reg_ovsec_024_init;   assign reg_ovsec_024_init = cfg_ro_ovsec_dlx1_version;
//re [31:0] reg_ovsec_028_init;   assign reg_ovsec_028_init = cfg_ro_ovsec_dlx2_version;
//re [31:0] reg_ovsec_02C_init;   assign reg_ovsec_02C_init = cfg_ro_ovsec_dlx3_version;
wire [31:0] reg_ovsec_030_init;   assign reg_ovsec_030_init = 32'h0000_0000;
wire [31:0] reg_ovsec_034_init;   assign reg_ovsec_034_init = 32'h0000_0000;






















