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
// Title    : cfg_func.v
// Function : This file is intended to be useful for any OpenCAPI AFU design. It provides the configuration spaces
//            contained in Function 1-7.
//
// -------------------------------------------------------------------
// Modification History :
//                                |Version    |     |Author   |Description of change
//                                |-----------|     |-------- |---------------------
  `define CFG_FUNC_VERSION         26_Sep_2017   //            Fix <= on reg_octrl0[1,2,3]_reset_timer_run_q and _reset_timer_q. Add MARK_DEBUG on terminate sigs.
// -------------------------------------------------------------------

// ******************************************************************************************************************************
// Functional Description
//
// Configuration registers are broken into a number of groups: 
// - Configuration Space Header
//   (csh)   Configuration Space Header
// - Capabilities
//   (vpd)   Capability: Vital Product Data (VPD) 
// - Extended Capabilities
//   (dsn)   Extended Capability: Device Serial Number 
//   (pasid) Extended Capability: Process Address Space ID
// - Extended Capability: OpenCAPI Designated Vendor Specific Extended Capability (DVSEC)
//   (otl)     DVSEC: OpenCAPI Transport Layer
//   (ofunc)   DVSEC: Functional Configuration
//   (oinfo)   DVSEC: AFU Information
//                    Configuration space located inside each AFU: (dsct0) AFU Descriptor Template 0
//   (octrl00) DVSEC: AFU 0 Control (one copy per AFU so tag name with AFU Index)
//   (octrl01) DVSEC: AFU 1 Control (one copy per AFU so tag name with AFU Index)
//   (octrl02) DVSEC: AFU 2 Control (one copy per AFU so tag name with AFU Index)
//   (octrl03) DVSEC: AFU 3 Control (one copy per AFU so tag name with AFU Index)
//   (ovsec)   DVSEC: Vendor Specific
//
// All internal configuration registers are 32 bits wide, using Little Endian format and addressing. 
// This means bits are ordered [31:0] and bytes are ordered 3,2,1,0 when looking at the lowest 2 address bits.
// 
// One register is selected at a time using the lower 12 bits of address bus (addr). 
// Thus the configuration address space starts at x000 and goes through xFFF.
//
// Writes to an address that is not implemented have no effect. 
// Reads from an address that is not implemented returns all 0s.
//
// Writes of various sizes are enabled using one of the three write strobes (wr_1B, wr_2B, wr_4B). 
// Only one should be used at a time. To signal a write, pulse one of the write strobes to 1 for a single cycle.  
// The byte(s) written are selected by the lower 2 bits of the address. 
// The address and data width must follow "natural alignment", meaning any byte can be selected for a 1 byte write, addr[0] must be
// b0 to select a 2 byte write, and addr[1:0] must be b00 to select a 4 byte write. If these conditions are not met, an error
// (bad_op_or_align) is pulsed and the write operation is discarded.
//
// Read operations are triggered by pulsing the read strobe (rd) active for one cycle. Only one read or write can be performed
// at a time, it is considered an error if multiple strobes of any kind are active at the same time. A read operation is always
// returns 4 bytes.
// 
// To make timing closure as easy as possible in any AFU that uses it, the design is latch bounded. Inputs are latched
// immediately and acted upon in the next cycle. During this cycle the target register and write data widths are determined. In the 
// cycle after that, the config register is updated (on a write), the config register contents are available for viewing (on a 
// read), or the error indicator is presented. All outputs are driven directly from latches to provide the best timing closure
// situation for the AFU design that uses this module. 
//
// Read and write operations can be pipelined in back to back cycles. A cycle starts on the rising edge of the clock (clock).
// When reset is active (=b1), all configuration registers are set to their initial values.
//
// Example timing diagram                   
//   clock                      ___|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^
//   cfg_addr               .<AAAA>........................<BBBB>........................<CCCC>.............................
//   cfg_wdata              .<dataA>........................................................................................
//   cfg_wr_[1,2,4]B        _^^^^^^^^^___________________________________________________^^^^^^^^^^_________________________
//   (config reg A)             .............<data AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//   cfg_rd                 _______________________________^^^^^^^^______________________^^^^^^^^___________________________
//   cfg_rdata              ............................................<dataBBBB>..........................................
//   cfg_rdata_vld          ____________________________________________^^^^^^^^^^__________________________________________
//   cfg_bad_op_or_align    __________________________________________________________________________^^^^^^^^^^____________
//  (cfg_addr_not_implemented) _______________________________________________________________________^^^^^^^^^^____________
//
// The first operation is a write to register "A". The address, write data, and one of the write strobes are present at same time.
// Data is written into the selected register on the clock edge after presentation.
// The second operation is a read from register "B". The adddress and read strobe are present at the same time. Data from 
// the targeted configuration register appears for one cycle, along with the 'rdata_vld' signal, 1 cycle after the read op is detected.
// The third operation is illegal, as multiple write or read strobes are active at the same time. The operation is dropped, so
// no change is made to the internal config register contents. No read data or read valid is present, but an error indicator
// (bad_op_or_align or addr_not_implemented) is pulsed during cycle read data would be present. 
// 'bad_op_or_align' will occur if either the alignment is incorrect on legal write or if multiple write/read strobes are present.
// 'addr_not_implemented' will occur if the address provided is within the ACS space, but not implemented.
//
// ******************************************************************************************************************************
// Address ranges of configuration areas
// The configuration areas have been assigned to these regions within the 4KB (12 bit) space. 
// - Configuration Space Header - must start at x000 as it is PCI legacy space.
//   (csh)   Configuration Space Header
`define CSH_BASE    8'h00
`define CSH_LAST    8'h3F   
 
// - Capabilities - all must appear after Configuration Space Header but before x100
//   (vpd)   Capability: Vital Product Data (VPD) 
// Note: Because Capabilities pointers are only 8 bits, create a special version of the pointer of that size. The value is the same as *_BASE.
//`define VPD_BASE    12'h040
//`define VPD_LAST    12'h047
//`define VPD_PTR     8'h40

// - Extended Capabilities - all must appear between x100 and xFFF
//   (dsn)   Extended Capability: Device Serial Number 
//   (pasid) Extended Capability: Process Address Space ID
//   DVSEC: OpenCAPI Extended Capabilities
//   (otl)     DVSEC: OpenCAPI Transport Layer
//   (ofunc)   DVSEC: Functional Configuration
//   (oinfo)   DVSEC: AFU Information
//                    Configuration space located inside each AFU: (dsct0) AFU Descriptor Template 0
//   (octrl00) DVSEC: AFU 0 Control (one copy per AFU so tag name with AFU Index)
//   (ovsec)   DVSEC: Vendor Specific
//`define DSN_BASE    12'h100
//`define DSN_LAST    12'h10B

`define PASID_BASE  12'h100
`define PASID_LAST  12'h107

// Because the portnum gates off all but 1 copy of OTL, only one OTL config address is used
//`define OTL_BASE    12'h200
//`define OTL_LAST    12'h28F

`define OFUNC_BASE  12'h300
`define OFUNC_LAST  12'h30F

`define OINFO_BASE  12'h400
`define OINFO_LAST  12'h413

`define OCTRL00_BASE  12'h500
`define OCTRL00_LAST  12'h51F

`ifdef ADD_AFU_CTRL01 
  `define OCTRL01_BASE  12'h540
  `define OCTRL01_LAST  12'h55F
`endif

`ifdef ADD_AFU_CTRL02 
  `define OCTRL02_BASE  12'h580
  `define OCTRL02_LAST  12'h59F
`endif

`ifdef ADD_AFU_CTRL03 
  `define OCTRL03_BASE  12'h5C0
  `define OCTRL03_LAST  12'h5DF
`endif

// Note: Each Function can contain a unique VSEC structure. To keep them apart in verification,
//       use `OVSEC0 and `OVSECn (n=1-7) as the define names. However within the logic, the signals and registers
//       and just use _ovsec_ since the location of them in cfg_func0 and cfg_func uniquely identify them.
//       Keeping _ovsec_ the same makes it easier to copy/paste common logic between the function instances.
//
`define OVSEC1_BASE  12'h600
`define OVSEC1_LAST  12'h60B
 
 
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
// Note about BAR registers:
//   The 3 MMIO BAR and Expansion ROM BAR registers should be written to all 1's, then read back. The low order bits that are 0 
//   tell software the size of the space that BAR register manages. MMIO spaces include both MMIO and all PASID registers.
// ==============================================================================================================================


module cfg_func1
(    
    // Miscellaneous Ports
    input          clock                             
  , input          reset          // (positive active) Externally combine (chip reset OR cfg_ofunc_function_reset) to drive this Function reset
  , input          device_reset   // (positive active) Provide a copy of Device reset, without combining it with cfg_ofunc_function_reset

    // READ ONLY field inputs (suggested default values to tie these ports to follow each declaration)
    // Note: These need to be inputs rather than parameters because they may change values when partial reconfiguration is supported
    // Configuration Space Header
  , input   [15:0] cfg_ro_csh_device_id               // = 16'h062B
  , input   [15:0] cfg_ro_csh_vendor_id               // = 16'h1014
  , input   [23:0] cfg_ro_csh_class_code              // = 24'h120000
  , input    [7:0] cfg_ro_csh_revision_id             // =  8'h00
  , input          cfg_ro_csh_multi_function          // =  1'b1                     // Always set to 1 when using this CFG implementation
  , input   [63:0] cfg_ro_csh_mmio_bar0_size          // = 64'hFFFF_FFFF_FFF0_0000   // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 1 MB)
  , input   [63:0] cfg_ro_csh_mmio_bar1_size          // = 64'hFFFF_FFFF_FFFF_FFFF   // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , input   [63:0] cfg_ro_csh_mmio_bar2_size          // = 64'hFFFF_FFFF_FFFF_FFFF   // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , input          cfg_ro_csh_mmio_bar0_prefetchable  // = 1'b0   // i.e. MMIO regs typically have write order dependencies, DRAM does not 
  , input          cfg_ro_csh_mmio_bar1_prefetchable  // = 1'b0
  , input          cfg_ro_csh_mmio_bar2_prefetchable  // = 1'b0
  , input   [15:0] cfg_ro_csh_subsystem_id            // = 16'h060F
  , input   [15:0] cfg_ro_csh_subsystem_vendor_id     // = 16'h1014
  , input   [31:0] cfg_ro_csh_expansion_rom_bar       // = 32'hFFFF_F800             // Set to all 0's if ROM not implemented
    // PASID
  , input    [4:0] cfg_ro_pasid_max_pasid_width       // =  5'b00001                 // Default is 2 PASIDs
    // Function
  , input    [7:0] cfg_ro_ofunc_reset_duration        // =  8'h10                    // Number of cycles Function reset is active (00=255 cycles)
  , input          cfg_ro_ofunc_afu_present           // =  1'b0                     // Func0=0, FuncN=1 (likely)
  , input    [5:0] cfg_ro_ofunc_max_afu_index         // =  6'b00_0000               // Default is AFU number 0
    // AFU Control
  , input    [7:0] cfg_ro_octrl00_reset_duration      // =  8'h10                    // AFU reset is active for this + 1 cycles (00=256 cycles)
  , input    [5:0] cfg_ro_octrl00_afu_control_index   // =  6'b000000                // AFU number for AFU in Function
  , input    [4:0] cfg_ro_octrl00_pasid_len_supported // =  5'b00000                 // Default is 1 PASID
  , input          cfg_ro_octrl00_metadata_supported  // =  1'b0                     // MetaData is not supported
  , input   [11:0] cfg_ro_octrl00_actag_len_supported // = 12'h001                   // Default is 1 acTag

`ifdef ADD_AFU_CTRL01 
  , input    [7:0] cfg_ro_octrl01_reset_duration      // =  8'h10                    // AFU reset is active for this + 1 cycles (00=256 cycles)
  , input    [5:0] cfg_ro_octrl01_afu_control_index   // =  6'b000001                // AFU number for AFU in Function
  , input    [4:0] cfg_ro_octrl01_pasid_len_supported // =  5'b00000                 // Default is 1 PASID
  , input          cfg_ro_octrl01_metadata_supported  // =  1'b0                     // MetaData is not supported
  , input   [11:0] cfg_ro_octrl01_actag_len_supported // = 12'h001                   // Default is 1 acTag
`endif

`ifdef ADD_AFU_CTRL02 
  , input    [7:0] cfg_ro_octrl02_reset_duration      // =  8'h10                    // AFU reset is active for this + 1 cycles (00=256 cycles)
  , input    [5:0] cfg_ro_octrl02_afu_control_index   // =  6'b000010                // AFU number for AFU in Function
  , input    [4:0] cfg_ro_octrl02_pasid_len_supported // =  5'b00000                 // Default is 1 PASID
  , input          cfg_ro_octrl02_metadata_supported  // =  1'b0                     // MetaData is not supported
  , input   [11:0] cfg_ro_octrl02_actag_len_supported // = 12'h001                   // Default is 1 acTag
`endif

`ifdef ADD_AFU_CTRL03 
  , input    [7:0] cfg_ro_octrl03_reset_duration      // =  8'h10                    // AFU reset is active for this + 1 cycles (00=256 cycles)
  , input    [5:0] cfg_ro_octrl03_afu_control_index   // =  6'b000011                // AFU number for AFU in Function
  , input    [4:0] cfg_ro_octrl03_pasid_len_supported // =  5'b00000                 // Default is 1 PASID
  , input          cfg_ro_octrl03_metadata_supported  // =  1'b0                     // MetaData is not supported
  , input   [11:0] cfg_ro_octrl03_actag_len_supported // = 12'h001                   // Default is 1 acTag
`endif

    // Assigned configuration values 
  , input    [2:0] cfg_ro_function               // Hardcoded number (0-7) in *_device.v to identify this Function instantiation

    // Functional interface
  , input    [2:0] cfg_function                  // Targeted Function
  , input    [1:0] cfg_portnum                   // Targeted TLX port
  , input   [11:0] cfg_addr                      // Target address for the read or write access
  , input   [31:0] cfg_wdata                     // Write data into selected config reg
  , output  [31:0] cfg_rdata                     // Read  data from selected config reg
  , output         cfg_rdata_vld                 // When observed in the proper cycle, indicates if cfg_rdata has valid information
  , input          cfg_wr_1B                     // When 1, triggers a write operation of 1 byte  (cfg_addr[1:0] selects byte)
  , input          cfg_wr_2B                     // When 1, triggers a write operation of 2 bytes (cfg_addr[1]   selects starting byte)
  , input          cfg_wr_4B                     // When 1, triggers a write operation of all 4 bytes
  , input          cfg_rd                        // When 1, triggers a read operation that returns all 4 bytes of data from the reg
  , output         cfg_bad_op_or_align           // Pulsed when multiple write/read strobes are active or writes are not naturally aligned
  , output         cfg_addr_not_implemented      // Pulsed when address provided is not implemented within the ACS space

    // Inputs defined by active AFU logic
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input          cfg_octrl00_terminate_in_progress     // When 1, a PASID is in the process of being terminated (set to 1 immediately after 'terminate valid')
`ifdef ADD_AFU_CTRL01
  , input          cfg_octrl01_terminate_in_progress     // When 1, a PASID is in the process of being terminated (set to 1 immediately after 
`endif
`ifdef ADD_AFU_CTRL02
  , input          cfg_octrl02_terminate_in_progress     // When 1, a PASID is in the process of being terminated (set to 1 immediately after 
`endif
`ifdef ADD_AFU_CTRL03
  , input          cfg_octrl03_terminate_in_progress     // When 1, a PASID is in the process of being terminated (set to 1 immediately after 
`endif

    // Individual fields from configuration registers
    // CSH
  , output         cfg_csh_memory_space
  , output  [63:0] cfg_csh_mmio_bar0
  , output  [63:0] cfg_csh_mmio_bar1
  , output  [63:0] cfg_csh_mmio_bar2
  , output  [31:0] cfg_csh_expansion_ROM_bar 
  , output         cfg_csh_expansion_ROM_enable
    // OFUNC
  , output         cfg_ofunc_function_reset       // When 1, reset this Function
  , output  [11:0] cfg_ofunc_func_actag_base
  , output  [11:0] cfg_ofunc_func_actag_len_enab
    // OCTRL
  , output   [5:0] cfg_octrl00_afu_control_index    // AFU number that other octrl signals refer to (control 1 AFU at a time)
  , output   [3:0] cfg_octrl00_afu_unique           // Each AFU can assign a use to this (OCTRL, h0C, bit [31:28])
  , output         cfg_octrl00_fence_afu            // When 1, isolate the selected AFU from all other units (likely in preparation for re-configuring it)
  , output         cfg_octrl00_enable_afu           // When 1, the selected AFU can initiate commands to the host
  , output         cfg_octrl00_reset_afu            // When 1, reset the selected AFU
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output         cfg_octrl00_terminate_valid      // When 1, terminate the specified PASID process
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [19:0] cfg_octrl00_terminate_pasid      // Which PASID 'terminate valid' applies to
  , output   [4:0] cfg_octrl00_pasid_length_enabled
  , output         cfg_octrl00_metadata_enabled
  , output   [2:0] cfg_octrl00_host_tag_run_length
  , output  [19:0] cfg_octrl00_pasid_base
  , output  [11:0] cfg_octrl00_afu_actag_len_enab
  , output  [11:0] cfg_octrl00_afu_actag_base

`ifdef ADD_AFU_CTRL01 
  , output   [5:0] cfg_octrl01_afu_control_index    // AFU number that other octrl signals refer to (control 1 AFU at a time)
  , output   [3:0] cfg_octrl01_afu_unique           // Each AFU can assign a use to this (OCTRL, h0C, bit [31:28])
  , output         cfg_octrl01_fence_afu            // When 1, isolate the selected AFU from all other units (likely in preparation for re-configuring it)
  , output         cfg_octrl01_enable_afu           // When 1, the selected AFU can initiate commands to the host
  , output         cfg_octrl01_reset_afu            // When 1, reset the selected AFU
  , output         cfg_octrl01_terminate_valid      // When 1, terminate the specified PASID process
  , output  [19:0] cfg_octrl01_terminate_pasid      // Which PASID 'terminate valid' applies to
  , output   [4:0] cfg_octrl01_pasid_length_enabled
  , output         cfg_octrl01_metadata_enabled
  , output   [2:0] cfg_octrl01_host_tag_run_length
  , output  [19:0] cfg_octrl01_pasid_base
  , output  [11:0] cfg_octrl01_afu_actag_len_enab
  , output  [11:0] cfg_octrl01_afu_actag_base
`endif

`ifdef ADD_AFU_CTRL02 
  , output   [5:0] cfg_octrl02_afu_control_index    // AFU number that other octrl signals refer to (control 1 AFU at a time)
  , output   [3:0] cfg_octrl02_afu_unique           // Each AFU can assign a use to this (OCTRL, h0C, bit [31:28])
  , output         cfg_octrl02_fence_afu            // When 1, isolate the selected AFU from all other units (likely in preparation for re-configuring it)
  , output         cfg_octrl02_enable_afu           // When 1, the selected AFU can initiate commands to the host
  , output         cfg_octrl02_reset_afu            // When 1, reset the selected AFU
  , output         cfg_octrl02_terminate_valid      // When 1, terminate the specified PASID process
  , output  [19:0] cfg_octrl02_terminate_pasid      // Which PASID 'terminate valid' applies to
  , output   [4:0] cfg_octrl02_pasid_length_enabled
  , output         cfg_octrl02_metadata_enabled
  , output   [2:0] cfg_octrl02_host_tag_run_length
  , output  [19:0] cfg_octrl02_pasid_base
  , output  [11:0] cfg_octrl02_afu_actag_len_enab
  , output  [11:0] cfg_octrl02_afu_actag_base
`endif

`ifdef ADD_AFU_CTRL03 
  , output   [5:0] cfg_octrl03_afu_control_index    // AFU number that other octrl signals refer to (control 1 AFU at a time)
  , output   [3:0] cfg_octrl03_afu_unique           // Each AFU can assign a use to this (OCTRL, h0C, bit [31:28])
  , output         cfg_octrl03_fence_afu            // When 1, isolate the selected AFU from all other units (likely in preparation for re-configuring it)
  , output         cfg_octrl03_enable_afu           // When 1, the selected AFU can initiate commands to the host
  , output         cfg_octrl03_reset_afu            // When 1, reset the selected AFU
  , output         cfg_octrl03_terminate_valid      // When 1, terminate the specified PASID process
  , output  [19:0] cfg_octrl03_terminate_pasid      // Which PASID 'terminate valid' applies to
  , output   [4:0] cfg_octrl03_pasid_length_enabled
  , output         cfg_octrl03_metadata_enabled
  , output   [2:0] cfg_octrl03_host_tag_run_length
  , output  [19:0] cfg_octrl03_pasid_base
  , output  [11:0] cfg_octrl03_afu_actag_len_enab
  , output  [11:0] cfg_octrl03_afu_actag_base
`endif

    // Interface to AFU Descriptor table (interface is Read Only)
  , output   [5:0] cfg_desc_afu_index
  , output  [30:0] cfg_desc_offset
  , output         cfg_desc_cmd_valid
  , input   [31:0] desc_cfg_data
  , input          desc_cfg_data_valid                
  , input          desc_cfg_echo_cmd_valid
    // When used with multiple descriptors representing multiple AFUs, connect the inputs thusly at the next level up:
    //    (into cfg_func.v) = (out of DESC0 instance)      (out of DESC1 instance)    (out of other DESC instances)
    // assign desc_cfg_echo_cmd_valid  = desc0_cfg_echo_cmd_valid  &  desc1_cfg_echo_cmd_valid & ... ;
    // assign desc_cfg_data_valid      = desc0_cfg_data_valid      |  desc1_cfg_data_valid     | ... ;
    // assign desc_cfg_data            = desc0_cfg_data            |  desc1_cfg_data           | ... ;
    //
    // Explanation:
    // - 'echo_cmd_valid' is returned after the DESC instance has executed the current command. 
    //   The idea is to not return a summary value until ALL DESC instances are ready.
    // - 'data_valid' and data will be an OR because only the DESC instance that contains the matching afu_index and afu_offset 
    //   should respond with real data, all others should output 0s
    //
    // Note: 'desc_cfg_data_valid' is not used because the CFG architecture only wants data = 0 returned on an error. 
    //       Knowing whether the read returned 0 because the target was found and contained 0, or because no target was found
    //       is deemed not important to software. Brian Bakke says this is because software should know which AFU Index's exist
    //       and how large they are from discovery. During discovery, reading from AFU Index's which don't exist will be attempted
    //       and software just wants to see 0's on data (and no error) when this happens. Thus while hardware can distinguish
    //       between the two cases, software doesn't want to know about it. 
 
) ;

// ----------------------------------
// Latch the inputs
// ----------------------------------
reg  [2:0] function_q;
//g  [1:0] portnum_q;
reg [11:0] addr_q  ;
reg [31:0] wdata_q ;
reg        wr_1B_q ;
reg        wr_2B_q ;
reg        wr_4B_q ;
reg        rd_q    ;
reg        reset_q ;

always @(posedge(clock))
  begin
    function_q <= cfg_function;
//  portnum_q  <= cfg_portnum;
    addr_q     <= cfg_addr;
    wdata_q    <= cfg_wdata;
    wr_1B_q    <= cfg_wr_1B;
    wr_2B_q    <= cfg_wr_2B;
    wr_4B_q    <= cfg_wr_4B;
    rd_q       <= cfg_rd;
    reset_q    <= reset;
  end
 

// --------------------------------------------
// Check read/write conflict, byte alignment, and determine write byte enables
// --------------------------------------------
reg [3:0] wr_be;              // Individual byte enables. When 1, a write operation will overlay that byte. When 0, byte remains untouched
reg       do_read;            // Set to 1 if no conflict between read and write, and read is requested
reg       bad_op_or_align_d;
reg       bad_op_or_align_q;

always @(*)     // Combinational logic
  begin
    if      (function_q != cfg_ro_function)                                                       // Operation is for a different Function
      begin  wr_be = 4'b0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set no write enable or read, no error

    else if (wr_1B_q==1'b0 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b0)                       // No operation is selected
      begin  wr_be = 4'b0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set no write enable or read, no error

    else if (wr_1B_q==1'b0 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b1)                       // Operation is a legal read (no addr alignment check)
      begin  wr_be = 4'b0000;   do_read = 1'b1;  bad_op_or_align_d = 1'b0; end                    // Set 'do_read' and no write bits

    else if (wr_1B_q==1'b0 && wr_2B_q==1'b0 && wr_4B_q==1'b1 && rd_q==1'b0 && addr_q[1:0]==2'b00) // Operation is a legal 4B write
      begin  wr_be = 4'b1111;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set all write byte enables and no read

    else if (wr_1B_q==1'b0 && wr_2B_q==1'b1 && wr_4B_q==1'b0 && rd_q==1'b0 && addr_q[1:0]==2'b00) // Operation is a legal 2B write
      begin  wr_be = 4'b0011;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set write enables for bytes 0 & 1
    else if (wr_1B_q==1'b0 && wr_2B_q==1'b1 && wr_4B_q==1'b0 && rd_q==1'b0 && addr_q[1:0]==2'b10) // Operation is a legal 2B write
      begin  wr_be = 4'b1100;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set write enables for bytes 2 & 3

    else if (wr_1B_q==1'b1 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b0 && addr_q[1:0]==2'b00) // Operation is a legal 1B write
      begin  wr_be = 4'b0001;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set write enable for byte 0
    else if (wr_1B_q==1'b1 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b0 && addr_q[1:0]==2'b01) // Operation is a legal 1B write
      begin  wr_be = 4'b0010;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set write enable for byte 1
    else if (wr_1B_q==1'b1 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b0 && addr_q[1:0]==2'b10) // Operation is a legal 1B write
      begin  wr_be = 4'b0100;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set write enable for byte 2
    else if (wr_1B_q==1'b1 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b0 && addr_q[1:0]==2'b11) // Operation is a legal 1B write
      begin  wr_be = 4'b1000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                    // Set write enable for byte 3

    else                                                                                          // Operation is illegal (bad combination of strobes)
      begin  wr_be = 4'b0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b1; end                    // Set no write enable or read, flag error

  end

// Latch error before sending out of module so it aligns with read data and write data taking effect
always @(posedge(clock))
  bad_op_or_align_q <= bad_op_or_align_d;

assign cfg_bad_op_or_align = bad_op_or_align_q;      // Because 'bad' signal is calculated each cycle, the error register should self clear. 



// ------------------------------------
// Select target register using address
// ------------------------------------
wire sel_csh_000; 
wire sel_csh_004;
wire sel_csh_008;
wire sel_csh_00C;
wire sel_csh_010; 
wire sel_csh_014;
wire sel_csh_018;
wire sel_csh_01C;
wire sel_csh_020; 
wire sel_csh_024;
wire sel_csh_028;
wire sel_csh_02C;
wire sel_csh_030; 
wire sel_csh_034;
wire sel_csh_038;
wire sel_csh_03C;

assign sel_csh_000 = (addr_q >= 12'h000 && addr_q < 12'h004) ? 1'b1 : 1'b0;
assign sel_csh_004 = (addr_q >= 12'h004 && addr_q < 12'h008) ? 1'b1 : 1'b0;
assign sel_csh_008 = (addr_q >= 12'h008 && addr_q < 12'h00C) ? 1'b1 : 1'b0;
assign sel_csh_00C = (addr_q >= 12'h00C && addr_q < 12'h010) ? 1'b1 : 1'b0;
assign sel_csh_010 = (addr_q >= 12'h010 && addr_q < 12'h014) ? 1'b1 : 1'b0;
assign sel_csh_014 = (addr_q >= 12'h014 && addr_q < 12'h018) ? 1'b1 : 1'b0;
assign sel_csh_018 = (addr_q >= 12'h018 && addr_q < 12'h01C) ? 1'b1 : 1'b0;
assign sel_csh_01C = (addr_q >= 12'h01C && addr_q < 12'h020) ? 1'b1 : 1'b0;
assign sel_csh_020 = (addr_q >= 12'h020 && addr_q < 12'h024) ? 1'b1 : 1'b0;
assign sel_csh_024 = (addr_q >= 12'h024 && addr_q < 12'h028) ? 1'b1 : 1'b0;
assign sel_csh_028 = (addr_q >= 12'h028 && addr_q < 12'h02C) ? 1'b1 : 1'b0;
assign sel_csh_02C = (addr_q >= 12'h02C && addr_q < 12'h030) ? 1'b1 : 1'b0;
assign sel_csh_030 = (addr_q >= 12'h030 && addr_q < 12'h034) ? 1'b1 : 1'b0;
assign sel_csh_034 = (addr_q >= 12'h034 && addr_q < 12'h038) ? 1'b1 : 1'b0;
assign sel_csh_038 = (addr_q >= 12'h038 && addr_q < 12'h03C) ? 1'b1 : 1'b0;
assign sel_csh_03C = (addr_q >= 12'h03C && addr_q < 12'h040) ? 1'b1 : 1'b0;


wire sel_pasid_000; 
wire sel_pasid_004;

assign sel_pasid_000 = (addr_q >= (`PASID_BASE + 12'h000) && addr_q < (`PASID_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_pasid_004 = (addr_q >= (`PASID_BASE + 12'h004) && addr_q < (`PASID_BASE + 12'h008)) ? 1'b1 : 1'b0;


wire sel_ofunc_000;          
wire sel_ofunc_004;
wire sel_ofunc_008;
wire sel_ofunc_00C;

assign sel_ofunc_000 = (addr_q >= (`OFUNC_BASE + 12'h000) && addr_q < (`OFUNC_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_ofunc_004 = (addr_q >= (`OFUNC_BASE + 12'h004) && addr_q < (`OFUNC_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_ofunc_008 = (addr_q >= (`OFUNC_BASE + 12'h008) && addr_q < (`OFUNC_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_ofunc_00C = (addr_q >= (`OFUNC_BASE + 12'h00C) && addr_q < (`OFUNC_BASE + 12'h010)) ? 1'b1 : 1'b0;


wire sel_oinfo_000;          
wire sel_oinfo_004;
wire sel_oinfo_008;
wire sel_oinfo_00C;
wire sel_oinfo_010;           

assign sel_oinfo_000 = (addr_q >= (`OINFO_BASE + 12'h000) && addr_q < (`OINFO_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_oinfo_004 = (addr_q >= (`OINFO_BASE + 12'h004) && addr_q < (`OINFO_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_oinfo_008 = (addr_q >= (`OINFO_BASE + 12'h008) && addr_q < (`OINFO_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_oinfo_00C = (addr_q >= (`OINFO_BASE + 12'h00C) && addr_q < (`OINFO_BASE + 12'h010)) ? 1'b1 : 1'b0;
assign sel_oinfo_010 = (addr_q >= (`OINFO_BASE + 12'h010) && addr_q < (`OINFO_BASE + 12'h014)) ? 1'b1 : 1'b0;


wire sel_octrl00_000;          
wire sel_octrl00_004;
wire sel_octrl00_008;
wire sel_octrl00_00C;
wire sel_octrl00_010;          
wire sel_octrl00_014;
wire sel_octrl00_018;
wire sel_octrl00_01C;
       
assign sel_octrl00_000 = (addr_q >= (`OCTRL00_BASE + 12'h000) && addr_q < (`OCTRL00_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_octrl00_004 = (addr_q >= (`OCTRL00_BASE + 12'h004) && addr_q < (`OCTRL00_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_octrl00_008 = (addr_q >= (`OCTRL00_BASE + 12'h008) && addr_q < (`OCTRL00_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_octrl00_00C = (addr_q >= (`OCTRL00_BASE + 12'h00C) && addr_q < (`OCTRL00_BASE + 12'h010)) ? 1'b1 : 1'b0;
assign sel_octrl00_010 = (addr_q >= (`OCTRL00_BASE + 12'h010) && addr_q < (`OCTRL00_BASE + 12'h014)) ? 1'b1 : 1'b0;
assign sel_octrl00_014 = (addr_q >= (`OCTRL00_BASE + 12'h014) && addr_q < (`OCTRL00_BASE + 12'h018)) ? 1'b1 : 1'b0;
assign sel_octrl00_018 = (addr_q >= (`OCTRL00_BASE + 12'h018) && addr_q < (`OCTRL00_BASE + 12'h01C)) ? 1'b1 : 1'b0;
assign sel_octrl00_01C = (addr_q >= (`OCTRL00_BASE + 12'h01C) && addr_q < (`OCTRL00_BASE + 12'h020)) ? 1'b1 : 1'b0;

`ifdef ADD_AFU_CTRL01 
wire sel_octrl01_000;          
wire sel_octrl01_004;
wire sel_octrl01_008;
wire sel_octrl01_00C;
wire sel_octrl01_010;          
wire sel_octrl01_014;
wire sel_octrl01_018;
wire sel_octrl01_01C;
       
assign sel_octrl01_000 = (addr_q >= (`OCTRL01_BASE + 12'h000) && addr_q < (`OCTRL01_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_octrl01_004 = (addr_q >= (`OCTRL01_BASE + 12'h004) && addr_q < (`OCTRL01_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_octrl01_008 = (addr_q >= (`OCTRL01_BASE + 12'h008) && addr_q < (`OCTRL01_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_octrl01_00C = (addr_q >= (`OCTRL01_BASE + 12'h00C) && addr_q < (`OCTRL01_BASE + 12'h010)) ? 1'b1 : 1'b0;
assign sel_octrl01_010 = (addr_q >= (`OCTRL01_BASE + 12'h010) && addr_q < (`OCTRL01_BASE + 12'h014)) ? 1'b1 : 1'b0;
assign sel_octrl01_014 = (addr_q >= (`OCTRL01_BASE + 12'h014) && addr_q < (`OCTRL01_BASE + 12'h018)) ? 1'b1 : 1'b0;
assign sel_octrl01_018 = (addr_q >= (`OCTRL01_BASE + 12'h018) && addr_q < (`OCTRL01_BASE + 12'h01C)) ? 1'b1 : 1'b0;
assign sel_octrl01_01C = (addr_q >= (`OCTRL01_BASE + 12'h01C) && addr_q < (`OCTRL01_BASE + 12'h020)) ? 1'b1 : 1'b0;
`endif

`ifdef ADD_AFU_CTRL02 
wire sel_octrl02_000;          
wire sel_octrl02_004;
wire sel_octrl02_008;
wire sel_octrl02_00C;
wire sel_octrl02_010;          
wire sel_octrl02_014;
wire sel_octrl02_018;
wire sel_octrl02_01C;
       
assign sel_octrl02_000 = (addr_q >= (`OCTRL02_BASE + 12'h000) && addr_q < (`OCTRL02_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_octrl02_004 = (addr_q >= (`OCTRL02_BASE + 12'h004) && addr_q < (`OCTRL02_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_octrl02_008 = (addr_q >= (`OCTRL02_BASE + 12'h008) && addr_q < (`OCTRL02_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_octrl02_00C = (addr_q >= (`OCTRL02_BASE + 12'h00C) && addr_q < (`OCTRL02_BASE + 12'h010)) ? 1'b1 : 1'b0;
assign sel_octrl02_010 = (addr_q >= (`OCTRL02_BASE + 12'h010) && addr_q < (`OCTRL02_BASE + 12'h014)) ? 1'b1 : 1'b0;
assign sel_octrl02_014 = (addr_q >= (`OCTRL02_BASE + 12'h014) && addr_q < (`OCTRL02_BASE + 12'h018)) ? 1'b1 : 1'b0;
assign sel_octrl02_018 = (addr_q >= (`OCTRL02_BASE + 12'h018) && addr_q < (`OCTRL02_BASE + 12'h01C)) ? 1'b1 : 1'b0;
assign sel_octrl02_01C = (addr_q >= (`OCTRL02_BASE + 12'h01C) && addr_q < (`OCTRL02_BASE + 12'h020)) ? 1'b1 : 1'b0;
`endif

`ifdef ADD_AFU_CTRL03
wire sel_octrl03_000;          
wire sel_octrl03_004;
wire sel_octrl03_008;
wire sel_octrl03_00C;
wire sel_octrl03_010;          
wire sel_octrl03_014;
wire sel_octrl03_018;
wire sel_octrl03_01C;
       
assign sel_octrl03_000 = (addr_q >= (`OCTRL03_BASE + 12'h000) && addr_q < (`OCTRL03_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_octrl03_004 = (addr_q >= (`OCTRL03_BASE + 12'h004) && addr_q < (`OCTRL03_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_octrl03_008 = (addr_q >= (`OCTRL03_BASE + 12'h008) && addr_q < (`OCTRL03_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_octrl03_00C = (addr_q >= (`OCTRL03_BASE + 12'h00C) && addr_q < (`OCTRL03_BASE + 12'h010)) ? 1'b1 : 1'b0;
assign sel_octrl03_010 = (addr_q >= (`OCTRL03_BASE + 12'h010) && addr_q < (`OCTRL03_BASE + 12'h014)) ? 1'b1 : 1'b0;
assign sel_octrl03_014 = (addr_q >= (`OCTRL03_BASE + 12'h014) && addr_q < (`OCTRL03_BASE + 12'h018)) ? 1'b1 : 1'b0;
assign sel_octrl03_018 = (addr_q >= (`OCTRL03_BASE + 12'h018) && addr_q < (`OCTRL03_BASE + 12'h01C)) ? 1'b1 : 1'b0;
assign sel_octrl03_01C = (addr_q >= (`OCTRL03_BASE + 12'h01C) && addr_q < (`OCTRL03_BASE + 12'h020)) ? 1'b1 : 1'b0;
`endif


wire sel_ovsec_000;          
wire sel_ovsec_004;
wire sel_ovsec_008;

assign sel_ovsec_000 = (addr_q >= (`OVSEC1_BASE + 12'h000) && addr_q < (`OVSEC1_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_ovsec_004 = (addr_q >= (`OVSEC1_BASE + 12'h004) && addr_q < (`OVSEC1_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_ovsec_008 = (addr_q >= (`OVSEC1_BASE + 12'h008) && addr_q < (`OVSEC1_BASE + 12'h00C)) ? 1'b1 : 1'b0;


// Check for the condition 'access to un-implemented address in architected range'.
// Latch it before sending it out of the module to align to interface timing.
// Note: 'reserved' address are considered to be implemented, so are not part of this range check. 
//       Writes to reserved locations should have no effect, but not flagged as an error.
//       Reads from them should be completed like any other read (with valid, no errors), but return all 0s as data.
// Note: 'not_implemented' signals are AND'd at the next level where multiple Functions exist. AND is used to ensure
//       all Functions say they don't contain the target before treating the overall operation as a failure.
//       This means each Functions which aren't being targeted need to respond with 'not_implemented', so the check
//       contains both individual register address ranges but also that the Function number requested matches this Function.
wire   sel_addr_not_implemented;
assign sel_addr_not_implemented = ( ( (addr_q >= {4'b0,`CSH_BASE}       && addr_q <= {4'b0,`CSH_LAST}   ) ||  
//                                    (addr_q >= `VPD_BASE              && addr_q <= `VPD_LAST          ) ||
//                                    (addr_q >= `DSN_BASE              && addr_q <= `DSN_LAST          ) ||
                                      (addr_q >= `PASID_BASE            && addr_q <= `PASID_LAST        ) ||
//                                    (addr_q >= `OTL_BASE              && addr_q <= `OTL_LAST          ) ||
                                      (addr_q >= `OFUNC_BASE            && addr_q <= `OFUNC_LAST        ) ||
                                      (addr_q >= `OINFO_BASE            && addr_q <= `OINFO_LAST        ) ||
                                      (addr_q >= `OCTRL00_BASE          && addr_q <= `OCTRL00_LAST      ) ||
`ifdef ADD_AFU_CTRL01
                                      (addr_q >= `OCTRL01_BASE          && addr_q <= `OCTRL01_LAST      ) ||
`endif
`ifdef ADD_AFU_CTRL02
                                      (addr_q >= `OCTRL02_BASE          && addr_q <= `OCTRL02_LAST      ) ||
`endif
`ifdef ADD_AFU_CTRL03
                                      (addr_q >= `OCTRL03_BASE          && addr_q <= `OCTRL03_LAST      ) ||
`endif
                                      (addr_q >= `OVSEC1_BASE           && addr_q <= `OVSEC1_LAST       ) 
                                    ) && (function_q == cfg_ro_function) 
                                  ) ? 1'b0 : 1'b1;   // Check is for implemented range, invert assignment values to make 'not implemented'

reg addr_not_implemented_q;

always @(posedge(clock))
  addr_not_implemented_q <= sel_addr_not_implemented;  // Because 'sel' signal is calculated each cycle, the error register should self clear.

assign cfg_addr_not_implemented = addr_not_implemented_q; 


// ----------------------------------
// Implement configuration registers 
//
// Note: Put 0's on read data when register is not selected so ultimate output can just be an OR gate.
// ----------------------------------

// During simulation, it may be wasteful of cycles to always run the same configuration commands to write  
// configuration registers with the correct value needed for the test. As a shortcut, each AFU designer or
// verification person is allowed to override the default 'init' signal values to have them be the post-
// configuration values. Some testing MUST be done using the real configuration command sequence, but
// in most tests initializing the registers to their final state after 'reset' will be more efficient.
// To enable this, the declaration and assignment of initial values for registers is broken out to 
// a different file so someone can easily subsitute their post-configuration version for the default.
// Include those declarations and initial value assignments here, before working with any register.

`include "cfg_func1_init.v" 

// ..............................................
// @@@ CSH
// ..............................................

wire [31:0] reg_csh_000_q;
reg  [31:0] reg_csh_004_q;
wire [31:0] reg_csh_008_q;  
wire [31:0] reg_csh_00C_q;    
reg  [31:0] reg_csh_010_q;    
reg  [31:0] reg_csh_014_q;
reg  [31:0] reg_csh_018_q;
reg  [31:0] reg_csh_01C_q;
reg  [31:0] reg_csh_020_q;   
reg  [31:0] reg_csh_024_q;
wire [31:0] reg_csh_028_q;
wire [31:0] reg_csh_02C_q; 
reg  [31:0] reg_csh_030_q;   
wire [31:0] reg_csh_034_q;
wire [31:0] reg_csh_038_q;
wire [31:0] reg_csh_03C_q;

wire [31:0] reg_csh_000_rdata;  
wire [31:0] reg_csh_004_rdata;
wire [31:0] reg_csh_008_rdata;
wire [31:0] reg_csh_00C_rdata;
wire [31:0] reg_csh_010_rdata;
wire [31:0] reg_csh_014_rdata;
wire [31:0] reg_csh_018_rdata;
wire [31:0] reg_csh_01C_rdata;
wire [31:0] reg_csh_020_rdata;
wire [31:0] reg_csh_024_rdata;
wire [31:0] reg_csh_028_rdata;
wire [31:0] reg_csh_02C_rdata; 
wire [31:0] reg_csh_030_rdata;
wire [31:0] reg_csh_034_rdata;
wire [31:0] reg_csh_038_rdata;
wire [31:0] reg_csh_03C_rdata;


// Because the entire register is assigned a constant value, using 'always @*' will never wake up so use 'assign' instead.
assign reg_csh_000_q[31:16] = cfg_ro_csh_device_id;      
assign reg_csh_000_q[15: 0] = cfg_ro_csh_vendor_id;   
assign reg_csh_000_rdata = (sel_csh_000 == 1'b1 && do_read == 1'b1) ? reg_csh_000_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_004_q <= reg_csh_004_init;     // Load initial value during reset
    else if (sel_csh_004 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_csh_004_q[31:21] <= 11'b0;
        reg_csh_004_q[   20] <= 1'b1;
        reg_csh_004_q[19: 2] <= 18'b0;
        reg_csh_004_q[    1] <= (wr_be[0] == 1'b1) ? wdata_q[    1] : reg_csh_004_q[    1];
        reg_csh_004_q[    0] <= 1'b0;
      end
    else                 reg_csh_004_q <= reg_csh_004_q;        // Hold value when register is not selected
  end
assign reg_csh_004_rdata = (sel_csh_004 == 1'b1 && do_read == 1'b1) ? reg_csh_004_q : 32'h00000000;


assign reg_csh_008_q[31: 8] = cfg_ro_csh_class_code;    
assign reg_csh_008_q[ 7: 0] = cfg_ro_csh_revision_id;     
assign reg_csh_008_rdata = (sel_csh_008 == 1'b1 && do_read == 1'b1) ? reg_csh_008_q : 32'h00000000;


assign reg_csh_00C_q[31:24] = 8'h00;   
assign reg_csh_00C_q[23   ] = cfg_ro_csh_multi_function;
assign reg_csh_00C_q[22: 0] = 23'b0;
assign reg_csh_00C_rdata = (sel_csh_00C == 1'b1 && do_read == 1'b1) ? reg_csh_00C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_010_q <= reg_csh_010_init;   // Load initial value during reset
    else if (sel_csh_010 == 1'b1)                               // If selected, write any byte that is active
      begin
        // 'AND' write data with MMIO size configured by user
        // Config software will write all 1s, then read back reg. Bits 0'd out tell software the size of the MMIO space.
        reg_csh_010_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_mmio_bar0_size[31:24]) : reg_csh_010_q[31:24];
        reg_csh_010_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_mmio_bar0_size[23:16]) : reg_csh_010_q[23:16];
        reg_csh_010_q[15: 8] <= (wr_be[1] == 1'b1) ? (wdata_q[15: 8] & cfg_ro_csh_mmio_bar0_size[15:08]) : reg_csh_010_q[15: 8];
        reg_csh_010_q[ 7: 4] <= (wr_be[0] == 1'b1) ? (wdata_q[ 7: 4] & cfg_ro_csh_mmio_bar0_size[ 7: 4]) : reg_csh_010_q[ 7: 4];
        reg_csh_010_q[    3] <= cfg_ro_csh_mmio_bar0_prefetchable;
        reg_csh_010_q[ 2: 1] <= 2'b10;
        reg_csh_010_q[    0] <= 1'b0;
      end
    else                 reg_csh_010_q <= reg_csh_010_q;      // Hold value when register is not selected
  end
assign reg_csh_010_rdata = (sel_csh_010 == 1'b1 && do_read == 1'b1) ? reg_csh_010_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_014_q <= reg_csh_014_init;   // Load initial value during reset
    else if (sel_csh_014 == 1'b1)                               // If selected, write any byte that is active
      begin
        // 'AND' write data with MMIO size configured by user
        // Config software will write all 1s, then read back reg. Bits 0'd out tell software the size of the MMIO space.
        reg_csh_014_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_mmio_bar0_size[63:56]) : reg_csh_014_q[31:24];
        reg_csh_014_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_mmio_bar0_size[55:48]) : reg_csh_014_q[23:16];
        reg_csh_014_q[15: 8] <= (wr_be[1] == 1'b1) ? (wdata_q[15: 8] & cfg_ro_csh_mmio_bar0_size[47:40]) : reg_csh_014_q[15: 8];
        reg_csh_014_q[ 7: 0] <= (wr_be[0] == 1'b1) ? (wdata_q[ 7: 0] & cfg_ro_csh_mmio_bar0_size[39:32]) : reg_csh_014_q[ 7: 0];
      end
    else                 reg_csh_014_q <= reg_csh_014_q;      // Hold value when register is not selected
  end
assign reg_csh_014_rdata = (sel_csh_014 == 1'b1 && do_read == 1'b1) ? reg_csh_014_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_018_q <= reg_csh_018_init;   // Load initial value during reset
    else if (sel_csh_018 == 1'b1)                               // If selected, write any byte that is active
      begin
        // 'AND' write data with MMIO size configured by user
        // Config software will write all 1s, then read back reg. Bits 0'd out tell software the size of the MMIO space.
        reg_csh_018_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_mmio_bar1_size[31:24]) : reg_csh_018_q[31:24];
        reg_csh_018_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_mmio_bar1_size[23:16]) : reg_csh_018_q[23:16];
        reg_csh_018_q[15: 8] <= (wr_be[1] == 1'b1) ? (wdata_q[15: 8] & cfg_ro_csh_mmio_bar1_size[15:08]) : reg_csh_018_q[15: 8];
        reg_csh_018_q[ 7: 4] <= (wr_be[0] == 1'b1) ? (wdata_q[ 7: 4] & cfg_ro_csh_mmio_bar1_size[ 7: 4]) : reg_csh_018_q[ 7: 4];
        reg_csh_018_q[    3] <= cfg_ro_csh_mmio_bar1_prefetchable;
        reg_csh_018_q[ 2: 1] <= 2'b10;
        reg_csh_018_q[    0] <= 1'b0;
      end
    else                 reg_csh_018_q <= reg_csh_018_q;      // Hold value when register is not selected
  end
assign reg_csh_018_rdata = (sel_csh_018 == 1'b1 && do_read == 1'b1) ? reg_csh_018_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_01C_q <= reg_csh_01C_init;   // Load initial value during reset
    else if (sel_csh_01C == 1'b1)                               // If selected, write any byte that is active
      begin
        // 'AND' write data with MMIO size configured by user
        // Config software will write all 1s, then read back reg. Bits 0'd out tell software the size of the MMIO space.
        reg_csh_01C_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_mmio_bar1_size[63:56]) : reg_csh_01C_q[31:24];
        reg_csh_01C_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_mmio_bar1_size[55:48]) : reg_csh_01C_q[23:16];
        reg_csh_01C_q[15: 8] <= (wr_be[1] == 1'b1) ? (wdata_q[15: 8] & cfg_ro_csh_mmio_bar1_size[47:40]) : reg_csh_01C_q[15: 8];
        reg_csh_01C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? (wdata_q[ 7: 0] & cfg_ro_csh_mmio_bar1_size[39:32]) : reg_csh_01C_q[ 7: 0];
      end
    else                 reg_csh_01C_q <= reg_csh_01C_q;      // Hold value when register is not selected
  end
assign reg_csh_01C_rdata = (sel_csh_01C == 1'b1 && do_read == 1'b1) ? reg_csh_01C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_020_q <= reg_csh_020_init;   // Load initial value during reset
    else if (sel_csh_020 == 1'b1)                               // If selected, write any byte that is active
      begin
        // 'AND' write data with MMIO size configured by user
        // Config software will write all 1s, then read back reg. Bits 0'd out tell software the size of the MMIO space.
        reg_csh_020_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_mmio_bar2_size[31:24]) : reg_csh_020_q[31:24];
        reg_csh_020_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_mmio_bar2_size[23:16]) : reg_csh_020_q[23:16];
        reg_csh_020_q[15: 8] <= (wr_be[1] == 1'b1) ? (wdata_q[15: 8] & cfg_ro_csh_mmio_bar2_size[15:08]) : reg_csh_020_q[15: 8];
        reg_csh_020_q[ 7: 4] <= (wr_be[0] == 1'b1) ? (wdata_q[ 7: 4] & cfg_ro_csh_mmio_bar2_size[ 7: 4]) : reg_csh_020_q[ 7: 4];
        reg_csh_020_q[    3] <= cfg_ro_csh_mmio_bar2_prefetchable;
        reg_csh_020_q[ 2: 1] <= 2'b10;
        reg_csh_020_q[    0] <= 1'b0;
      end
    else                 reg_csh_020_q <= reg_csh_020_q;      // Hold value when register is not selected
  end
assign reg_csh_020_rdata = (sel_csh_020 == 1'b1 && do_read == 1'b1) ? reg_csh_020_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_024_q <= reg_csh_024_init;   // Load initial value during reset
    else if (sel_csh_024 == 1'b1)                               // If selected, write any byte that is active
      begin
        // 'AND' write data with MMIO size configured by user
        // Config software will write all 1s, then read back reg. Bits 0'd out tell software the size of the MMIO space.
        reg_csh_024_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_mmio_bar2_size[63:56]) : reg_csh_024_q[31:24];
        reg_csh_024_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_mmio_bar2_size[55:48]) : reg_csh_024_q[23:16];
        reg_csh_024_q[15: 8] <= (wr_be[1] == 1'b1) ? (wdata_q[15: 8] & cfg_ro_csh_mmio_bar2_size[47:40]) : reg_csh_024_q[15: 8];
        reg_csh_024_q[ 7: 0] <= (wr_be[0] == 1'b1) ? (wdata_q[ 7: 0] & cfg_ro_csh_mmio_bar2_size[39:32]) : reg_csh_024_q[ 7: 0];
      end
    else                 reg_csh_024_q <= reg_csh_024_q;      // Hold value when register is not selected
  end
assign reg_csh_024_rdata = (sel_csh_024 == 1'b1 && do_read == 1'b1) ? reg_csh_024_q : 32'h00000000;


assign reg_csh_028_q[31: 0] = 32'h0000_0000;    
assign reg_csh_028_rdata = (sel_csh_028 == 1'b1 && do_read == 1'b1) ? reg_csh_028_q : 32'h00000000;


assign reg_csh_02C_q[31:16] = cfg_ro_csh_subsystem_id;    
assign reg_csh_02C_q[15: 0] = cfg_ro_csh_subsystem_vendor_id;     
assign reg_csh_02C_rdata = (sel_csh_02C == 1'b1 && do_read == 1'b1) ? reg_csh_02C_q : 32'h00000000;


// The Expansion ROM register has unique requirements on it. These date back to the original days of PCI where multiple
// devices shared the same address space. The intent of use is to allow software to read parts of its boot code from a
// device's ROM area, then use this ROM code to boot other parts of the device. Once initialized, software disables the
// Expansion ROM so the device now treats the address range as Read/Write memory. Some OpenCAPI applications may need
// this capability so it is part of the configuration architecture.
// To use the Expansion ROM, software writes all 1's to the register and reads it back. If the 'enable' bit comes back 0,
// or if all the BAR bits come back 0, software knows the ROM is not implemented. If enable comes back 1 and some BAR
// bits are non-zero, software can read and execute the contents of the ROM.
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_csh_030_q <= { reg_csh_030_init[31:1], 1'b0 };  // Bit [0] must start at 0 regardless of enable value
    else if (sel_csh_030 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_csh_030_q[31:24] <= (wr_be[3] == 1'b1) ? (wdata_q[31:24] & cfg_ro_csh_expansion_rom_bar[31:24]) : reg_csh_030_q[31:24];
        reg_csh_030_q[23:16] <= (wr_be[2] == 1'b1) ? (wdata_q[23:16] & cfg_ro_csh_expansion_rom_bar[23:16]) : reg_csh_030_q[23:16];
        reg_csh_030_q[15:11] <= (wr_be[1] == 1'b1) ? (wdata_q[15:11] & cfg_ro_csh_expansion_rom_bar[15:11]) : reg_csh_030_q[15:11];
        reg_csh_030_q[10: 1] <= 10'b0;
        reg_csh_030_q[    0] <= (wr_be[0] == 1'b1) ? wdata_q[0] : reg_csh_030_q[0];  // If ROM exists, let software control its use
      end
    else                 reg_csh_030_q <= reg_csh_030_q;      // Hold value when register is not selected
  end
assign reg_csh_030_rdata = (sel_csh_030 == 1'b1 && do_read == 1'b1) ? reg_csh_030_q : 32'h00000000;


assign reg_csh_034_q[31: 8] = 24'h0000_00;    
assign reg_csh_034_q[ 7: 0] = 8'h00;        // No Capabilities list
assign reg_csh_034_rdata = (sel_csh_034 == 1'b1 && do_read == 1'b1) ? reg_csh_034_q : 32'h00000000;


assign reg_csh_038_q[31: 0] = 32'h0000_0000;      
assign reg_csh_038_rdata = (sel_csh_038 == 1'b1 && do_read == 1'b1) ? reg_csh_038_q : 32'h00000000;


assign reg_csh_03C_q[31: 0] = 32'h0000_0000;   
assign reg_csh_03C_rdata = (sel_csh_03C == 1'b1 && do_read == 1'b1) ? reg_csh_03C_q : 32'h00000000;


// ..............................................
// @@@ VPD
// ..............................................

// Place holder for future changes.


// ..............................................
// @@@ DSN
// ..............................................

// Place holder for future changes.


// ..............................................
// @@@ PASID
// ..............................................

wire [31:0] reg_pasid_000_q;
wire [31:0] reg_pasid_004_q;

wire [31:0] reg_pasid_000_rdata;
wire [31:0] reg_pasid_004_rdata;



assign reg_pasid_000_q[31:0] = {`OFUNC_BASE, 4'h1, 16'h001B};  
assign reg_pasid_000_rdata = (sel_pasid_000 == 1'b1 && do_read == 1'b1) ? reg_pasid_000_q : 32'h00000000;


assign reg_pasid_004_q[31:16] = 16'h0000;
assign reg_pasid_004_q[15:13] = 3'b000;
assign reg_pasid_004_q[12: 8] = cfg_ro_pasid_max_pasid_width;
assign reg_pasid_004_q[ 7: 0] = 8'h00;
assign reg_pasid_004_rdata = (sel_pasid_004 == 1'b1 && do_read == 1'b1) ? reg_pasid_004_q : 32'h00000000;


// ..............................................
// @@@ OTL
// ..............................................

// Place holder for future changes.


// ..............................................
// @@@ OFUNC
// ..............................................


wire [31:0] reg_ofunc_000_q;   
wire [31:0] reg_ofunc_004_q;   
reg  [31:0] reg_ofunc_008_q;
reg  [31:0] reg_ofunc_00C_q;

wire [31:0] reg_ofunc_000_rdata; 
wire [31:0] reg_ofunc_004_rdata; 
wire [31:0] reg_ofunc_008_rdata;
wire [31:0] reg_ofunc_00C_rdata;


assign reg_ofunc_000_q[31:20] = `OINFO_BASE;   
assign reg_ofunc_000_q[19:16] = 4'h1;     
assign reg_ofunc_000_q[15: 0] = 16'h0023;
assign reg_ofunc_000_rdata = (sel_ofunc_000 == 1'b1 && do_read == 1'b1) ? reg_ofunc_000_q : 32'h00000000;


assign reg_ofunc_004_q[31:20] = 12'h010;       
assign reg_ofunc_004_q[19:16] = 4'h0;     
assign reg_ofunc_004_q[15: 0] = 16'h1014;      
assign reg_ofunc_004_rdata = (sel_ofunc_004 == 1'b1 && do_read == 1'b1) ? reg_ofunc_004_q : 32'h00000000;


wire reg_ofunc_function_reset_active;
always @(posedge(clock))
  begin
    if (device_reset == 1'b1) reg_ofunc_008_q <= reg_ofunc_008_init;    // Load initial value during 'device_reset' (reg is not self-reset)
    else if (sel_ofunc_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_ofunc_008_q[   31] <= cfg_ro_ofunc_afu_present;
        reg_ofunc_008_q[   30] <= 1'b0;
        reg_ofunc_008_q[29:24] <= cfg_ro_ofunc_max_afu_index;    
        reg_ofunc_008_q[   23] <= reg_ofunc_function_reset_active;  // Hardware will clear this to 0 after it is set
        reg_ofunc_008_q[22:16] <= 7'b000_0000;
        reg_ofunc_008_q[15: 0] <= 16'hF001;
      end
    else
      begin
        reg_ofunc_008_q[31:24] <= reg_ofunc_008_q[31:24];           // Hold value when register is not selected
        reg_ofunc_008_q[23]    <= reg_ofunc_function_reset_active;  // But allow active input to be reflected all the time
        reg_ofunc_008_q[22: 0] <= reg_ofunc_008_q[22: 0];
      end
  end
assign reg_ofunc_008_rdata = (sel_ofunc_008 == 1'b1 && do_read == 1'b1) ? reg_ofunc_008_q : 32'h00000000;


// Logic to manage 'Function Reset'   
reg  [7:0] reg_ofunc_function_reset_timer_q;
always @(posedge(clock))
  // Since bit reset's the Function itself, we can't use the Function's 'reset' input to clear the timer. If we did, the timer would
  // clear itself immediately and the reset duration would be 1 clock cycle. This may be too short for the Function logic and/or
  // the AFU's contained inside the Function, so we need to execute the timer without relying on the input 'reset' signal.
  // Instead clear the timer at the initial power on reset, which should be the 'device_reset' without any Function reset factored in.
  // Including 'timer > 0' as a condition of running the timer means once the timer starts, it will continue to the desired value
  // even if the CFG_SEQ inputs setting the Function Reset bit go away.
  if (device_reset == 1'b1)                                                           // When entire Device is reset, initialized timer. 
    reg_ofunc_function_reset_timer_q <= 8'h00;                                        
  else if ( (sel_ofunc_008 == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[23] == 1'b1)) ||   // When software initiates Function reset
             reg_ofunc_function_reset_timer_q != 8'h00 )                              // OR timer is counting, 
    begin    
      if (cfg_ro_ofunc_reset_duration != 8'h00 && reg_ofunc_function_reset_timer_q != cfg_ro_ofunc_reset_duration)  // Timer max = duration
        reg_ofunc_function_reset_timer_q <= reg_ofunc_function_reset_timer_q + 8'h01; 
      else if (cfg_ro_ofunc_reset_duration == 8'h00 && reg_ofunc_function_reset_timer_q != 8'hFF)                   // Timer max = rollover
        reg_ofunc_function_reset_timer_q <= reg_ofunc_function_reset_timer_q + 8'h01; 
      else                                                                            // When the limit is reached, clear the timer.
        reg_ofunc_function_reset_timer_q <= 8'h00;
    end
  else                                                                                // Clear timer when no Function reset is active.
    reg_ofunc_function_reset_timer_q <= 8'h00;                                    
assign reg_ofunc_function_reset_active = (reg_ofunc_function_reset_timer_q != 8'h00) ? 1'b1 : 1'b0;  // Function reset is active while timer is counting



always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_ofunc_00C_q <= reg_ofunc_00C_init;    // Load initial value during reset
    else if (sel_ofunc_00C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_ofunc_00C_q[31:28] <= 4'b0000;
        reg_ofunc_00C_q[27:24] <= (wr_be[3] == 1'b1) ? wdata_q[27:24] : reg_ofunc_00C_q[27:24];
        reg_ofunc_00C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_ofunc_00C_q[23:16];
        reg_ofunc_00C_q[15:12] <= 4'b0000;
        reg_ofunc_00C_q[11: 8] <= (wr_be[1] == 1'b1) ? wdata_q[11: 8] : reg_ofunc_00C_q[11: 8];
        reg_ofunc_00C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_ofunc_00C_q[ 7: 0];
      end
    else                 reg_ofunc_00C_q <= reg_ofunc_00C_q;       // Hold value when register is not selected
  end
assign reg_ofunc_00C_rdata = (sel_ofunc_00C == 1'b1 && do_read == 1'b1) ? reg_ofunc_00C_q : 32'h00000000;



// ..............................................
// @@@ OINFO
// ..............................................


wire [31:0] reg_oinfo_000_q;   
wire [31:0] reg_oinfo_004_q;   
reg  [31:0] reg_oinfo_008_q;
reg  [31:0] reg_oinfo_00C_q;
reg  [31:0] reg_oinfo_010_q;

wire [31:0] reg_oinfo_000_rdata; 
wire [31:0] reg_oinfo_004_rdata; 
wire [31:0] reg_oinfo_008_rdata;  
wire [31:0] reg_oinfo_00C_rdata; 
wire [31:0] reg_oinfo_010_rdata;


assign reg_oinfo_000_q[31:20] = `OCTRL00_BASE;   
assign reg_oinfo_000_q[19:16] = 4'h1;     
assign reg_oinfo_000_q[15: 0] = 16'h0023;
assign reg_oinfo_000_rdata = (sel_oinfo_000 == 1'b1 && do_read == 1'b1) ? reg_oinfo_000_q : 32'h00000000;


assign reg_oinfo_004_q[31:20] = 12'h014;       
assign reg_oinfo_004_q[19:16] = 4'h0;     
assign reg_oinfo_004_q[15: 0] = 16'h1014;      
assign reg_oinfo_004_rdata = (sel_oinfo_004 == 1'b1 && do_read == 1'b1) ? reg_oinfo_004_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_oinfo_008_q <= reg_oinfo_008_init;    // Load initial value during reset
    else if (sel_oinfo_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_oinfo_008_q[31:22] <= { 8'h00, 2'b00 };
        reg_oinfo_008_q[21:16] <= (wr_be[2] == 1'b1) ? wdata_q[21:16] : reg_oinfo_008_q[21:16];   
        reg_oinfo_008_q[15: 0] <= 16'hF003; 
      end
    else                 reg_oinfo_008_q <= reg_oinfo_008_q;       // Hold value when register is not selected
  end
assign reg_oinfo_008_rdata = (sel_oinfo_008 == 1'b1 && do_read == 1'b1) ? reg_oinfo_008_q : 32'h00000000;


reg reg_oinfo_cmd_valid_q;
reg reg_oinfo_data_valid_q;
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_oinfo_00C_q <= reg_oinfo_00C_init;    // Load initial value during reset
    else if (sel_oinfo_00C == 1'b1)                                // If selected, write any byte that is active
      begin
        // Software writes 'Data Valid' to 0 to initiate a command. Hardware sets it to 1 when the desired value is retrived.
        // An assumption made here is the look up may take a few cycles longer than the config_write command that started the
        // operation, but it will complete before the config_write is over or before the next config_write can take place.
        // If config_write's are non-pipelined, or if software ensures an interlock of initiate command, poll on data valid,
        // retrieve data, this assumption should be met. 
        reg_oinfo_00C_q[   31] <= reg_oinfo_data_valid_q;      // Bit is auto-updated by hardware 
        reg_oinfo_00C_q[30:24] <= (wr_be[3] == 1'b1) ? wdata_q[30:24] : reg_oinfo_00C_q[30:24]; 
        reg_oinfo_00C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_oinfo_00C_q[23:16];
        reg_oinfo_00C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_oinfo_00C_q[15: 8];
        reg_oinfo_00C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_oinfo_00C_q[ 7: 0];   
      end
    else
      begin
        reg_oinfo_00C_q[   31] <= reg_oinfo_data_valid_q;      // To enable auto-hardware update, always capture 'Data Valid' bit
        reg_oinfo_00C_q[30: 0] <= reg_oinfo_00C_q[30:0];       // Hold remaining part of register when not selected
      end
  end
assign reg_oinfo_00C_rdata = (sel_oinfo_00C == 1'b1 && do_read == 1'b1) ? reg_oinfo_00C_q : 32'h00000000;

reg  [31:0] reg_oinfo_data_q;
always @(posedge(clock))                                       // Register is READ ONLY so do not include logic to allow it to be loaded by software
  reg_oinfo_010_q <= reg_oinfo_data_q;                         // Register 'Data' to align with 'Data Valid' that is latched in offset 0C0
assign reg_oinfo_010_rdata = (sel_oinfo_010 == 1'b1 && do_read == 1'b1) ? reg_oinfo_010_q : 32'h00000000;


// AFU Descriptor Table interface control logic
// 
// Operation:
// The descriptor table echos 'cmd_valid' back as 'echo_cmd_valid' after inserting a few cycles of delay. 
// The number of delay cycles is tuned so 'echo_cmd_valid' and 'data_valid' are changed to in the same cycle 
// the retrieved register contents are present on the data bus. The distinction is 'echo_cmd_valid' = 1
// means the descriptor table has completed the read request. If 'data_valid' = 1, it means the targeted
// register existed and 'data' reflects its contents. If 'data_valid' = 0, it means no register was found
// that matched the 'afu_index' and 'offset', so 'data' is an artifact and not the intended response.
//
// Normally one would expect software to care whether 'data' was valid or not. However in PCI Express,
// table walk functions expect to see all 0s or all 1s on 'data' when it targets an unimplemented register.
// According to (Brian Bakke 3/30/17), the walk table software will eventually figure out that it isn't
// reading the expected template header when it sees 0s or 1s, so knows an invalid read occurred. 
// Thus in the interface, 'data_valid' has no real meaning. However it was included in the config_space
// to descriptor interface in case this ever changes later.
//
// If this logic sets 'cmd_valid' to 0 when not in use, 'echo_cmd_valid' will also be 0 when a new command
// arrives. So to control the 'Data Valid' register bit, use a special register bit.
// The special register is initialized to 0, to indicate data is not valid until after the first 
// descriptor table read is performed. When receiving the read cmd, the register is set to 0. 
// It remains 0 until 'echo_cmd_valid' from the descriptor logic is 1, and at this point set the special
// reg to 1. While 'cmd_valid' returns to 0 (after detecting 'echo_cmd_valid' = 1), keep the special reg
// at 1 until the next read command is received. This allows software to retrieve the returned value
// anytime it wishes before the next read command is issued. When receiving the next read cmd, set
// the special reg to 0 and await the arrival of 'echo_cmd_valid' = 1.

always @(posedge(clock))
  if (reset_q == 1'b1) 
    reg_oinfo_cmd_valid_q <= 1'b0;                    // Put command control signal into inactive state
  else if (sel_oinfo_00C == 1'b1 && (wr_be[3] == 1'b1 && wdata_q[31] == 1'b0))
    reg_oinfo_cmd_valid_q <= 1'b1;                    // Initiate cmd_valid when write 'Data Valid' bit to 0
  else if (desc_cfg_echo_cmd_valid == 1'b1) 
    reg_oinfo_cmd_valid_q <= 1'b0;                    // Clear cmd_valid after Descriptor table has processed current commmand
  else
    reg_oinfo_cmd_valid_q <= reg_oinfo_cmd_valid_q;   // Hold value  

always @(posedge(clock))
  if (reset_q == 1'b1)             
    begin
      reg_oinfo_data_valid_q <= 1'b0;                   // At reset, set to 0 as no read command has been performed yet 
      reg_oinfo_data_q       <= reg_oinfo_010_init;       
    end
  else if (sel_oinfo_00C == 1'b1 && (wr_be[3] == 1'b1 && wdata_q[31] == 1'b0))
    begin
      reg_oinfo_data_valid_q <= 1'b0;                   // Clear 'Data Valid' seen by MMIO register as soon as a command starts
      reg_oinfo_data_q       <= 32'h0000_0000;          // Clear 'Data' register as soon as command starts  
    end
  else if (desc_cfg_echo_cmd_valid == 1'b1)             // Software expects to see valid & all 0s if the target register is not implemented
    begin
      reg_oinfo_data_valid_q <= 1'b1;                   // Set (and hold) 'Data Valid' bit to 1 until next read command arrives
      reg_oinfo_data_q       <= desc_cfg_data;          // Set (and hold) 'Data' until next read command arrives
    end
  else 
    begin
      reg_oinfo_data_valid_q <= reg_oinfo_data_valid_q; // Hold value
      reg_oinfo_data_q       <= reg_oinfo_data_q;       // Hold value
    end

assign cfg_desc_cmd_valid = reg_oinfo_cmd_valid_q;  // Drive outputs to descriptor table
assign cfg_desc_afu_index = reg_oinfo_008_q[21:16]; // AFU Info Index[5:0]
assign cfg_desc_offset    = reg_oinfo_00C_q[30:0];



// ..............................................
// @@@ OCTRL00
// ..............................................


wire [31:0] reg_octrl00_000_q;   
wire [31:0] reg_octrl00_004_q;   
reg  [31:0] reg_octrl00_008_q;
reg  [31:0] reg_octrl00_00C_q;
reg  [31:0] reg_octrl00_010_q;   
reg  [31:0] reg_octrl00_014_q;   
reg  [31:0] reg_octrl00_018_q;
reg  [31:0] reg_octrl00_01C_q;

wire [31:0] reg_octrl00_000_rdata; 
wire [31:0] reg_octrl00_004_rdata; 
wire [31:0] reg_octrl00_008_rdata;
wire [31:0] reg_octrl00_00C_rdata; 
wire [31:0] reg_octrl00_010_rdata; 
wire [31:0] reg_octrl00_014_rdata; 
wire [31:0] reg_octrl00_018_rdata;
wire [31:0] reg_octrl00_01C_rdata; 

`ifdef ADD_AFU_CTRL01
assign reg_octrl00_000_q[31:20] = `OCTRL01_BASE;   
`else
assign reg_octrl00_000_q[31:20] = `OVSEC1_BASE;   
`endif

assign reg_octrl00_000_q[19:16] = 4'h1;     
assign reg_octrl00_000_q[15: 0] = 16'h0023;
assign reg_octrl00_000_rdata = (sel_octrl00_000 == 1'b1 && do_read == 1'b1) ? reg_octrl00_000_q : 32'h00000000;


assign reg_octrl00_004_q[31:20] = 12'h020;       
assign reg_octrl00_004_q[19:16] = 4'h0;     
assign reg_octrl00_004_q[15: 0] = 16'h1014;      
assign reg_octrl00_004_rdata = (sel_octrl00_004 == 1'b1 && do_read == 1'b1) ? reg_octrl00_004_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl00_008_q <= reg_octrl00_008_init;    // Load initial value during reset
    else if (sel_octrl00_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl00_008_q[31:22] <= { 8'h00, 2'b00 }; 
        reg_octrl00_008_q[21:16] <= cfg_ro_octrl00_afu_control_index;   
        reg_octrl00_008_q[15: 0] <= 16'hF004;   
      end
    else                 reg_octrl00_008_q <= reg_octrl00_008_q;       // Hold value when register is not selected
  end
assign reg_octrl00_008_rdata = (sel_octrl00_008 == 1'b1 && do_read == 1'b1) ? reg_octrl00_008_q : 32'h00000000;


reg   reg_octrl00_reset_timer_run_q;
reg   reg_octrl00_terminate_valid_q;  
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl00_00C_q <= reg_octrl00_00C_init;    // Load initial value during reset
    else if (sel_octrl00_00C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl00_00C_q[31:28] <= (wr_be[3] == 1'b1) ? wdata_q[31:28] : reg_octrl00_00C_q[31:28];  
        reg_octrl00_00C_q[27:26] <= 2'b00;  
        reg_octrl00_00C_q[25:24] <= (wr_be[3] == 1'b1) ? wdata_q[25:24] : reg_octrl00_00C_q[25:24];   
        reg_octrl00_00C_q[   23] <= reg_octrl00_reset_timer_run_q; 
        reg_octrl00_00C_q[22:21] <= 2'b00;   
        reg_octrl00_00C_q[   20] <= reg_octrl00_terminate_valid_q;   
        reg_octrl00_00C_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl00_00C_q[19:16];   
        reg_octrl00_00C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl00_00C_q[15: 8];   
        reg_octrl00_00C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl00_00C_q[ 7: 0];   
      end
    else
      begin
        reg_octrl00_00C_q[31:24] <= reg_octrl00_00C_q[31:24];      // Hold value when not selected, but capture active bits every cycle
        reg_octrl00_00C_q[   23] <= reg_octrl00_reset_timer_run_q;
        reg_octrl00_00C_q[22:21] <= reg_octrl00_00C_q[22:21];
        reg_octrl00_00C_q[   20] <= reg_octrl00_terminate_valid_q;
        reg_octrl00_00C_q[19: 0] <= reg_octrl00_00C_q[19: 0];
      end
  end
assign reg_octrl00_00C_rdata = (sel_octrl00_00C == 1'b1 && do_read == 1'b1) ? reg_octrl00_00C_q : 32'h00000000;


// Logic to manage 'Reset AFU'  
//
// Start a timer when software writes the reset bit to 1. Hold reset out to AFU's active until timer expires. 
reg  [7:0] reg_octrl00_reset_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    reg_octrl00_reset_timer_run_q <= 1'b0;                                          // Timer is off initially
  else if (sel_octrl00_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[23] == 1'b1))    // Start timer when software initiates AFU reset
    reg_octrl00_reset_timer_run_q <= 1'b1;
  else if (cfg_ro_octrl00_reset_duration != 8'h00 && reg_octrl00_reset_timer_q == cfg_ro_octrl00_reset_duration)  // Timer max = duration
    reg_octrl00_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else if (cfg_ro_octrl00_reset_duration == 8'h00 && reg_octrl00_reset_timer_q == 8'hFF)                          // Timer max = roll over
    reg_octrl00_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else
    reg_octrl00_reset_timer_run_q <= reg_octrl00_reset_timer_run_q;                 // Hold value while timer is running

always @(posedge(clock))
  if (reset == 1'b1)
    reg_octrl00_reset_timer_q <= 8'h00;                                    // Clear timer at reset
  else if (reg_octrl00_reset_timer_run_q == 1'b1)     
    reg_octrl00_reset_timer_q <= reg_octrl00_reset_timer_q + 8'h01;        // Roll over case is handled by 'run' signal
  else
    reg_octrl00_reset_timer_q <= 8'h00;



// Logic to manage 'Terminate Valid'
//
// Per the CFG architecture, software ensures 'Terminate Valid' is 0 (meaning it is not in use), then writes it to 1 to stop a process.
// When this happens, the AFU looks at the 'PASID Termination Value' in adjacent bits and begins terminating that process.
// Functionally, the AFU raises an indicator signal to the CFG logic that means 'wait while I terminate the process'. 
// Once the signal (cfg_terminate_in_progress) returns to 0, the CFG logic clears 'Terminate Valid' so that software
// knows the process has been terminated.
// At an implementation level, there are a few things to consider. 
// a) When the AFU does not implement termination, it may tie cfg_terminate_in_progress to a constant 0.
// b) When the AFU does implement termination, it may not be able to raise cfg_terminate_in_progress immediately,
//    as timing registers and/or clock crossings can add delay between from when the AFU senses 'Terminate Valid' become 1
//    and when the CFG logic sees cfg_terminate_in_progress become 1.
// To accommodate these implementation items, the logic below is designed to act as follows.
// Upon seeing 'Terminate Valid' written to 1, the logic looks for one of two conditions to be true to set it back to 0.
// 1) cfg_terminate_in_progress does not change from 0 to 1 within 15 cycles (case 'a' above)
// 2) If a rising edge of cfg_terminate_in_progress is detected with 15 cycles, 'Terminate Valid' is not cleared until 
//    cfg_terminate_in_progress returns to 0. (case 'b' above)
//
// IMPORTANT: AFU must activate 'cfg_in_terminate_progress' within 15 cycles of 'Terminate Valid' becoming 1, else this logic
//            will pulse 'Terminate Valid' unexpectedly after it has become 0.
// Note: Software should not write 'Terminate Valid' to 0 after writing to 1, so don't check for this condition in the logic.
// Note: Software should ensure multiple ports don't try to use this resource simultaneously, so don't check for this condition.
// Note: This logic does some calcalution on the cfg_terminate_in_progress input. If this causes timing problems, it should
//       be OK to add a staging register before the calculation. The only effect would be to delay the detection of rising
//       and falling edges by 1 cycle.

// Use delay of input signal determining edges
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg    cfg_octrl00_terminate_in_progress_q;
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    wire   octrl00_terminate_in_progress_rising_edge;
//wire   octrl00_terminate_in_progress_falling_edge;
always @(posedge(clock))
  cfg_octrl00_terminate_in_progress_q <= cfg_octrl00_terminate_in_progress;
assign octrl00_terminate_in_progress_rising_edge  = ~cfg_octrl00_terminate_in_progress_q &  cfg_octrl00_terminate_in_progress;  // was 0, is 1
//assign octrl00_terminate_in_progress_falling_edge =  cfg_octrl00_terminate_in_progress_q & ~cfg_octrl00_terminate_in_progress;  // was 1, is 0

// Determine when 'Terminate Valid' is being written 
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    wire   octrl00_terminate_valid_written;  
assign octrl00_terminate_valid_written = sel_octrl00_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[20] == 1'b1);

// Determine when timer should start, be running, or stop
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg       octrl00_terminate_timer_run_q;
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg [3:0] octrl00_terminate_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl00_terminate_timer_run_q <= 1'b0;                             // Timer is off initially
  else if (octrl00_terminate_valid_written == 1'b1)
    octrl00_terminate_timer_run_q <= 1'b1;                             // Start timer when 'Terminate Valid' is written
  else if (octrl00_terminate_timer_q == 4'hF ||                        // When timer is about to roll over, OR
           octrl00_terminate_in_progress_rising_edge == 1'b1)          // if AFU has raised the 'in_progress' signal
    octrl00_terminate_timer_run_q <= 1'b0;                             // Stop the timer 
  else
    octrl00_terminate_timer_run_q <= octrl00_terminate_timer_run_q;    // Hold value while timer is running

// Timer (gives AFU up to 15 cycles to respond with 'cfg_terminate_in_progress')
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl00_terminate_timer_q <= 4'h0;
  else if (octrl00_terminate_timer_run_q == 1'b1)
    octrl00_terminate_timer_q <= octrl00_terminate_timer_q + 4'h1;     // Roll over case is handled by 'run' signal logic
  else
    octrl00_terminate_timer_q <= 4'h0;

// Determine 'Terminate Valid' register bit value (capture and hold because register itself only loads when selected by a command)
always @(posedge(clock))
  if (reset_q == 1'b1)             
    reg_octrl00_terminate_valid_q <= 1'b0;                    // At reset, set to inactive value so software knows feature is available       
  else 
    reg_octrl00_terminate_valid_q <= octrl00_terminate_timer_run_q |    // If AFU never responds, will drop after timer expires
                                     cfg_octrl00_terminate_in_progress; // If AFU does respond, this takes over
                                                                        // If timer isn't running and AFU is not terminating anything, should be 0



always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl00_010_q <= reg_octrl00_010_init;    // Load initial value during reset
    else if (sel_octrl00_010 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl00_010_q[31:16] <= 16'h0000;   
        reg_octrl00_010_q[15:13] <= 3'b000; 
        reg_octrl00_010_q[12: 8] <= (wr_be[1] == 1'b1) ? wdata_q[12: 8] : reg_octrl00_010_q[12: 8];   
        reg_octrl00_010_q[ 7: 5] <= 3'b000; 
        reg_octrl00_010_q[ 4: 0] <= cfg_ro_octrl00_pasid_len_supported;   
      end
    else                 reg_octrl00_010_q <= reg_octrl00_010_q;       // Hold value when register is not selected
  end
assign reg_octrl00_010_rdata = (sel_octrl00_010 == 1'b1 && do_read == 1'b1) ? reg_octrl00_010_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl00_014_q <= reg_octrl00_014_init;    // Load initial value during reset
    else if (sel_octrl00_014 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl00_014_q[   31] <= cfg_ro_octrl00_metadata_supported;
        reg_octrl00_014_q[   30] <= (wr_be[3] == 1'b1) ? wdata_q[   30] : reg_octrl00_014_q[   30];
        reg_octrl00_014_q[29:27] <= (wr_be[3] == 1'b1) ? wdata_q[29:27] : reg_octrl00_014_q[29:27];
        reg_octrl00_014_q[26:20] <= 7'b000_0000;                                                    
        reg_octrl00_014_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl00_014_q[19:16]; 
        reg_octrl00_014_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl00_014_q[15: 8];   
        reg_octrl00_014_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl00_014_q[ 7: 0];   
      end
    else                 reg_octrl00_014_q <= reg_octrl00_014_q;       // Hold value when register is not selected
  end
assign reg_octrl00_014_rdata = (sel_octrl00_014 == 1'b1 && do_read == 1'b1) ? reg_octrl00_014_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl00_018_q <= reg_octrl00_018_init;    // Load initial value during reset
    else if (sel_octrl00_018 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl00_018_q[31:28] <= 4'b0000;   
        reg_octrl00_018_q[27:24] <= (wr_be[3] == 1'b1) ? wdata_q[27:24] : reg_octrl00_018_q[27:24];   
        reg_octrl00_018_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_octrl00_018_q[23:16]; 
        reg_octrl00_018_q[15:12] <= 4'b0000;
        reg_octrl00_018_q[11: 0] <= cfg_ro_octrl00_actag_len_supported;   
      end
    else                 reg_octrl00_018_q <= reg_octrl00_018_q;       // Hold value when register is not selected
  end
assign reg_octrl00_018_rdata = (sel_octrl00_018 == 1'b1 && do_read == 1'b1) ? reg_octrl00_018_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl00_01C_q <= reg_octrl00_01C_init;    // Load initial value during reset
    else if (sel_octrl00_01C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl00_01C_q[31:12] <= 20'h0000_0;  
        reg_octrl00_01C_q[11: 8] <= (wr_be[1] == 1'b1) ? wdata_q[11: 8] : reg_octrl00_01C_q[11: 8];   
        reg_octrl00_01C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl00_01C_q[ 7: 0];   
      end
    else                 reg_octrl00_01C_q <= reg_octrl00_01C_q;       // Hold value when register is not selected
  end
assign reg_octrl00_01C_rdata = (sel_octrl00_01C == 1'b1 && do_read == 1'b1) ? reg_octrl00_01C_q : 32'h00000000;



`ifdef ADD_AFU_CTRL01

// ..............................................
// @@@ OCTRL01
// ..............................................


wire [31:0] reg_octrl01_000_q;   
wire [31:0] reg_octrl01_004_q;   
reg  [31:0] reg_octrl01_008_q;
reg  [31:0] reg_octrl01_00C_q;
reg  [31:0] reg_octrl01_010_q;   
reg  [31:0] reg_octrl01_014_q;   
reg  [31:0] reg_octrl01_018_q;
reg  [31:0] reg_octrl01_01C_q;

wire [31:0] reg_octrl01_000_rdata; 
wire [31:0] reg_octrl01_004_rdata; 
wire [31:0] reg_octrl01_008_rdata;
wire [31:0] reg_octrl01_00C_rdata; 
wire [31:0] reg_octrl01_010_rdata; 
wire [31:0] reg_octrl01_014_rdata; 
wire [31:0] reg_octrl01_018_rdata;
wire [31:0] reg_octrl01_01C_rdata; 


`ifdef ADD_AFU_CTRL02
assign reg_octrl01_000_q[31:20] = `OCTRL02_BASE;   
`else
assign reg_octrl01_000_q[31:20] = `OVSEC1_BASE;   
`endif
assign reg_octrl01_000_q[19:16] = 4'h1;     
assign reg_octrl01_000_q[15: 0] = 16'h0023;
assign reg_octrl01_000_rdata = (sel_octrl01_000 == 1'b1 && do_read == 1'b1) ? reg_octrl01_000_q : 32'h00000000;


assign reg_octrl01_004_q[31:20] = 12'h020;       
assign reg_octrl01_004_q[19:16] = 4'h0;     
assign reg_octrl01_004_q[15: 0] = 16'h1014;      
assign reg_octrl01_004_rdata = (sel_octrl01_004 == 1'b1 && do_read == 1'b1) ? reg_octrl01_004_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl01_008_q <= reg_octrl01_008_init;    // Load initial value during reset
    else if (sel_octrl01_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl01_008_q[31:22] <= { 8'h00, 2'b00 }; 
        reg_octrl01_008_q[21:16] <= cfg_ro_octrl01_afu_control_index;   
        reg_octrl01_008_q[15: 0] <= 16'hF004;   
      end
    else                 reg_octrl01_008_q <= reg_octrl01_008_q;       // Hold value when register is not selected
  end
assign reg_octrl01_008_rdata = (sel_octrl01_008 == 1'b1 && do_read == 1'b1) ? reg_octrl01_008_q : 32'h00000000;


reg   reg_octrl01_reset_timer_run_q;
reg   reg_octrl01_terminate_valid_q;  
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl01_00C_q <= reg_octrl01_00C_init;    // Load initial value during reset
    else if (sel_octrl01_00C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl01_00C_q[31:28] <= (wr_be[3] == 1'b1) ? wdata_q[31:28] : reg_octrl01_00C_q[31:28];  
        reg_octrl01_00C_q[27:26] <= 2'b00;  
        reg_octrl01_00C_q[25:24] <= (wr_be[3] == 1'b1) ? wdata_q[25:24] : reg_octrl01_00C_q[25:24];   
        reg_octrl01_00C_q[   23] <= reg_octrl01_reset_timer_run_q; 
        reg_octrl01_00C_q[22:21] <= 2'b00;   
        reg_octrl01_00C_q[   20] <= reg_octrl01_terminate_valid_q;   
        reg_octrl01_00C_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl01_00C_q[19:16];   
        reg_octrl01_00C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl01_00C_q[15: 8];   
        reg_octrl01_00C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl01_00C_q[ 7: 0];   
      end
    else
      begin
        reg_octrl01_00C_q[31:24] <= reg_octrl01_00C_q[31:24];      // Hold value when not selected, but capture active bits every cycle
        reg_octrl01_00C_q[   23] <= reg_octrl01_reset_timer_run_q;
        reg_octrl01_00C_q[22:21] <= reg_octrl01_00C_q[22:21];
        reg_octrl01_00C_q[   20] <= reg_octrl01_terminate_valid_q;
        reg_octrl01_00C_q[19: 0] <= reg_octrl01_00C_q[19: 0];
      end
  end
assign reg_octrl01_00C_rdata = (sel_octrl01_00C == 1'b1 && do_read == 1'b1) ? reg_octrl01_00C_q : 32'h00000000;


// Logic to manage 'Reset AFU'  
//
// Start a timer when software writes the reset bit to 1. Hold reset out to AFU's active until timer expires. 
reg  [7:0] reg_octrl01_reset_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    reg_octrl01_reset_timer_run_q <= 1'b0;                                          // Timer is off initially
  else if (sel_octrl01_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[23] == 1'b1))    // Start timer when software initiates AFU reset
    reg_octrl01_reset_timer_run_q <= 1'b1;
  else if (cfg_ro_octrl01_reset_duration != 8'h00 && reg_octrl01_reset_timer_q == cfg_ro_octrl01_reset_duration)  // Timer max = duration
    reg_octrl01_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else if (cfg_ro_octrl01_reset_duration == 8'h00 && reg_octrl01_reset_timer_q == 8'hFF)                          // Timer max = roll over
    reg_octrl01_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else
    reg_octrl01_reset_timer_run_q <= reg_octrl01_reset_timer_run_q;                 // Hold value while timer is running

always @(posedge(clock))
  if (reset == 1'b1)
    reg_octrl01_reset_timer_q <= 8'h00;                                   // Clear timer at reset
  else if (reg_octrl01_reset_timer_run_q == 1'b1)     
    reg_octrl01_reset_timer_q <= reg_octrl01_reset_timer_q + 8'h01;       // Roll over case is handled by 'run' signal
  else
    reg_octrl01_reset_timer_q <= 8'h00;



// Logic to manage 'Terminate Valid'
//
// Per the CFG architecture, software ensures 'Terminate Valid' is 0 (meaning it is not in use), then writes it to 1 to stop a process.
// When this happens, the AFU looks at the 'PASID Termination Value' in adjacent bits and begins terminating that process.
// Functionally, the AFU raises an indicator signal to the CFG logic that means 'wait while I terminate the process'. 
// Once the signal (cfg_terminate_in_progress) returns to 0, the CFG logic clears 'Terminate Valid' so that software
// knows the process has been terminated.
// At an implementation level, there are a few things to consider. 
// a) When the AFU does not implement termination, it may tie cfg_terminate_in_progress to a constant 0.
// b) When the AFU does implement termination, it may not be able to raise cfg_terminate_in_progress immediately,
//    as timing registers and/or clock crossings can add delay between from when the AFU senses 'Terminate Valid' become 1
//    and when the CFG logic sees cfg_terminate_in_progress become 1.
// To accommodate these implementation items, the logic below is designed to act as follows.
// Upon seeing 'Terminate Valid' written to 1, the logic looks for one of two conditions to be true to set it back to 0.
// 1) cfg_terminate_in_progress does not change from 0 to 1 within 15 cycles (case 'a' above)
// 2) If a rising edge of cfg_terminate_in_progress is detected with 15 cycles, 'Terminate Valid' is not cleared until 
//    cfg_terminate_in_progress returns to 0. (case 'b' above)
//
// IMPORTANT: AFU must activate 'cfg_in_terminate_progress' within 15 cycles of 'Terminate Valid' becoming 1, else this logic
//            will pulse 'Terminate Valid' unexpectedly after it has become 0.
// Note: Software should not write 'Terminate Valid' to 0 after writing to 1, so don't check for this condition in the logic.
// Note: Software should ensure multiple ports don't try to use this resource simultaneously, so don't check for this condition.
// Note: This logic does some calcalution on the cfg_terminate_in_progress input. If this causes timing problems, it should
//       be OK to add a staging register before the calculation. The only effect would be to delay the detection of rising
//       and falling edges by 1 cycle.

// Use delay of input signal determining edges
reg    cfg_octrl01_terminate_in_progress_q;
wire   octrl01_terminate_in_progress_rising_edge;
//wire   octrl01_terminate_in_progress_falling_edge;
always @(posedge(clock))
  cfg_octrl01_terminate_in_progress_q <= cfg_octrl01_terminate_in_progress;
assign octrl01_terminate_in_progress_rising_edge  = ~cfg_octrl01_terminate_in_progress_q &  cfg_octrl01_terminate_in_progress;  // was 0, is 1
//assign octrl01_terminate_in_progress_falling_edge =  cfg_octrl01_terminate_in_progress_q & ~cfg_octrl01_terminate_in_progress;  // was 1, is 0

// Determine when 'Terminate Valid' is being written 
wire   octrl01_terminate_valid_written;  
assign octrl01_terminate_valid_written = sel_octrl01_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[20] == 1'b1);

// Determine when timer should start, be running, or stop
reg       octrl01_terminate_timer_run_q;
reg [3:0] octrl01_terminate_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl01_terminate_timer_run_q <= 1'b0;                             // Timer is off initially
  else if (octrl01_terminate_valid_written == 1'b1)
    octrl01_terminate_timer_run_q <= 1'b1;                             // Start timer when 'Terminate Valid' is written
  else if (octrl01_terminate_timer_q == 4'hF ||                       // When timer is about to roll over, OR
           octrl01_terminate_in_progress_rising_edge == 1'b1)         // if AFU has raised the 'in_progress' signal
    octrl01_terminate_timer_run_q <= 1'b0;                             // Stop the timer 
  else
    octrl01_terminate_timer_run_q <= octrl01_terminate_timer_run_q;    // Hold value while timer is running

// Timer (gives AFU up to 15 cycles to respond with 'cfg_terminate_in_progress')
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl01_terminate_timer_q <= 4'h0;
  else if (octrl01_terminate_timer_run_q == 1'b1)
    octrl01_terminate_timer_q <= octrl01_terminate_timer_q + 4'h1;     // Roll over case is handled by 'run' signal logic
  else
    octrl01_terminate_timer_q <= 4'h0;

// Determine 'Terminate Valid' register bit value (capture and hold because register itself only loads when selected by a command)
always @(posedge(clock))
  if (reset_q == 1'b1)             
    reg_octrl01_terminate_valid_q <= 1'b0;                    // At reset, set to inactive value so software knows feature is available       
  else 
    reg_octrl01_terminate_valid_q <= octrl01_terminate_timer_run_q |    // If AFU never responds, will drop after timer expires
                                     cfg_octrl01_terminate_in_progress; // If AFU does respond, this takes over
                                                                        // If timer isn't running and AFU is not terminating anything, should be 0



always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl01_010_q <= reg_octrl01_010_init;    // Load initial value during reset
    else if (sel_octrl01_010 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl01_010_q[31:16] <= 16'h0000;   
        reg_octrl01_010_q[15:13] <= 3'b000; 
        reg_octrl01_010_q[12: 8] <= (wr_be[1] == 1'b1) ? wdata_q[12: 8] : reg_octrl01_010_q[12: 8];   
        reg_octrl01_010_q[ 7: 5] <= 3'b000; 
        reg_octrl01_010_q[ 4: 0] <= cfg_ro_octrl01_pasid_len_supported;   
      end
    else                 reg_octrl01_010_q <= reg_octrl01_010_q;       // Hold value when register is not selected
  end
assign reg_octrl01_010_rdata = (sel_octrl01_010 == 1'b1 && do_read == 1'b1) ? reg_octrl01_010_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl01_014_q <= reg_octrl01_014_init;    // Load initial value during reset
    else if (sel_octrl01_014 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl01_014_q[   31] <= cfg_ro_octrl01_metadata_supported;
        reg_octrl01_014_q[   30] <= (wr_be[3] == 1'b1) ? wdata_q[   30] : reg_octrl01_014_q[   30];
        reg_octrl01_014_q[29:27] <= (wr_be[3] == 1'b1) ? wdata_q[29:27] : reg_octrl01_014_q[29:27];
        reg_octrl01_014_q[26:20] <= 7'b000_0000;                                                    
        reg_octrl01_014_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl01_014_q[19:16]; 
        reg_octrl01_014_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl01_014_q[15: 8];   
        reg_octrl01_014_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl01_014_q[ 7: 0];   
      end
    else                 reg_octrl01_014_q <= reg_octrl01_014_q;       // Hold value when register is not selected
  end
assign reg_octrl01_014_rdata = (sel_octrl01_014 == 1'b1 && do_read == 1'b1) ? reg_octrl01_014_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl01_018_q <= reg_octrl01_018_init;    // Load initial value during reset
    else if (sel_octrl01_018 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl01_018_q[31:28] <= 4'b0000;   
        reg_octrl01_018_q[27:24] <= (wr_be[3] == 1'b1) ? wdata_q[27:24] : reg_octrl01_018_q[27:24];   
        reg_octrl01_018_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_octrl01_018_q[23:16]; 
        reg_octrl01_018_q[15:12] <= 4'b0000;
        reg_octrl01_018_q[11: 0] <= cfg_ro_octrl01_actag_len_supported;   
      end
    else                 reg_octrl01_018_q <= reg_octrl01_018_q;       // Hold value when register is not selected
  end
assign reg_octrl01_018_rdata = (sel_octrl01_018 == 1'b1 && do_read == 1'b1) ? reg_octrl01_018_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl01_01C_q <= reg_octrl01_01C_init;    // Load initial value during reset
    else if (sel_octrl01_01C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl01_01C_q[31:12] <= 20'h0000_0;  
        reg_octrl01_01C_q[11: 8] <= (wr_be[1] == 1'b1) ? wdata_q[11: 8] : reg_octrl01_01C_q[11: 8];   
        reg_octrl01_01C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl01_01C_q[ 7: 0];   
      end
    else                 reg_octrl01_01C_q <= reg_octrl01_01C_q;       // Hold value when register is not selected
  end
assign reg_octrl01_01C_rdata = (sel_octrl01_01C == 1'b1 && do_read == 1'b1) ? reg_octrl01_01C_q : 32'h00000000;

`endif



`ifdef ADD_AFU_CTRL02

// ..............................................
// @@@ OCTRL02
// ..............................................


wire [31:0] reg_octrl02_000_q;   
wire [31:0] reg_octrl02_004_q;   
reg  [31:0] reg_octrl02_008_q;
reg  [31:0] reg_octrl02_00C_q;
reg  [31:0] reg_octrl02_010_q;   
reg  [31:0] reg_octrl02_014_q;   
reg  [31:0] reg_octrl02_018_q;
reg  [31:0] reg_octrl02_01C_q;

wire [31:0] reg_octrl02_000_rdata; 
wire [31:0] reg_octrl02_004_rdata; 
wire [31:0] reg_octrl02_008_rdata;
wire [31:0] reg_octrl02_00C_rdata; 
wire [31:0] reg_octrl02_010_rdata; 
wire [31:0] reg_octrl02_014_rdata; 
wire [31:0] reg_octrl02_018_rdata;
wire [31:0] reg_octrl02_01C_rdata; 


`ifdef ADD_AFU_CTRL03
assign reg_octrl02_000_q[31:20] = `OCTRL03_BASE;   
`else
assign reg_octrl02_000_q[31:20] = `OVSEC1_BASE;   
`endif
assign reg_octrl02_000_q[19:16] = 4'h1;     
assign reg_octrl02_000_q[15: 0] = 16'h0023;
assign reg_octrl02_000_rdata = (sel_octrl02_000 == 1'b1 && do_read == 1'b1) ? reg_octrl02_000_q : 32'h00000000;


assign reg_octrl02_004_q[31:20] = 12'h020;       
assign reg_octrl02_004_q[19:16] = 4'h0;     
assign reg_octrl02_004_q[15: 0] = 16'h1014;      
assign reg_octrl02_004_rdata = (sel_octrl02_004 == 1'b1 && do_read == 1'b1) ? reg_octrl02_004_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl02_008_q <= reg_octrl02_008_init;    // Load initial value during reset
    else if (sel_octrl02_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl02_008_q[31:22] <= { 8'h00, 2'b00 }; 
        reg_octrl02_008_q[21:16] <= cfg_ro_octrl02_afu_control_index;   
        reg_octrl02_008_q[15: 0] <= 16'hF004;   
      end
    else                 reg_octrl02_008_q <= reg_octrl02_008_q;       // Hold value when register is not selected
  end
assign reg_octrl02_008_rdata = (sel_octrl02_008 == 1'b1 && do_read == 1'b1) ? reg_octrl02_008_q : 32'h00000000;


reg   reg_octrl02_reset_timer_run_q;
reg   reg_octrl02_terminate_valid_q;  
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl02_00C_q <= reg_octrl02_00C_init;    // Load initial value during reset
    else if (sel_octrl02_00C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl02_00C_q[31:28] <= (wr_be[3] == 1'b1) ? wdata_q[31:28] : reg_octrl02_00C_q[31:28];  
        reg_octrl02_00C_q[27:26] <= 2'b00;  
        reg_octrl02_00C_q[25:24] <= (wr_be[3] == 1'b1) ? wdata_q[25:24] : reg_octrl02_00C_q[25:24];   
        reg_octrl02_00C_q[   23] <= reg_octrl02_reset_timer_run_q; 
        reg_octrl02_00C_q[22:21] <= 2'b00;   
        reg_octrl02_00C_q[   20] <= reg_octrl02_terminate_valid_q;   
        reg_octrl02_00C_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl02_00C_q[19:16];   
        reg_octrl02_00C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl02_00C_q[15: 8];   
        reg_octrl02_00C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl02_00C_q[ 7: 0];   
      end
    else
      begin
        reg_octrl02_00C_q[31:24] <= reg_octrl02_00C_q[31:24];      // Hold value when not selected, but capture active bits every cycle
        reg_octrl02_00C_q[   23] <= reg_octrl02_reset_timer_run_q;
        reg_octrl02_00C_q[22:21] <= reg_octrl02_00C_q[22:21];
        reg_octrl02_00C_q[   20] <= reg_octrl02_terminate_valid_q;
        reg_octrl02_00C_q[19: 0] <= reg_octrl02_00C_q[19: 0];
      end
  end
assign reg_octrl02_00C_rdata = (sel_octrl02_00C == 1'b1 && do_read == 1'b1) ? reg_octrl02_00C_q : 32'h00000000;


// Logic to manage 'Reset AFU'  
//
// Start a timer when software writes the reset bit to 1. Hold reset out to AFU's active until timer expires. 
reg  [7:0] reg_octrl02_reset_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    reg_octrl02_reset_timer_run_q <= 1'b0;                                          // Timer is off initially
  else if (sel_octrl02_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[23] == 1'b1))    // Start timer when software initiates AFU reset
    reg_octrl02_reset_timer_run_q <= 1'b1;
  else if (cfg_ro_octrl02_reset_duration != 8'h00 && reg_octrl02_reset_timer_q == cfg_ro_octrl02_reset_duration)  // Timer max = duration
    reg_octrl02_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else if (cfg_ro_octrl02_reset_duration == 8'h00 && reg_octrl02_reset_timer_q == 8'hFF)                          // Timer max = roll over
    reg_octrl02_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else
    reg_octrl02_reset_timer_run_q <= reg_octrl02_reset_timer_run_q;                 // Hold value while timer is running

always @(posedge(clock))
  if (reset == 1'b1)
    reg_octrl02_reset_timer_q <= 8'h00;                                   // Clear timer at reset
  else if (reg_octrl02_reset_timer_run_q == 1'b1)     
    reg_octrl02_reset_timer_q <= reg_octrl02_reset_timer_q + 8'h01;       // Roll over case is handled by 'run' signal
  else
    reg_octrl02_reset_timer_q <= 8'h00;



// Logic to manage 'Terminate Valid'
//
// Per the CFG architecture, software ensures 'Terminate Valid' is 0 (meaning it is not in use), then writes it to 1 to stop a process.
// When this happens, the AFU looks at the 'PASID Termination Value' in adjacent bits and begins terminating that process.
// Functionally, the AFU raises an indicator signal to the CFG logic that means 'wait while I terminate the process'. 
// Once the signal (cfg_terminate_in_progress) returns to 0, the CFG logic clears 'Terminate Valid' so that software
// knows the process has been terminated.
// At an implementation level, there are a few things to consider. 
// a) When the AFU does not implement termination, it may tie cfg_terminate_in_progress to a constant 0.
// b) When the AFU does implement termination, it may not be able to raise cfg_terminate_in_progress immediately,
//    as timing registers and/or clock crossings can add delay between from when the AFU senses 'Terminate Valid' become 1
//    and when the CFG logic sees cfg_terminate_in_progress become 1.
// To accommodate these implementation items, the logic below is designed to act as follows.
// Upon seeing 'Terminate Valid' written to 1, the logic looks for one of two conditions to be true to set it back to 0.
// 1) cfg_terminate_in_progress does not change from 0 to 1 within 15 cycles (case 'a' above)
// 2) If a rising edge of cfg_terminate_in_progress is detected with 15 cycles, 'Terminate Valid' is not cleared until 
//    cfg_terminate_in_progress returns to 0. (case 'b' above)
//
// IMPORTANT: AFU must activate 'cfg_in_terminate_progress' within 15 cycles of 'Terminate Valid' becoming 1, else this logic
//            will pulse 'Terminate Valid' unexpectedly after it has become 0.
// Note: Software should not write 'Terminate Valid' to 0 after writing to 1, so don't check for this condition in the logic.
// Note: Software should ensure multiple ports don't try to use this resource simultaneously, so don't check for this condition.
// Note: This logic does some calcalution on the cfg_terminate_in_progress input. If this causes timing problems, it should
//       be OK to add a staging register before the calculation. The only effect would be to delay the detection of rising
//       and falling edges by 1 cycle.

// Use delay of input signal determining edges
reg    cfg_octrl02_terminate_in_progress_q;
wire   octrl02_terminate_in_progress_rising_edge;
//wire   octrl02_terminate_in_progress_falling_edge;
always @(posedge(clock))
  cfg_octrl02_terminate_in_progress_q <= cfg_octrl02_terminate_in_progress;
assign octrl02_terminate_in_progress_rising_edge  = ~cfg_octrl02_terminate_in_progress_q &  cfg_octrl02_terminate_in_progress;  // was 0, is 1
//assign octrl02_terminate_in_progress_falling_edge =  cfg_octrl02_terminate_in_progress_q & ~cfg_octrl02_terminate_in_progress;  // was 1, is 0

// Determine when 'Terminate Valid' is being written 
wire   octrl02_terminate_valid_written;  
assign octrl02_terminate_valid_written = sel_octrl02_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[20] == 1'b1);

// Determine when timer should start, be running, or stop
reg       octrl02_terminate_timer_run_q;
reg [3:0] octrl02_terminate_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl02_terminate_timer_run_q <= 1'b0;                             // Timer is off initially
  else if (octrl02_terminate_valid_written == 1'b1)
    octrl02_terminate_timer_run_q <= 1'b1;                             // Start timer when 'Terminate Valid' is written
  else if (octrl02_terminate_timer_q == 4'hF ||                       // When timer is about to roll over, OR
           octrl02_terminate_in_progress_rising_edge == 1'b1)         // if AFU has raised the 'in_progress' signal
    octrl02_terminate_timer_run_q <= 1'b0;                             // Stop the timer 
  else
    octrl02_terminate_timer_run_q <= octrl02_terminate_timer_run_q;    // Hold value while timer is running

// Timer (gives AFU up to 15 cycles to respond with 'cfg_terminate_in_progress')
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl02_terminate_timer_q <= 4'h0;
  else if (octrl02_terminate_timer_run_q == 1'b1)
    octrl02_terminate_timer_q <= octrl02_terminate_timer_q + 4'h1;     // Roll over case is handled by 'run' signal logic
  else
    octrl02_terminate_timer_q <= 4'h0;

// Determine 'Terminate Valid' register bit value (capture and hold because register itself only loads when selected by a command)
always @(posedge(clock))
  if (reset_q == 1'b1)             
    reg_octrl02_terminate_valid_q <= 1'b0;                    // At reset, set to inactive value so software knows feature is available       
  else 
    reg_octrl02_terminate_valid_q <= octrl02_terminate_timer_run_q |    // If AFU never responds, will drop after timer expires
                                     cfg_octrl02_terminate_in_progress; // If AFU does respond, this takes over
                                                                        // If timer isn't running and AFU is not terminating anything, should be 0



always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl02_010_q <= reg_octrl02_010_init;    // Load initial value during reset
    else if (sel_octrl02_010 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl02_010_q[31:16] <= 16'h0000;   
        reg_octrl02_010_q[15:13] <= 3'b000; 
        reg_octrl02_010_q[12: 8] <= (wr_be[1] == 1'b1) ? wdata_q[12: 8] : reg_octrl02_010_q[12: 8];   
        reg_octrl02_010_q[ 7: 5] <= 3'b000; 
        reg_octrl02_010_q[ 4: 0] <= cfg_ro_octrl02_pasid_len_supported;   
      end
    else                 reg_octrl02_010_q <= reg_octrl02_010_q;       // Hold value when register is not selected
  end
assign reg_octrl02_010_rdata = (sel_octrl02_010 == 1'b1 && do_read == 1'b1) ? reg_octrl02_010_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl02_014_q <= reg_octrl02_014_init;    // Load initial value during reset
    else if (sel_octrl02_014 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl02_014_q[   31] <= cfg_ro_octrl02_metadata_supported;
        reg_octrl02_014_q[   30] <= (wr_be[3] == 1'b1) ? wdata_q[   30] : reg_octrl02_014_q[   30];
        reg_octrl02_014_q[29:27] <= (wr_be[3] == 1'b1) ? wdata_q[29:27] : reg_octrl02_014_q[29:27];
        reg_octrl02_014_q[26:20] <= 7'b000_0000;                                                    
        reg_octrl02_014_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl02_014_q[19:16]; 
        reg_octrl02_014_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl02_014_q[15: 8];   
        reg_octrl02_014_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl02_014_q[ 7: 0];   
      end
    else                 reg_octrl02_014_q <= reg_octrl02_014_q;       // Hold value when register is not selected
  end
assign reg_octrl02_014_rdata = (sel_octrl02_014 == 1'b1 && do_read == 1'b1) ? reg_octrl02_014_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl02_018_q <= reg_octrl02_018_init;    // Load initial value during reset
    else if (sel_octrl02_018 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl02_018_q[31:28] <= 4'b0000;   
        reg_octrl02_018_q[27:24] <= (wr_be[3] == 1'b1) ? wdata_q[27:24] : reg_octrl02_018_q[27:24];   
        reg_octrl02_018_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_octrl02_018_q[23:16]; 
        reg_octrl02_018_q[15:12] <= 4'b0000;
        reg_octrl02_018_q[11: 0] <= cfg_ro_octrl02_actag_len_supported;   
      end
    else                 reg_octrl02_018_q <= reg_octrl02_018_q;       // Hold value when register is not selected
  end
assign reg_octrl02_018_rdata = (sel_octrl02_018 == 1'b1 && do_read == 1'b1) ? reg_octrl02_018_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl02_01C_q <= reg_octrl02_01C_init;    // Load initial value during reset
    else if (sel_octrl02_01C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl02_01C_q[31:12] <= 20'h0000_0;  
        reg_octrl02_01C_q[11: 8] <= (wr_be[1] == 1'b1) ? wdata_q[11: 8] : reg_octrl02_01C_q[11: 8];   
        reg_octrl02_01C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl02_01C_q[ 7: 0];   
      end
    else                 reg_octrl02_01C_q <= reg_octrl02_01C_q;       // Hold value when register is not selected
  end
assign reg_octrl02_01C_rdata = (sel_octrl02_01C == 1'b1 && do_read == 1'b1) ? reg_octrl02_01C_q : 32'h00000000;

`endif



`ifdef ADD_AFU_CTRL03

// ..............................................
// @@@ OCTRL03
// ..............................................


wire [31:0] reg_octrl03_000_q;   
wire [31:0] reg_octrl03_004_q;   
reg  [31:0] reg_octrl03_008_q;
reg  [31:0] reg_octrl03_00C_q;
reg  [31:0] reg_octrl03_010_q;   
reg  [31:0] reg_octrl03_014_q;   
reg  [31:0] reg_octrl03_018_q;
reg  [31:0] reg_octrl03_01C_q;

wire [31:0] reg_octrl03_000_rdata; 
wire [31:0] reg_octrl03_004_rdata; 
wire [31:0] reg_octrl03_008_rdata;
wire [31:0] reg_octrl03_00C_rdata; 
wire [31:0] reg_octrl03_010_rdata; 
wire [31:0] reg_octrl03_014_rdata; 
wire [31:0] reg_octrl03_018_rdata;
wire [31:0] reg_octrl03_01C_rdata; 


assign reg_octrl03_000_q[31:20] = `OVSEC1_BASE;   
assign reg_octrl03_000_q[19:16] = 4'h1;     
assign reg_octrl03_000_q[15: 0] = 16'h0023;
assign reg_octrl03_000_rdata = (sel_octrl03_000 == 1'b1 && do_read == 1'b1) ? reg_octrl03_000_q : 32'h00000000;


assign reg_octrl03_004_q[31:20] = 12'h020;       
assign reg_octrl03_004_q[19:16] = 4'h0;     
assign reg_octrl03_004_q[15: 0] = 16'h1014;      
assign reg_octrl03_004_rdata = (sel_octrl03_004 == 1'b1 && do_read == 1'b1) ? reg_octrl03_004_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl03_008_q <= reg_octrl03_008_init;    // Load initial value during reset
    else if (sel_octrl03_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl03_008_q[31:22] <= { 8'h00, 2'b00 }; 
        reg_octrl03_008_q[21:16] <= cfg_ro_octrl03_afu_control_index;   
        reg_octrl03_008_q[15: 0] <= 16'hF004;   
      end
    else                 reg_octrl03_008_q <= reg_octrl03_008_q;       // Hold value when register is not selected
  end
assign reg_octrl03_008_rdata = (sel_octrl03_008 == 1'b1 && do_read == 1'b1) ? reg_octrl03_008_q : 32'h00000000;


reg   reg_octrl03_reset_timer_run_q;
reg   reg_octrl03_terminate_valid_q;  
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl03_00C_q <= reg_octrl03_00C_init;    // Load initial value during reset
    else if (sel_octrl03_00C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl03_00C_q[31:28] <= (wr_be[3] == 1'b1) ? wdata_q[31:28] : reg_octrl03_00C_q[31:28];  
        reg_octrl03_00C_q[27:26] <= 2'b00;  
        reg_octrl03_00C_q[25:24] <= (wr_be[3] == 1'b1) ? wdata_q[25:24] : reg_octrl03_00C_q[25:24];   
        reg_octrl03_00C_q[   23] <= reg_octrl03_reset_timer_run_q; 
        reg_octrl03_00C_q[22:21] <= 2'b00;   
        reg_octrl03_00C_q[   20] <= reg_octrl03_terminate_valid_q;   
        reg_octrl03_00C_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl03_00C_q[19:16];   
        reg_octrl03_00C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl03_00C_q[15: 8];   
        reg_octrl03_00C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl03_00C_q[ 7: 0];   
      end
    else
      begin
        reg_octrl03_00C_q[31:24] <= reg_octrl03_00C_q[31:24];      // Hold value when not selected, but capture active bits every cycle
        reg_octrl03_00C_q[   23] <= reg_octrl03_reset_timer_run_q;
        reg_octrl03_00C_q[22:21] <= reg_octrl03_00C_q[22:21];
        reg_octrl03_00C_q[   20] <= reg_octrl03_terminate_valid_q;
        reg_octrl03_00C_q[19: 0] <= reg_octrl03_00C_q[19: 0];
      end
  end
assign reg_octrl03_00C_rdata = (sel_octrl03_00C == 1'b1 && do_read == 1'b1) ? reg_octrl03_00C_q : 32'h00000000;


// Logic to manage 'Reset AFU'  
//
// Start a timer when software writes the reset bit to 1. Hold reset out to AFU's active until timer expires. 
reg  [7:0] reg_octrl03_reset_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    reg_octrl03_reset_timer_run_q <= 1'b0;                                          // Timer is off initially
  else if (sel_octrl03_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[23] == 1'b1))    // Start timer when software initiates AFU reset
    reg_octrl03_reset_timer_run_q <= 1'b1;
  else if (cfg_ro_octrl03_reset_duration != 8'h00 && reg_octrl03_reset_timer_q == cfg_ro_octrl03_reset_duration)  // Timer max = duration
    reg_octrl03_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else if (cfg_ro_octrl03_reset_duration == 8'h00 && reg_octrl03_reset_timer_q == 8'hFF)                          // Timer max = roll over
    reg_octrl03_reset_timer_run_q <= 1'b0;                                          // Stop the timer
  else
    reg_octrl03_reset_timer_run_q <= reg_octrl03_reset_timer_run_q;                 // Hold value while timer is running

always @(posedge(clock))
  if (reset == 1'b1)
    reg_octrl03_reset_timer_q <= 8'h00;                                    // Clear timer at reset
  else if (reg_octrl03_reset_timer_run_q == 1'b1)     
    reg_octrl03_reset_timer_q <= reg_octrl03_reset_timer_q + 8'h01;        // Roll over case is handled by 'run' signal
  else
    reg_octrl03_reset_timer_q <= 8'h00;



// Logic to manage 'Terminate Valid'
//
// Per the CFG architecture, software ensures 'Terminate Valid' is 0 (meaning it is not in use), then writes it to 1 to stop a process.
// When this happens, the AFU looks at the 'PASID Termination Value' in adjacent bits and begins terminating that process.
// Functionally, the AFU raises an indicator signal to the CFG logic that means 'wait while I terminate the process'. 
// Once the signal (cfg_terminate_in_progress) returns to 0, the CFG logic clears 'Terminate Valid' so that software
// knows the process has been terminated.
// At an implementation level, there are a few things to consider. 
// a) When the AFU does not implement termination, it may tie cfg_terminate_in_progress to a constant 0.
// b) When the AFU does implement termination, it may not be able to raise cfg_terminate_in_progress immediately,
//    as timing registers and/or clock crossings can add delay between from when the AFU senses 'Terminate Valid' become 1
//    and when the CFG logic sees cfg_terminate_in_progress become 1.
// To accommodate these implementation items, the logic below is designed to act as follows.
// Upon seeing 'Terminate Valid' written to 1, the logic looks for one of two conditions to be true to set it back to 0.
// 1) cfg_terminate_in_progress does not change from 0 to 1 within 15 cycles (case 'a' above)
// 2) If a rising edge of cfg_terminate_in_progress is detected with 15 cycles, 'Terminate Valid' is not cleared until 
//    cfg_terminate_in_progress returns to 0. (case 'b' above)
//
// IMPORTANT: AFU must activate 'cfg_in_terminate_progress' within 15 cycles of 'Terminate Valid' becoming 1, else this logic
//            will pulse 'Terminate Valid' unexpectedly after it has become 0.
// Note: Software should not write 'Terminate Valid' to 0 after writing to 1, so don't check for this condition in the logic.
// Note: Software should ensure multiple ports don't try to use this resource simultaneously, so don't check for this condition.
// Note: This logic does some calcalution on the cfg_terminate_in_progress input. If this causes timing problems, it should
//       be OK to add a staging register before the calculation. The only effect would be to delay the detection of rising
//       and falling edges by 1 cycle.

// Use delay of input signal determining edges
reg    cfg_octrl03_terminate_in_progress_q;
wire   octrl03_terminate_in_progress_rising_edge;
//wire   octrl03_terminate_in_progress_falling_edge;
always @(posedge(clock))
  cfg_octrl03_terminate_in_progress_q <= cfg_octrl03_terminate_in_progress;
assign octrl03_terminate_in_progress_rising_edge  = ~cfg_octrl03_terminate_in_progress_q &  cfg_octrl03_terminate_in_progress;  // was 0, is 1
//assign octrl03_terminate_in_progress_falling_edge =  cfg_octrl03_terminate_in_progress_q & ~cfg_octrl03_terminate_in_progress;  // was 1, is 0

// Determine when 'Terminate Valid' is being written 
wire   octrl03_terminate_valid_written;  
assign octrl03_terminate_valid_written = sel_octrl03_00C == 1'b1 && (wr_be[2] == 1'b1 && wdata_q[20] == 1'b1);

// Determine when timer should start, be running, or stop
reg       octrl03_terminate_timer_run_q;
reg [3:0] octrl03_terminate_timer_q;
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl03_terminate_timer_run_q <= 1'b0;                             // Timer is off initially
  else if (octrl03_terminate_valid_written == 1'b1)
    octrl03_terminate_timer_run_q <= 1'b1;                             // Start timer when 'Terminate Valid' is written
  else if (octrl03_terminate_timer_q == 4'hF ||                       // When timer is about to roll over, OR
           octrl03_terminate_in_progress_rising_edge == 1'b1)         // if AFU has raised the 'in_progress' signal
    octrl03_terminate_timer_run_q <= 1'b0;                             // Stop the timer 
  else
    octrl03_terminate_timer_run_q <= octrl03_terminate_timer_run_q;    // Hold value while timer is running

// Timer (gives AFU up to 15 cycles to respond with 'cfg_terminate_in_progress')
always @(posedge(clock))
  if (reset_q == 1'b1)
    octrl03_terminate_timer_q <= 4'h0;
  else if (octrl03_terminate_timer_run_q == 1'b1)
    octrl03_terminate_timer_q <= octrl03_terminate_timer_q + 4'h1;     // Roll over case is handled by 'run' signal logic
  else
    octrl03_terminate_timer_q <= 4'h0;

// Determine 'Terminate Valid' register bit value (capture and hold because register itself only loads when selected by a command)
always @(posedge(clock))
  if (reset_q == 1'b1)             
    reg_octrl03_terminate_valid_q <= 1'b0;                    // At reset, set to inactive value so software knows feature is available       
  else 
    reg_octrl03_terminate_valid_q <= octrl03_terminate_timer_run_q |    // If AFU never responds, will drop after timer expires
                                     cfg_octrl03_terminate_in_progress; // If AFU does respond, this takes over
                                                                        // If timer isn't running and AFU is not terminating anything, should be 0



always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl03_010_q <= reg_octrl03_010_init;    // Load initial value during reset
    else if (sel_octrl03_010 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl03_010_q[31:16] <= 16'h0000;   
        reg_octrl03_010_q[15:13] <= 3'b000; 
        reg_octrl03_010_q[12: 8] <= (wr_be[1] == 1'b1) ? wdata_q[12: 8] : reg_octrl03_010_q[12: 8];   
        reg_octrl03_010_q[ 7: 5] <= 3'b000; 
        reg_octrl03_010_q[ 4: 0] <= cfg_ro_octrl03_pasid_len_supported;   
      end
    else                 reg_octrl03_010_q <= reg_octrl03_010_q;       // Hold value when register is not selected
  end
assign reg_octrl03_010_rdata = (sel_octrl03_010 == 1'b1 && do_read == 1'b1) ? reg_octrl03_010_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl03_014_q <= reg_octrl03_014_init;    // Load initial value during reset
    else if (sel_octrl03_014 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl03_014_q[   31] <= cfg_ro_octrl03_metadata_supported;
        reg_octrl03_014_q[   30] <= (wr_be[3] == 1'b1) ? wdata_q[   30] : reg_octrl03_014_q[   30];
        reg_octrl03_014_q[29:27] <= (wr_be[3] == 1'b1) ? wdata_q[29:27] : reg_octrl03_014_q[29:27];
        reg_octrl03_014_q[26:20] <= 7'b000_0000;                                                    
        reg_octrl03_014_q[19:16] <= (wr_be[2] == 1'b1) ? wdata_q[19:16] : reg_octrl03_014_q[19:16]; 
        reg_octrl03_014_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_octrl03_014_q[15: 8];   
        reg_octrl03_014_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl03_014_q[ 7: 0];   
      end
    else                 reg_octrl03_014_q <= reg_octrl03_014_q;       // Hold value when register is not selected
  end
assign reg_octrl03_014_rdata = (sel_octrl03_014 == 1'b1 && do_read == 1'b1) ? reg_octrl03_014_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl03_018_q <= reg_octrl03_018_init;    // Load initial value during reset
    else if (sel_octrl03_018 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl03_018_q[31:28] <= 4'b0000;   
        reg_octrl03_018_q[27:24] <= (wr_be[3] == 1'b1) ? wdata_q[27:24] : reg_octrl03_018_q[27:24];   
        reg_octrl03_018_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_octrl03_018_q[23:16]; 
        reg_octrl03_018_q[15:12] <= 4'b0000;
        reg_octrl03_018_q[11: 0] <= cfg_ro_octrl03_actag_len_supported;   
      end
    else                 reg_octrl03_018_q <= reg_octrl03_018_q;       // Hold value when register is not selected
  end
assign reg_octrl03_018_rdata = (sel_octrl03_018 == 1'b1 && do_read == 1'b1) ? reg_octrl03_018_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_octrl03_01C_q <= reg_octrl03_01C_init;    // Load initial value during reset
    else if (sel_octrl03_01C == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_octrl03_01C_q[31:12] <= 20'h0000_0;  
        reg_octrl03_01C_q[11: 8] <= (wr_be[1] == 1'b1) ? wdata_q[11: 8] : reg_octrl03_01C_q[11: 8];   
        reg_octrl03_01C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_octrl03_01C_q[ 7: 0];   
      end
    else                 reg_octrl03_01C_q <= reg_octrl03_01C_q;       // Hold value when register is not selected
  end
assign reg_octrl03_01C_rdata = (sel_octrl03_01C == 1'b1 && do_read == 1'b1) ? reg_octrl03_01C_q : 32'h00000000;

`endif



// ..............................................
// @@@ OVSEC1
// ..............................................


wire [31:0] reg_ovsec_000_q;   
wire [31:0] reg_ovsec_004_q;   
reg  [31:0] reg_ovsec_008_q;

wire [31:0] reg_ovsec_000_rdata; 
wire [31:0] reg_ovsec_004_rdata; 
wire [31:0] reg_ovsec_008_rdata;


assign reg_ovsec_000_q[31:20] = 12'h000;     // Last Extended Capability
assign reg_ovsec_000_q[19:16] = 4'h1;     
assign reg_ovsec_000_q[15: 0] = 16'h0023;
assign reg_ovsec_000_rdata = (sel_ovsec_000 == 1'b1 && do_read == 1'b1) ? reg_ovsec_000_q : 32'h00000000;


assign reg_ovsec_004_q[31:20] = 12'h00C;       
assign reg_ovsec_004_q[19:16] = 4'h0;     
assign reg_ovsec_004_q[15: 0] = 16'h1014;      
assign reg_ovsec_004_rdata = (sel_ovsec_004 == 1'b1 && do_read == 1'b1) ? reg_ovsec_004_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_ovsec_008_q <= reg_ovsec_008_init;    // Load initial value during reset
    else if (sel_ovsec_008 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_ovsec_008_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_ovsec_008_q[31:24];
        reg_ovsec_008_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_ovsec_008_q[23:16];
        reg_ovsec_008_q[15: 0] <= 16'hF0F0;
      end
    else                 reg_ovsec_008_q <= reg_ovsec_008_q;       // Hold value when register is not selected
  end
assign reg_ovsec_008_rdata = (sel_ovsec_008 == 1'b1 && do_read == 1'b1) ? reg_ovsec_008_q : 32'h00000000;


// ----------------------------------
// Select source for ultimate read data
// ----------------------------------
wire [31:0] final_rdata_d;
reg  [31:0] final_rdata_q;
reg         final_rdata_vld_q;

// Use a big OR gate to combine all the read data sources. When source is not selected, the 'rdata' vector should be all 0.
assign final_rdata_d = reg_csh_000_rdata     | reg_csh_004_rdata     | reg_csh_008_rdata     | reg_csh_00C_rdata   |
                       reg_csh_010_rdata     | reg_csh_014_rdata     | reg_csh_018_rdata     | reg_csh_01C_rdata   |
                       reg_csh_020_rdata     | reg_csh_024_rdata     | reg_csh_028_rdata     | reg_csh_02C_rdata   |
                       reg_csh_030_rdata     | reg_csh_034_rdata     | reg_csh_038_rdata     | reg_csh_03C_rdata   |
                       reg_pasid_000_rdata   | reg_pasid_004_rdata   |
                       reg_ofunc_000_rdata   | reg_ofunc_004_rdata   | reg_ofunc_008_rdata   | reg_ofunc_00C_rdata |
                       reg_oinfo_000_rdata   | reg_oinfo_004_rdata   | reg_oinfo_008_rdata   | reg_oinfo_00C_rdata |
                       reg_oinfo_010_rdata   |
                       reg_octrl00_000_rdata | reg_octrl00_004_rdata | reg_octrl00_008_rdata | reg_octrl00_00C_rdata |
                       reg_octrl00_010_rdata | reg_octrl00_014_rdata | reg_octrl00_018_rdata | reg_octrl00_01C_rdata |
`ifdef ADD_AFU_CTRL01
                       reg_octrl01_000_rdata | reg_octrl01_004_rdata | reg_octrl01_008_rdata | reg_octrl01_00C_rdata |
                       reg_octrl01_010_rdata | reg_octrl01_014_rdata | reg_octrl01_018_rdata | reg_octrl01_01C_rdata |
`endif
`ifdef ADD_AFU_CTRL02
                       reg_octrl02_000_rdata | reg_octrl02_004_rdata | reg_octrl02_008_rdata | reg_octrl02_00C_rdata |
                       reg_octrl02_010_rdata | reg_octrl02_014_rdata | reg_octrl02_018_rdata | reg_octrl02_01C_rdata |
`endif
`ifdef ADD_AFU_CTRL03
                       reg_octrl03_000_rdata | reg_octrl03_004_rdata | reg_octrl03_008_rdata | reg_octrl03_00C_rdata |
                       reg_octrl03_010_rdata | reg_octrl03_014_rdata | reg_octrl03_018_rdata | reg_octrl03_01C_rdata |
`endif
                       reg_ovsec_000_rdata   | reg_ovsec_004_rdata   | reg_ovsec_008_rdata 
                       ;                      

always @(posedge(clock))
  final_rdata_q <= final_rdata_d;   // Latch the result of the big OR gate before sending out of the module

always @(posedge(clock))
  final_rdata_vld_q <= do_read;     // If operation was a read, capture it and pass this along as the valid

assign cfg_rdata     = final_rdata_q;
assign cfg_rdata_vld = final_rdata_vld_q;



// -------------------------------------------------------------------------------------------
// Break bit fields out from config regs (where possible, use register outputs to ease timing)
// -------------------------------------------------------------------------------------------

assign cfg_csh_memory_space              =  reg_csh_004_q[1];
assign cfg_csh_mmio_bar0                 = {reg_csh_014_q[31:0], reg_csh_010_q[31:4], 4'b0000};  // Pad 0s on right for easier use
assign cfg_csh_mmio_bar1                 = {reg_csh_01C_q[31:0], reg_csh_018_q[31:4], 4'b0000};
assign cfg_csh_mmio_bar2                 = {reg_csh_024_q[31:0], reg_csh_020_q[31:4], 4'b0000};
assign cfg_csh_expansion_ROM_bar         = {reg_csh_030_q[31:11], 11'b0 };                       // Pad 0s on the right for easier use
assign cfg_csh_expansion_ROM_enable      =  reg_csh_030_q[0];

assign cfg_ofunc_function_reset          = reg_ofunc_function_reset_active;   // Need to send internal reset signal, not reg bit as reg bit will be cleared as soon as Function reset starts. Internal reset signal though will be held longer, giving Function and underlying AFUs more time to see an active reset.
assign cfg_ofunc_func_actag_base         = reg_ofunc_00C_q[27:16];
assign cfg_ofunc_func_actag_len_enab     = reg_ofunc_00C_q[11:0];

assign cfg_octrl00_afu_control_index     = reg_octrl00_008_q[21:16];
assign cfg_octrl00_afu_unique[3:0]       = reg_octrl00_00C_q[31:28];
assign cfg_octrl00_fence_afu             = reg_octrl00_00C_q[25];
assign cfg_octrl00_enable_afu            = reg_octrl00_00C_q[24];
assign cfg_octrl00_reset_afu             = reg_octrl00_reset_timer_run_q;  // reg_octrl00_00C_q[23]; Send signal going into register
assign cfg_octrl00_terminate_valid       = reg_octrl00_terminate_valid_q;  // reg_octrl00_00C_q[20]; Send signal going into register
assign cfg_octrl00_terminate_pasid       = reg_octrl00_00C_q[19:0];
assign cfg_octrl00_pasid_length_enabled  = reg_octrl00_010_q[12:8];
assign cfg_octrl00_metadata_enabled      = reg_octrl00_014_q[30];
assign cfg_octrl00_host_tag_run_length   = reg_octrl00_014_q[29:27];
assign cfg_octrl00_pasid_base            = reg_octrl00_014_q[19:0];
assign cfg_octrl00_afu_actag_len_enab    = reg_octrl00_018_q[27:16];
assign cfg_octrl00_afu_actag_base        = reg_octrl00_01C_q[11:0];

`ifdef ADD_AFU_CTRL01
assign cfg_octrl01_afu_control_index     = reg_octrl01_008_q[21:16];
assign cfg_octrl01_afu_unique[3:0]       = reg_octrl01_00C_q[31:28];
assign cfg_octrl01_fence_afu             = reg_octrl01_00C_q[25];
assign cfg_octrl01_enable_afu            = reg_octrl01_00C_q[24];
assign cfg_octrl01_reset_afu             = reg_octrl01_reset_timer_run_q;  // reg_octrl01_00C_q[23]; Send signal going into register
assign cfg_octrl01_terminate_valid       = reg_octrl01_terminate_valid_q;  // reg_octrl01_00C_q[20]; Send signal going into register
assign cfg_octrl01_terminate_pasid       = reg_octrl01_00C_q[19:0];
assign cfg_octrl01_pasid_length_enabled  = reg_octrl01_010_q[12:8];
assign cfg_octrl01_metadata_enabled      = reg_octrl01_014_q[30];
assign cfg_octrl01_host_tag_run_length   = reg_octrl01_014_q[29:27];
assign cfg_octrl01_pasid_base            = reg_octrl01_014_q[19:0];
assign cfg_octrl01_afu_actag_len_enab    = reg_octrl01_018_q[27:16];
assign cfg_octrl01_afu_actag_base        = reg_octrl01_01C_q[11:0];
`endif

`ifdef ADD_AFU_CTRL02
assign cfg_octrl02_afu_control_index     = reg_octrl02_008_q[21:16];
assign cfg_octrl02_afu_unique[3:0]       = reg_octrl02_00C_q[31:28];
assign cfg_octrl02_fence_afu             = reg_octrl02_00C_q[25];
assign cfg_octrl02_enable_afu            = reg_octrl02_00C_q[24];
assign cfg_octrl02_reset_afu             = reg_octrl02_reset_timer_run_q;  // reg_octrl02_00C_q[23]; Send signal going into register
assign cfg_octrl02_terminate_valid       = reg_octrl02_terminate_valid_q;  // reg_octrl02_00C_q[20]; Send signal going into register
assign cfg_octrl02_terminate_pasid       = reg_octrl02_00C_q[19:0];
assign cfg_octrl02_pasid_length_enabled  = reg_octrl02_010_q[12:8];
assign cfg_octrl02_metadata_enabled      = reg_octrl02_014_q[30];
assign cfg_octrl02_host_tag_run_length   = reg_octrl02_014_q[29:27];
assign cfg_octrl02_pasid_base            = reg_octrl02_014_q[19:0];
assign cfg_octrl02_afu_actag_len_enab    = reg_octrl02_018_q[27:16];
assign cfg_octrl02_afu_actag_base        = reg_octrl02_01C_q[11:0];
`endif

`ifdef ADD_AFU_CTRL03
assign cfg_octrl03_afu_control_index     = reg_octrl03_008_q[21:16];
assign cfg_octrl03_afu_unique[3:0]       = reg_octrl03_00C_q[31:28];
assign cfg_octrl03_fence_afu             = reg_octrl03_00C_q[25];
assign cfg_octrl03_enable_afu            = reg_octrl03_00C_q[24];
assign cfg_octrl03_reset_afu             = reg_octrl03_reset_timer_run_q;  // reg_octrl03_00C_q[23]; Send signal going into register
assign cfg_octrl03_terminate_valid       = reg_octrl03_terminate_valid_q;  // reg_octrl03_00C_q[20]; Send signal going into register
assign cfg_octrl03_terminate_pasid       = reg_octrl03_00C_q[19:0];
assign cfg_octrl03_pasid_length_enabled  = reg_octrl03_010_q[12:8];
assign cfg_octrl03_metadata_enabled      = reg_octrl03_014_q[30];
assign cfg_octrl03_host_tag_run_length   = reg_octrl03_014_q[29:27];
assign cfg_octrl03_pasid_base            = reg_octrl03_014_q[19:0];
assign cfg_octrl03_afu_actag_len_enab    = reg_octrl03_018_q[27:16];
assign cfg_octrl03_afu_actag_base        = reg_octrl03_01C_q[11:0];
`endif
endmodule 
