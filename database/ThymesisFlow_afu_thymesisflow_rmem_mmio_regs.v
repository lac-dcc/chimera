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
`timescale 1ns / 10ps

// ******************************************************************************************************************************
// Module Description : This file contains the MMIO registers for the RMEM AFU reference design.
// ******************************************************************************************************************************
// Functional Description
//
// Most internal MMIO accessible registers are 64 bits wide, using Little Endian format and addressing. 
// This means bits are ordered [63:0] and bytes are ordered 7,6,5,4,3,2,1,0 when looking at the lowest 3 address bits.
// Some registers used for test purposes are intentionally smaller, but these are special cases.
//
// The implemented MMIO address range is 1 MByte, so uses the lower 20 bits of address to index into the space. Addresses
// are treated as byte addresses. Checks for 'natural alignment' is done using the lowest address bits to ensure they
// are 0, depending on the write strobe used.   
//
// Writes of various sizes are enabled using one of the four write strobes (wr_1B, wr_2B, wr_4B, wr_8B). 
// Only one should be used at a time. To signal a write, pulse one of the write strobes to 1 for a single cycle.  
// The byte(s) written are selected by the lower 3 bits of the address. 
// The address and data width must follow "natural alignment", meaning any byte can be selected for a 1 byte write, addr[0] must be
// b0 to select a 2 byte write, addr[1:0] must be b00 to select a 4 byte write, and addr[2:0] must be b000 on an 8 byte write. 
// If these conditions are not met, an error (bad_op_or_align) is pulsed and the write operation is discarded.
//
// Read operations are triggered by pulsing the read strobe (rd) active for one cycle. Only one read or write can be performed
// at a time, it is considered an error if multiple strobes of any kind are active at the same time. A read operation is always
// returns 8 bytes.
// 
// One register is selected at a time using the address bus (addr). Writes to an address that is not implemented have no effect. 
// Reads from an address that is not implemented returns all 0s.
//
// To make timing closure as easy as possible, the design is latch bounded. Inputs are latched
// immediately and acted upon in the next cycle. During this cycle the target register and write data widths are determined. In the 
// cycle after that, the config register is updated (on a write), the config register contents are available for viewing (on a 
// read), or the error indicator is presented. All outputs are driven directly from latches to provide the best timing closure
// situation for the AFU design that uses this module. 
//
// Read and write operations can be pipelined in back to back cycles. A cycle starts on the rising edge of the clock (clock).
// When reset is active (=b1), all configuration registers are set to their initial values.
//
// Example timing diagram                   
//   clock                  ___|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^^^|____|^^
//   mmio_addr              .<AAAA>........................<BBBB>........................<CCCC>.............................
//   mmio_wdata             .<dataA>........................................................................................
//   mmio_wr_[1,2,4,8]B     _^^^^^^^^^___________________________________________________^^^^^^^^^^_________________________
//   (internal reg A)       .............<data AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//   mmio_rd                _______________________________^^^^^^^^______________________^^^^^^^^___________________________
//   mmio_rdata             ............................................<dataBBBB>..........................................
//   mmio_rdata_vld         ____________________________________________^^^^^^^^^^__________________________________________
//   mmio_bad_op_or_align   __________________________________________________________________________^^^^^^^^^^____________
//  (mmio_addr_not_implemented)  _____________________________________________________________________^^^^^^^^^^____________
//
// The first operation is a write to register "A". The address, write data, and one of the write strobes are present at same time.
// Data is written into the selected register on the clock edge after presentation.
// The second operation is a read from register "B". The adddress and read strobe are present at the same time. Data from 
// the targeted configuration register appears for one cycle, along with the 'rdata_vld' signal, 1 cycle after the read op is detected.
// The third operation is illegal, as multiple write or read strobes are active at the same time. The operation is dropped, so
// no change is made to the internal config register contents. No read data or read valid is present, but an error indicator
// (bad_op_or_align or addr_not_implemented) is pulsed during cycle read data would be present. 
// 'bad_op_or_align' will occur if either the alignment is incorrect on legal write or if multiple write/read strobes are present.
// 'addr_not_implemented' will occur if the address provided is within the MMIO registers, but not implemented.
//
// ******************************************************************************************************************************

// When updating the MMIO registers, check these things:
// - Per OPPA spec (section 1.2 Reserved Fields & Registers) reading reserved bits must return 0, writing reserved bits are ignored.
// - Per OPPA spec (section 1.2 Reserved Fields & Registers) AFU must decode all reserved registers for both reads and writes.
// - Per OPPA spec (section 1.2 Reserved Fields & Registers) all reserved regs must be initialized to 0.


// ==============================================================================================================================
// @@@  Module Declaration
/// ==============================================================================================================================
module rmem_mmio_regs (
  
    // Miscellaneous Ports
    input          clock                             
  , input          reset                      // (positive active)

    // Functional interface
  , input   [19:0] mmio_addr                  // Target address for the read or write access
  , input   [63:0] mmio_wdata                 // Write data into selected MMIO reg
  , output  [63:0] mmio_rdata                 // Read  data from selected MMIO reg
  , output         mmio_rdata_vld             // When observed in the proper cycle, indicates if mmio_rdata has valid information
  , input          mmio_wr_1B                 // When 1, triggers a write operation of 1 byte  (mmio_addr[2:0] selects byte)
  , input          mmio_wr_2B                 // When 1, triggers a write operation of 2 bytes (mmio_addr[2:1] selects starting byte)
  , input          mmio_wr_4B                 // When 1, triggers a write operation of 4 bytes (mmio_addr[2]   selects starting byte)
  , input          mmio_wr_8B                 // When 1, triggers a write operation of all 8 bytes
  , input          mmio_rd                    // When 1, triggers a read operation that returns all 4 bytes of data from the reg
  , output         mmio_bad_op_or_align       // Pulsed when multiple write/read strobes are active or writes are not naturally aligned
  , output         mmio_addr_not_implemented  // Pulsed when address provided is not implemented as an MMIO register


    // Inputs for readable MMIO fields
  , input   [63:0] mmio_in_captured_errors    // When pulsed to 1, the associated MMIO reg bit is captured and held to 1. Write to 0 to clear.
  , input   [63:0] mmio_in_status             // Provide a READ ONLY way for signals like status to be assigned an MMIO address
  , input  [127:0] mmio_ery_data_out          // Information associated with an interrupt, expected that software will read this
  , input          mmio_in_intrp_is_pending   // When 1, set interrupt pending bit in MSI-X PBA register
   //Input for aurora cores status
  , input  [63:0]  aurora_status

    // Writable MMIO fields used within the design
  , output         mmio_out_test_enable             // When 1, fires the test command logic
  , output         mmio_out_ignore_nomatch_on_read  // When 1, reading from uninitialized memory is not a read error
  , output         mmio_out_enable_pipeline         // When 1, pipelining is enabled on bulk memory writes and reads
  , output  [63:0] mmio_out_captured_errors         // Provide vector to sample at the end of a test to see if an error occurred
  , output  [63:0] mmio_out_intrp_ea                // Effective Address to use in intrp_req
  , output         mmio_out_intrp_vec_mask          // Enable/disable indicator of intrp_ea
  , output  [19:0] mmio_out_intrp_pasid             // PASID value to use in assign_actag preceding intrp_req
  , output   [3:0] mmio_out_intrp_cmd_flag          // CMD_FLAG value to use in intrp_req
  , output   [3:0] mmio_out_intrp_stream_id         // STREAM_ID value to use in intrp_req
  , output  [15:0] mmio_out_intrp_afutag            // AFUTAG value to use in intrp_req

    // Control outputs
  , output         mmio_ery_data_done        // Pulsed to 1 when 2nd MMIO register of error information is read. Used to present next error vector.
  , output         mmio_ery_loadsrc15        // Pulsed to 1 when mmio_in_captured_errors captures first error
  , output [127:0] mmio_ery_src15            // Save first error source in error array
  , output         mmio_ery_loadsrc14        // Pulsed to 1 when a software generated interrupt is detected
  , output [127:0] mmio_ery_src14            // Save first error source in error array
   
   //ThymesisFlow configuration writable Outputs 
  , output [63:0]  thymesis_out_slot0_reg  // ThymesisFlow configuration register 0 
  , output [63:0]  thymesis_out_slot1_reg  // ThymesisFlow configuration register 1
  , output [63:0]  thymesis_out_slot2_reg  // ThymesisFlow configuration register 2
  , output [63:0]  thymesis_out_slot3_reg  // ThymesisFlow configuration register 3
  , output [63:0]  thymesis_out_slot4_reg  // ThymesisFlow configuration register 4
  , output [63:0]  thymesis_out_slot5_reg  // ThymesisFlow configuration register 5
  , output [63:0]  thymesis_out_slot6_reg  // ThymesisFlow configuration register 6
  , output [63:0]  thymesis_out_slot7_reg  // ThymesisFlow configuration register 7
  , output [63:0]  thymesis_out_slot8_reg  // ThymesisFlow configuration register 8
  , output [63:0]  thymesis_out_slot9_reg  // ThymesisFlow configuration register 9
  , output [63:0]  thymesis_out_slot10_reg // ThymesisFlow configuration register 10
  , output [63:0]  thymesis_out_slot11_reg // ThymesisFlow configuration register 11
  // aurora serDes control
  , output [63:0]  aurora_control_reg //Control Aurora serDES instance 0
  , input  [63:0]  latency_cycle_counter //latency counter cycles.
  , output latency_counter_reset 
  , input  flit_tx_pulse   //arriving flits that reset latency counters
  , input  flit_rx_pulse_cmd
  , input  flit_rx_pulse_data
) ;
// slot11 is not used yet
assign thymesis_out_slot11_reg = 64'b0;

// ----------------------------------
// Latch the inputs
// ----------------------------------
reg [19:0] addr_q  ;
reg [63:0] wdata_q ;
reg        wr_1B_q ;
reg        wr_2B_q ;
reg        wr_4B_q ;
reg        wr_8B_q ;
reg        rd_q    ;
reg        reset_q ;

always @(posedge(clock))
  begin
    addr_q  <= mmio_addr ;
    wdata_q <= mmio_wdata;
    wr_1B_q <= mmio_wr_1B;
    wr_2B_q <= mmio_wr_2B;
    wr_4B_q <= mmio_wr_4B;
    wr_8B_q <= mmio_wr_8B;
    rd_q    <= mmio_rd;
    reset_q <= reset;
  end

 

// --------------------------------------------
// Check read/write conflict, byte alignment, and determine write byte enables
// --------------------------------------------
reg [7:0] wr_be;              // Individual byte enables. When 1, a write operation will overlay that byte. When 0, byte remains untouched
reg       do_read;            // Set to 1 if no conflict between read and write, and read is requested
reg       bad_op_or_align_d;
reg       bad_op_or_align_q;

always @(wr_1B_q, wr_2B_q, wr_4B_q, wr_8B_q, rd_q, addr_q[2:0])   // This is combinational logic
  begin
    // No operation is selected. No write enable or read or error is set
    if      (wr_1B_q==1'b0 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0)     
      begin  wr_be = 8'b0000_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end

    // Operation is a legal read. Set 'do_read' and no write bits nor error. (Note: No address alignment check performed on reads.)
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b1)      
      begin  wr_be = 8'b0000_0000;   do_read = 1'b1;  bad_op_or_align_d = 1'b0; end

    // Operation is a legal 8B write. Set all write enables, no read nor error.
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b1 & rd_q==1'b0 & addr_q[2:0]==3'b000)
      begin  wr_be = 8'b1111_1111;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               

    // Operation is a legal 4B write. Set half write enables, no read nor error.
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b0 & wr_4B_q==1'b1 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b000)  // bytes 0,1,2,3
      begin  wr_be = 8'b0000_1111;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b0 & wr_4B_q==1'b1 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b100)  // bytes 4,5,6,7
      begin  wr_be = 8'b1111_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               

    // Operation is a legal 2B write. Set 1/4 write enables, no read nor error.
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b1 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b000)  // bytes 0,1
      begin  wr_be = 8'b0000_0011;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b1 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b010)  // bytes 2,3
      begin  wr_be = 8'b0000_1100;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b1 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b100)  // bytes 4,5
      begin  wr_be = 8'b0011_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b0 & wr_2B_q==1'b1 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b110)  // bytes 6,7
      begin  wr_be = 8'b1100_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               

    // Operation is a legal 1B write. Set individual write enables, no read nor error.
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b000)  // byte 0
      begin  wr_be = 8'b0000_0001;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b001)  // byte 1
      begin  wr_be = 8'b0000_0010;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b010)  // byte 2
      begin  wr_be = 8'b0000_0100;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b011)  // byte 3
      begin  wr_be = 8'b0000_1000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b100)  // byte 4
      begin  wr_be = 8'b0001_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b101)  // byte 5
      begin  wr_be = 8'b0010_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b110)  // byte 6
      begin  wr_be = 8'b0100_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               
    else if (wr_1B_q==1'b1 & wr_2B_q==1'b0 & wr_4B_q==1'b0 & wr_8B_q==1'b0 & rd_q==1'b0 & addr_q[2:0]==3'b111)  // byte 7
      begin  wr_be = 8'b1000_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b0; end               

    // Operation is illegal. Set no write enable or read, but flag an error
    else                                                                                      
      begin  wr_be = 8'b0000_0000;   do_read = 1'b0;  bad_op_or_align_d = 1'b1; end           

  end

// Latch error before sending out of module so it aligns with read data and write data taking effect
always @(posedge(clock))
  if (reset_q == 1'b1) bad_op_or_align_q <= 1'b0;   // Clear error
  else bad_op_or_align_q <= bad_op_or_align_d;

assign mmio_bad_op_or_align = bad_op_or_align_q;  


// ------------------------------------
// Select target register using address
// ------------------------------------
wire sel_00000;   // Normal registers, sometimes with bit fields
wire sel_00008;
wire sel_00010;
wire sel_00018;
//getting registers for thymesisflow offset calculation and steering.
wire sel_00020; 
wire sel_00028;
wire sel_00030;
wire sel_00038;
wire sel_00040;
wire sel_00048;
wire sel_00050;
wire sel_00058;
wire sel_00060;
wire sel_00068;
wire sel_00070;
wire sel_00078;
wire sel_00080;
wire sel_00088;
wire sel_00100;   // Read Only status
wire sel_00108;   // Error capture and hold
wire sel_00110;   // Error vector 1
wire sel_00118;   // Error vector 2
wire sel_00200_002FF;  // Scratch pad array 
wire sel_80000;
wire sel_80008;
wire sel_80010;
wire sel_80018;

assign sel_00000       = (addr_q >= 20'h00000 && addr_q < 20'h00008) ? 1'b1 : 1'b0;
assign sel_00008       = (addr_q >= 20'h00008 && addr_q < 20'h00010) ? 1'b1 : 1'b0;
assign sel_00010       = (addr_q >= 20'h00010 && addr_q < 20'h00018) ? 1'b1 : 1'b0;
assign sel_00018       = (addr_q >= 20'h00018 && addr_q < 20'h00020) ? 1'b1 : 1'b0;
//getting another 12 - from 0x20 - 0x88
assign sel_00020       = (addr_q >= 20'h00020 && addr_q < 20'h00028) ? 1'b1 : 1'b0; 
assign sel_00028       = (addr_q >= 20'h00028 && addr_q < 20'h00030) ? 1'b1 : 1'b0;
assign sel_00030       = (addr_q >= 20'h00030 && addr_q < 20'h00038) ? 1'b1 : 1'b0;
assign sel_00038       = (addr_q >= 20'h00038 && addr_q < 20'h00040) ? 1'b1 : 1'b0;
assign sel_00040       = (addr_q >= 20'h00040 && addr_q < 20'h00048) ? 1'b1 : 1'b0;
assign sel_00048       = (addr_q >= 20'h00048 && addr_q < 20'h00050) ? 1'b1 : 1'b0;
assign sel_00050       = (addr_q >= 20'h00050 && addr_q < 20'h00058) ? 1'b1 : 1'b0;
assign sel_00058       = (addr_q >= 20'h00058 && addr_q < 20'h00060) ? 1'b1 : 1'b0;
assign sel_00060       = (addr_q >= 20'h00060 && addr_q < 20'h00068) ? 1'b1 : 1'b0;
assign sel_00068       = (addr_q >= 20'h00068 && addr_q < 20'h00070) ? 1'b1 : 1'b0;
assign sel_00070       = (addr_q >= 20'h00070 && addr_q < 20'h00078) ? 1'b1 : 1'b0;
assign sel_00078       = (addr_q >= 20'h00078 && addr_q < 20'h00080) ? 1'b1 : 1'b0;
assign sel_00080       = (addr_q >= 20'h00080 && addr_q < 20'h00088) ? 1'b1 : 1'b0;
assign sel_00088       = (addr_q >= 20'h00088 && addr_q < 20'h00090) ? 1'b1 : 1'b0;

assign sel_00100       = (addr_q >= 20'h00100 && addr_q < 20'h00108) ? 1'b1 : 1'b0;
assign sel_00108       = (addr_q >= 20'h00108 && addr_q < 20'h00110) ? 1'b1 : 1'b0;
assign sel_00110       = (addr_q >= 20'h00110 && addr_q < 20'h00118) ? 1'b1 : 1'b0;
assign sel_00118       = (addr_q >= 20'h00118 && addr_q < 20'h00120) ? 1'b1 : 1'b0;
// x00110 to x001FC un-implemented
assign sel_00200_002FF = (addr_q >= 20'h00200 && addr_q < 20'h00300) ? 1'b1 : 1'b0;
// x00300 to x7FFFC un-implemented
assign sel_80000       = (addr_q >= 20'h80000 && addr_q < 20'h80008) ? 1'b1 : 1'b0;
assign sel_80008       = (addr_q >= 20'h80008 && addr_q < 20'h80010) ? 1'b1 : 1'b0;
assign sel_80010       = (addr_q >= 20'h80010 && addr_q < 20'h80018) ? 1'b1 : 1'b0;
assign sel_80018       = (addr_q >= 20'h80018 && addr_q < 20'h80020) ? 1'b1 : 1'b0;
// x80020 to xFFFFC un-implemented



//     Add new check for the condition 'access to un-implemented address in architected range'.
//                  Latch it before sending it out of the module to align to interface timing.
//                  Note: 'reserved' address are considered to be implemented, so are not part of this range check. 
//                        Writes to reserved locations should have no effect, but not flagged as an error.
//                        Reads from them should be completed like any other read (with valid, no errors), but return all 0s as data.
assign sel_addr_not_implemented = ( (addr_q >= 20'h00080 && addr_q <  20'h00100) ||  // Between first and second range
                                    (addr_q >= 20'h00120 && addr_q <  20'h00200) ||  // Between second and third range
                                    (addr_q >= 20'h00300 && addr_q <  20'h80000) ||  // Between third and fourth range
                                    (addr_q >= 20'h80020 && addr_q <= 20'hFFFFF)     // Between fourth range and end of range
                                  ) ? 1'b1 : 1'b0;

reg addr_not_implemented_q;

always @(posedge(clock))
  addr_not_implemented_q <= sel_addr_not_implemented;  // Because 'sel' signal is calculated each cycle, the error register should self clear.

assign mmio_addr_not_implemented = addr_not_implemented_q; 

// ----------------------------------
// Implement configuration registers 
//
// Note: Put 0's on read data when register is not selected so ultimate output can just be an OR gate.
// ----------------------------------
reg  [63:0] reg_00000_q;
reg  [63:0] reg_00008_q;
reg  [63:0] reg_00010_q;  
reg  [63:0] reg_00018_q;
reg  [63:0] reg_00020_q;
reg  [63:0] reg_00028_q;
reg  [63:0] reg_00030_q;
reg  [63:0] reg_00038_q;
reg  [63:0] reg_00040_q;
reg  [63:0] reg_00048_q;
reg  [63:0] reg_00050_q;
reg  [63:0] reg_00058_q;
reg  [63:0] reg_00060_q;
reg  [63:0] reg_00068_q;
wire [63:0] reg_00070_q;
reg  [63:0] reg_00078_q;
reg  [63:0] reg_00080_q;
wire [63:0] reg_00088_q;
wire [63:0] reg_00100_q;    // (register not needed, so make into a wire)    
reg  [63:0] reg_00108_q;
wire [63:0] reg_00110_q;
wire [63:0] reg_00118_q;
reg  [63:0] reg_80000_q;
reg  [63:0] reg_80008_q;
wire [63:0] reg_80010_q;
reg  [63:0] reg_80018_q;
// Scratch pad array defined locally below

wire [63:0] reg_00000_rdata,  reg_00000_init;  
wire [63:0] reg_00008_rdata,  reg_00008_init;  
wire [63:0] reg_00010_rdata,  reg_00010_init;  
wire [63:0] reg_00018_rdata,  reg_00018_init;  
wire [63:0] reg_00020_rdata,  reg_00020_init;
wire [63:0] reg_00028_rdata,  reg_00028_init;
wire [63:0] reg_00030_rdata,  reg_00030_init;
wire [63:0] reg_00038_rdata,  reg_00038_init;
wire [63:0] reg_00040_rdata,  reg_00040_init;
wire [63:0] reg_00048_rdata,  reg_00048_init;
wire [63:0] reg_00050_rdata,  reg_00050_init;
wire [63:0] reg_00058_rdata,  reg_00058_init;
wire [63:0] reg_00060_rdata,  reg_00060_init;
wire [63:0] reg_00068_rdata,  reg_00068_init;
wire [63:0] reg_00070_rdata,  reg_00070_init;
wire [63:0] reg_00078_rdata,  reg_00078_init;
wire [63:0] reg_00080_rdata,  reg_00080_init;
wire [63:0] reg_00088_rdata;
wire [63:0] reg_00100_rdata; //,  reg_00100_init;   (register not needed)
wire [63:0] reg_00108_rdata,  reg_00108_init;  
wire [63:0] reg_00110_rdata; //,  reg_00110_init;   (register not needed)
wire [63:0] reg_00118_rdata; //,  reg_00118_init;   (register not needed)
wire [63:0] reg_80000_rdata,  reg_80000_init;
wire [63:0] reg_80008_rdata,  reg_80008_init;
wire [63:0] reg_80010_rdata; //,  reg_80010_init;   (register not needed)
wire [63:0] reg_80018_rdata,  reg_80018_init;
// Scratch pad array defined locally below

// Assign default values to registers
wire [15:0] sfw_intrp_loadsrc;
assign sfw_intrp_loadsrc = 16'h4000;   // Hardcode to identify ery_src14 which is where software interrupt is tied

assign reg_00000_init = 64'h0000_0000_0000_0000;     
assign reg_00008_init = {sfw_intrp_loadsrc, 48'h0000_0000_0000} ;     
assign reg_00010_init = 64'h0000_0000_0000_0000;     
assign reg_00018_init = 64'h0000_0000_0000_0000;     
assign reg_00020_init = 64'h0000_0000_0000_0000;  
assign reg_00028_init = 64'h0000_0000_0000_0000;  
assign reg_00030_init = 64'h0000_0000_0000_0000;  
assign reg_00038_init = 64'h0000_0000_0000_0000;  
assign reg_00040_init = 64'h0000_0000_0000_0000;  
assign reg_00048_init = 64'h0000_0000_0000_0000;  
assign reg_00050_init = 64'h0000_0000_0000_0000;  
assign reg_00058_init = 64'h0000_0000_0000_0000;  
assign reg_00060_init = 64'h0000_0000_0000_0000;  
assign reg_00068_init = 64'h0000_0000_0000_0000;  
assign reg_00070_init = 64'h0000_0000_0000_0000;  
assign reg_00078_init = 64'h0000_0000_0000_0000;  
assign reg_00080_init = 64'h0000_0000_0000_0000; //bits[6:0] should be 1 during initialization to keep aurora reset_pb asserted at boot. Resets will be deasserted at boot by OPAL
//assign reg_00100_init = 64'h0000_0000_0000_0000;     
assign reg_00108_init = 64'h0000_0000_0000_0000;     
//assign reg_00110_init = 64'h0000_0000_0000_0000;     
//assign reg_00118_init = 64'h0000_0000_0000_0000;     
assign reg_80000_init = 64'h0000_0000_0000_0000;     
assign reg_80008_init = 64'h0000_0001_0000_0000;   // intrp_vec_mask = 1 (general error interrupt is masked (disabled))   
//assign reg_80010_init = 64'h0000_0000_0000_0000;     
assign reg_80018_init = 64'h0000_0000_0000_0010; //init to a value that will allow zero to be pushed


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00000_q <= reg_00000_init;   // Load initial value during reset
    else if (sel_00000 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00000_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00000_q[63:56];
        reg_00000_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00000_q[55:48];
        reg_00000_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00000_q[47:40];
        reg_00000_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00000_q[39:32];
        reg_00000_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00000_q[31:24];
        reg_00000_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00000_q[23:16];
        reg_00000_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00000_q[15: 8];
        reg_00000_q[ 7: 2] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 2] : reg_00000_q[ 7: 2];
        reg_00000_q[    1] <= (wr_be[0] == 1'b1) ? wdata_q[    1] : 1'b0;               // trigger_sfw_intrp is auto-cleared after 1 cycle
        reg_00000_q[    0] <= (wr_be[0] == 1'b1) ? wdata_q[    0] : reg_00000_q[    0];
      end
    else reg_00000_q <= reg_00000_q;        // Hold value when register is not selected
  end
assign reg_00000_rdata = (sel_00000 == 1'b1 & do_read == 1'b1) ? reg_00000_q : 64'b0;
// Bit 1 (trigger_sfw_intrp) is special. It needs to pulse to 1 for only 1 cycle after being written to 1.
// To do this, let software write it to 1, which will load 1 into reg_00000_q[1]. On the next cycle though, 0 is loaded.
// The net effect of this is bit 1 will pulse to 1 for a single cycle. 
wire   trigger_sfw_intrp;
assign trigger_sfw_intrp = reg_00000_q[1];


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00008_q <= reg_00008_init;   // Load initial value during reset
    else if (sel_00008 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00008_q[63:56] <= sfw_intrp_loadsrc[15:8];    // Read only field
        reg_00008_q[55:48] <= sfw_intrp_loadsrc[ 7:0];    // Read only field
        reg_00008_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00008_q[47:40];
        reg_00008_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00008_q[39:32];
        reg_00008_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00008_q[31:24];
        reg_00008_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00008_q[23:16];
        reg_00008_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00008_q[15: 8];
        reg_00008_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00008_q[ 7: 0];
      end
    else reg_00008_q <= reg_00008_q;        // Hold value when register is not selected
  end
assign reg_00008_rdata = (sel_00008 == 1'b1 & do_read == 1'b1) ? reg_00008_q : 64'b0;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00010_q <= reg_00010_init;   // Load initial value during reset
    else if (sel_00010 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00010_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00010_q[63:56];
        reg_00010_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00010_q[55:48];
        reg_00010_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00010_q[47:40];
        reg_00010_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00010_q[39:32];
        reg_00010_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00010_q[31:24];
        reg_00010_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00010_q[23:16];
        reg_00010_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00010_q[15: 8];
        reg_00010_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00010_q[ 7: 0];
      end
    else reg_00010_q <= reg_00010_q;        // Hold value when register is not selected
  end
assign reg_00010_rdata = (sel_00010 == 1'b1 & do_read == 1'b1) ? reg_00010_q : 64'b0;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00018_q <= reg_00018_init;   // Load initial value during reset
    else if (sel_00018 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00018_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00018_q[63:56];
        reg_00018_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00018_q[55:48];
        reg_00018_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00018_q[47:40];
        reg_00018_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00018_q[39:32];
        reg_00018_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00018_q[31:24];
        reg_00018_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00018_q[23:16];
        reg_00018_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00018_q[15: 8];
        reg_00018_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00018_q[ 7: 0];
      end
    else reg_00018_q <= reg_00018_q;        // Hold value when register is not selected
  end
assign reg_00018_rdata = (sel_00018 == 1'b1 & do_read == 1'b1) ? reg_00018_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00020_q <= reg_00020_init;   // Load initial value during reset
    else if (sel_00020 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00020_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00020_q[63:56];
        reg_00020_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00020_q[55:48];
        reg_00020_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00020_q[47:40];
        reg_00020_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00020_q[39:32];
        reg_00020_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00020_q[31:24];
        reg_00020_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00020_q[23:16];
        reg_00020_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00020_q[15: 8];
        reg_00020_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00020_q[ 7: 0];
      end
    else reg_00020_q <= reg_00020_q;        // Hold value when register is not selected
  end
assign reg_00020_rdata = (sel_00020 == 1'b1 & do_read == 1'b1) ? reg_00020_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00028_q <= reg_00028_init;   // Load initial value during reset
    else if (sel_00028 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00028_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00028_q[63:56];
        reg_00028_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00028_q[55:48];
        reg_00028_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00028_q[47:40];
        reg_00028_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00028_q[39:32];
        reg_00028_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00028_q[31:24];
        reg_00028_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00028_q[23:16];
        reg_00028_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00028_q[15: 8];
        reg_00028_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00028_q[ 7: 0];
      end
    else reg_00028_q <= reg_00028_q;        // Hold value when register is not selected
  end
assign reg_00028_rdata = (sel_00028 == 1'b1 & do_read == 1'b1) ? reg_00028_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00030_q <= reg_00030_init;   // Load initial value during reset
    else if (sel_00030 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00030_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00030_q[63:56];
        reg_00030_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00030_q[55:48];
        reg_00030_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00030_q[47:40];
        reg_00030_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00030_q[39:32];
        reg_00030_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00030_q[31:24];
        reg_00030_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00030_q[23:16];
        reg_00030_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00030_q[15: 8];
        reg_00030_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00030_q[ 7: 0];
      end
    else reg_00030_q <= reg_00030_q;        // Hold value when register is not selected
  end
assign reg_00030_rdata = (sel_00030 == 1'b1 & do_read == 1'b1) ? reg_00030_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00038_q <= reg_00038_init;   // Load initial value during reset
    else if (sel_00038 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00038_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00038_q[63:56];
        reg_00038_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00038_q[55:48];
        reg_00038_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00038_q[47:40];
        reg_00038_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00038_q[39:32];
        reg_00038_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00038_q[31:24];
        reg_00038_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00038_q[23:16];
        reg_00038_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00038_q[15: 8];
        reg_00038_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00038_q[ 7: 0];
      end
    else reg_00038_q <= reg_00038_q;        // Hold value when register is not selected
  end
assign reg_00038_rdata = (sel_00038 == 1'b1 & do_read == 1'b1) ? reg_00038_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00040_q <= reg_00040_init;   // Load initial value during reset
    else if (sel_00040 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00040_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00040_q[63:56];
        reg_00040_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00040_q[55:48];
        reg_00040_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00040_q[47:40];
        reg_00040_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00040_q[39:32];
        reg_00040_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00040_q[31:24];
        reg_00040_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00040_q[23:16];
        reg_00040_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00040_q[15: 8];
        reg_00040_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00040_q[ 7: 0];
      end
    else reg_00040_q <= reg_00040_q;        // Hold value when register is not selected
  end
assign reg_00040_rdata = (sel_00040 == 1'b1 & do_read == 1'b1) ? reg_00040_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00048_q <= reg_00048_init;   // Load initial value during reset
    else if (sel_00048 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00048_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00048_q[63:56];
        reg_00048_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00048_q[55:48];
        reg_00048_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00048_q[47:40];
        reg_00048_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00048_q[39:32];
        reg_00048_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00048_q[31:24];
        reg_00048_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00048_q[23:16];
        reg_00048_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00048_q[15: 8];
        reg_00048_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00048_q[ 7: 0];
      end
    else reg_00048_q <= reg_00048_q;        // Hold value when register is not selected
  end
assign reg_00048_rdata = (sel_00048 == 1'b1 & do_read == 1'b1) ? reg_00048_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00050_q <= reg_00050_init;   // Load initial value during reset
    else if (sel_00050 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00050_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00050_q[63:56];
        reg_00050_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00050_q[55:48];
        reg_00050_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00050_q[47:40];
        reg_00050_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00050_q[39:32];
        reg_00050_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00050_q[31:24];
        reg_00050_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00050_q[23:16];
        reg_00050_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00050_q[15: 8];
        reg_00050_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00050_q[ 7: 0];
      end
    else reg_00050_q <= reg_00050_q;        // Hold value when register is not selected
  end
assign reg_00050_rdata = (sel_00050 == 1'b1 & do_read == 1'b1) ? reg_00050_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00058_q <= reg_00058_init;   // Load initial value during reset
    else if (sel_00058 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00058_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00058_q[63:56];
        reg_00058_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00058_q[55:48];
        reg_00058_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00058_q[47:40];
        reg_00058_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00058_q[39:32];
        reg_00058_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00058_q[31:24];
        reg_00058_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00058_q[23:16];
        reg_00058_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00058_q[15: 8];
        reg_00058_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00058_q[ 7: 0];
      end
    else reg_00058_q <= reg_00058_q;        // Hold value when register is not selected
  end
assign reg_00058_rdata = (sel_00058 == 1'b1 & do_read == 1'b1) ? reg_00058_q : 64'b0;

////////////////////////////////////////////////////////////////////////////////////////////
////Flit + latency counters: 0x60 flit_tx_pulse, 0x68 flit_rx_pulse, 0x70 latency_counter///
////////////////////////////////////////////////////////////////////////////////////////////

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00060_q <= reg_00060_init;
     else if ((sel_00060 == 1'b1) && (do_read == 1'b1))
      begin
             reg_00060_q <= 64'b0;  //In this cycle it will get read, so zero for the next
      end
    else if (flit_tx_pulse == 1'b1)
      begin
             reg_00060_q <= reg_00060_q + 64'h1; //count a flit
      end 
    else   reg_00060_q <= reg_00060_q;   
  end

assign reg_00060_rdata = (sel_00060 == 1'b1 & do_read == 1'b1) ? reg_00060_q : 64'b0;

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00068_q <= reg_00068_init;
     else if ((sel_00068 == 1'b1) && (do_read == 1'b1))
      begin
             reg_00068_q <= 64'b0;  // zero for the next cycle
      end
     else if ((flit_rx_pulse_cmd == 1'b1) && (flit_rx_pulse_data == 1'b1))
      begin
             reg_00068_q <= reg_00068_q + 64'h2; //count 2 flit
      end 
     else if ((flit_rx_pulse_cmd == 1'b1) || (flit_rx_pulse_data == 1'b1))
      begin
             reg_00068_q <= reg_00068_q + 64'h1; //count 1 flit
      end  
     else   reg_00068_q <= reg_00068_q; 
  end

assign reg_00068_rdata = (sel_00068 == 1'b1 & do_read == 1'b1) ? reg_00068_q : 64'b0;

assign reg_00070_rdata = (sel_00070 == 1'b1 & do_read == 1'b1) ? latency_cycle_counter : 64'b0;

assign latency_counter_reset = ((sel_00070 == 1'b1) && (do_read == 1'b1)); 

always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00078_q <= reg_00078_init;   // Load initial value during reset
    else if (sel_00078 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00078_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00078_q[63:56];
        reg_00078_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00078_q[55:48];
        reg_00078_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00078_q[47:40];
        reg_00078_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00078_q[39:32];
        reg_00078_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00078_q[31:24];
        reg_00078_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00078_q[23:16];
        reg_00078_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00078_q[15: 8];
        reg_00078_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00078_q[ 7: 0];
      end
    else reg_00078_q <= reg_00078_q;        // Hold value when register is not selected
  end
assign reg_00078_rdata = (sel_00078 == 1'b1 & do_read == 1'b1) ? reg_00078_q : 64'b0;



always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00080_q <= reg_00080_init;   // Load initial value during reset
    else if (sel_00080 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_00080_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_00080_q[63:56];
        reg_00080_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_00080_q[55:48];
        reg_00080_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_00080_q[47:40];
        reg_00080_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_00080_q[39:32];
        reg_00080_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_00080_q[31:24];
        reg_00080_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_00080_q[23:16];
        reg_00080_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_00080_q[15: 8];
        reg_00080_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_00080_q[ 7: 0];
      end
    else reg_00080_q <= reg_00080_q;        // Hold value when register is not selected
  end
assign reg_00080_rdata = (sel_00080 == 1'b1 & do_read == 1'b1) ? reg_00080_q : 64'b0;


// Entire register is READ ONLY, so no need to implement a register
assign reg_00100_q = mmio_in_status;
assign reg_00100_rdata = (sel_00100 == 1'b1 & do_read == 1'b1) ? reg_00100_q : 64'b0;
//READ ONLY
assign reg_00088_q = aurora_status;
assign reg_00088_rdata = (sel_00088 == 1'b1 & do_read == 1'b1) ? reg_00088_q : 64'b0;

// Special action on error register: capture and hold any bit pulsing to 1 until register is written to 0
always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_00108_q <= reg_00108_init;   // Load initial value during reset
    else if (sel_00108 == 1'b1)                           // If selected, write any byte that is active
      begin                     // Note: Accumulate error pulses while reg is selected, since this just reflects value on address bus
        reg_00108_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : ( reg_00108_q[63:56] | mmio_in_captured_errors[63:56] ) ;
        reg_00108_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : ( reg_00108_q[55:48] | mmio_in_captured_errors[55:48] ) ;
        reg_00108_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : ( reg_00108_q[47:40] | mmio_in_captured_errors[47:40] ) ;
        reg_00108_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : ( reg_00108_q[39:32] | mmio_in_captured_errors[39:32] ) ;
        reg_00108_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : ( reg_00108_q[31:24] | mmio_in_captured_errors[31:24] ) ;
        reg_00108_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : ( reg_00108_q[23:16] | mmio_in_captured_errors[23:16] ) ;
        reg_00108_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : ( reg_00108_q[15: 8] | mmio_in_captured_errors[15: 8] ) ;
        reg_00108_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : ( reg_00108_q[ 7: 0] | mmio_in_captured_errors[ 7: 0] ) ;
      end
    else reg_00108_q <= (reg_00108_q | mmio_in_captured_errors);        // Hold value and accumulate error pulses when not selected
  end
assign reg_00108_rdata = (sel_00108 == 1'b1 & do_read == 1'b1) ? reg_00108_q : 64'b0;


// Entire register is READ ONLY, so no need to implement a register
assign reg_00110_q = mmio_ery_data_out[127:64];
assign reg_00110_rdata = (sel_00110 == 1'b1 & do_read == 1'b1) ? reg_00110_q : 64'b0;


// Entire register is READ ONLY, so no need to implement a register
assign reg_00118_q = mmio_ery_data_out[63:0];
assign reg_00118_rdata = (sel_00118 == 1'b1 & do_read == 1'b1) ? reg_00118_q : 64'b0;



// 256 Byte scratch pad array. Implement as eight, 32 byte register file arrays one for each byte.
reg  [7:0]  scratch_ary7 [31:0];
reg  [7:0]  scratch_ary6 [31:0];
reg  [7:0]  scratch_ary5 [31:0];
reg  [7:0]  scratch_ary4 [31:0];
reg  [7:0]  scratch_ary3 [31:0];
reg  [7:0]  scratch_ary2 [31:0];
reg  [7:0]  scratch_ary1 [31:0];
reg  [7:0]  scratch_ary0 [31:0];
wire [63:0] scratch_ary_rdata;
wire [63:0] scratch_ary_init;
wire [4:0]  sai; // 'scratch ary' index

assign scratch_ary_init = 64'hFFFF_FFFF_FFFF_FFFF;   // Initial value of array contents

assign sai = addr_q[7:3];  // byte address in [2:0] has been converted into wr_be vector, so just use upper 5 bits to select row of array

genvar g;
generate for (g=0; g<=31; g=g+1)
  begin : scratch_ary
    always @(posedge(clock))
      if (reset_q == 1'b1)                                   // During reset, set all locations to the init value
        begin
          scratch_ary7[g] <= scratch_ary_init[63:56];
          scratch_ary6[g] <= scratch_ary_init[55:48];
          scratch_ary5[g] <= scratch_ary_init[47:40];
          scratch_ary4[g] <= scratch_ary_init[39:32];
          scratch_ary3[g] <= scratch_ary_init[31:24];
          scratch_ary2[g] <= scratch_ary_init[23:16];
          scratch_ary1[g] <= scratch_ary_init[15: 8];
          scratch_ary0[g] <= scratch_ary_init[ 7: 0];
        end
      else if (sel_00200_002FF == 1'b1 && {27'b0,sai} == g)  // If array is selected and index matches array location, (perhaps) load write data
          begin                                              // (extending sai to 32 bits resolves a compilation warning)
            scratch_ary7[g] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : scratch_ary7[g] ;
            scratch_ary6[g] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : scratch_ary6[g] ;
            scratch_ary5[g] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : scratch_ary5[g] ;
            scratch_ary4[g] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : scratch_ary4[g] ;
            scratch_ary3[g] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : scratch_ary3[g] ;
            scratch_ary2[g] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : scratch_ary2[g] ;
            scratch_ary1[g] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : scratch_ary1[g] ;
            scratch_ary0[g] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : scratch_ary0[g] ;
          end
      else                                                  // Otherwise hold the current value
        begin
          scratch_ary7[g] <= scratch_ary7[g];
          scratch_ary6[g] <= scratch_ary6[g];
          scratch_ary5[g] <= scratch_ary5[g];
          scratch_ary4[g] <= scratch_ary4[g];
          scratch_ary3[g] <= scratch_ary3[g];
          scratch_ary2[g] <= scratch_ary2[g];
          scratch_ary1[g] <= scratch_ary1[g];
          scratch_ary0[g] <= scratch_ary1[g];
        end
  end
endgenerate

assign scratch_ary_rdata = (sel_00200_002FF == 1'b1 & do_read == 1'b1) ? 
                            {scratch_ary7[sai], scratch_ary6[sai], scratch_ary5[sai], scratch_ary4[sai], 
                             scratch_ary3[sai], scratch_ary2[sai], scratch_ary1[sai], scratch_ary0[sai] }: 64'b0;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_80000_q <= reg_80000_init;   // Load initial value during reset
    else if (sel_80000 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_80000_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_80000_q[63:56];
        reg_80000_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_80000_q[55:48];
        reg_80000_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_80000_q[47:40];
        reg_80000_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_80000_q[39:32];
        reg_80000_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_80000_q[31:24];
        reg_80000_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_80000_q[23:16];
        reg_80000_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_80000_q[15: 8];
        reg_80000_q[ 7: 2] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 2] : reg_80000_q[ 7: 2];
        reg_80000_q[ 1: 0] <= 2'b00;
      end
    else reg_80000_q <= reg_80000_q;        // Hold value when register is not selected
  end
assign reg_80000_rdata = (sel_80000 == 1'b1 & do_read == 1'b1) ? reg_80000_q : 64'b0;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_80008_q <= reg_80008_init;   // Load initial value during reset
    else if (sel_80008 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_80008_q[63:33] <= 31'b0;
        reg_80008_q[   32] <= (wr_be[4] == 1'b1) ? wdata_q[   32] : reg_80008_q[   32];
        reg_80008_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_80008_q[31:24];
        reg_80008_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_80008_q[23:16];
        reg_80008_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_80008_q[15: 8];
        reg_80008_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_80008_q[ 7: 0];
      end
    else reg_80008_q <= reg_80008_q;        // Hold value when register is not selected
  end
assign reg_80008_rdata = (sel_80008 == 1'b1 & do_read == 1'b1) ? reg_80008_q : 64'b0;


assign reg_80010_q = {63'b0, mmio_in_intrp_is_pending};
assign reg_80010_rdata = (sel_80010 == 1'b1 & do_read == 1'b1) ? reg_80010_q : 64'b0;


always @(posedge(clock))
  begin
    if (reset_q == 1'b1) reg_80018_q <= reg_80018_init;   // Load initial value during reset
    else if (sel_80018 == 1'b1)                           // If selected, write any byte that is active
      begin
        reg_80018_q[63:56] <= (wr_be[7] == 1'b1) ? wdata_q[63:56] : reg_80018_q[63:56];
        reg_80018_q[55:48] <= (wr_be[6] == 1'b1) ? wdata_q[55:48] : reg_80018_q[55:48];
        reg_80018_q[47:40] <= (wr_be[5] == 1'b1) ? wdata_q[47:40] : reg_80018_q[47:40];
        reg_80018_q[39:32] <= (wr_be[4] == 1'b1) ? wdata_q[39:32] : reg_80018_q[39:32];
        reg_80018_q[31:24] <= (wr_be[3] == 1'b1) ? wdata_q[31:24] : reg_80018_q[31:24];
        reg_80018_q[23:16] <= (wr_be[2] == 1'b1) ? wdata_q[23:16] : reg_80018_q[23:16];
        reg_80018_q[15: 8] <= (wr_be[1] == 1'b1) ? wdata_q[15: 8] : reg_80018_q[15: 8];
        reg_80018_q[ 7: 0] <= (wr_be[0] == 1'b1) ? wdata_q[ 7: 0] : reg_80018_q[ 7: 0];
      end
    else reg_80018_q <= reg_80018_q;        // Hold value when register is not selected
  end
assign reg_80018_rdata = (sel_80018 == 1'b1 & do_read == 1'b1) ? reg_80018_q : 64'b0;


// ----------------------------------
// Select source for ultimate read data
// ----------------------------------
wire [63:0] final_rdata_d;
reg  [63:0] final_rdata_q;
reg         final_rdata_vld_q;

// Use a big OR gate to combine all the read data sources. When source is not selected, the 'rdata' vector should be all 0.
assign final_rdata_d = reg_00000_rdata | reg_00008_rdata | reg_00010_rdata   | reg_00018_rdata |
		       reg_00020_rdata | reg_00028_rdata | reg_00030_rdata   | reg_00038_rdata |
                       reg_00040_rdata | reg_00048_rdata | reg_00050_rdata   | reg_00058_rdata |
                       reg_00060_rdata | reg_00068_rdata | reg_00070_rdata   | reg_00078_rdata |
                       reg_00080_rdata | reg_00088_rdata | reg_00100_rdata | reg_00108_rdata   | reg_00110_rdata |
                       reg_00118_rdata | reg_80000_rdata | reg_80008_rdata   | reg_80010_rdata | 
                       reg_80018_rdata | scratch_ary_rdata;

always @(posedge(clock))
  final_rdata_q <= final_rdata_d;   // Latch the result of the big OR gate before sending out of the module

always @(posedge(clock))
  final_rdata_vld_q <= do_read;     // If operation was a read, capture it and pass this along as the valid

assign mmio_rdata     = final_rdata_q;
assign mmio_rdata_vld = final_rdata_vld_q;


// -------------------------------------
// Break bit fields out from config regs
// -------------------------------------

// Outputs which are directly connected to registers
assign mmio_out_test_enable            = reg_00000_q[0];  
assign mmio_out_ignore_nomatch_on_read = reg_00000_q[2];
assign mmio_out_enable_pipeline        = reg_00000_q[4];
assign mmio_out_captured_errors        = reg_00108_q;
assign mmio_out_intrp_ea               = reg_80000_q[63:0];
assign mmio_out_intrp_vec_mask         = reg_80008_q[32];
assign mmio_out_intrp_pasid            = reg_80018_q[19:0];
assign mmio_out_intrp_cmd_flag         = reg_80018_q[43:40];
assign mmio_out_intrp_stream_id        = reg_80018_q[47:44];
assign mmio_out_intrp_afutag           = reg_80018_q[63:48];

//ThymesisFlow config registers
assign thymesis_out_slot0_reg          = reg_00020_q[63:0];
assign thymesis_out_slot1_reg          = reg_00028_q[63:0];
assign thymesis_out_slot2_reg          = reg_00030_q[63:0];
assign thymesis_out_slot3_reg          = reg_00038_q[63:0];
assign thymesis_out_slot4_reg          = reg_00040_q[63:0];
assign thymesis_out_slot5_reg          = reg_00048_q[63:0];
assign thymesis_out_slot6_reg          = reg_00050_q[63:0];
assign thymesis_out_slot7_reg          = reg_00058_q[63:0];
assign thymesis_out_slot8_reg          = 64'b0; //= reg_00060_q[63:0];
assign thymesis_out_slot9_reg          = 64'b0;  //= reg_00068_q[63:0];
assign thymesis_out_slot10_reg         = 64'b0;  //= reg_00070_q[63:0];
assign  aurora_control_reg             = reg_00078_q[63:0];
//assign thymesis_out_slot11_reg  	   = reg_00080_q[63:0];

// Software Generated Interrupt
assign mmio_ery_loadsrc14 =  trigger_sfw_intrp;  // This is naturally a 1 cycle pulse.

wire [47:0] sfw_intrp_hi_data;  // Creating wires to match field names in spec allows easier tracing during simulation
wire [63:0] sfw_intrp_lo_data;
assign sfw_intrp_hi_data = reg_00008_q[47:0];
assign sfw_intrp_lo_data = reg_00010_q[63:0];
assign mmio_ery_src14    = {sfw_intrp_loadsrc, sfw_intrp_hi_data, sfw_intrp_lo_data }; 


// Interrupt generated by receipt of (possibly) fatal error

// Trigger errary to save information about general purpose errors when THE FIRST error condition is logged in the incoming 'captured_errors' vector
// Note: mmio_in_captured_errors may just pulse a bit and not hold it, so can't compare it vs. reg_00108_q directly to detect new arrival
//       Instead look for error vector to change from all 0s to a non-0 value (rising edge detector).
// Important: Only send the first error that was captured. If this isn't done, there can be a cascading of error bits that can cause
//            things like the 'loadsrc15' condition to be a solid 1 vs. a pulse which would violate the assumption it is a pulse.
//            Thus add the 0->1 edge detector on the reduced captured_error register. This should prevent a solid level input (i.e. ery_overflow)
//            from generating a stream of errary loads / interrupts.
//            As implemented with the OR reduction operator, captured_errors_change pulses when the error vector changes from
//            (all 0s) to (1 or more bits are set). This does a good job of capturing the first error, but it would re-trigger
//            if the error input vector went back to 0 and sometime later had another error. To prevent this "re-firing", add
//            the condition that the error register itself must be all 0s before it can trigger.

wire captured_errors_orreduce;
reg  captured_errors_orreduce_dly;
wire captured_errors_change;
wire saved_errors_orreduce;
assign captured_errors_orreduce = (| mmio_in_captured_errors);   // OR Reduction operator
assign saved_errors_orreduce    = (| reg_00108_q);               // Saved copy (set and hold) of mmio_in_captured_errors

always @(posedge(clock))
  captured_errors_orreduce_dly <= captured_errors_orreduce;       
assign captured_errors_change = (saved_errors_orreduce == 1'b0 &&   // No errors are currently recorded, AND
                                 captured_errors_orreduce == 1'b1 && captured_errors_orreduce_dly == 1'b0) // saw a new one arrive
                                 ? 1'b1 : 1'b0;


// Below use 'reset' to break logical (but latched) loop where MMIO -> ERY and ERY -> MMIO. X circulates without reset to non-X value.
assign mmio_ery_loadsrc15 = (reset == 1'b1) ? 1'b0 : captured_errors_change;   
                          
assign mmio_ery_src15     = { 16'h8000, 48'b0, mmio_in_captured_errors };  // Pass register input since reg doesn't hold error yet. 
                                                                           // Error source assigned to bit [15], so upper 16 bits are x8000

// Indicate when software has read ERR_INFO_LO so the entry in the errary can be cleared
assign mmio_ery_data_done = sel_00118;   // Pulsed to 1 when 2nd MMIO register of error information is read. Used to present next error vector.
                                         // Note: If necessary, it should be OK to latch this before sending on if it doesn't meet timing.

endmodule 

