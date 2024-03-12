//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-07-31 10:47:23 +0100 (Tue, 31 Jul 2012) $
//
//      Revision            : $Revision: 217027 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : APB test slave for testing of wait state and error response in
//            the APB subsystem. For validation purpose only.
//-----------------------------------------------------------------------------
//-------------------------------------
// Programmer's model
//  0x000   R/W    Data0[31:0], 0 wait state (2 cycles transfer)
//  0x004   R/W    Data0[31:0], 1 wait state (3 cycles transfer)
//  0x008   R/W    Data0[31:0], 2 wait states (4 cycles transfer)
//  0x00C   R/W    Data0[31:0], 3 wait states (5 cycles transfer)
//
//  0x0F0   R/W    Data0[31:0], 0 wait state, error response
//  0x0F4   R/W    Data0[31:0], 1 wait state, error response
//  0x0F8   R/W    Data0[31:0], 2 wait states, error response
//  0x0FC   R/W    Data0[31:0], 3 wait states, error response
//
//  other addresses : read zero, write ignored
//

module cmsdk_apb_test_slave(
  // IO declaration
  input  wire                    PCLK,     // clock
  input  wire                    PRESETn,  // reset

  // APB interface inputs
  input  wire                    PSEL,
  input  wire [11:2]             PADDR,
  input  wire                    PENABLE,
  input  wire                    PWRITE,
  input  wire [31:0]             PWDATA,
  input  wire [3:0]              PSTRB,

  // APB interface outputs
  output wire  [31:0]            PRDATA,
  output wire                    PREADY,
  output wire                    PSLVERR);

//------------------------------------------------------------------------------
// internal wires
//------------------------------------------------------------------------------
  reg   [31:0]              reg_data0;  // data register
  reg   [31:0]              nxt_data0;
  reg   [ 1:0]              reg_wait_counter; // wait state counter
  reg   [ 1:0]              nxt_wait_counter;
  wire  [31:0]              read_data_mux;

//------------------------------------------------------------------------------
// Main code
//------------------------------------------------------------------------------
  // Data register
  always @(PSEL or PENABLE or PWRITE or PWDATA or PSTRB or PADDR or
    reg_data0)
    begin
    case (PSEL & PENABLE & PWRITE & ((PADDR[11:4]==8'h00)|(PADDR[11:4]==8'h0F)))
     1'b1:
      begin
      nxt_data0[ 7: 0] = (PSTRB[0]) ? PWDATA[ 7: 0] : reg_data0[ 7: 0];
      nxt_data0[15: 8] = (PSTRB[1]) ? PWDATA[15: 8] : reg_data0[15: 8];
      nxt_data0[23:16] = (PSTRB[2]) ? PWDATA[23:16] : reg_data0[23:16];
      nxt_data0[31:24] = (PSTRB[3]) ? PWDATA[31:24] : reg_data0[31:24];
      end
     1'b0:
      nxt_data0 = reg_data0;
     default:
      nxt_data0 = {32{1'bx}};
    endcase
    end

  // register data register
  always @(posedge PCLK or negedge PRESETn)
    begin
    if (~PRESETn)
      reg_data0 <= {32{1'b0}};
    else
      reg_data0 <= nxt_data0;
    end

  // Read data multiplexer
  assign read_data_mux = ((PADDR[11:2] == 10'b0000_0000_00) |
                          (PADDR[11:2] == 10'b0000_0000_01) |
                          (PADDR[11:2] == 10'b0000_0000_10) |
                          (PADDR[11:2] == 10'b0000_0000_11) |
                          (PADDR[11:2] == 10'b0000_1111_00) |
                          (PADDR[11:2] == 10'b0000_1111_01) |
                          (PADDR[11:2] == 10'b0000_1111_10) |
                          (PADDR[11:2] == 10'b0000_1111_11) ) ? reg_data0 : {32{1'b0}};

  // Wait counter
  always @(PSEL or PENABLE or PADDR or reg_wait_counter)
    begin
    if (PSEL & (~PENABLE)) // Set counter at first cycle of APB transfer
      nxt_wait_counter = PADDR[3:2];
    else if  (|reg_wait_counter) // Decrement after 1st cycle
      nxt_wait_counter = reg_wait_counter - 2'b01;
    else // Idle
      nxt_wait_counter = 2'b00;
    end

  // register wait counter
  always @(posedge PCLK or negedge PRESETn)
    begin
    if (~PRESETn)
      reg_wait_counter <= 2'b00;
    else
      reg_wait_counter <= nxt_wait_counter;
    end

  assign PREADY = (reg_wait_counter==2'b00) ?  1'b1 : 1'b0;

  // Error response
  assign PSLVERR = (PSEL & PENABLE & PREADY & (PADDR[11:4]==8'h0F)) ? 1'b1 : 1'b0;

  assign PRDATA  = (PSEL & PENABLE & (~PWRITE)) ? read_data_mux : {32{1'b0}};

endmodule
