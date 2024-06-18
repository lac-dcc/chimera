// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
 * Copyright 2016 <Admobilize>
 * MATRIX Labs  [http://creator.matrix.one]
 * This file is part of MATRIX Creator HDL for Spartan 6
 *
 * MATRIX Creator HDL is like free software: you can redistribute 
 * it and/or modify it under the terms of the GNU General Public License 
 * as published by the Free Software Foundation, either version 3 of the 
 * License, or (at your option) any later version.

 * This program is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU 
 * General Public License for more details.

 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module creator_dcm #(
  parameter CLKFX_DIVIDE   = 1,
  parameter CLKFX_MULTIPLY = 4
  ) (
  // Clock in ports
  input  clkin       ,
  // Clock out ports
  output clk_out_200 ,
  output nclk_out_200,
  output clk_out_25
);

  IBUFG clkin_buf (
    .O(b_clkin),
    .I(clkin  )
  );

  wire       locked_int;
  wire [7:0] status_int;
  wire       clkfb     ;
  wire       clk0      ;
  wire       clkfx     ;
  wire       nclkfx    ;
  wire       clkdv     ;

DCM_SP
#(.CLKDV_DIVIDE          (2.000),
  .CLKFX_DIVIDE          (CLKFX_DIVIDE),
  .CLKFX_MULTIPLY        (CLKFX_MULTIPLY),
  .CLKIN_DIVIDE_BY_2     ("FALSE"),
  .CLKIN_PERIOD          (20.000),
  .CLKOUT_PHASE_SHIFT    ("NONE"),
  .CLK_FEEDBACK          ("1X"),
  .DESKEW_ADJUST         ("SYSTEM_SYNCHRONOUS"),
  .PHASE_SHIFT           (0),
  .STARTUP_WAIT          ("FALSE"))
dcm_sp_inst (
  .CLKIN                 (b_clkin),
  .CLKFB                 (clkfb),
    // Output clocks
  .CLK0                  (clk0),
  .CLK90                 (),
  .CLK180                (),
  .CLK270                (),
  .CLK2X                 (),
  .CLK2X180              (),
  .CLKFX                 (clkfx),
  .CLKFX180              (nclkfx),
  .CLKDV                 (clkdv),
    // Ports for dynamic phase shift
  .PSCLK                 (1'b0),
  .PSEN                  (1'b0),
  .PSINCDEC              (1'b0),
  .PSDONE                (),
    // Other control and status signals
  .LOCKED                (locked_int),
  .STATUS                (status_int),
  .RST                   (1'b0),
    // Unused pin- tie low
  .DSSEN                 (1'b0)
  );


  BUFG clkf_buf
   (.O (clkfb),
  .I (clk0));

  BUFG clkout1_buf
   (.O   (clk_out_200),
  .I   (clkfx));

  BUFG clkout2_buf
   (.O   (nclk_out_200),
  .I   (nclkfx));

  BUFG clkout3_buf
   (.O   (clk_out_25),
  .I   (clkdv));

endmodule

