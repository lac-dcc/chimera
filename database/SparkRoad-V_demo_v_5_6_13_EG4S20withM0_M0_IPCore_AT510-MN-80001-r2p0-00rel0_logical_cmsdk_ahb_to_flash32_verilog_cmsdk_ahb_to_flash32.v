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
//      Checked In          : $Date: 2012-11-28 09:44:35 +0000 (Wed, 28 Nov 2012) $
//
//      Revision            : $Revision: 229864 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Simple 32-bit flash memory interface with wait state support
//-----------------------------------------------------------------------------
module cmsdk_ahb_to_flash32 #(
  // Parameters
  parameter AW       = 16,// Address width
  parameter WS       = 1) // Flash access wait state (0 to 3)
 (
 input  wire          HCLK,    // Clock
 input  wire          HRESETn, // Reset
 input  wire          HSEL,    // Device select
 input  wire [AW-1:0] HADDR,   // Address
 input  wire    [1:0] HTRANS,  // Transfer control
 input  wire    [2:0] HSIZE,   // Transfer size
 input  wire    [3:0] HPROT,   // Protection
 input  wire          HWRITE,  // Write control
 input  wire   [31:0] HWDATA,  // Write data - not used
 input  wire          HREADY,  // Transfer phase done
 output wire          HREADYOUT, // Device ready
 output wire   [31:0] HRDATA,  // Read data output
 output wire          HRESP,   // Device response (always OKAY)

 output wire [AW-3:0] FLASHADDR, // Flash address
 input  wire   [31:0] FLASHRDATA);  // Flash read data

// Internal signals
wire          read_valid;     // Address phase read valid
reg           read_enable;    // Data phase read enable
reg  [AW-3:0] reg_addr1;      // Address registered in data phase

// Flash wait state control
wire          flash_read_done;      // flash read data is valid
reg    [1:0]  flash_wait_counter;   // wait state counter
wire   [1:0]  nxt_flash_wait_counter;   // Next wait state counter

wire   [1:0]  ws_cfg;

// wait state settings
assign ws_cfg = WS;

// Generate read control (address phase)
assign read_valid  = HSEL & HTRANS[1] & (~HWRITE) & HREADY;

// Registering control signals to data phase
always @(posedge HCLK or negedge HRESETn)
begin
  if (~HRESETn)
    begin
    read_enable    <= 1'b0;
    reg_addr1      <= {(AW-2){1'b0}};
    end
  else if (HREADY)
    begin
    read_enable    <= read_valid;
    reg_addr1      <= HADDR[AW-1:2];
    end
end

// Connect sample address to top level
assign FLASHADDR = reg_addr1[AW-3:0];

// flash wait state
// - if address has been changed, then counter set to ws_cfg
// - else decrement until zero
assign nxt_flash_wait_counter = (read_valid) ? ws_cfg :
  ((flash_wait_counter!= {2{1'b0}}) ? (flash_wait_counter - 1'b1) :
                               flash_wait_counter);

// Register wait state counter
always @(posedge HCLK or negedge HRESETn)
begin
  if (~HRESETn)
    flash_wait_counter    <= {2{1'b0}};
  else if (read_valid | (flash_wait_counter != 0))
    flash_wait_counter    <= nxt_flash_wait_counter;
end

assign flash_read_done = (flash_wait_counter == 0);
assign HREADYOUT = (~read_enable) | flash_read_done;
assign HRESP     = 1'b0;
assign HRDATA    = (read_enable) ? FLASHRDATA : {32{1'b0}};

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"

  // Create signal to indicate data phase
  reg        ovl_ahb_data_phase_reg;
  wire       ovl_ahb_data_phase_nxt = HSEL & HTRANS[1];

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    ovl_ahb_data_phase_reg <= 1'b0;
  else if (HREADY)
    ovl_ahb_data_phase_reg <= ovl_ahb_data_phase_nxt;
  end

  //  Wait state counter should be 0 if it is not reading
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Wait state counter should be 0 when idle")
   u_ovl_counter_idle
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((~ovl_ahb_data_phase_reg) & (|flash_wait_counter))
      );

  // HREADYOUT should be 1 if idle
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "HREADYOUT should be 1 when idle")
   u_ovl_hreadyout_idle
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((~ovl_ahb_data_phase_reg) & (~HREADYOUT))
      );

  // WS should be ranged from 0 to 3
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "WS should be ranged from 0 to 3")
   u_ovl_ws_config_check
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(WS > 3)
      );

  // HREADYOUT should be valid after WS+1 cycle
    assert_next
    #(`OVL_ERROR, WS+1,1,0,
      `OVL_ASSERT,
       "HREADYOUT should be valid after WS+1 cycle for READ transaction"
      )
    u_ovl_hreadyout_check
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event (HTRANS[1] & HSEL & (~HWRITE) & HREADY
                   ),
     .test_expr   ( HREADYOUT == 1'b1
                   )
     );

  //  Wait state configuration should be ranged from 0 to 3
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,
       "Wait state configuration should be ranged from 0 to 3")
   u_ovl_waitstate_cfg
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(WS>3)
      );

`endif

endmodule

