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
module cfg_tieoffs (

    // -------------------------------------------
    // cfg_func0 ports
    // -------------------------------------------       
           // Static
           // ------------------------------------                 
    output [63:0] f0_ro_csh_mmio_bar0_size
  , output [63:0] f0_ro_csh_mmio_bar1_size
  , output [63:0] f0_ro_csh_mmio_bar2_size
  , output        f0_ro_csh_mmio_bar0_prefetchable
  , output        f0_ro_csh_mmio_bar1_prefetchable
  , output        f0_ro_csh_mmio_bar2_prefetchable
  , output [31:0] f0_ro_csh_expansion_rom_bar
  , output  [7:0] f0_ro_otl0_tl_major_vers_capbl
  , output  [7:0] f0_ro_otl0_tl_minor_vers_capbl
           // Card Specific
           // ------------------------------------         
  , output [15:0] f0_ro_csh_subsystem_id
  , output [15:0] f0_ro_csh_subsystem_vendor_id
  , output [63:0] f0_ro_dsn_serial_number

    // -------------------------------------------
    // cfg_func1 ports
    // -------------------------------------------
           // Static
           // ------------------------------------- 
  , output [31:0] f1_ro_csh_expansion_rom_bar                    
           // Card Specific
           // -------------------------------------
  , output [15:0] f1_ro_csh_subsystem_id
  , output [15:0] f1_ro_csh_subsystem_vendor_id 
           // AFU Specific
           // ------------------------------------
  , output [63:0] f1_ro_csh_mmio_bar0_size
  , output [63:0] f1_ro_csh_mmio_bar1_size
  , output [63:0] f1_ro_csh_mmio_bar2_size
  , output        f1_ro_csh_mmio_bar0_prefetchable
  , output        f1_ro_csh_mmio_bar1_prefetchable
  , output        f1_ro_csh_mmio_bar2_prefetchable
  , output  [4:0] f1_ro_pasid_max_pasid_width
  , output  [7:0] f1_ro_ofunc_reset_duration
  , output        f1_ro_ofunc_afu_present
  , output  [4:0] f1_ro_ofunc_max_afu_index
  , output  [7:0] f1_ro_octrl00_reset_duration
  , output  [5:0] f1_ro_octrl00_afu_control_index
  , output  [4:0] f1_ro_octrl00_pasid_len_supported
  , output        f1_ro_octrl00_metadata_supported
  , output [11:0] f1_ro_octrl00_actag_len_supported



);

// -------------------------------------------
// cfg_func0 ports
// ------------------------------------------- 
      // Static                               
      // -------------------------------------          
      assign f0_ro_csh_mmio_bar0_size             =   64'hFFFF_FFFF_FFFF_FFFF;      
      assign f0_ro_csh_mmio_bar1_size             =   64'hFFFF_FFFF_FFFF_FFFF;  
      assign f0_ro_csh_mmio_bar2_size             =   64'hFFFF_FFFF_FFFF_FFFF;  
      assign f0_ro_csh_mmio_bar0_prefetchable     =                      1'b0;
      assign f0_ro_csh_mmio_bar1_prefetchable     =                      1'b0;
      assign f0_ro_csh_mmio_bar2_prefetchable     =                      1'b0;
      assign f0_ro_csh_expansion_rom_bar          =             32'hFFFF_F800;
      assign f0_ro_otl0_tl_major_vers_capbl       =                     8'h03;
      assign f0_ro_otl0_tl_minor_vers_capbl       =                     8'h00;
      // Card Specific                        
      // -------------------------------------
      assign f0_ro_csh_subsystem_id               =                  16'h060F;
      assign f0_ro_csh_subsystem_vendor_id        =                  16'h1014;
      assign f0_ro_dsn_serial_number              =   64'hDEAD_DEAD_DEAD_DEAD;
                                        
// ------------------------------------------- 
// cfg_func1 ports                             
// ------------------------------------------- 
      // Static                               
      // -------------------------------------
      assign f1_ro_csh_expansion_rom_bar          =              32'hFFFF_F800;     
      // Card Specific                        
      // -------------------------------------
      assign f1_ro_csh_subsystem_id               =                   16'h060F;
      assign f1_ro_csh_subsystem_vendor_id        =                   16'h1014;
      // AFU Specific                         
      // ------------------------------------- 
      
`ifdef MCP
      assign f1_ro_csh_mmio_bar0_size             =    64'hFFFF_FFFF_FC00_0000;
      assign f1_ro_csh_mmio_bar1_size             =    64'hFFFF_FFFF_FFFF_FFFF;
      assign f1_ro_csh_mmio_bar2_size             =    64'hFFFF_FFFF_FFFF_FFFF;
      assign f1_ro_csh_mmio_bar0_prefetchable     =                       1'b0;
      assign f1_ro_csh_mmio_bar1_prefetchable     =                       1'b0;
      assign f1_ro_csh_mmio_bar2_prefetchable     =                       1'b0;
      assign f1_ro_pasid_max_pasid_width          =                   5'b01001;
      assign f1_ro_ofunc_reset_duration           =                      8'h10;
      assign f1_ro_ofunc_afu_present              =                       1'b1;
      assign f1_ro_ofunc_max_afu_index            =                 6'b00_0000;
      assign f1_ro_octrl00_reset_duration         =                      8'h10;
      assign f1_ro_octrl00_afu_control_index      =                  6'b000000;
      assign f1_ro_octrl00_pasid_len_supported    =                   5'b01001;
      assign f1_ro_octrl00_metadata_supported     =                       1'b0;
      assign f1_ro_octrl00_actag_len_supported    =                    12'h020;

`elsif LPC
      assign f1_ro_csh_mmio_bar0_size             =    64'hFFFF_FFFF_FFF0_0000;
      assign f1_ro_csh_mmio_bar1_size             =    64'hFFFF_FFFF_FFFF_FFFF;
      assign f1_ro_csh_mmio_bar2_size             =    64'hFFFF_FFFF_FFFF_FFFF;
      assign f1_ro_csh_mmio_bar0_prefetchable     =                       1'b0;
      assign f1_ro_csh_mmio_bar1_prefetchable     =                       1'b0;
      assign f1_ro_csh_mmio_bar2_prefetchable     =                       1'b0;
      assign f1_ro_pasid_max_pasid_width          =                   5'b00001;
      assign f1_ro_ofunc_reset_duration           =                      8'h10;
      assign f1_ro_ofunc_afu_present              =                       1'b1;
      assign f1_ro_ofunc_max_afu_index            =                 6'b00_0000;
      assign f1_ro_octrl00_reset_duration         =                      8'h10;
      assign f1_ro_octrl00_afu_control_index      =                  6'b000000;
      assign f1_ro_octrl00_pasid_len_supported    =                   5'b00000;
      assign f1_ro_octrl00_metadata_supported     =                       1'b0;
      assign f1_ro_octrl00_actag_len_supported    =                    12'h001;

`else
      assign f1_ro_csh_mmio_bar0_size             =    64'hFFFF_FFFF_FC00_0000;
      assign f1_ro_csh_mmio_bar1_size             =    64'hFFFF_FFFF_FFFF_FFFF;
      assign f1_ro_csh_mmio_bar2_size             =    64'hFFFF_FFFF_FFFF_FFFF;
      assign f1_ro_csh_mmio_bar0_prefetchable     =                       1'b0;
      assign f1_ro_csh_mmio_bar1_prefetchable     =                       1'b0;
      assign f1_ro_csh_mmio_bar2_prefetchable     =                       1'b0;
      assign f1_ro_pasid_max_pasid_width          =                   5'b01001;
      assign f1_ro_ofunc_reset_duration           =                      8'h10;
      assign f1_ro_ofunc_afu_present              =                       1'b1;
      assign f1_ro_ofunc_max_afu_index            =                 6'b00_0000;
      assign f1_ro_octrl00_reset_duration         =                      8'h10;
      assign f1_ro_octrl00_afu_control_index      =                  6'b000000;
      assign f1_ro_octrl00_pasid_len_supported    =                   5'b01001;
      assign f1_ro_octrl00_metadata_supported     =                       1'b0;
      assign f1_ro_octrl00_actag_len_supported    =                    12'h020;
`endif



endmodule // cfg_tieoffs