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
// Title    : cfg_func0.v
// Function : This file is intended to be useful for any OpenCAPI AFU design. It provides the configuration spaces
//            contained in Function 0.
// 
//  NOTE: Use `define variables to expose or remove ports 1, 2, and 3. The `define can be included in this file
//        or applied externally in the environment when performing simulation or synthesis. If applied here, uncomment one or 
//        more of the lines below. Port 0 always exists, and while not a requirement, the intent is to add ports in increasing 
//        numerical order to make tracing and debug eaiser.
//        Important: Wherever it is applied, the define must apply to both cfg_func0.v and cfg_seq.v 
// `define EXPOSE_CFG_PORT_1
// `define EXPOSE_CFG_PORT_2
// `define EXPOSE_CFG_PORT_3
//
// -------------------------------------------------------------------
// Modification History :
//                                |Version    |     |Author   |Description of change
//                                |-----------|     |-------- |---------------------
  `define CFG_FUNC0_VERSION        16_Jan_2018   //            Change reg_ovsec_004_q[31:20] from h30 to h38. Add AXI expander bits.
// -------------------------------------------------------------------

// This define contains the snapshot version of the CFG implementation. Overlay it each time a version snapshot is made.
// Format is: yymmddvv where yy = year (i.e. 17 = 2017), mm = month, dd = day, vv = version made on that day, starting with 00
// Note: The line below should remain untouched, else the script making CFG snapshots will not find it. 
`define OVSEC0_CFG_VERSION 32'h18011600

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
`define VPD_BASE    12'h040
`define VPD_LAST    12'h047
`define VPD_PTR     8'h40

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
`define DSN_BASE    12'h100
`define DSN_LAST    12'h10B

//`define PASID_BASE  12'h100
//`define PASID_LAST  12'h107

// Because the portnum gates off all but 1 copy of OTL, only one OTL config address is used
`define OTL_BASE    12'h200
`define OTL_LAST    12'h28F

`define OFUNC_BASE  12'h300
`define OFUNC_LAST  12'h30F

//`define OINFO_BASE  12'h400
//`define OINFO_LAST  12'h413

//`define OCTRL00_BASE  12'h500
//`define OCTRL00_LAST  12'h51F

// Note: Each Function can contain a unique VSEC structure. To keep them apart in verification,
//       use `OVSEC0 and `OVSECn (n=1-7) as the define names. However within the logic, the signals and registers
//       and just use _ovsec_ since the location of them in cfg_func0 and cfg_func uniquely identify them.
//       Keeping _ovsec_ the same makes it easier to copy/paste common logic between the function instances.
//
`define OVSEC0_BASE  12'h600
`define OVSEC0_LAST  12'h637
 
 
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
// Note about BAR registers:
//   The 3 MMIO BAR and Expansion ROM BAR registers should be written to all 1's, then read back. The low order bits that are 0 
//   tell software the size of the space that BAR register manages. MMIO spaces include both MMIO and all PASID registers.
// ==============================================================================================================================


module cfg_func0
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
    // Device Serial Number
  , input   [63:0] cfg_ro_dsn_serial_number           // = 64'hDEAD_DEAD_DEAD_DEAD
    // OpenCAPI TL - port 0
  , input    [7:0] cfg_ro_otl0_tl_major_vers_capbl    // =  8'h03
  , input    [7:0] cfg_ro_otl0_tl_minor_vers_capbl    // =  8'h00
  , input   [63:0] cfg_ro_otl0_rcv_tmpl_capbl         // = 64'h0000_0000_0000_0001   // Template 0 must be supported
  , input  [255:0] cfg_ro_otl0_rcv_rate_tmpl_capbl    // = { {63{4'b0000}},4'b1111 } // Template 0 supports slowest speed of '1111'
`ifdef EXPOSE_CFG_PORT_1
    // OpenCAPI TL - port 1
  , input    [7:0] cfg_ro_otl1_tl_major_vers_capbl    // =  8'h03
  , input    [7:0] cfg_ro_otl1_tl_minor_vers_capbl    // =  8'h00
  , input   [63:0] cfg_ro_otl1_rcv_tmpl_capbl         // = 64'h0000_0000_0000_0001   // Template 0 must be supported
  , input  [255:0] cfg_ro_otl1_rcv_rate_tmpl_capbl    // = { {63{4'b0000}},4'b1111 } // Template 0 supports slowest speed of '1111'
`endif    
`ifdef EXPOSE_CFG_PORT_2
    // OpenCAPI TL - port 2
  , input    [7:0] cfg_ro_otl2_tl_major_vers_capbl    // =  8'h03
  , input    [7:0] cfg_ro_otl2_tl_minor_vers_capbl    // =  8'h00
  , input   [63:0] cfg_ro_otl2_rcv_tmpl_capbl         // = 64'h0000_0000_0000_0001   // Template 0 must be supported
  , input  [255:0] cfg_ro_otl2_rcv_rate_tmpl_capbl    // = { {63{4'b0000}},4'b1111 } // Template 0 supports slowest speed of '1111'
`endif    
`ifdef EXPOSE_CFG_PORT_3
    // OpenCAPI TL - port 3
  , input    [7:0] cfg_ro_otl3_tl_major_vers_capbl    // =  8'h03
  , input    [7:0] cfg_ro_otl3_tl_minor_vers_capbl    // =  8'h00
  , input   [63:0] cfg_ro_otl3_rcv_tmpl_capbl         // = 64'h0000_0000_0000_0001   // Template 0 must be supported
  , input  [255:0] cfg_ro_otl3_rcv_rate_tmpl_capbl    // = { {63{4'b0000}},4'b1111 } // Template 0 supports slowest speed of '1111'
`endif    
    // Function
  , input    [7:0] cfg_ro_ofunc_reset_duration        // =  8'h10                    // Number of cycles Function reset is active (00=255 cycles)
  , input          cfg_ro_ofunc_afu_present           // =  1'b0                     // Func0=0, FuncN=1 (likely)
  , input    [5:0] cfg_ro_ofunc_max_afu_index         // =  6'b00_0000               // Default is AFU number 0

    // Vendor DVSEC - Version Control
  , input   [31:0] cfg_ro_ovsec_tlx0_version          // Version information for Port 0 TLX
  , input   [31:0] cfg_ro_ovsec_tlx1_version          // Version information for Port 1 TLX      
  , input   [31:0] cfg_ro_ovsec_tlx2_version          // Version information for Port 2 TLX      
  , input   [31:0] cfg_ro_ovsec_tlx3_version          // Version information for Port 3 TLX    
  , input   [31:0] cfg_ro_ovsec_dlx0_version          // Version information for Port 0 DLX
  , input   [31:0] cfg_ro_ovsec_dlx1_version          // Version information for Port 1 DLX      
  , input   [31:0] cfg_ro_ovsec_dlx2_version          // Version information for Port 2 DLX      
  , input   [31:0] cfg_ro_ovsec_dlx3_version          // Version information for Port 3 DLX     

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

    // Individual fields from configuration registers
    // CSH
  , output         cfg_csh_memory_space
  , output  [63:0] cfg_csh_mmio_bar0
  , output  [63:0] cfg_csh_mmio_bar1
  , output  [63:0] cfg_csh_mmio_bar2
  , output  [31:0] cfg_csh_expansion_ROM_bar 
  , output         cfg_csh_expansion_ROM_enable
    // OTL Port 0
  , output   [7:0] cfg_otl0_tl_major_vers_config 
  , output   [7:0] cfg_otl0_tl_minor_vers_config
  , output   [3:0] cfg_otl0_long_backoff_timer
  , output   [3:0] cfg_otl0_short_backoff_timer
  , output  [63:0] cfg_otl0_xmt_tmpl_config
  , output [255:0] cfg_otl0_xmt_rate_tmpl_config  
`ifdef EXPOSE_CFG_PORT_1
    // OTL Port 1
  , output   [7:0] cfg_otl1_tl_major_vers_config 
  , output   [7:0] cfg_otl1_tl_minor_vers_config
  , output   [3:0] cfg_otl1_long_backoff_timer
  , output   [3:0] cfg_otl1_short_backoff_timer
  , output  [63:0] cfg_otl1_xmt_tmpl_config
  , output [255:0] cfg_otl1_xmt_rate_tmpl_config  
`endif
`ifdef EXPOSE_CFG_PORT_2
    // OTL Port 2
  , output   [7:0] cfg_otl2_tl_major_vers_config 
  , output   [7:0] cfg_otl2_tl_minor_vers_config
  , output   [3:0] cfg_otl2_long_backoff_timer
  , output   [3:0] cfg_otl2_short_backoff_timer
  , output  [63:0] cfg_otl2_xmt_tmpl_config
  , output [255:0] cfg_otl2_xmt_rate_tmpl_config  
`endif
`ifdef EXPOSE_CFG_PORT_3
    // OTL Port 3
  , output   [7:0] cfg_otl3_tl_major_vers_config 
  , output   [7:0] cfg_otl3_tl_minor_vers_config
  , output   [3:0] cfg_otl3_long_backoff_timer
  , output   [3:0] cfg_otl3_short_backoff_timer
  , output  [63:0] cfg_otl3_xmt_tmpl_config
  , output [255:0] cfg_otl3_xmt_rate_tmpl_config  
`endif
    // OFUNC
  , output         cfg_ofunc_function_reset       // When 1, reset this Function
  , output  [11:0] cfg_ofunc_func_actag_base
  , output  [11:0] cfg_ofunc_func_actag_len_enab

   // Interface to VPD 
  , output  [14:0] cfg_vpd_addr           // VPD address for write or read
  , output         cfg_vpd_wren           // Set to 1 to write a location, hold at 1 until see 'vpd done' = 1 then clear to 0
  , output  [31:0] cfg_vpd_wdata          // Contains data to write to VPD register (valid while wren=1)
  , output         cfg_vpd_rden           // Set to 1 to read  a location, hold at 1 until see 'vpd done' = 1 then clear to 0
  , input   [31:0] vpd_cfg_rdata          // Contains data read back from VPD register (valid when rden=1 and 'vpd done'=1)
  , input          vpd_cfg_done           // VPD pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
 
   // Interface to FLASH control logic
  , output   [1:0] cfg_flsh_devsel        // Select AXI4-Lite device to target
  , output  [13:0] cfg_flsh_addr          // Read or write address to selected target
  , output         cfg_flsh_wren          // Set to 1 to write a location, hold at 1 until see 'flsh_done' = 1 then clear to 0
  , output  [31:0] cfg_flsh_wdata         // Contains data to write to FLASH register (valid while wren=1)
  , output         cfg_flsh_rden          // Set to 1 to read  a location, hold at 1 until see 'flsh_done' = 1 the clear to 0
  , input   [31:0] flsh_cfg_rdata         // Contains data read back from FLASH register (valid when rden=1 and 'flsh_done'=1)
  , input          flsh_cfg_done          // FLASH logic pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
  , input    [7:0] flsh_cfg_status        // Device Specific status information
  , input    [1:0] flsh_cfg_bresp         // Write response from selected AXI4-Lite device
  , input    [1:0] flsh_cfg_rresp         // Read  response from selected AXI4-Lite device
  , output         cfg_flsh_expand_enable // When 1, expand/collapse 4 bytes of data into four, 1 byte AXI operations
  , output         cfg_flsh_expand_dir    // When 0, expand bytes [3:0] in order 0,1,2,3 . When 1, expand in order 3,2,1,0 .

) ;

// ----------------------------------
// Latch the inputs
// ----------------------------------
reg  [2:0] function_q;
reg  [1:0] portnum_q;
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
    portnum_q  <= cfg_portnum;
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
    if      (function_q != cfg_ro_function)                                                   // Operation is for a different Function
      begin  wr_be = 4'b0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                // Set no write enable or read, no error

    else if (wr_1B_q==1'b0 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b0)                      // No operation is selected
      begin  wr_be = 4'b0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end                // Set no write enable or read, no error

    else if (wr_1B_q==1'b0 && wr_2B_q==1'b0 && wr_4B_q==1'b0 && rd_q==1'b1)                      // Operation is a legal read (no addr alignment check)
      begin  wr_be = 4'b0000;   do_read = 1'b1;  bad_op_or_align_d = 1'b0; end                // Set 'do_read' and no write bits

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

    else                                                                                      // Operation is illegal (bad combination of strobes)
      begin  wr_be = 4'b0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b1; end                // Set no write enable or read, flag error

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


wire sel_vpd_000; 
wire sel_vpd_004;

assign sel_vpd_000 = (addr_q >= (`VPD_BASE + 12'h000) && addr_q < (`VPD_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_vpd_004 = (addr_q >= (`VPD_BASE + 12'h004) && addr_q < (`VPD_BASE + 12'h008)) ? 1'b1 : 1'b0;


wire sel_dsn_000; 
wire sel_dsn_004;
wire sel_dsn_008;

assign sel_dsn_000 = (addr_q >= (`DSN_BASE + 12'h000) && addr_q < (`DSN_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_dsn_004 = (addr_q >= (`DSN_BASE + 12'h004) && addr_q < (`DSN_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_dsn_008 = (addr_q >= (`DSN_BASE + 12'h008) && addr_q < (`DSN_BASE + 12'h00C)) ? 1'b1 : 1'b0;


// TLX Port 0
wire sel_otl0_000;          
wire sel_otl0_004;
wire sel_otl0_008;
wire sel_otl0_00C;
wire sel_otl0_010;           
wire sel_otl0_014;
wire sel_otl0_018;
wire sel_otl0_01C;
wire sel_otl0_020;           
wire sel_otl0_024;
wire sel_otl0_028;
wire sel_otl0_02C;
wire sel_otl0_030;           
wire sel_otl0_034;
wire sel_otl0_038;
wire sel_otl0_03C;
wire sel_otl0_040;           
wire sel_otl0_044;
wire sel_otl0_048;
wire sel_otl0_04C;
wire sel_otl0_050;           
wire sel_otl0_054;
wire sel_otl0_058;
wire sel_otl0_05C;
wire sel_otl0_060;           
wire sel_otl0_064;
wire sel_otl0_068;
wire sel_otl0_06C;
//re sel_otl0_070;
//re sel_otl0_074; 
//re sel_otl0_078; 
//re sel_otl0_07C; 
//re sel_otl0_080; 
//re sel_otl0_084; 
//re sel_otl0_088;  
//re sel_otl0_08C; 

assign sel_otl0_000 = (addr_q >= (`OTL_BASE + 12'h000) && addr_q < (`OTL_BASE + 12'h004) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_004 = (addr_q >= (`OTL_BASE + 12'h004) && addr_q < (`OTL_BASE + 12'h008) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_008 = (addr_q >= (`OTL_BASE + 12'h008) && addr_q < (`OTL_BASE + 12'h00C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_00C = (addr_q >= (`OTL_BASE + 12'h00C) && addr_q < (`OTL_BASE + 12'h010) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_010 = (addr_q >= (`OTL_BASE + 12'h010) && addr_q < (`OTL_BASE + 12'h014) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_014 = (addr_q >= (`OTL_BASE + 12'h014) && addr_q < (`OTL_BASE + 12'h018) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_018 = (addr_q >= (`OTL_BASE + 12'h018) && addr_q < (`OTL_BASE + 12'h01C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_01C = (addr_q >= (`OTL_BASE + 12'h01C) && addr_q < (`OTL_BASE + 12'h020) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_020 = (addr_q >= (`OTL_BASE + 12'h020) && addr_q < (`OTL_BASE + 12'h024) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_024 = (addr_q >= (`OTL_BASE + 12'h024) && addr_q < (`OTL_BASE + 12'h028) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_028 = (addr_q >= (`OTL_BASE + 12'h028) && addr_q < (`OTL_BASE + 12'h02C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_02C = (addr_q >= (`OTL_BASE + 12'h02C) && addr_q < (`OTL_BASE + 12'h030) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_030 = (addr_q >= (`OTL_BASE + 12'h030) && addr_q < (`OTL_BASE + 12'h034) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_034 = (addr_q >= (`OTL_BASE + 12'h034) && addr_q < (`OTL_BASE + 12'h038) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_038 = (addr_q >= (`OTL_BASE + 12'h038) && addr_q < (`OTL_BASE + 12'h03C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_03C = (addr_q >= (`OTL_BASE + 12'h03C) && addr_q < (`OTL_BASE + 12'h040) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_040 = (addr_q >= (`OTL_BASE + 12'h040) && addr_q < (`OTL_BASE + 12'h044) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_044 = (addr_q >= (`OTL_BASE + 12'h044) && addr_q < (`OTL_BASE + 12'h048) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_048 = (addr_q >= (`OTL_BASE + 12'h048) && addr_q < (`OTL_BASE + 12'h04C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_04C = (addr_q >= (`OTL_BASE + 12'h04C) && addr_q < (`OTL_BASE + 12'h050) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_050 = (addr_q >= (`OTL_BASE + 12'h050) && addr_q < (`OTL_BASE + 12'h054) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_054 = (addr_q >= (`OTL_BASE + 12'h054) && addr_q < (`OTL_BASE + 12'h058) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_058 = (addr_q >= (`OTL_BASE + 12'h058) && addr_q < (`OTL_BASE + 12'h05C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_05C = (addr_q >= (`OTL_BASE + 12'h05C) && addr_q < (`OTL_BASE + 12'h060) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_060 = (addr_q >= (`OTL_BASE + 12'h060) && addr_q < (`OTL_BASE + 12'h064) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_064 = (addr_q >= (`OTL_BASE + 12'h064) && addr_q < (`OTL_BASE + 12'h068) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_068 = (addr_q >= (`OTL_BASE + 12'h068) && addr_q < (`OTL_BASE + 12'h06C) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
assign sel_otl0_06C = (addr_q >= (`OTL_BASE + 12'h06C) && addr_q < (`OTL_BASE + 12'h070) && portnum_q == 2'b00) ? 1'b1 : 1'b0;
//sign sel_otl0_070 = (addr_q >= (`OTL_BASE + 12'h070) && addr_q < (`OTL_BASE + 12'h074) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_074 = (addr_q >= (`OTL_BASE + 12'h074) && addr_q < (`OTL_BASE + 12'h078) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_078 = (addr_q >= (`OTL_BASE + 12'h078) && addr_q < (`OTL_BASE + 12'h07C) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_07C = (addr_q >= (`OTL_BASE + 12'h07C) && addr_q < (`OTL_BASE + 12'h080) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_080 = (addr_q >= (`OTL_BASE + 12'h080) && addr_q < (`OTL_BASE + 12'h084) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_084 = (addr_q >= (`OTL_BASE + 12'h084) && addr_q < (`OTL_BASE + 12'h088) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_088 = (addr_q >= (`OTL_BASE + 12'h088) && addr_q < (`OTL_BASE + 12'h08C) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 
//sign sel_otl0_08C = (addr_q >= (`OTL_BASE + 12'h08C) && addr_q < (`OTL_BASE + 12'h090) && portnum_q == 2'b00) ? 1'b1 : 1'b0; 


`ifdef EXPOSE_CFG_PORT_1
// TLX Port 1
wire sel_otl1_000;          
wire sel_otl1_004;
wire sel_otl1_008;
wire sel_otl1_00C;
wire sel_otl1_010;           
wire sel_otl1_014;
wire sel_otl1_018;
wire sel_otl1_01C;
wire sel_otl1_020;           
wire sel_otl1_024;
wire sel_otl1_028;
wire sel_otl1_02C;
wire sel_otl1_030;           
wire sel_otl1_034;
wire sel_otl1_038;
wire sel_otl1_03C;
wire sel_otl1_040;           
wire sel_otl1_044;
wire sel_otl1_048;
wire sel_otl1_04C;
wire sel_otl1_050;           
wire sel_otl1_054;
wire sel_otl1_058;
wire sel_otl1_05C;
wire sel_otl1_060;           
wire sel_otl1_064;
wire sel_otl1_068;
wire sel_otl1_06C;
//re sel_otl1_070;
//re sel_otl1_074; 
//re sel_otl1_078; 
//re sel_otl1_07C; 
//re sel_otl1_080; 
//re sel_otl1_084; 
//re sel_otl1_088;  
//re sel_otl1_08C; 

assign sel_otl1_000 = (addr_q >= (`OTL_BASE + 12'h000) && addr_q < (`OTL_BASE + 12'h004) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_004 = (addr_q >= (`OTL_BASE + 12'h004) && addr_q < (`OTL_BASE + 12'h008) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_008 = (addr_q >= (`OTL_BASE + 12'h008) && addr_q < (`OTL_BASE + 12'h00C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_00C = (addr_q >= (`OTL_BASE + 12'h00C) && addr_q < (`OTL_BASE + 12'h010) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_010 = (addr_q >= (`OTL_BASE + 12'h010) && addr_q < (`OTL_BASE + 12'h014) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_014 = (addr_q >= (`OTL_BASE + 12'h014) && addr_q < (`OTL_BASE + 12'h018) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_018 = (addr_q >= (`OTL_BASE + 12'h018) && addr_q < (`OTL_BASE + 12'h01C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_01C = (addr_q >= (`OTL_BASE + 12'h01C) && addr_q < (`OTL_BASE + 12'h020) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_020 = (addr_q >= (`OTL_BASE + 12'h020) && addr_q < (`OTL_BASE + 12'h024) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_024 = (addr_q >= (`OTL_BASE + 12'h024) && addr_q < (`OTL_BASE + 12'h028) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_028 = (addr_q >= (`OTL_BASE + 12'h028) && addr_q < (`OTL_BASE + 12'h02C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_02C = (addr_q >= (`OTL_BASE + 12'h02C) && addr_q < (`OTL_BASE + 12'h030) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_030 = (addr_q >= (`OTL_BASE + 12'h030) && addr_q < (`OTL_BASE + 12'h034) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_034 = (addr_q >= (`OTL_BASE + 12'h034) && addr_q < (`OTL_BASE + 12'h038) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_038 = (addr_q >= (`OTL_BASE + 12'h038) && addr_q < (`OTL_BASE + 12'h03C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_03C = (addr_q >= (`OTL_BASE + 12'h03C) && addr_q < (`OTL_BASE + 12'h040) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_040 = (addr_q >= (`OTL_BASE + 12'h040) && addr_q < (`OTL_BASE + 12'h044) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_044 = (addr_q >= (`OTL_BASE + 12'h044) && addr_q < (`OTL_BASE + 12'h048) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_048 = (addr_q >= (`OTL_BASE + 12'h048) && addr_q < (`OTL_BASE + 12'h04C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_04C = (addr_q >= (`OTL_BASE + 12'h04C) && addr_q < (`OTL_BASE + 12'h050) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_050 = (addr_q >= (`OTL_BASE + 12'h050) && addr_q < (`OTL_BASE + 12'h054) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_054 = (addr_q >= (`OTL_BASE + 12'h054) && addr_q < (`OTL_BASE + 12'h058) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_058 = (addr_q >= (`OTL_BASE + 12'h058) && addr_q < (`OTL_BASE + 12'h05C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_05C = (addr_q >= (`OTL_BASE + 12'h05C) && addr_q < (`OTL_BASE + 12'h060) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_060 = (addr_q >= (`OTL_BASE + 12'h060) && addr_q < (`OTL_BASE + 12'h064) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_064 = (addr_q >= (`OTL_BASE + 12'h064) && addr_q < (`OTL_BASE + 12'h068) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_068 = (addr_q >= (`OTL_BASE + 12'h068) && addr_q < (`OTL_BASE + 12'h06C) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
assign sel_otl1_06C = (addr_q >= (`OTL_BASE + 12'h06C) && addr_q < (`OTL_BASE + 12'h070) && portnum_q == 2'b01) ? 1'b1 : 1'b0;
//sign sel_otl1_070 = (addr_q >= (`OTL_BASE + 12'h070) && addr_q < (`OTL_BASE + 12'h074) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_074 = (addr_q >= (`OTL_BASE + 12'h074) && addr_q < (`OTL_BASE + 12'h078) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_078 = (addr_q >= (`OTL_BASE + 12'h078) && addr_q < (`OTL_BASE + 12'h07C) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_07C = (addr_q >= (`OTL_BASE + 12'h07C) && addr_q < (`OTL_BASE + 12'h080) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_080 = (addr_q >= (`OTL_BASE + 12'h080) && addr_q < (`OTL_BASE + 12'h084) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_084 = (addr_q >= (`OTL_BASE + 12'h084) && addr_q < (`OTL_BASE + 12'h088) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_088 = (addr_q >= (`OTL_BASE + 12'h088) && addr_q < (`OTL_BASE + 12'h08C) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
//sign sel_otl1_08C = (addr_q >= (`OTL_BASE + 12'h08C) && addr_q < (`OTL_BASE + 12'h090) && portnum_q == 2'b01) ? 1'b1 : 1'b0; 
`endif

`ifdef EXPOSE_CFG_PORT_2
// TLX Port 2
wire sel_otl2_000;          
wire sel_otl2_004;
wire sel_otl2_008;
wire sel_otl2_00C;
wire sel_otl2_010;           
wire sel_otl2_014;
wire sel_otl2_018;
wire sel_otl2_01C;
wire sel_otl2_020;           
wire sel_otl2_024;
wire sel_otl2_028;
wire sel_otl2_02C;
wire sel_otl2_030;           
wire sel_otl2_034;
wire sel_otl2_038;
wire sel_otl2_03C;
wire sel_otl2_040;           
wire sel_otl2_044;
wire sel_otl2_048;
wire sel_otl2_04C;
wire sel_otl2_050;           
wire sel_otl2_054;
wire sel_otl2_058;
wire sel_otl2_05C;
wire sel_otl2_060;           
wire sel_otl2_064;
wire sel_otl2_068;
wire sel_otl2_06C;
//re sel_otl2_070;
//re sel_otl2_074; 
//re sel_otl2_078; 
//re sel_otl2_07C; 
//re sel_otl2_080; 
//re sel_otl2_084; 
//re sel_otl2_088;  
//re sel_otl2_08C; 

assign sel_otl2_000 = (addr_q >= (`OTL_BASE + 12'h000) && addr_q < (`OTL_BASE + 12'h004) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_004 = (addr_q >= (`OTL_BASE + 12'h004) && addr_q < (`OTL_BASE + 12'h008) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_008 = (addr_q >= (`OTL_BASE + 12'h008) && addr_q < (`OTL_BASE + 12'h00C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_00C = (addr_q >= (`OTL_BASE + 12'h00C) && addr_q < (`OTL_BASE + 12'h010) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_010 = (addr_q >= (`OTL_BASE + 12'h010) && addr_q < (`OTL_BASE + 12'h014) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_014 = (addr_q >= (`OTL_BASE + 12'h014) && addr_q < (`OTL_BASE + 12'h018) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_018 = (addr_q >= (`OTL_BASE + 12'h018) && addr_q < (`OTL_BASE + 12'h01C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_01C = (addr_q >= (`OTL_BASE + 12'h01C) && addr_q < (`OTL_BASE + 12'h020) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_020 = (addr_q >= (`OTL_BASE + 12'h020) && addr_q < (`OTL_BASE + 12'h024) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_024 = (addr_q >= (`OTL_BASE + 12'h024) && addr_q < (`OTL_BASE + 12'h028) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_028 = (addr_q >= (`OTL_BASE + 12'h028) && addr_q < (`OTL_BASE + 12'h02C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_02C = (addr_q >= (`OTL_BASE + 12'h02C) && addr_q < (`OTL_BASE + 12'h030) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_030 = (addr_q >= (`OTL_BASE + 12'h030) && addr_q < (`OTL_BASE + 12'h034) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_034 = (addr_q >= (`OTL_BASE + 12'h034) && addr_q < (`OTL_BASE + 12'h038) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_038 = (addr_q >= (`OTL_BASE + 12'h038) && addr_q < (`OTL_BASE + 12'h03C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_03C = (addr_q >= (`OTL_BASE + 12'h03C) && addr_q < (`OTL_BASE + 12'h040) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_040 = (addr_q >= (`OTL_BASE + 12'h040) && addr_q < (`OTL_BASE + 12'h044) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_044 = (addr_q >= (`OTL_BASE + 12'h044) && addr_q < (`OTL_BASE + 12'h048) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_048 = (addr_q >= (`OTL_BASE + 12'h048) && addr_q < (`OTL_BASE + 12'h04C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_04C = (addr_q >= (`OTL_BASE + 12'h04C) && addr_q < (`OTL_BASE + 12'h050) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_050 = (addr_q >= (`OTL_BASE + 12'h050) && addr_q < (`OTL_BASE + 12'h054) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_054 = (addr_q >= (`OTL_BASE + 12'h054) && addr_q < (`OTL_BASE + 12'h058) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_058 = (addr_q >= (`OTL_BASE + 12'h058) && addr_q < (`OTL_BASE + 12'h05C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_05C = (addr_q >= (`OTL_BASE + 12'h05C) && addr_q < (`OTL_BASE + 12'h060) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_060 = (addr_q >= (`OTL_BASE + 12'h060) && addr_q < (`OTL_BASE + 12'h064) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_064 = (addr_q >= (`OTL_BASE + 12'h064) && addr_q < (`OTL_BASE + 12'h068) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_068 = (addr_q >= (`OTL_BASE + 12'h068) && addr_q < (`OTL_BASE + 12'h06C) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
assign sel_otl2_06C = (addr_q >= (`OTL_BASE + 12'h06C) && addr_q < (`OTL_BASE + 12'h070) && portnum_q == 2'b10) ? 1'b1 : 1'b0;
//sign sel_otl2_070 = (addr_q >= (`OTL_BASE + 12'h070) && addr_q < (`OTL_BASE + 12'h074) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_074 = (addr_q >= (`OTL_BASE + 12'h074) && addr_q < (`OTL_BASE + 12'h078) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_078 = (addr_q >= (`OTL_BASE + 12'h078) && addr_q < (`OTL_BASE + 12'h07C) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_07C = (addr_q >= (`OTL_BASE + 12'h07C) && addr_q < (`OTL_BASE + 12'h080) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_080 = (addr_q >= (`OTL_BASE + 12'h080) && addr_q < (`OTL_BASE + 12'h084) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_084 = (addr_q >= (`OTL_BASE + 12'h084) && addr_q < (`OTL_BASE + 12'h088) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_088 = (addr_q >= (`OTL_BASE + 12'h088) && addr_q < (`OTL_BASE + 12'h08C) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
//sign sel_otl2_08C = (addr_q >= (`OTL_BASE + 12'h08C) && addr_q < (`OTL_BASE + 12'h090) && portnum_q == 2'b10) ? 1'b1 : 1'b0; 
`endif

`ifdef EXPOSE_CFG_PORT_3
// TLX Port 3
wire sel_otl3_000;          
wire sel_otl3_004;
wire sel_otl3_008;
wire sel_otl3_00C;
wire sel_otl3_010;           
wire sel_otl3_014;
wire sel_otl3_018;
wire sel_otl3_01C;
wire sel_otl3_020;           
wire sel_otl3_024;
wire sel_otl3_028;
wire sel_otl3_02C;
wire sel_otl3_030;           
wire sel_otl3_034;
wire sel_otl3_038;
wire sel_otl3_03C;
wire sel_otl3_040;           
wire sel_otl3_044;
wire sel_otl3_048;
wire sel_otl3_04C;
wire sel_otl3_050;           
wire sel_otl3_054;
wire sel_otl3_058;
wire sel_otl3_05C;
wire sel_otl3_060;           
wire sel_otl3_064;
wire sel_otl3_068;
wire sel_otl3_06C;
//re sel_otl3_070;
//re sel_otl3_074; 
//re sel_otl3_078; 
//re sel_otl3_07C; 
//re sel_otl3_080; 
//re sel_otl3_084; 
//re sel_otl3_088;  
//re sel_otl3_08C; 

assign sel_otl3_000 = (addr_q >= (`OTL_BASE + 12'h000) && addr_q < (`OTL_BASE + 12'h004) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_004 = (addr_q >= (`OTL_BASE + 12'h004) && addr_q < (`OTL_BASE + 12'h008) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_008 = (addr_q >= (`OTL_BASE + 12'h008) && addr_q < (`OTL_BASE + 12'h00C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_00C = (addr_q >= (`OTL_BASE + 12'h00C) && addr_q < (`OTL_BASE + 12'h010) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_010 = (addr_q >= (`OTL_BASE + 12'h010) && addr_q < (`OTL_BASE + 12'h014) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_014 = (addr_q >= (`OTL_BASE + 12'h014) && addr_q < (`OTL_BASE + 12'h018) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_018 = (addr_q >= (`OTL_BASE + 12'h018) && addr_q < (`OTL_BASE + 12'h01C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_01C = (addr_q >= (`OTL_BASE + 12'h01C) && addr_q < (`OTL_BASE + 12'h020) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_020 = (addr_q >= (`OTL_BASE + 12'h020) && addr_q < (`OTL_BASE + 12'h024) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_024 = (addr_q >= (`OTL_BASE + 12'h024) && addr_q < (`OTL_BASE + 12'h028) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_028 = (addr_q >= (`OTL_BASE + 12'h028) && addr_q < (`OTL_BASE + 12'h02C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_02C = (addr_q >= (`OTL_BASE + 12'h02C) && addr_q < (`OTL_BASE + 12'h030) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_030 = (addr_q >= (`OTL_BASE + 12'h030) && addr_q < (`OTL_BASE + 12'h034) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_034 = (addr_q >= (`OTL_BASE + 12'h034) && addr_q < (`OTL_BASE + 12'h038) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_038 = (addr_q >= (`OTL_BASE + 12'h038) && addr_q < (`OTL_BASE + 12'h03C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_03C = (addr_q >= (`OTL_BASE + 12'h03C) && addr_q < (`OTL_BASE + 12'h040) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_040 = (addr_q >= (`OTL_BASE + 12'h040) && addr_q < (`OTL_BASE + 12'h044) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_044 = (addr_q >= (`OTL_BASE + 12'h044) && addr_q < (`OTL_BASE + 12'h048) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_048 = (addr_q >= (`OTL_BASE + 12'h048) && addr_q < (`OTL_BASE + 12'h04C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_04C = (addr_q >= (`OTL_BASE + 12'h04C) && addr_q < (`OTL_BASE + 12'h050) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_050 = (addr_q >= (`OTL_BASE + 12'h050) && addr_q < (`OTL_BASE + 12'h054) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_054 = (addr_q >= (`OTL_BASE + 12'h054) && addr_q < (`OTL_BASE + 12'h058) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_058 = (addr_q >= (`OTL_BASE + 12'h058) && addr_q < (`OTL_BASE + 12'h05C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_05C = (addr_q >= (`OTL_BASE + 12'h05C) && addr_q < (`OTL_BASE + 12'h060) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_060 = (addr_q >= (`OTL_BASE + 12'h060) && addr_q < (`OTL_BASE + 12'h064) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_064 = (addr_q >= (`OTL_BASE + 12'h064) && addr_q < (`OTL_BASE + 12'h068) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_068 = (addr_q >= (`OTL_BASE + 12'h068) && addr_q < (`OTL_BASE + 12'h06C) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
assign sel_otl3_06C = (addr_q >= (`OTL_BASE + 12'h06C) && addr_q < (`OTL_BASE + 12'h070) && portnum_q == 2'b11) ? 1'b1 : 1'b0;
//sign sel_otl3_070 = (addr_q >= (`OTL_BASE + 12'h070) && addr_q < (`OTL_BASE + 12'h074) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_074 = (addr_q >= (`OTL_BASE + 12'h074) && addr_q < (`OTL_BASE + 12'h078) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_078 = (addr_q >= (`OTL_BASE + 12'h078) && addr_q < (`OTL_BASE + 12'h07C) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_07C = (addr_q >= (`OTL_BASE + 12'h07C) && addr_q < (`OTL_BASE + 12'h080) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_080 = (addr_q >= (`OTL_BASE + 12'h080) && addr_q < (`OTL_BASE + 12'h084) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_084 = (addr_q >= (`OTL_BASE + 12'h084) && addr_q < (`OTL_BASE + 12'h088) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_088 = (addr_q >= (`OTL_BASE + 12'h088) && addr_q < (`OTL_BASE + 12'h08C) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
//sign sel_otl3_08C = (addr_q >= (`OTL_BASE + 12'h08C) && addr_q < (`OTL_BASE + 12'h090) && portnum_q == 2'b11) ? 1'b1 : 1'b0; 
`endif


wire sel_ofunc_000;          
wire sel_ofunc_004;
wire sel_ofunc_008;
wire sel_ofunc_00C;

assign sel_ofunc_000 = (addr_q >= (`OFUNC_BASE + 12'h000) && addr_q < (`OFUNC_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_ofunc_004 = (addr_q >= (`OFUNC_BASE + 12'h004) && addr_q < (`OFUNC_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_ofunc_008 = (addr_q >= (`OFUNC_BASE + 12'h008) && addr_q < (`OFUNC_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_ofunc_00C = (addr_q >= (`OFUNC_BASE + 12'h00C) && addr_q < (`OFUNC_BASE + 12'h010)) ? 1'b1 : 1'b0;


wire sel_ovsec_000;          
wire sel_ovsec_004;
wire sel_ovsec_008;
wire sel_ovsec_00C;
wire sel_ovsec_010;          
wire sel_ovsec_014;
wire sel_ovsec_018;
wire sel_ovsec_01C;
wire sel_ovsec_020;          
wire sel_ovsec_024;
wire sel_ovsec_028;
wire sel_ovsec_02C;

assign sel_ovsec_000 = (addr_q >= (`OVSEC0_BASE + 12'h000) && addr_q < (`OVSEC0_BASE + 12'h004)) ? 1'b1 : 1'b0;
assign sel_ovsec_004 = (addr_q >= (`OVSEC0_BASE + 12'h004) && addr_q < (`OVSEC0_BASE + 12'h008)) ? 1'b1 : 1'b0;
assign sel_ovsec_008 = (addr_q >= (`OVSEC0_BASE + 12'h008) && addr_q < (`OVSEC0_BASE + 12'h00C)) ? 1'b1 : 1'b0;
assign sel_ovsec_00C = (addr_q >= (`OVSEC0_BASE + 12'h00C) && addr_q < (`OVSEC0_BASE + 12'h010)) ? 1'b1 : 1'b0;
assign sel_ovsec_010 = (addr_q >= (`OVSEC0_BASE + 12'h010) && addr_q < (`OVSEC0_BASE + 12'h014)) ? 1'b1 : 1'b0;
assign sel_ovsec_014 = (addr_q >= (`OVSEC0_BASE + 12'h014) && addr_q < (`OVSEC0_BASE + 12'h018)) ? 1'b1 : 1'b0;
assign sel_ovsec_018 = (addr_q >= (`OVSEC0_BASE + 12'h018) && addr_q < (`OVSEC0_BASE + 12'h01C)) ? 1'b1 : 1'b0;
assign sel_ovsec_01C = (addr_q >= (`OVSEC0_BASE + 12'h01C) && addr_q < (`OVSEC0_BASE + 12'h020)) ? 1'b1 : 1'b0;
assign sel_ovsec_020 = (addr_q >= (`OVSEC0_BASE + 12'h020) && addr_q < (`OVSEC0_BASE + 12'h024)) ? 1'b1 : 1'b0;
assign sel_ovsec_024 = (addr_q >= (`OVSEC0_BASE + 12'h024) && addr_q < (`OVSEC0_BASE + 12'h028)) ? 1'b1 : 1'b0;
assign sel_ovsec_028 = (addr_q >= (`OVSEC0_BASE + 12'h028) && addr_q < (`OVSEC0_BASE + 12'h02C)) ? 1'b1 : 1'b0;
assign sel_ovsec_02C = (addr_q >= (`OVSEC0_BASE + 12'h02C) && addr_q < (`OVSEC0_BASE + 12'h030)) ? 1'b1 : 1'b0;
assign sel_ovsec_030 = (addr_q >= (`OVSEC0_BASE + 12'h030) && addr_q < (`OVSEC0_BASE + 12'h034)) ? 1'b1 : 1'b0;
assign sel_ovsec_034 = (addr_q >= (`OVSEC0_BASE + 12'h034) && addr_q < (`OVSEC0_BASE + 12'h038)) ? 1'b1 : 1'b0;


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
                                      (addr_q >= `VPD_BASE              && addr_q <= `VPD_LAST          ) ||
                                      (addr_q >= `DSN_BASE              && addr_q <= `DSN_LAST          ) ||
//                                    (addr_q >= `PASID_BASE            && addr_q <= `PASID_LAST        ) ||
                                      (addr_q >= `OTL_BASE              && addr_q <= `OTL_LAST          ) ||
                                      (addr_q >= `OFUNC_BASE            && addr_q <= `OFUNC_LAST        ) ||
//                                    (addr_q >= `OINFO_BASE            && addr_q <= `OINFO_LAST        ) ||
//                                    (addr_q >= `OCTRL00_BASE          && addr_q <= `OCTRL00_LAST      ) ||
                                      (addr_q >= `OVSEC0_BASE           && addr_q <= `OVSEC0_LAST       ) 
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

`include "cfg_func0_init.v" 

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
assign reg_csh_034_q[ 7: 0] = `VPD_PTR;     
assign reg_csh_034_rdata = (sel_csh_034 == 1'b1 && do_read == 1'b1) ? reg_csh_034_q : 32'h00000000;


assign reg_csh_038_q[31: 0] = 32'h0000_0000;      
assign reg_csh_038_rdata = (sel_csh_038 == 1'b1 && do_read == 1'b1) ? reg_csh_038_q : 32'h00000000;


assign reg_csh_03C_q[31: 0] = 32'h0000_0000;   
assign reg_csh_03C_rdata = (sel_csh_03C == 1'b1 && do_read == 1'b1) ? reg_csh_03C_q : 32'h00000000;


// ..............................................
// @@@ VPD
// ..............................................

// The VPD interface is designed such that:
// output [14:0] cfg_vpd_addr        // VPD address for write or read
// output        cfg_vpd_wren        // Set to 1 to write a location, hold at 1 until see 'vpd done' = 1 then clear to 0
// output [31:0] cfg_vpd_wdata       // Contains data to write to VPD register (valid while wren=1)
// output        cfg_vpd_rden        // Set to 1 to read  a location, hold at 1 until see 'vpd done' = 1 then clear to 0
// input  [31:0] vpd_cfg_rdata       // Contains data read back from VPD register (valid when rden=1 and 'vpd done'=1)
// input         vpd_cfg_done        // VPD pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
reg         vpd_flag_changing;
reg         vpd_flag_bit;
reg         vpd_wren;
reg         vpd_rden;
reg  [31:0] vpd_data;


reg  [31:0] reg_vpd_000_q;
reg  [31:0] reg_vpd_004_q;

wire [31:0] reg_vpd_000_rdata;
wire [31:0] reg_vpd_004_rdata;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_vpd_000_q <= reg_vpd_000_init;   // Load initial value during reset
    else if (sel_vpd_000 == 1'b1)                             // If selected, write any byte that is active
      begin
        reg_vpd_000_q[   31] <= vpd_flag_bit;
        reg_vpd_000_q[30:24] <= (wr_be[3] == 1'b1) ? wdata_q[30:24] : reg_vpd_000_q[30:24];
        reg_vpd_000_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_vpd_000_q[23:16];
        reg_vpd_000_q[15: 8] <= 8'h00;  // This is the last Capability structure
        reg_vpd_000_q[ 7: 0] <= 8'h03;
      end
    else
      begin
        reg_vpd_000_q[   31] <= vpd_flag_bit;         // To enable auto changing of it, 'vpd_flag_bit' controls what bit 31 value all the time even when reg is not selected
        reg_vpd_000_q[30: 0] <= reg_vpd_000_q[30:0];  // Hold value in rest of the bits when register is not selected
      end
  end
assign reg_vpd_000_rdata = (sel_vpd_000 == 1'b1 && do_read == 1'b1) ? reg_vpd_000_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_vpd_004_q <= reg_vpd_004_init;   // Load initial value during reset
    else if (sel_vpd_004 == 1'b1)                             // If selected, write any byte that is active
      begin
        reg_vpd_004_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : vpd_data[31:24];   
        reg_vpd_004_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : vpd_data[23:16];   
        reg_vpd_004_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : vpd_data[15: 8];   
        reg_vpd_004_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : vpd_data[ 7: 0];   
      end
    else                 
        reg_vpd_004_q <= vpd_data;   // To enable auto changing of it, 'vpd_data' controls value all the time even when reg is not selected
  end
assign reg_vpd_004_rdata = (sel_vpd_004 == 1'b1 && do_read == 1'b1) ? reg_vpd_004_q : 32'h00000000;


// VPD interface control logic

always @(*)    // Combinational
  if (sel_vpd_000 == 1'b1 && wr_be[3] == 1'b1)   // Detect when Flag & VPD Address are written
    vpd_flag_changing = 1'b1;
  else
    vpd_flag_changing = 1'b0;

// NOTE: Simultaneously encountering 'config_write' and 'vpd done' branches is prevented because software is required by
//       protocol to poll FLAG to make sure current operation is over before starting the next write command.
always @(*)    // Combinational
  if (reset_q == 1'b1)  
    vpd_flag_bit = reg_vpd_000_init[31];   // Initial value
  else if (vpd_flag_changing == 1'b1)
    vpd_flag_bit = wdata_q[31];            // config_write is changing the Flag bit
  else if (vpd_cfg_done == 1'b1)
    vpd_flag_bit = ~reg_vpd_000_q[31];     // The current operation is complete, so invert the bit
  else
    vpd_flag_bit = reg_vpd_000_q[31];      // Hold value (no command is in progress, or a command is in progress that isn't finished yet)


// Note: Don't make wren/rden logic combinational so 'vpd_rden' will stay around 1 cycle longer than 'vpd done', allowing 'vpd_data' to update properly
always @(posedge(clock))    
  if (reset_q == 1'b1)                                        // Set inactive initially
    begin
      vpd_wren <= 1'b0;
      vpd_rden <= 1'b0;
    end    
  else if (vpd_flag_changing == 1'b1 && wdata_q[31] == 1'b0)  // Starting a read command
    begin
      vpd_wren <= 1'b0;
      vpd_rden <= 1'b1;
    end
  else if (vpd_flag_changing == 1'b1 && wdata_q[31] == 1'b1)  // Starting a write command
    begin
      vpd_wren <= 1'b1;
      vpd_rden <= 1'b0;
    end
  else if (vpd_cfg_done == 1'b1)                              // Current command is complete, clear enable that was active
    begin
      vpd_wren <= 1'b0;
      vpd_rden <= 1'b0;
    end
  else                                                        // Hold value
    begin
      vpd_wren <= vpd_wren;
      vpd_rden <= vpd_rden;
    end

always @(*)    // Combinational
  if (vpd_rden == 1'b1 && vpd_cfg_done == 1'b1)
    vpd_data = vpd_cfg_rdata;                                 // When read data arrives, load it into reg_vpd_004
  else
    vpd_data = reg_vpd_004_q;                                 // Otherwise hold the reg contents. config_write data takes priority in the reg equations.

assign cfg_vpd_addr  = reg_vpd_000_q[30:16];
assign cfg_vpd_wdata = reg_vpd_004_q[31:0];
assign cfg_vpd_wren  = vpd_wren;
assign cfg_vpd_rden  = vpd_rden;


// ..............................................
// @@@ DSN
// ..............................................

wire [31:0] reg_dsn_000_q;
wire [31:0] reg_dsn_004_q;
wire [31:0] reg_dsn_008_q;

wire [31:0] reg_dsn_000_rdata;
wire [31:0] reg_dsn_004_rdata;
wire [31:0] reg_dsn_008_rdata;


assign reg_dsn_000_q[31:0] = {`OTL_BASE, 4'h1, 16'h0003};  
assign reg_dsn_000_rdata = (sel_dsn_000 == 1'b1 && do_read == 1'b1) ? reg_dsn_000_q : 32'h00000000;


assign reg_dsn_004_q[31:0] = cfg_ro_dsn_serial_number[31:0]; 
assign reg_dsn_004_rdata = (sel_dsn_004 == 1'b1 && do_read == 1'b1) ? reg_dsn_004_q : 32'h00000000;


assign reg_dsn_008_q[31:0] = cfg_ro_dsn_serial_number[63:32]; 
assign reg_dsn_008_rdata = (sel_dsn_008 == 1'b1 && do_read == 1'b1) ? reg_dsn_008_q : 32'h00000000;


// ..............................................
// @@@ PASID
// ..............................................

// Placeholder for future changes


// ..............................................
// @@@ OTL0
// ..............................................


wire [31:0] reg_otl0_000_q;   
wire [31:0] reg_otl0_004_q;   
wire [31:0] reg_otl0_008_q;
wire [31:0] reg_otl0_00C_q;
reg  [31:0] reg_otl0_010_q;
wire [31:0] reg_otl0_014_q;
wire [31:0] reg_otl0_018_q;
wire [31:0] reg_otl0_01C_q;   
reg  [31:0] reg_otl0_020_q;   
reg  [31:0] reg_otl0_024_q;
wire [31:0] reg_otl0_028_q;
wire [31:0] reg_otl0_02C_q;
wire [31:0] reg_otl0_030_q;   
wire [31:0] reg_otl0_034_q;   
wire [31:0] reg_otl0_038_q;   
wire [31:0] reg_otl0_03C_q;   
wire [31:0] reg_otl0_040_q;  
wire [31:0] reg_otl0_044_q;  
wire [31:0] reg_otl0_048_q;  
wire [31:0] reg_otl0_04C_q;  
reg  [31:0] reg_otl0_050_q;
reg  [31:0] reg_otl0_054_q;
reg  [31:0] reg_otl0_058_q;
reg  [31:0] reg_otl0_05C_q;
reg  [31:0] reg_otl0_060_q;
reg  [31:0] reg_otl0_064_q;
reg  [31:0] reg_otl0_068_q;
reg  [31:0] reg_otl0_06C_q;

wire [31:0] reg_otl0_000_rdata; 
wire [31:0] reg_otl0_004_rdata; 
wire [31:0] reg_otl0_008_rdata;
wire [31:0] reg_otl0_00C_rdata; 
wire [31:0] reg_otl0_010_rdata;
wire [31:0] reg_otl0_014_rdata;
wire [31:0] reg_otl0_018_rdata;
wire [31:0] reg_otl0_01C_rdata;
wire [31:0] reg_otl0_020_rdata; 
wire [31:0] reg_otl0_024_rdata;
wire [31:0] reg_otl0_028_rdata;
wire [31:0] reg_otl0_02C_rdata;
wire [31:0] reg_otl0_030_rdata; 
wire [31:0] reg_otl0_034_rdata; 
wire [31:0] reg_otl0_038_rdata; 
wire [31:0] reg_otl0_03C_rdata; 
wire [31:0] reg_otl0_040_rdata; 
wire [31:0] reg_otl0_044_rdata; 
wire [31:0] reg_otl0_048_rdata; 
wire [31:0] reg_otl0_04C_rdata; 
wire [31:0] reg_otl0_050_rdata;
wire [31:0] reg_otl0_054_rdata;
wire [31:0] reg_otl0_058_rdata;
wire [31:0] reg_otl0_05C_rdata;
wire [31:0] reg_otl0_060_rdata;
wire [31:0] reg_otl0_064_rdata;
wire [31:0] reg_otl0_068_rdata;
wire [31:0] reg_otl0_06C_rdata;
// Registers x070 through x08C are not implemented. When reading, they should return 0.


assign reg_otl0_000_q[31:20] = `OFUNC_BASE;   
assign reg_otl0_000_q[19:16] = 4'h1;     
assign reg_otl0_000_q[15: 0] = 16'h0023;     
assign reg_otl0_000_rdata = (sel_otl0_000 == 1'b1 && do_read == 1'b1) ? reg_otl0_000_q : 32'h00000000;


assign reg_otl0_004_q[31:20] = 12'h090;       
assign reg_otl0_004_q[19:16] = 4'h0;     
assign reg_otl0_004_q[15: 0] = 16'h1014;      
assign reg_otl0_004_rdata = (sel_otl0_004 == 1'b1 && do_read == 1'b1) ? reg_otl0_004_q : 32'h00000000;


assign reg_otl0_008_q[31:16] = 16'h0000;       
assign reg_otl0_008_q[15: 0] = 16'hF000;      
assign reg_otl0_008_rdata = (sel_otl0_008 == 1'b1 && do_read == 1'b1) ? reg_otl0_008_q : 32'h00000000;


assign reg_otl0_00C_q[31:24] = cfg_ro_otl0_tl_major_vers_capbl;     
assign reg_otl0_00C_q[23:16] = cfg_ro_otl0_tl_minor_vers_capbl;    
assign reg_otl0_00C_q[15: 8] = 8'h00;    // This capability is hard coded to TLX Port 0
assign reg_otl0_00C_q[ 7: 0] = 8'h00;  
assign reg_otl0_00C_rdata = (sel_otl0_00C == 1'b1 && do_read == 1'b1) ? reg_otl0_00C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_010_q <= reg_otl0_010_init;    // Load initial value during reset
    else if (sel_otl0_010 == 1'b1)                              // If selected, write any byte that is active
      begin
        reg_otl0_010_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_010_q[31:24];
        reg_otl0_010_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_010_q[23:16];
        reg_otl0_010_q[15: 8] <= 8'h00;
        reg_otl0_010_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_010_q[ 7: 0];
      end
    else                 reg_otl0_010_q <= reg_otl0_010_q;      // Hold value when register is not selected
  end
assign reg_otl0_010_rdata = (sel_otl0_010 == 1'b1 && do_read == 1'b1) ? reg_otl0_010_q : 32'h00000000;


assign reg_otl0_014_q = 32'h0000_0000;
assign reg_otl0_014_rdata = (sel_otl0_014 == 1'b1 && do_read == 1'b1) ? reg_otl0_014_q : 32'h00000000;


assign reg_otl0_018_q = cfg_ro_otl0_rcv_tmpl_capbl[63:32];
assign reg_otl0_018_rdata = (sel_otl0_018 == 1'b1 && do_read == 1'b1) ? reg_otl0_018_q : 32'h00000000;


assign reg_otl0_01C_q = cfg_ro_otl0_rcv_tmpl_capbl[31: 0];
assign reg_otl0_01C_rdata = (sel_otl0_01C == 1'b1 && do_read == 1'b1) ? reg_otl0_01C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_020_q <= reg_otl0_020_init;    // Load initial value during reset
    else if (sel_otl0_020 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_020_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_020_q[31:24];
        reg_otl0_020_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_020_q[23:16];
        reg_otl0_020_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_020_q[15: 8];
        reg_otl0_020_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_020_q[ 7: 0];
      end
    else                 reg_otl0_020_q <= reg_otl0_020_q;        // Hold value when register is not selected
  end
assign reg_otl0_020_rdata = (sel_otl0_020 == 1'b1 && do_read == 1'b1) ? reg_otl0_020_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_024_q <= reg_otl0_024_init;     // Load initial value during reset
    else if (sel_otl0_024 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_otl0_024_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_024_q[31:24];
        reg_otl0_024_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_024_q[23:16];
        reg_otl0_024_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_024_q[15: 8];
        reg_otl0_024_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_024_q[ 7: 0];
      end
    else               reg_otl0_024_q <= reg_otl0_024_q;        // Hold value when register is not selected
  end
assign reg_otl0_024_rdata = (sel_otl0_024 == 1'b1 && do_read == 1'b1) ? reg_otl0_024_q : 32'h00000000;


assign reg_otl0_028_q = 32'h0000_0000;
assign reg_otl0_028_rdata = (sel_otl0_028 == 1'b1 && do_read == 1'b1) ? reg_otl0_028_q : 32'h00000000;


assign reg_otl0_02C_q = 32'h0000_0000;
assign reg_otl0_02C_rdata = (sel_otl0_02C == 1'b1 && do_read == 1'b1) ? reg_otl0_02C_q : 32'h00000000;


assign reg_otl0_030_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[255:224];
assign reg_otl0_030_rdata = (sel_otl0_030 == 1'b1 && do_read == 1'b1) ? reg_otl0_030_q : 32'h00000000;


assign reg_otl0_034_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[223:192];
assign reg_otl0_034_rdata = (sel_otl0_034 == 1'b1 && do_read == 1'b1) ? reg_otl0_034_q : 32'h00000000;


assign reg_otl0_038_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[191:160];
assign reg_otl0_038_rdata = (sel_otl0_038 == 1'b1 && do_read == 1'b1) ? reg_otl0_038_q : 32'h00000000;


assign reg_otl0_03C_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[159:128];
assign reg_otl0_03C_rdata = (sel_otl0_03C == 1'b1 && do_read == 1'b1) ? reg_otl0_03C_q : 32'h00000000;


assign reg_otl0_040_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[127: 96];
assign reg_otl0_040_rdata = (sel_otl0_040 == 1'b1 && do_read == 1'b1) ? reg_otl0_040_q : 32'h00000000;


assign reg_otl0_044_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[ 95: 64];
assign reg_otl0_044_rdata = (sel_otl0_044 == 1'b1 && do_read == 1'b1) ? reg_otl0_044_q : 32'h00000000;


assign reg_otl0_048_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[ 63: 32];
assign reg_otl0_048_rdata = (sel_otl0_048 == 1'b1 && do_read == 1'b1) ? reg_otl0_048_q : 32'h00000000;


assign reg_otl0_04C_q = cfg_ro_otl0_rcv_rate_tmpl_capbl[ 31:  0];
assign reg_otl0_04C_rdata = (sel_otl0_04C == 1'b1 && do_read == 1'b1) ? reg_otl0_04C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_050_q <= reg_otl0_050_init;    // Load initial value during reset
    else if (sel_otl0_050 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_050_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_050_q[31:24];
        reg_otl0_050_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_050_q[23:16];
        reg_otl0_050_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_050_q[15: 8];
        reg_otl0_050_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_050_q[ 7: 0];
      end
    else                 reg_otl0_050_q <= reg_otl0_050_q;       // Hold value when register is not selected
  end
assign reg_otl0_050_rdata = (sel_otl0_050 == 1'b1 && do_read == 1'b1) ? reg_otl0_050_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_054_q <= reg_otl0_054_init;    // Load initial value during reset
    else if (sel_otl0_054 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_054_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_054_q[31:24];
        reg_otl0_054_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_054_q[23:16];
        reg_otl0_054_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_054_q[15: 8];
        reg_otl0_054_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_054_q[ 7: 0];
      end
    else                 reg_otl0_054_q <= reg_otl0_054_q;       // Hold value when register is not selected
  end
assign reg_otl0_054_rdata = (sel_otl0_054 == 1'b1 && do_read == 1'b1) ? reg_otl0_054_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_058_q <= reg_otl0_058_init;    // Load initial value during reset
    else if (sel_otl0_058 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_058_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_058_q[31:24];
        reg_otl0_058_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_058_q[23:16];
        reg_otl0_058_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_058_q[15: 8];
        reg_otl0_058_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_058_q[ 7: 0];
      end
    else                 reg_otl0_058_q <= reg_otl0_058_q;      // Hold value when register is not selected
  end
assign reg_otl0_058_rdata = (sel_otl0_058 == 1'b1 && do_read == 1'b1) ? reg_otl0_058_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_05C_q <= reg_otl0_05C_init;    // Load initial value during reset
    else if (sel_otl0_05C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_05C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_05C_q[31:24];
        reg_otl0_05C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_05C_q[23:16];
        reg_otl0_05C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_05C_q[15: 8];
        reg_otl0_05C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_05C_q[ 7: 0];
      end
    else                 reg_otl0_05C_q <= reg_otl0_05C_q;       // Hold value when register is not selected
  end
assign reg_otl0_05C_rdata = (sel_otl0_05C == 1'b1 && do_read == 1'b1) ? reg_otl0_05C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_060_q <= reg_otl0_060_init;    // Load initial value during reset
    else if (sel_otl0_060 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_060_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_060_q[31:24];
        reg_otl0_060_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_060_q[23:16];
        reg_otl0_060_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_060_q[15: 8];
        reg_otl0_060_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_060_q[ 7: 0];
      end
    else                 reg_otl0_060_q <= reg_otl0_060_q;       // Hold value when register is not selected
  end
assign reg_otl0_060_rdata = (sel_otl0_060 == 1'b1 && do_read == 1'b1) ? reg_otl0_060_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_064_q <= reg_otl0_064_init;    // Load initial value during reset
    else if (sel_otl0_064 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_064_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_064_q[31:24];
        reg_otl0_064_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_064_q[23:16];
        reg_otl0_064_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_064_q[15: 8];
        reg_otl0_064_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_064_q[ 7: 0];
      end
    else                 reg_otl0_064_q <= reg_otl0_064_q;       // Hold value when register is not selected
  end
assign reg_otl0_064_rdata = (sel_otl0_064 == 1'b1 && do_read == 1'b1) ? reg_otl0_064_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_068_q <= reg_otl0_068_init;    // Load initial value during reset
    else if (sel_otl0_068 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_068_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_068_q[31:24];
        reg_otl0_068_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_068_q[23:16];
        reg_otl0_068_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_068_q[15: 8];
        reg_otl0_068_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_068_q[ 7: 0];
      end
    else                 reg_otl0_068_q <= reg_otl0_068_q;       // Hold value when register is not selected
  end
assign reg_otl0_068_rdata = (sel_otl0_068 == 1'b1 && do_read == 1'b1) ? reg_otl0_068_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl0_06C_q <= reg_otl0_06C_init;    // Load initial value during reset
    else if (sel_otl0_06C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl0_06C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl0_06C_q[31:24];
        reg_otl0_06C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl0_06C_q[23:16];
        reg_otl0_06C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl0_06C_q[15: 8];
        reg_otl0_06C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl0_06C_q[ 7: 0];
      end
    else                 reg_otl0_06C_q <= reg_otl0_06C_q;       // Hold value when register is not selected
  end
assign reg_otl0_06C_rdata = (sel_otl0_06C == 1'b1 && do_read == 1'b1) ? reg_otl0_06C_q : 32'h00000000;

// Registers x070 through x08C are 'reserved' but not implemented. When reading, they will return 0.
// This will happen naturally when all other *_rdata vectors contain 0s.
wire [31:0] reg_otl0_unimp_q;                // Provide a facility that the CFG verification environment can check for these regs
assign      reg_otl0_unimp_q = 32'h00000000;


// ..............................................
// @@@ OTL1
// ..............................................
`ifdef EXPOSE_CFG_PORT_1

wire [31:0] reg_otl1_000_q;   
wire [31:0] reg_otl1_004_q;   
wire [31:0] reg_otl1_008_q;
wire [31:0] reg_otl1_00C_q;
reg  [31:0] reg_otl1_010_q;
wire [31:0] reg_otl1_014_q;
wire [31:0] reg_otl1_018_q;
wire [31:0] reg_otl1_01C_q;   
reg  [31:0] reg_otl1_020_q;   
reg  [31:0] reg_otl1_024_q;
wire [31:0] reg_otl1_028_q;
wire [31:0] reg_otl1_02C_q;
wire [31:0] reg_otl1_030_q;   
wire [31:0] reg_otl1_034_q;   
wire [31:0] reg_otl1_038_q;   
wire [31:0] reg_otl1_03C_q;   
wire [31:0] reg_otl1_040_q;  
wire [31:0] reg_otl1_044_q;  
wire [31:0] reg_otl1_048_q;  
wire [31:0] reg_otl1_04C_q;  
reg  [31:0] reg_otl1_050_q;
reg  [31:0] reg_otl1_054_q;
reg  [31:0] reg_otl1_058_q;
reg  [31:0] reg_otl1_05C_q;
reg  [31:0] reg_otl1_060_q;
reg  [31:0] reg_otl1_064_q;
reg  [31:0] reg_otl1_068_q;
reg  [31:0] reg_otl1_06C_q;

wire [31:0] reg_otl1_000_rdata; 
wire [31:0] reg_otl1_004_rdata; 
wire [31:0] reg_otl1_008_rdata;
wire [31:0] reg_otl1_00C_rdata; 
wire [31:0] reg_otl1_010_rdata;
wire [31:0] reg_otl1_014_rdata;
wire [31:0] reg_otl1_018_rdata;
wire [31:0] reg_otl1_01C_rdata;
wire [31:0] reg_otl1_020_rdata; 
wire [31:0] reg_otl1_024_rdata;
wire [31:0] reg_otl1_028_rdata;
wire [31:0] reg_otl1_02C_rdata;
wire [31:0] reg_otl1_030_rdata; 
wire [31:0] reg_otl1_034_rdata; 
wire [31:0] reg_otl1_038_rdata; 
wire [31:0] reg_otl1_03C_rdata; 
wire [31:0] reg_otl1_040_rdata; 
wire [31:0] reg_otl1_044_rdata; 
wire [31:0] reg_otl1_048_rdata; 
wire [31:0] reg_otl1_04C_rdata; 
wire [31:0] reg_otl1_050_rdata;
wire [31:0] reg_otl1_054_rdata;
wire [31:0] reg_otl1_058_rdata;
wire [31:0] reg_otl1_05C_rdata;
wire [31:0] reg_otl1_060_rdata;
wire [31:0] reg_otl1_064_rdata;
wire [31:0] reg_otl1_068_rdata;
wire [31:0] reg_otl1_06C_rdata;
// Registers x070 through x08C are not implemented. When reading, they should return 0.


assign reg_otl1_000_q[31:20] = `OFUNC_BASE;   
assign reg_otl1_000_q[19:16] = 4'h1;     
assign reg_otl1_000_q[15: 0] = 16'h0023;     
assign reg_otl1_000_rdata = (sel_otl1_000 == 1'b1 && do_read == 1'b1) ? reg_otl1_000_q : 32'h00000000;


assign reg_otl1_004_q[31:20] = 12'h090;       
assign reg_otl1_004_q[19:16] = 4'h0;     
assign reg_otl1_004_q[15: 0] = 16'h1014;      
assign reg_otl1_004_rdata = (sel_otl1_004 == 1'b1 && do_read == 1'b1) ? reg_otl1_004_q : 32'h00000000;


assign reg_otl1_008_q[31:16] = 16'h0000;       
assign reg_otl1_008_q[15: 0] = 16'hF000;      
assign reg_otl1_008_rdata = (sel_otl1_008 == 1'b1 && do_read == 1'b1) ? reg_otl1_008_q : 32'h00000000;


assign reg_otl1_00C_q[31:24] = cfg_ro_otl1_tl_major_vers_capbl;     
assign reg_otl1_00C_q[23:16] = cfg_ro_otl1_tl_minor_vers_capbl;    
assign reg_otl1_00C_q[15: 8] = 8'h01;    // This capability is hard coded to TLX Port 1
assign reg_otl1_00C_q[ 7: 0] = 8'h00;  
assign reg_otl1_00C_rdata = (sel_otl1_00C == 1'b1 && do_read == 1'b1) ? reg_otl1_00C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_010_q <= reg_otl1_010_init;    // Load initial value during reset
    else if (sel_otl1_010 == 1'b1)                              // If selected, write any byte that is active
      begin
        reg_otl1_010_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_010_q[31:24];
        reg_otl1_010_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_010_q[23:16];
        reg_otl1_010_q[15: 8] <= 8'h00;
        reg_otl1_010_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_010_q[ 7: 0];
      end
    else                 reg_otl1_010_q <= reg_otl1_010_q;      // Hold value when register is not selected
  end
assign reg_otl1_010_rdata = (sel_otl1_010 == 1'b1 && do_read == 1'b1) ? reg_otl1_010_q : 32'h00000000;


assign reg_otl1_014_q = 32'h0000_0000;
assign reg_otl1_014_rdata = (sel_otl1_014 == 1'b1 && do_read == 1'b1) ? reg_otl1_014_q : 32'h00000000;


assign reg_otl1_018_q = cfg_ro_otl1_rcv_tmpl_capbl[63:32];
assign reg_otl1_018_rdata = (sel_otl1_018 == 1'b1 && do_read == 1'b1) ? reg_otl1_018_q : 32'h00000000;


assign reg_otl1_01C_q = cfg_ro_otl1_rcv_tmpl_capbl[31: 0];
assign reg_otl1_01C_rdata = (sel_otl1_01C == 1'b1 && do_read == 1'b1) ? reg_otl1_01C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_020_q <= reg_otl1_020_init;    // Load initial value during reset
    else if (sel_otl1_020 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_020_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_020_q[31:24];
        reg_otl1_020_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_020_q[23:16];
        reg_otl1_020_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_020_q[15: 8];
        reg_otl1_020_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_020_q[ 7: 0];
      end
    else                 reg_otl1_020_q <= reg_otl1_020_q;        // Hold value when register is not selected
  end
assign reg_otl1_020_rdata = (sel_otl1_020 == 1'b1 && do_read == 1'b1) ? reg_otl1_020_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_024_q <= reg_otl1_024_init;     // Load initial value during reset
    else if (sel_otl1_024 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_otl1_024_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_024_q[31:24];
        reg_otl1_024_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_024_q[23:16];
        reg_otl1_024_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_024_q[15: 8];
        reg_otl1_024_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_024_q[ 7: 0];
      end
    else               reg_otl1_024_q <= reg_otl1_024_q;        // Hold value when register is not selected
  end
assign reg_otl1_024_rdata = (sel_otl1_024 == 1'b1 && do_read == 1'b1) ? reg_otl1_024_q : 32'h00000000;


assign reg_otl1_028_q = 32'h0000_0000;
assign reg_otl1_028_rdata = (sel_otl1_028 == 1'b1 && do_read == 1'b1) ? reg_otl1_028_q : 32'h00000000;


assign reg_otl1_02C_q = 32'h0000_0000;
assign reg_otl1_02C_rdata = (sel_otl1_02C == 1'b1 && do_read == 1'b1) ? reg_otl1_02C_q : 32'h00000000;


assign reg_otl1_030_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[255:224];
assign reg_otl1_030_rdata = (sel_otl1_030 == 1'b1 && do_read == 1'b1) ? reg_otl1_030_q : 32'h00000000;


assign reg_otl1_034_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[223:192];
assign reg_otl1_034_rdata = (sel_otl1_034 == 1'b1 && do_read == 1'b1) ? reg_otl1_034_q : 32'h00000000;


assign reg_otl1_038_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[191:160];
assign reg_otl1_038_rdata = (sel_otl1_038 == 1'b1 && do_read == 1'b1) ? reg_otl1_038_q : 32'h00000000;


assign reg_otl1_03C_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[159:128];
assign reg_otl1_03C_rdata = (sel_otl1_03C == 1'b1 && do_read == 1'b1) ? reg_otl1_03C_q : 32'h00000000;


assign reg_otl1_040_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[127: 96];
assign reg_otl1_040_rdata = (sel_otl1_040 == 1'b1 && do_read == 1'b1) ? reg_otl1_040_q : 32'h00000000;


assign reg_otl1_044_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[ 95: 64];
assign reg_otl1_044_rdata = (sel_otl1_044 == 1'b1 && do_read == 1'b1) ? reg_otl1_044_q : 32'h00000000;


assign reg_otl1_048_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[ 63: 32];
assign reg_otl1_048_rdata = (sel_otl1_048 == 1'b1 && do_read == 1'b1) ? reg_otl1_048_q : 32'h00000000;


assign reg_otl1_04C_q = cfg_ro_otl1_rcv_rate_tmpl_capbl[ 31:  0];
assign reg_otl1_04C_rdata = (sel_otl1_04C == 1'b1 && do_read == 1'b1) ? reg_otl1_04C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_050_q <= reg_otl1_050_init;    // Load initial value during reset
    else if (sel_otl1_050 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_050_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_050_q[31:24];
        reg_otl1_050_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_050_q[23:16];
        reg_otl1_050_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_050_q[15: 8];
        reg_otl1_050_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_050_q[ 7: 0];
      end
    else                 reg_otl1_050_q <= reg_otl1_050_q;       // Hold value when register is not selected
  end
assign reg_otl1_050_rdata = (sel_otl1_050 == 1'b1 && do_read == 1'b1) ? reg_otl1_050_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_054_q <= reg_otl1_054_init;    // Load initial value during reset
    else if (sel_otl1_054 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_054_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_054_q[31:24];
        reg_otl1_054_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_054_q[23:16];
        reg_otl1_054_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_054_q[15: 8];
        reg_otl1_054_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_054_q[ 7: 0];
      end
    else                 reg_otl1_054_q <= reg_otl1_054_q;       // Hold value when register is not selected
  end
assign reg_otl1_054_rdata = (sel_otl1_054 == 1'b1 && do_read == 1'b1) ? reg_otl1_054_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_058_q <= reg_otl1_058_init;    // Load initial value during reset
    else if (sel_otl1_058 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_058_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_058_q[31:24];
        reg_otl1_058_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_058_q[23:16];
        reg_otl1_058_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_058_q[15: 8];
        reg_otl1_058_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_058_q[ 7: 0];
      end
    else                 reg_otl1_058_q <= reg_otl1_058_q;      // Hold value when register is not selected
  end
assign reg_otl1_058_rdata = (sel_otl1_058 == 1'b1 && do_read == 1'b1) ? reg_otl1_058_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_05C_q <= reg_otl1_05C_init;    // Load initial value during reset
    else if (sel_otl1_05C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_05C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_05C_q[31:24];
        reg_otl1_05C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_05C_q[23:16];
        reg_otl1_05C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_05C_q[15: 8];
        reg_otl1_05C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_05C_q[ 7: 0];
      end
    else                 reg_otl1_05C_q <= reg_otl1_05C_q;       // Hold value when register is not selected
  end
assign reg_otl1_05C_rdata = (sel_otl1_05C == 1'b1 && do_read == 1'b1) ? reg_otl1_05C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_060_q <= reg_otl1_060_init;    // Load initial value during reset
    else if (sel_otl1_060 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_060_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_060_q[31:24];
        reg_otl1_060_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_060_q[23:16];
        reg_otl1_060_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_060_q[15: 8];
        reg_otl1_060_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_060_q[ 7: 0];
      end
    else                 reg_otl1_060_q <= reg_otl1_060_q;       // Hold value when register is not selected
  end
assign reg_otl1_060_rdata = (sel_otl1_060 == 1'b1 && do_read == 1'b1) ? reg_otl1_060_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_064_q <= reg_otl1_064_init;    // Load initial value during reset
    else if (sel_otl1_064 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_064_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_064_q[31:24];
        reg_otl1_064_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_064_q[23:16];
        reg_otl1_064_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_064_q[15: 8];
        reg_otl1_064_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_064_q[ 7: 0];
      end
    else                 reg_otl1_064_q <= reg_otl1_064_q;       // Hold value when register is not selected
  end
assign reg_otl1_064_rdata = (sel_otl1_064 == 1'b1 && do_read == 1'b1) ? reg_otl1_064_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_068_q <= reg_otl1_068_init;    // Load initial value during reset
    else if (sel_otl1_068 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_068_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_068_q[31:24];
        reg_otl1_068_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_068_q[23:16];
        reg_otl1_068_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_068_q[15: 8];
        reg_otl1_068_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_068_q[ 7: 0];
      end
    else                 reg_otl1_068_q <= reg_otl1_068_q;       // Hold value when register is not selected
  end
assign reg_otl1_068_rdata = (sel_otl1_068 == 1'b1 && do_read == 1'b1) ? reg_otl1_068_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl1_06C_q <= reg_otl1_06C_init;    // Load initial value during reset
    else if (sel_otl1_06C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl1_06C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl1_06C_q[31:24];
        reg_otl1_06C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl1_06C_q[23:16];
        reg_otl1_06C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl1_06C_q[15: 8];
        reg_otl1_06C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl1_06C_q[ 7: 0];
      end
    else                 reg_otl1_06C_q <= reg_otl1_06C_q;       // Hold value when register is not selected
  end
assign reg_otl1_06C_rdata = (sel_otl1_06C == 1'b1 && do_read == 1'b1) ? reg_otl1_06C_q : 32'h00000000;

// Registers x070 through x08C are 'reserved' but not implemented. When reading, they will return 0.
// This will happen naturally when all other *_rdata vectors contain 0s.
wire [31:0] reg_otl1_unimp_q;                // Provide a facility that the CFG verification environment can check for these regs
assign      reg_otl1_unimp_q = 32'h00000000;


`endif


// ..............................................
// @@@ OTL2
// ..............................................
`ifdef EXPOSE_CFG_PORT_2

wire [31:0] reg_otl2_000_q;   
wire [31:0] reg_otl2_004_q;   
wire [31:0] reg_otl2_008_q;
wire [31:0] reg_otl2_00C_q;
reg  [31:0] reg_otl2_010_q;
wire [31:0] reg_otl2_014_q;
wire [31:0] reg_otl2_018_q;
wire [31:0] reg_otl2_01C_q;   
reg  [31:0] reg_otl2_020_q;   
reg  [31:0] reg_otl2_024_q;
wire [31:0] reg_otl2_028_q;
wire [31:0] reg_otl2_02C_q;
wire [31:0] reg_otl2_030_q;   
wire [31:0] reg_otl2_034_q;   
wire [31:0] reg_otl2_038_q;   
wire [31:0] reg_otl2_03C_q;   
wire [31:0] reg_otl2_040_q;  
wire [31:0] reg_otl2_044_q;  
wire [31:0] reg_otl2_048_q;  
wire [31:0] reg_otl2_04C_q;  
reg  [31:0] reg_otl2_050_q;
reg  [31:0] reg_otl2_054_q;
reg  [31:0] reg_otl2_058_q;
reg  [31:0] reg_otl2_05C_q;
reg  [31:0] reg_otl2_060_q;
reg  [31:0] reg_otl2_064_q;
reg  [31:0] reg_otl2_068_q;
reg  [31:0] reg_otl2_06C_q;

wire [31:0] reg_otl2_000_rdata; 
wire [31:0] reg_otl2_004_rdata; 
wire [31:0] reg_otl2_008_rdata;
wire [31:0] reg_otl2_00C_rdata; 
wire [31:0] reg_otl2_010_rdata;
wire [31:0] reg_otl2_014_rdata;
wire [31:0] reg_otl2_018_rdata;
wire [31:0] reg_otl2_01C_rdata;
wire [31:0] reg_otl2_020_rdata; 
wire [31:0] reg_otl2_024_rdata;
wire [31:0] reg_otl2_028_rdata;
wire [31:0] reg_otl2_02C_rdata;
wire [31:0] reg_otl2_030_rdata; 
wire [31:0] reg_otl2_034_rdata; 
wire [31:0] reg_otl2_038_rdata; 
wire [31:0] reg_otl2_03C_rdata; 
wire [31:0] reg_otl2_040_rdata; 
wire [31:0] reg_otl2_044_rdata; 
wire [31:0] reg_otl2_048_rdata; 
wire [31:0] reg_otl2_04C_rdata; 
wire [31:0] reg_otl2_050_rdata;
wire [31:0] reg_otl2_054_rdata;
wire [31:0] reg_otl2_058_rdata;
wire [31:0] reg_otl2_05C_rdata;
wire [31:0] reg_otl2_060_rdata;
wire [31:0] reg_otl2_064_rdata;
wire [31:0] reg_otl2_068_rdata;
wire [31:0] reg_otl2_06C_rdata;
// Registers x070 through x08C are not implemented. When reading, they should return 0.


assign reg_otl2_000_q[31:20] = `OFUNC_BASE;   
assign reg_otl2_000_q[19:16] = 4'h1;     
assign reg_otl2_000_q[15: 0] = 16'h0023;     
assign reg_otl2_000_rdata = (sel_otl2_000 == 1'b1 && do_read == 1'b1) ? reg_otl2_000_q : 32'h00000000;


assign reg_otl2_004_q[31:20] = 12'h090;       
assign reg_otl2_004_q[19:16] = 4'h0;     
assign reg_otl2_004_q[15: 0] = 16'h1014;      
assign reg_otl2_004_rdata = (sel_otl2_004 == 1'b1 && do_read == 1'b1) ? reg_otl2_004_q : 32'h00000000;


assign reg_otl2_008_q[31:16] = 16'h0000;       
assign reg_otl2_008_q[15: 0] = 16'hF000;      
assign reg_otl2_008_rdata = (sel_otl2_008 == 1'b1 && do_read == 1'b1) ? reg_otl2_008_q : 32'h00000000;


assign reg_otl2_00C_q[31:24] = cfg_ro_otl2_tl_major_vers_capbl;     
assign reg_otl2_00C_q[23:16] = cfg_ro_otl2_tl_minor_vers_capbl;    
assign reg_otl2_00C_q[15: 8] = 8'h02;    // This capability is hard coded to TLX Port 1
assign reg_otl2_00C_q[ 7: 0] = 8'h00;  
assign reg_otl2_00C_rdata = (sel_otl2_00C == 1'b1 && do_read == 1'b1) ? reg_otl2_00C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_010_q <= reg_otl2_010_init;    // Load initial value during reset
    else if (sel_otl2_010 == 1'b1)                              // If selected, write any byte that is active
      begin
        reg_otl2_010_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_010_q[31:24];
        reg_otl2_010_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_010_q[23:16];
        reg_otl2_010_q[15: 8] <= 8'h00;
        reg_otl2_010_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_010_q[ 7: 0];
      end
    else                 reg_otl2_010_q <= reg_otl2_010_q;      // Hold value when register is not selected
  end
assign reg_otl2_010_rdata = (sel_otl2_010 == 1'b1 && do_read == 1'b1) ? reg_otl2_010_q : 32'h00000000;


assign reg_otl2_014_q = 32'h0000_0000;
assign reg_otl2_014_rdata = (sel_otl2_014 == 1'b1 && do_read == 1'b1) ? reg_otl2_014_q : 32'h00000000;


assign reg_otl2_018_q = cfg_ro_otl2_rcv_tmpl_capbl[63:32];
assign reg_otl2_018_rdata = (sel_otl2_018 == 1'b1 && do_read == 1'b1) ? reg_otl2_018_q : 32'h00000000;


assign reg_otl2_01C_q = cfg_ro_otl2_rcv_tmpl_capbl[31: 0];
assign reg_otl2_01C_rdata = (sel_otl2_01C == 1'b1 && do_read == 1'b1) ? reg_otl2_01C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_020_q <= reg_otl2_020_init;    // Load initial value during reset
    else if (sel_otl2_020 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_020_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_020_q[31:24];
        reg_otl2_020_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_020_q[23:16];
        reg_otl2_020_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_020_q[15: 8];
        reg_otl2_020_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_020_q[ 7: 0];
      end
    else                 reg_otl2_020_q <= reg_otl2_020_q;        // Hold value when register is not selected
  end
assign reg_otl2_020_rdata = (sel_otl2_020 == 1'b1 && do_read == 1'b1) ? reg_otl2_020_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_024_q <= reg_otl2_024_init;     // Load initial value during reset
    else if (sel_otl2_024 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_otl2_024_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_024_q[31:24];
        reg_otl2_024_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_024_q[23:16];
        reg_otl2_024_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_024_q[15: 8];
        reg_otl2_024_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_024_q[ 7: 0];
      end
    else               reg_otl2_024_q <= reg_otl2_024_q;        // Hold value when register is not selected
  end
assign reg_otl2_024_rdata = (sel_otl2_024 == 1'b1 && do_read == 1'b1) ? reg_otl2_024_q : 32'h00000000;


assign reg_otl2_028_q = 32'h0000_0000;
assign reg_otl2_028_rdata = (sel_otl2_028 == 1'b1 && do_read == 1'b1) ? reg_otl2_028_q : 32'h00000000;


assign reg_otl2_02C_q = 32'h0000_0000;
assign reg_otl2_02C_rdata = (sel_otl2_02C == 1'b1 && do_read == 1'b1) ? reg_otl2_02C_q : 32'h00000000;


assign reg_otl2_030_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[255:224];
assign reg_otl2_030_rdata = (sel_otl2_030 == 1'b1 && do_read == 1'b1) ? reg_otl2_030_q : 32'h00000000;


assign reg_otl2_034_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[223:192];
assign reg_otl2_034_rdata = (sel_otl2_034 == 1'b1 && do_read == 1'b1) ? reg_otl2_034_q : 32'h00000000;


assign reg_otl2_038_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[191:160];
assign reg_otl2_038_rdata = (sel_otl2_038 == 1'b1 && do_read == 1'b1) ? reg_otl2_038_q : 32'h00000000;


assign reg_otl2_03C_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[159:128];
assign reg_otl2_03C_rdata = (sel_otl2_03C == 1'b1 && do_read == 1'b1) ? reg_otl2_03C_q : 32'h00000000;


assign reg_otl2_040_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[127: 96];
assign reg_otl2_040_rdata = (sel_otl2_040 == 1'b1 && do_read == 1'b1) ? reg_otl2_040_q : 32'h00000000;


assign reg_otl2_044_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[ 95: 64];
assign reg_otl2_044_rdata = (sel_otl2_044 == 1'b1 && do_read == 1'b1) ? reg_otl2_044_q : 32'h00000000;


assign reg_otl2_048_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[ 63: 32];
assign reg_otl2_048_rdata = (sel_otl2_048 == 1'b1 && do_read == 1'b1) ? reg_otl2_048_q : 32'h00000000;


assign reg_otl2_04C_q = cfg_ro_otl2_rcv_rate_tmpl_capbl[ 31:  0];
assign reg_otl2_04C_rdata = (sel_otl2_04C == 1'b1 && do_read == 1'b1) ? reg_otl2_04C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_050_q <= reg_otl2_050_init;    // Load initial value during reset
    else if (sel_otl2_050 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_050_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_050_q[31:24];
        reg_otl2_050_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_050_q[23:16];
        reg_otl2_050_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_050_q[15: 8];
        reg_otl2_050_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_050_q[ 7: 0];
      end
    else                 reg_otl2_050_q <= reg_otl2_050_q;       // Hold value when register is not selected
  end
assign reg_otl2_050_rdata = (sel_otl2_050 == 1'b1 && do_read == 1'b1) ? reg_otl2_050_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_054_q <= reg_otl2_054_init;    // Load initial value during reset
    else if (sel_otl2_054 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_054_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_054_q[31:24];
        reg_otl2_054_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_054_q[23:16];
        reg_otl2_054_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_054_q[15: 8];
        reg_otl2_054_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_054_q[ 7: 0];
      end
    else                 reg_otl2_054_q <= reg_otl2_054_q;       // Hold value when register is not selected
  end
assign reg_otl2_054_rdata = (sel_otl2_054 == 1'b1 && do_read == 1'b1) ? reg_otl2_054_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_058_q <= reg_otl2_058_init;    // Load initial value during reset
    else if (sel_otl2_058 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_058_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_058_q[31:24];
        reg_otl2_058_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_058_q[23:16];
        reg_otl2_058_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_058_q[15: 8];
        reg_otl2_058_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_058_q[ 7: 0];
      end
    else                 reg_otl2_058_q <= reg_otl2_058_q;      // Hold value when register is not selected
  end
assign reg_otl2_058_rdata = (sel_otl2_058 == 1'b1 && do_read == 1'b1) ? reg_otl2_058_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_05C_q <= reg_otl2_05C_init;    // Load initial value during reset
    else if (sel_otl2_05C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_05C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_05C_q[31:24];
        reg_otl2_05C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_05C_q[23:16];
        reg_otl2_05C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_05C_q[15: 8];
        reg_otl2_05C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_05C_q[ 7: 0];
      end
    else                 reg_otl2_05C_q <= reg_otl2_05C_q;       // Hold value when register is not selected
  end
assign reg_otl2_05C_rdata = (sel_otl2_05C == 1'b1 && do_read == 1'b1) ? reg_otl2_05C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_060_q <= reg_otl2_060_init;    // Load initial value during reset
    else if (sel_otl2_060 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_060_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_060_q[31:24];
        reg_otl2_060_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_060_q[23:16];
        reg_otl2_060_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_060_q[15: 8];
        reg_otl2_060_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_060_q[ 7: 0];
      end
    else                 reg_otl2_060_q <= reg_otl2_060_q;       // Hold value when register is not selected
  end
assign reg_otl2_060_rdata = (sel_otl2_060 == 1'b1 && do_read == 1'b1) ? reg_otl2_060_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_064_q <= reg_otl2_064_init;    // Load initial value during reset
    else if (sel_otl2_064 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_064_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_064_q[31:24];
        reg_otl2_064_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_064_q[23:16];
        reg_otl2_064_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_064_q[15: 8];
        reg_otl2_064_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_064_q[ 7: 0];
      end
    else                 reg_otl2_064_q <= reg_otl2_064_q;       // Hold value when register is not selected
  end
assign reg_otl2_064_rdata = (sel_otl2_064 == 1'b1 && do_read == 1'b1) ? reg_otl2_064_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_068_q <= reg_otl2_068_init;    // Load initial value during reset
    else if (sel_otl2_068 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_068_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_068_q[31:24];
        reg_otl2_068_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_068_q[23:16];
        reg_otl2_068_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_068_q[15: 8];
        reg_otl2_068_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_068_q[ 7: 0];
      end
    else                 reg_otl2_068_q <= reg_otl2_068_q;       // Hold value when register is not selected
  end
assign reg_otl2_068_rdata = (sel_otl2_068 == 1'b1 && do_read == 1'b1) ? reg_otl2_068_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl2_06C_q <= reg_otl2_06C_init;    // Load initial value during reset
    else if (sel_otl2_06C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl2_06C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl2_06C_q[31:24];
        reg_otl2_06C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl2_06C_q[23:16];
        reg_otl2_06C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl2_06C_q[15: 8];
        reg_otl2_06C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl2_06C_q[ 7: 0];
      end
    else                 reg_otl2_06C_q <= reg_otl2_06C_q;       // Hold value when register is not selected
  end
assign reg_otl2_06C_rdata = (sel_otl2_06C == 1'b1 && do_read == 1'b1) ? reg_otl2_06C_q : 32'h00000000;

// Registers x070 through x08C are 'reserved' but not implemented. When reading, they will return 0.
// This will happen naturally when all other *_rdata vectors contain 0s.
wire [31:0] reg_otl2_unimp_q;                // Provide a facility that the CFG verification environment can check for these regs
assign      reg_otl2_unimp_q = 32'h00000000;

`endif


// ..............................................
// @@@ OTL3
// ..............................................
`ifdef EXPOSE_CFG_PORT_3

wire [31:0] reg_otl3_000_q;   
wire [31:0] reg_otl3_004_q;   
wire [31:0] reg_otl3_008_q;
wire [31:0] reg_otl3_00C_q;
reg  [31:0] reg_otl3_010_q;
wire [31:0] reg_otl3_014_q;
wire [31:0] reg_otl3_018_q;
wire [31:0] reg_otl3_01C_q;   
reg  [31:0] reg_otl3_020_q;   
reg  [31:0] reg_otl3_024_q;
wire [31:0] reg_otl3_028_q;
wire [31:0] reg_otl3_02C_q;
wire [31:0] reg_otl3_030_q;   
wire [31:0] reg_otl3_034_q;   
wire [31:0] reg_otl3_038_q;   
wire [31:0] reg_otl3_03C_q;   
wire [31:0] reg_otl3_040_q;  
wire [31:0] reg_otl3_044_q;  
wire [31:0] reg_otl3_048_q;  
wire [31:0] reg_otl3_04C_q;  
reg  [31:0] reg_otl3_050_q;
reg  [31:0] reg_otl3_054_q;
reg  [31:0] reg_otl3_058_q;
reg  [31:0] reg_otl3_05C_q;
reg  [31:0] reg_otl3_060_q;
reg  [31:0] reg_otl3_064_q;
reg  [31:0] reg_otl3_068_q;
reg  [31:0] reg_otl3_06C_q;

wire [31:0] reg_otl3_000_rdata; 
wire [31:0] reg_otl3_004_rdata; 
wire [31:0] reg_otl3_008_rdata;
wire [31:0] reg_otl3_00C_rdata; 
wire [31:0] reg_otl3_010_rdata;
wire [31:0] reg_otl3_014_rdata;
wire [31:0] reg_otl3_018_rdata;
wire [31:0] reg_otl3_01C_rdata;
wire [31:0] reg_otl3_020_rdata; 
wire [31:0] reg_otl3_024_rdata;
wire [31:0] reg_otl3_028_rdata;
wire [31:0] reg_otl3_02C_rdata;
wire [31:0] reg_otl3_030_rdata; 
wire [31:0] reg_otl3_034_rdata; 
wire [31:0] reg_otl3_038_rdata; 
wire [31:0] reg_otl3_03C_rdata; 
wire [31:0] reg_otl3_040_rdata; 
wire [31:0] reg_otl3_044_rdata; 
wire [31:0] reg_otl3_048_rdata; 
wire [31:0] reg_otl3_04C_rdata; 
wire [31:0] reg_otl3_050_rdata;
wire [31:0] reg_otl3_054_rdata;
wire [31:0] reg_otl3_058_rdata;
wire [31:0] reg_otl3_05C_rdata;
wire [31:0] reg_otl3_060_rdata;
wire [31:0] reg_otl3_064_rdata;
wire [31:0] reg_otl3_068_rdata;
wire [31:0] reg_otl3_06C_rdata;
// Registers x070 through x08C are not implemented. When reading, they should return 0.


assign reg_otl3_000_q[31:20] = `OFUNC_BASE;   
assign reg_otl3_000_q[19:16] = 4'h1;     
assign reg_otl3_000_q[15: 0] = 16'h0023;     
assign reg_otl3_000_rdata = (sel_otl3_000 == 1'b1 && do_read == 1'b1) ? reg_otl3_000_q : 32'h00000000;


assign reg_otl3_004_q[31:20] = 12'h090;       
assign reg_otl3_004_q[19:16] = 4'h0;     
assign reg_otl3_004_q[15: 0] = 16'h1014;      
assign reg_otl3_004_rdata = (sel_otl3_004 == 1'b1 && do_read == 1'b1) ? reg_otl3_004_q : 32'h00000000;


assign reg_otl3_008_q[31:16] = 16'h0000;       
assign reg_otl3_008_q[15: 0] = 16'hF000;      
assign reg_otl3_008_rdata = (sel_otl3_008 == 1'b1 && do_read == 1'b1) ? reg_otl3_008_q : 32'h00000000;


assign reg_otl3_00C_q[31:24] = cfg_ro_otl3_tl_major_vers_capbl;     
assign reg_otl3_00C_q[23:16] = cfg_ro_otl3_tl_minor_vers_capbl;    
assign reg_otl3_00C_q[15: 8] = 8'h03;    // This capability is hard coded to TLX Port 3
assign reg_otl3_00C_q[ 7: 0] = 8'h00;  
assign reg_otl3_00C_rdata = (sel_otl3_00C == 1'b1 && do_read == 1'b1) ? reg_otl3_00C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_010_q <= reg_otl3_010_init;    // Load initial value during reset
    else if (sel_otl3_010 == 1'b1)                              // If selected, write any byte that is active
      begin
        reg_otl3_010_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_010_q[31:24];
        reg_otl3_010_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_010_q[23:16];
        reg_otl3_010_q[15: 8] <= 8'h00;
        reg_otl3_010_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_010_q[ 7: 0];
      end
    else                 reg_otl3_010_q <= reg_otl3_010_q;      // Hold value when register is not selected
  end
assign reg_otl3_010_rdata = (sel_otl3_010 == 1'b1 && do_read == 1'b1) ? reg_otl3_010_q : 32'h00000000;


assign reg_otl3_014_q = 32'h0000_0000;
assign reg_otl3_014_rdata = (sel_otl3_014 == 1'b1 && do_read == 1'b1) ? reg_otl3_014_q : 32'h00000000;


assign reg_otl3_018_q = cfg_ro_otl3_rcv_tmpl_capbl[63:32];
assign reg_otl3_018_rdata = (sel_otl3_018 == 1'b1 && do_read == 1'b1) ? reg_otl3_018_q : 32'h00000000;


assign reg_otl3_01C_q = cfg_ro_otl3_rcv_tmpl_capbl[31: 0];
assign reg_otl3_01C_rdata = (sel_otl3_01C == 1'b1 && do_read == 1'b1) ? reg_otl3_01C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_020_q <= reg_otl3_020_init;    // Load initial value during reset
    else if (sel_otl3_020 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_020_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_020_q[31:24];
        reg_otl3_020_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_020_q[23:16];
        reg_otl3_020_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_020_q[15: 8];
        reg_otl3_020_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_020_q[ 7: 0];
      end
    else                 reg_otl3_020_q <= reg_otl3_020_q;        // Hold value when register is not selected
  end
assign reg_otl3_020_rdata = (sel_otl3_020 == 1'b1 && do_read == 1'b1) ? reg_otl3_020_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_024_q <= reg_otl3_024_init;     // Load initial value during reset
    else if (sel_otl3_024 == 1'b1)                                // If selected, write any byte that is active
      begin
        reg_otl3_024_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_024_q[31:24];
        reg_otl3_024_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_024_q[23:16];
        reg_otl3_024_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_024_q[15: 8];
        reg_otl3_024_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_024_q[ 7: 0];
      end
    else               reg_otl3_024_q <= reg_otl3_024_q;        // Hold value when register is not selected
  end
assign reg_otl3_024_rdata = (sel_otl3_024 == 1'b1 && do_read == 1'b1) ? reg_otl3_024_q : 32'h00000000;


assign reg_otl3_028_q = 32'h0000_0000;
assign reg_otl3_028_rdata = (sel_otl3_028 == 1'b1 && do_read == 1'b1) ? reg_otl3_028_q : 32'h00000000;


assign reg_otl3_02C_q = 32'h0000_0000;
assign reg_otl3_02C_rdata = (sel_otl3_02C == 1'b1 && do_read == 1'b1) ? reg_otl3_02C_q : 32'h00000000;


assign reg_otl3_030_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[255:224];
assign reg_otl3_030_rdata = (sel_otl3_030 == 1'b1 && do_read == 1'b1) ? reg_otl3_030_q : 32'h00000000;


assign reg_otl3_034_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[223:192];
assign reg_otl3_034_rdata = (sel_otl3_034 == 1'b1 && do_read == 1'b1) ? reg_otl3_034_q : 32'h00000000;


assign reg_otl3_038_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[191:160];
assign reg_otl3_038_rdata = (sel_otl3_038 == 1'b1 && do_read == 1'b1) ? reg_otl3_038_q : 32'h00000000;


assign reg_otl3_03C_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[159:128];
assign reg_otl3_03C_rdata = (sel_otl3_03C == 1'b1 && do_read == 1'b1) ? reg_otl3_03C_q : 32'h00000000;


assign reg_otl3_040_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[127: 96];
assign reg_otl3_040_rdata = (sel_otl3_040 == 1'b1 && do_read == 1'b1) ? reg_otl3_040_q : 32'h00000000;


assign reg_otl3_044_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[ 95: 64];
assign reg_otl3_044_rdata = (sel_otl3_044 == 1'b1 && do_read == 1'b1) ? reg_otl3_044_q : 32'h00000000;


assign reg_otl3_048_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[ 63: 32];
assign reg_otl3_048_rdata = (sel_otl3_048 == 1'b1 && do_read == 1'b1) ? reg_otl3_048_q : 32'h00000000;


assign reg_otl3_04C_q = cfg_ro_otl3_rcv_rate_tmpl_capbl[ 31:  0];
assign reg_otl3_04C_rdata = (sel_otl3_04C == 1'b1 && do_read == 1'b1) ? reg_otl3_04C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_050_q <= reg_otl3_050_init;    // Load initial value during reset
    else if (sel_otl3_050 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_050_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_050_q[31:24];
        reg_otl3_050_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_050_q[23:16];
        reg_otl3_050_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_050_q[15: 8];
        reg_otl3_050_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_050_q[ 7: 0];
      end
    else                 reg_otl3_050_q <= reg_otl3_050_q;       // Hold value when register is not selected
  end
assign reg_otl3_050_rdata = (sel_otl3_050 == 1'b1 && do_read == 1'b1) ? reg_otl3_050_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_054_q <= reg_otl3_054_init;    // Load initial value during reset
    else if (sel_otl3_054 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_054_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_054_q[31:24];
        reg_otl3_054_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_054_q[23:16];
        reg_otl3_054_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_054_q[15: 8];
        reg_otl3_054_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_054_q[ 7: 0];
      end
    else                 reg_otl3_054_q <= reg_otl3_054_q;       // Hold value when register is not selected
  end
assign reg_otl3_054_rdata = (sel_otl3_054 == 1'b1 && do_read == 1'b1) ? reg_otl3_054_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_058_q <= reg_otl3_058_init;    // Load initial value during reset
    else if (sel_otl3_058 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_058_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_058_q[31:24];
        reg_otl3_058_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_058_q[23:16];
        reg_otl3_058_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_058_q[15: 8];
        reg_otl3_058_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_058_q[ 7: 0];
      end
    else                 reg_otl3_058_q <= reg_otl3_058_q;      // Hold value when register is not selected
  end
assign reg_otl3_058_rdata = (sel_otl3_058 == 1'b1 && do_read == 1'b1) ? reg_otl3_058_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_05C_q <= reg_otl3_05C_init;    // Load initial value during reset
    else if (sel_otl3_05C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_05C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_05C_q[31:24];
        reg_otl3_05C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_05C_q[23:16];
        reg_otl3_05C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_05C_q[15: 8];
        reg_otl3_05C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_05C_q[ 7: 0];
      end
    else                 reg_otl3_05C_q <= reg_otl3_05C_q;       // Hold value when register is not selected
  end
assign reg_otl3_05C_rdata = (sel_otl3_05C == 1'b1 && do_read == 1'b1) ? reg_otl3_05C_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_060_q <= reg_otl3_060_init;    // Load initial value during reset
    else if (sel_otl3_060 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_060_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_060_q[31:24];
        reg_otl3_060_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_060_q[23:16];
        reg_otl3_060_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_060_q[15: 8];
        reg_otl3_060_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_060_q[ 7: 0];
      end
    else                 reg_otl3_060_q <= reg_otl3_060_q;       // Hold value when register is not selected
  end
assign reg_otl3_060_rdata = (sel_otl3_060 == 1'b1 && do_read == 1'b1) ? reg_otl3_060_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_064_q <= reg_otl3_064_init;    // Load initial value during reset
    else if (sel_otl3_064 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_064_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_064_q[31:24];
        reg_otl3_064_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_064_q[23:16];
        reg_otl3_064_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_064_q[15: 8];
        reg_otl3_064_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_064_q[ 7: 0];
      end
    else                 reg_otl3_064_q <= reg_otl3_064_q;       // Hold value when register is not selected
  end
assign reg_otl3_064_rdata = (sel_otl3_064 == 1'b1 && do_read == 1'b1) ? reg_otl3_064_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_068_q <= reg_otl3_068_init;    // Load initial value during reset
    else if (sel_otl3_068 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_068_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_068_q[31:24];
        reg_otl3_068_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_068_q[23:16];
        reg_otl3_068_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_068_q[15: 8];
        reg_otl3_068_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_068_q[ 7: 0];
      end
    else                 reg_otl3_068_q <= reg_otl3_068_q;       // Hold value when register is not selected
  end
assign reg_otl3_068_rdata = (sel_otl3_068 == 1'b1 && do_read == 1'b1) ? reg_otl3_068_q : 32'h00000000;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_otl3_06C_q <= reg_otl3_06C_init;    // Load initial value during reset
    else if (sel_otl3_06C == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_otl3_06C_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_otl3_06C_q[31:24];
        reg_otl3_06C_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_otl3_06C_q[23:16];
        reg_otl3_06C_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_otl3_06C_q[15: 8];
        reg_otl3_06C_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_otl3_06C_q[ 7: 0];
      end
    else                 reg_otl3_06C_q <= reg_otl3_06C_q;       // Hold value when register is not selected
  end
assign reg_otl3_06C_rdata = (sel_otl3_06C == 1'b1 && do_read == 1'b1) ? reg_otl3_06C_q : 32'h00000000;

// Registers x070 through x08C are 'reserved' but not implemented. When reading, they will return 0.
// This will happen naturally when all other *_rdata vectors contain 0s.
wire [31:0] reg_otl3_unimp_q;                // Provide a facility that the CFG verification environment can check for these regs
assign      reg_otl3_unimp_q = 32'h00000000;

`endif


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


assign reg_ofunc_000_q[31:20] = `OVSEC0_BASE;   
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

// Placeholder for future changes

// ..............................................
// @@@ OCTRL00
// ..............................................

// Placeholder for future changes

// ..............................................
// @@@ OVSEC0
// ..............................................


wire [31:0] reg_ovsec_000_q;   
wire [31:0] reg_ovsec_004_q;   
reg  [31:0] reg_ovsec_008_q;
wire [31:0] reg_ovsec_00C_q; 
wire [31:0] reg_ovsec_010_q; 
wire [31:0] reg_ovsec_014_q; 
wire [31:0] reg_ovsec_018_q; 
wire [31:0] reg_ovsec_01C_q; 
wire [31:0] reg_ovsec_020_q; 
wire [31:0] reg_ovsec_024_q; 
wire [31:0] reg_ovsec_028_q; 
wire [31:0] reg_ovsec_02C_q; 
reg  [31:0] reg_ovsec_030_q; 
reg  [31:0] reg_ovsec_034_q; 

wire [31:0] reg_ovsec_000_rdata; 
wire [31:0] reg_ovsec_004_rdata; 
wire [31:0] reg_ovsec_008_rdata;
wire [31:0] reg_ovsec_00C_rdata;
wire [31:0] reg_ovsec_010_rdata; 
wire [31:0] reg_ovsec_014_rdata; 
wire [31:0] reg_ovsec_018_rdata;
wire [31:0] reg_ovsec_01C_rdata;
wire [31:0] reg_ovsec_020_rdata; 
wire [31:0] reg_ovsec_024_rdata; 
wire [31:0] reg_ovsec_028_rdata;
wire [31:0] reg_ovsec_02C_rdata;
wire [31:0] reg_ovsec_030_rdata;
wire [31:0] reg_ovsec_034_rdata;


assign reg_ovsec_000_q[31:20] = 12'h000;     // Last Extended Capability
assign reg_ovsec_000_q[19:16] = 4'h1;     
assign reg_ovsec_000_q[15: 0] = 16'h0023;
assign reg_ovsec_000_rdata = (sel_ovsec_000 == 1'b1 && do_read == 1'b1) ? reg_ovsec_000_q : 32'h00000000;


assign reg_ovsec_004_q[31:20] = 12'h038;     // Capability structure length in bytes (last byte address + 1)
assign reg_ovsec_004_q[19:16] = 4'h0;     
assign reg_ovsec_004_q[15: 0] = 16'h1014;      
assign reg_ovsec_004_rdata = (sel_ovsec_004 == 1'b1 && do_read == 1'b1) ? reg_ovsec_004_q : 32'h00000000;


//x assign reg_ovsec_008_q[31:16] = 16'h0000;    // Vendor unique      
//x assign reg_ovsec_008_q[15: 0] = 16'hF0F0;      
//x assign reg_ovsec_008_rdata = (sel_ovsec_008 == 1'b1 && do_read == 1'b1) ? reg_ovsec_008_q : 32'h00000000;
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

// --- Version Control ---

wire [31:0] cfg_ro_ovsec_cfg_version;   // Need a signal for Virtual Interface to grab when getting initial default values 
assign cfg_ro_ovsec_cfg_version = `OVSEC0_CFG_VERSION ;

assign reg_ovsec_00C_q[31: 0] = cfg_ro_ovsec_cfg_version;
assign reg_ovsec_00C_rdata = (sel_ovsec_00C == 1'b1 && do_read == 1'b1) ? reg_ovsec_00C_q : 32'h00000000;


assign reg_ovsec_010_q[31: 0] = cfg_ro_ovsec_tlx0_version;
assign reg_ovsec_010_rdata = (sel_ovsec_010 == 1'b1 && do_read == 1'b1) ? reg_ovsec_010_q : 32'h00000000;


assign reg_ovsec_014_q[31: 0] = cfg_ro_ovsec_tlx1_version;
assign reg_ovsec_014_rdata = (sel_ovsec_014 == 1'b1 && do_read == 1'b1) ? reg_ovsec_014_q : 32'h00000000;


assign reg_ovsec_018_q[31: 0] = cfg_ro_ovsec_tlx2_version;
assign reg_ovsec_018_rdata = (sel_ovsec_018 == 1'b1 && do_read == 1'b1) ? reg_ovsec_018_q : 32'h00000000;


assign reg_ovsec_01C_q[31: 0] = cfg_ro_ovsec_tlx3_version;
assign reg_ovsec_01C_rdata = (sel_ovsec_01C == 1'b1 && do_read == 1'b1) ? reg_ovsec_01C_q : 32'h00000000;


assign reg_ovsec_020_q[31: 0] = cfg_ro_ovsec_dlx0_version;
assign reg_ovsec_020_rdata = (sel_ovsec_020 == 1'b1 && do_read == 1'b1) ? reg_ovsec_020_q : 32'h00000000;


assign reg_ovsec_024_q[31: 0] = cfg_ro_ovsec_dlx1_version;
assign reg_ovsec_024_rdata = (sel_ovsec_024 == 1'b1 && do_read == 1'b1) ? reg_ovsec_024_q : 32'h00000000;


assign reg_ovsec_028_q[31: 0] = cfg_ro_ovsec_dlx2_version;
assign reg_ovsec_028_rdata = (sel_ovsec_028 == 1'b1 && do_read == 1'b1) ? reg_ovsec_028_q : 32'h00000000;


assign reg_ovsec_02C_q[31: 0] = cfg_ro_ovsec_dlx3_version;
assign reg_ovsec_02C_rdata = (sel_ovsec_02C == 1'b1 && do_read == 1'b1) ? reg_ovsec_02C_q : 32'h00000000;

// --- FLASH Control ---

// The FLASH control interface is designed such that:
// output   [1:0] cfg_flsh_devsel    // Select AXI4-Lite device to target
// output  [13:0] cfg_flsh_addr      // Read or write address to selected target
// output         cfg_flsh_wren      // Set to 1 to write a location, hold at 1 until see 'flsh_done' = 1 then clear to 0
// output  [31:0] cfg_flsh_wdata     // Contains data to write to FLASH register (valid while wren=1)
// output         cfg_flsh_rden      // Set to 1 to read  a location, hold at 1 until see 'flsh_done' = 1 the clear to 0
// input   [31:0] flsh_cfg_rdata     // Contains data read back from FLASH register (valid when rden=1 and 'flsh_done'=1)
// input          flsh_cfg_done      // FLASH logic pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
// input    [9:0] flsh_cfg_status    // Device Specific status information
// input    [1:0] flsh_cfg_bresp     // Write response from selected AXI4-Lite device
// input    [1:0] flsh_cfg_rresp     // Read  response from selected AXI4-Lite device

reg flsh_wr_strobe_q; 
reg flsh_rd_strobe_q;   

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_ovsec_030_q <= reg_ovsec_030_init;   // Load initial value during reset
    else if (sel_ovsec_030 == 1'b1)                               // If selected, write any byte that is active
      begin
        reg_ovsec_030_q[31:24] <= flsh_cfg_status;                // Set read only fields all the time
        reg_ovsec_030_q[23:22] <= flsh_cfg_bresp;
        reg_ovsec_030_q[21:20] <= flsh_cfg_rresp;
        reg_ovsec_030_q[19:18] <= (wr_be[2] == 1'b1) ? wdata_q[19:18] : reg_ovsec_030_q[19:18];
        reg_ovsec_030_q[   17] <= flsh_wr_strobe_q;               // Special control logic
        reg_ovsec_030_q[   16] <= flsh_rd_strobe_q;
        reg_ovsec_030_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_ovsec_030_q[15: 8];
        reg_ovsec_030_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_ovsec_030_q[ 7: 0];
      end
    else
      begin
        reg_ovsec_030_q[31:24] <= flsh_cfg_status;                // Set read only fields all the time
        reg_ovsec_030_q[23:22] <= flsh_cfg_bresp;
        reg_ovsec_030_q[21:20] <= flsh_cfg_rresp;
        reg_ovsec_030_q[19:18] <= reg_ovsec_030_q[19:18];         // Hold value in rest of the bits when register is not selected
        reg_ovsec_030_q[   17] <= flsh_wr_strobe_q;               // Special control logic
        reg_ovsec_030_q[   16] <= flsh_rd_strobe_q;
        reg_ovsec_030_q[15: 0] <= reg_ovsec_030_q[15:0];          // Hold value in rest of the bits when register is not selected
      end
  end
assign reg_ovsec_030_rdata = (sel_ovsec_030 == 1'b1 && do_read == 1'b1) ? reg_ovsec_030_q : 32'h00000000;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) flsh_wr_strobe_q <= reg_ovsec_030_init[17];
    else if (flsh_wr_strobe_q == 1'b1 && flsh_cfg_done == 1'b1)     // Write Strobe is active and 'done' is being pulsed, clear it
        flsh_wr_strobe_q <= 1'b0;                                   //   (This takes priority over a config_write, which shouldn't 
                                                                    //    happen as software shouldn't start new op until after the 
                                                                    //    current one completes.)
    else if (sel_ovsec_030 == 1'b1 && wr_be[2] == 1'b1)             // Set to written value on config_write with active byte enable 
      flsh_wr_strobe_q <= wdata_q[17];
    else 
      flsh_wr_strobe_q <= flsh_wr_strobe_q;                         // Hold value
  end

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) flsh_rd_strobe_q <= reg_ovsec_030_init[16];
    else if (flsh_rd_strobe_q == 1'b1 && flsh_cfg_done == 1'b1)     // Read Strobe is active and 'done' is being pulsed, clear it
        flsh_rd_strobe_q <= 1'b0;                                   //   (This takes priority over a config_write, which shouldn't 
                                                                    //    happen as software shouldn't start new op until after the 
                                                                    //    current one completes.)
    else if (sel_ovsec_030 == 1'b1 && wr_be[2] == 1'b1)             // Set to written value on config_write with active byte enable 
      flsh_rd_strobe_q <= wdata_q[16];
    else 
      flsh_rd_strobe_q <= flsh_rd_strobe_q;                         // Hold value
  end


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_ovsec_034_q <= reg_ovsec_034_init;     // Load initial value during reset
    else if (flsh_rd_strobe_q == 1'b1 && flsh_cfg_done == 1'b1)     // Read Strobe is active and 'done' is being pulsed, load read data
        reg_ovsec_034_q        <= flsh_cfg_rdata;                   //   (This takes priority over a config_write, which shouldn't 
                                                                    //    happen as software shouldn't start new op until after the 
                                                                    //    current one completes.)
    else if (sel_ovsec_034 == 1'b1)                                 // If selected, write any byte that is active (wr_be=0000 on read)
      begin
        reg_ovsec_034_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_ovsec_034_q[31:24];
        reg_ovsec_034_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_ovsec_034_q[23:16];
        reg_ovsec_034_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_ovsec_034_q[15: 8];
        reg_ovsec_034_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_ovsec_034_q[ 7: 0];
      end
    else                 reg_ovsec_034_q <= reg_ovsec_034_q;        // Hold value when register is not selected or operation is on-going
  end
assign reg_ovsec_034_rdata = (sel_ovsec_034 == 1'b1 && do_read == 1'b1) ? reg_ovsec_034_q : 32'h00000000;



// ----------------------------------
// Select source for ultimate read data
// ----------------------------------
wire [31:0] final_rdata_d;
reg  [31:0] final_rdata_q;
reg         final_rdata_vld_q;

// Use a big OR gate to combine all the read data sources. When source is not selected, the 'rdata' vector should be all 0.
assign final_rdata_d = reg_csh_000_rdata   | reg_csh_004_rdata   | reg_csh_008_rdata   | reg_csh_00C_rdata   |
                       reg_csh_010_rdata   | reg_csh_014_rdata   | reg_csh_018_rdata   | reg_csh_01C_rdata   |
                       reg_csh_020_rdata   | reg_csh_024_rdata   | reg_csh_028_rdata   | reg_csh_02C_rdata   |
                       reg_csh_030_rdata   | reg_csh_034_rdata   | reg_csh_038_rdata   | reg_csh_03C_rdata   |
                       reg_vpd_000_rdata   | reg_vpd_004_rdata   |
                       reg_dsn_000_rdata   | reg_dsn_004_rdata   | reg_dsn_008_rdata   |
                       reg_otl0_000_rdata  | reg_otl0_004_rdata  | reg_otl0_008_rdata  | reg_otl0_00C_rdata  |
                       reg_otl0_010_rdata  | reg_otl0_014_rdata  | reg_otl0_018_rdata  | reg_otl0_01C_rdata  |
                       reg_otl0_020_rdata  | reg_otl0_024_rdata  | reg_otl0_028_rdata  | reg_otl0_02C_rdata  |
                       reg_otl0_030_rdata  | reg_otl0_034_rdata  | reg_otl0_038_rdata  | reg_otl0_03C_rdata  |
                       reg_otl0_040_rdata  | reg_otl0_044_rdata  | reg_otl0_048_rdata  | reg_otl0_04C_rdata  |
                       reg_otl0_050_rdata  | reg_otl0_054_rdata  | reg_otl0_058_rdata  | reg_otl0_05C_rdata  |
                       reg_otl0_060_rdata  | reg_otl0_064_rdata  | reg_otl0_068_rdata  | reg_otl0_06C_rdata  |
//                     reg_otl0_070_rdata  | reg_otl0_074_rdata  | reg_otl0_078_rdata  | reg_otl0_07C_rdata  |  (reserved locations)
//                     reg_otl0_080_rdata  | reg_otl0_084_rdata  | reg_otl0_088_rdata  | reg_otl0_08C_rdata  |  (reserved locations)
`ifdef EXPOSE_CFG_PORT_1
                       reg_otl1_000_rdata  | reg_otl1_004_rdata  | reg_otl1_008_rdata  | reg_otl1_00C_rdata  |
                       reg_otl1_010_rdata  | reg_otl1_014_rdata  | reg_otl1_018_rdata  | reg_otl1_01C_rdata  |
                       reg_otl1_020_rdata  | reg_otl1_024_rdata  | reg_otl1_028_rdata  | reg_otl1_02C_rdata  |
                       reg_otl1_030_rdata  | reg_otl1_034_rdata  | reg_otl1_038_rdata  | reg_otl1_03C_rdata  |
                       reg_otl1_040_rdata  | reg_otl1_044_rdata  | reg_otl1_048_rdata  | reg_otl1_04C_rdata  |
                       reg_otl1_050_rdata  | reg_otl1_054_rdata  | reg_otl1_058_rdata  | reg_otl1_05C_rdata  |
                       reg_otl1_060_rdata  | reg_otl1_064_rdata  | reg_otl1_068_rdata  | reg_otl1_06C_rdata  |
//                     reg_otl1_070_rdata  | reg_otl1_074_rdata  | reg_otl1_078_rdata  | reg_otl1_07C_rdata  |  (reserved locations)
//                     reg_otl1_080_rdata  | reg_otl1_084_rdata  | reg_otl1_088_rdata  | reg_otl1_08C_rdata  |  (reserved locations)
`endif
`ifdef EXPOSE_CFG_PORT_2
                       reg_otl2_000_rdata  | reg_otl2_004_rdata  | reg_otl2_008_rdata  | reg_otl2_00C_rdata  |
                       reg_otl2_010_rdata  | reg_otl2_014_rdata  | reg_otl2_018_rdata  | reg_otl2_01C_rdata  |
                       reg_otl2_020_rdata  | reg_otl2_024_rdata  | reg_otl2_028_rdata  | reg_otl2_02C_rdata  |
                       reg_otl2_030_rdata  | reg_otl2_034_rdata  | reg_otl2_038_rdata  | reg_otl2_03C_rdata  |
                       reg_otl2_040_rdata  | reg_otl2_044_rdata  | reg_otl2_048_rdata  | reg_otl2_04C_rdata  |
                       reg_otl2_050_rdata  | reg_otl2_054_rdata  | reg_otl2_058_rdata  | reg_otl2_05C_rdata  |
                       reg_otl2_060_rdata  | reg_otl2_064_rdata  | reg_otl2_068_rdata  | reg_otl2_06C_rdata  |
//                     reg_otl2_070_rdata  | reg_otl2_074_rdata  | reg_otl2_078_rdata  | reg_otl2_07C_rdata  |  (reserved locations)
//                     reg_otl2_080_rdata  | reg_otl2_084_rdata  | reg_otl2_088_rdata  | reg_otl2_08C_rdata  |  (reserved locations)
`endif
`ifdef EXPOSE_CFG_PORT_3
                       reg_otl3_000_rdata  | reg_otl3_004_rdata  | reg_otl3_008_rdata  | reg_otl3_00C_rdata  |
                       reg_otl3_010_rdata  | reg_otl3_014_rdata  | reg_otl3_018_rdata  | reg_otl3_01C_rdata  |
                       reg_otl3_020_rdata  | reg_otl3_024_rdata  | reg_otl3_028_rdata  | reg_otl3_02C_rdata  |
                       reg_otl3_030_rdata  | reg_otl3_034_rdata  | reg_otl3_038_rdata  | reg_otl3_03C_rdata  |
                       reg_otl3_040_rdata  | reg_otl3_044_rdata  | reg_otl3_048_rdata  | reg_otl3_04C_rdata  |
                       reg_otl3_050_rdata  | reg_otl3_054_rdata  | reg_otl3_058_rdata  | reg_otl3_05C_rdata  |
                       reg_otl3_060_rdata  | reg_otl3_064_rdata  | reg_otl3_068_rdata  | reg_otl3_06C_rdata  |
//                     reg_otl3_070_rdata  | reg_otl3_074_rdata  | reg_otl3_078_rdata  | reg_otl3_07C_rdata  |  (reserved locations)
//                     reg_otl3_080_rdata  | reg_otl3_084_rdata  | reg_otl3_088_rdata  | reg_otl3_08C_rdata  |  (reserved locations)
`endif
                       reg_ofunc_000_rdata | reg_ofunc_004_rdata | reg_ofunc_008_rdata | reg_ofunc_00C_rdata |
                       reg_ovsec_000_rdata | reg_ovsec_004_rdata | reg_ovsec_008_rdata | reg_ovsec_00C_rdata |
                       reg_ovsec_010_rdata | reg_ovsec_014_rdata | reg_ovsec_018_rdata | reg_ovsec_01C_rdata |
                       reg_ovsec_020_rdata | reg_ovsec_024_rdata | reg_ovsec_028_rdata | reg_ovsec_02C_rdata |
                       reg_ovsec_030_rdata | reg_ovsec_034_rdata 
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

assign cfg_csh_memory_space            =  reg_csh_004_q[1];
assign cfg_csh_mmio_bar0               = {reg_csh_014_q[31:0], reg_csh_010_q[31:4], 4'b0000};  // Pad 0s on right for easier use
assign cfg_csh_mmio_bar1               = {reg_csh_01C_q[31:0], reg_csh_018_q[31:4], 4'b0000};
assign cfg_csh_mmio_bar2               = {reg_csh_024_q[31:0], reg_csh_020_q[31:4], 4'b0000};
assign cfg_csh_expansion_ROM_bar       = {reg_csh_030_q[31:11], 11'b0 };                       // Pad 0s on the right for easier use
assign cfg_csh_expansion_ROM_enable    =  reg_csh_030_q[0];

assign cfg_otl0_tl_major_vers_config   = reg_otl0_010_q[31:24];
assign cfg_otl0_tl_minor_vers_config   = reg_otl0_010_q[23:16];
assign cfg_otl0_long_backoff_timer     = reg_otl0_010_q[7:4];
assign cfg_otl0_short_backoff_timer    = reg_otl0_010_q[3:0];
assign cfg_otl0_xmt_tmpl_config        = { reg_otl0_020_q, reg_otl0_024_q };
assign cfg_otl0_xmt_rate_tmpl_config   = { reg_otl0_050_q, reg_otl0_054_q, reg_otl0_058_q, reg_otl0_05C_q, 
                                           reg_otl0_060_q, reg_otl0_064_q, reg_otl0_068_q, reg_otl0_06C_q };

`ifdef EXPOSE_CFG_PORT_1
assign cfg_otl1_tl_major_vers_config   = reg_otl1_010_q[31:24];
assign cfg_otl1_tl_minor_vers_config   = reg_otl1_010_q[23:16];
assign cfg_otl1_long_backoff_timer     = reg_otl1_010_q[7:4];
assign cfg_otl1_short_backoff_timer    = reg_otl1_010_q[3:0];
assign cfg_otl1_xmt_tmpl_config        = { reg_otl1_020_q, reg_otl1_024_q };
assign cfg_otl1_xmt_rate_tmpl_config   = { reg_otl1_050_q, reg_otl1_054_q, reg_otl1_058_q, reg_otl1_05C_q, 
                                           reg_otl1_060_q, reg_otl1_064_q, reg_otl1_068_q, reg_otl1_06C_q };
`endif

`ifdef EXPOSE_CFG_PORT_2
assign cfg_otl2_tl_major_vers_config   = reg_otl2_010_q[31:24];
assign cfg_otl2_tl_minor_vers_config   = reg_otl2_010_q[23:16];
assign cfg_otl2_long_backoff_timer     = reg_otl2_010_q[7:4];
assign cfg_otl2_short_backoff_timer    = reg_otl2_010_q[3:0];
assign cfg_otl2_xmt_tmpl_config        = { reg_otl2_020_q, reg_otl2_024_q };
assign cfg_otl2_xmt_rate_tmpl_config   = { reg_otl2_050_q, reg_otl2_054_q, reg_otl2_058_q, reg_otl2_05C_q, 
                                           reg_otl2_060_q, reg_otl2_064_q, reg_otl2_068_q, reg_otl2_06C_q };
`endif

`ifdef EXPOSE_CFG_PORT_3
assign cfg_otl3_tl_major_vers_config   = reg_otl3_010_q[31:24];
assign cfg_otl3_tl_minor_vers_config   = reg_otl3_010_q[23:16];
assign cfg_otl3_long_backoff_timer     = reg_otl3_010_q[7:4];
assign cfg_otl3_short_backoff_timer    = reg_otl3_010_q[3:0];
assign cfg_otl3_xmt_tmpl_config        = { reg_otl3_020_q, reg_otl3_024_q };
assign cfg_otl3_xmt_rate_tmpl_config   = { reg_otl3_050_q, reg_otl3_054_q, reg_otl3_058_q, reg_otl3_05C_q, 
                                           reg_otl3_060_q, reg_otl3_064_q, reg_otl3_068_q, reg_otl3_06C_q };
`endif

assign cfg_ofunc_function_reset        = reg_ofunc_function_reset_active;   // Need to send internal reset signal, not reg bit as reg bit will be cleared as soon as Function reset starts. Internal reset signal though will be held longer, giving Function and underlying AFUs more time to see an active reset.
assign cfg_ofunc_func_actag_base       = reg_ofunc_00C_q[27:16];
assign cfg_ofunc_func_actag_len_enab   = reg_ofunc_00C_q[11:0];


// Drive to AXI4-Lite devices
assign cfg_flsh_expand_enable = reg_ovsec_030_q[19];
assign cfg_flsh_expand_dir    = reg_ovsec_030_q[18];
assign cfg_flsh_devsel        = reg_ovsec_030_q[15:14];
assign cfg_flsh_addr          = reg_ovsec_030_q[13: 0];
assign cfg_flsh_wren          = reg_ovsec_030_q[17];
assign cfg_flsh_rden          = reg_ovsec_030_q[16];
assign cfg_flsh_wdata         = reg_ovsec_034_q;


endmodule 
