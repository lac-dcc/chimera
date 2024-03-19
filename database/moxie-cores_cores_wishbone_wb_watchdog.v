// wb_watchdog.v - Wishbone Shared Bus Watchdog
//
// Copyright (c) 2012  Anthony Green.
// 
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.


module wb_watchdog #(
  parameter timeout_width = 5
  )(/*AUTOARG*/
   // Outputs
   wb_dat_o, wb_ack_o, fault_o,
   // Inputs
   rst_i, clk_i, wb_dat_i, wb_adr_i, wb_sel_i, wb_we_i, wb_cyc_i,
   wb_stb_i
   );

  // Wishbone Master Interface
   input  rst_i, clk_i;
   input [15:0] wb_dat_i;
   input [31:0] wb_adr_i;
   output reg [15:0] wb_dat_o;
   input [1:0] 	wb_sel_i;
   input 	wb_we_i;
   input 	wb_cyc_i;
   input 	wb_stb_i;
   output reg	wb_ack_o;

   output reg 	fault_o = 1'b0;

  // Watchdog counter
  reg [timeout_width-1:0] counter = 0;

  // Address
  reg [31:0] 	address;

  // Watchdog active flag
  reg 		active = 1'b0;

  wire 		timeout;
  assign timeout = (counter == 5'b11111);

  wire trap = active & timeout;
  
  always @(posedge clk_i) begin
     counter <= rst_i ? 1'b0 : wb_cyc_i ? counter + 1 : 0;
     active <= (rst_i | fault_o) ? 1'b0 : wb_ack_o ? 1'b0 : wb_cyc_i ? 1'b1 : active;
     wb_dat_o <= trap ? wb_adr_i : wb_dat_o;
     wb_ack_o  <= rst_i ? 1'b0 : wb_stb_i & wb_cyc_i;
     fault_o <= wb_stb_i & wb_cyc_i ? 1'b0 : trap ? 1'b1 : fault_o;
  end

endmodule // wb_watchdog

