//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Dual port RAM for VGA module
//-----------------------------------------------------------------------------


module dual_port_ram_sync
  #(
      parameter ADDR_WIDTH = 6,
      parameter DATA_WIDTH = 8
  )
  (
  input wire clk,
  input wire we,
  input wire [ADDR_WIDTH-1:0] addr_a,
  input wire [ADDR_WIDTH-1:0] addr_b,
  input wire [DATA_WIDTH-1:0] din_a,
  
  output wire [DATA_WIDTH-1:0] dout_a,
  output wire [DATA_WIDTH-1:0] dout_b
  );

  reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
  reg [ADDR_WIDTH-1:0] addr_a_reg;
  reg [ADDR_WIDTH-1:0] addr_b_reg;
  
  always @ (posedge clk)
  begin
    if(we)
      ram[addr_a] <= din_a;
    addr_a_reg <= addr_a;
    addr_b_reg <= addr_b;
  end
  
  assign dout_a = ram[addr_a_reg];
  assign dout_b = ram[addr_b_reg];
  
endmodule
