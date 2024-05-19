// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/



//sdram_clkgen.v
`timescale 1 ns/1 ps


module sdram_clkgen (

input          clk,
input          rst,

output         locked,
output         out_clk,
output         phy_out_clk
);

wire  clkfbout_buf;
wire  clkfbout;
wire  clkout0;
wire  clkout1;
wire  clkout2;
wire  clkout3;
wire  clkout4;
wire  clkout5;
wire  phy_bufout;


PLL_BASE #(
  .BANDWIDTH            ("OPTIMIZED"          ),
  .CLK_FEEDBACK         ("CLKFBOUT"           ),
  .COMPENSATION         ("SYSTEM_SYNCHRONOUS" ),
  .DIVCLK_DIVIDE        (1                    ),
  .CLKFBOUT_MULT        (18                   ),
  .CLKFBOUT_PHASE       (0.000                ),
  .CLKOUT0_DIVIDE       (9                    ),
//Simulations differ from real world in that the phase must be 0, not 90 degrees
`ifndef SIMULATION
  .CLKOUT0_PHASE        (180.00               ),
`else
  .CLKOUT0_PHASE        (0.00                 ),
`endif
  .CLKOUT0_DUTY_CYCLE   (0.500                ),
  .CLKOUT1_DIVIDE       (9                    ),
  .CLKOUT1_DUTY_CYCLE   (0.500                ),
  .CLKIN_PERIOD         (20.000               ),
  .REF_JITTER           (0.010                )
) pll (

  //Input Clock and Input Clock Control
  .CLKFBIN              (clkfbout_buf         ),
  .CLKIN                (clk                  ),

  //Status/Control
  .LOCKED               (locked               ),
  .RST                  (rst                  ),

  //Feedback Output
  .CLKFBOUT             (clkfbout             ),

  .CLKOUT0              (clkout0              ),
  .CLKOUT1              (clkout1              ),
  .CLKOUT2              (clkout2              ),
  .CLKOUT3              (clkout3              ),
  .CLKOUT4              (clkout4              ),
  .CLKOUT5              (clkout5              )
);

BUFG bufg_sdram_clk (
        .I(clkout0),
        .O(out_clk)
);

BUFG  pll_fb (
  .I (clkfbout),
  .O (clkfbout_buf)
);

BUFG phy_clock_out (
  .I(clkout1),
  .O(phy_bufout)
);

ODDR2 #(
  .DDR_ALIGNMENT  ("NONE"      ),      //Sets output alignment to NON
  .INIT           (1'b0        ),      //Sets the inital state to 0
  .SRTYPE         ("SYNC"      )       //Specified "SYNC" or "ASYNC" reset
) pad_buf (

  .Q              (phy_out_clk ),
  .C0             (phy_bufout  ),
  .C1             (~phy_bufout ),
  .CE             (1'b1        ),
  .D0             (1'b1        ),
  .D1             (1'b0        ),
  .R              (1'b0        ),
  .S              (1'b0        )
);


endmodule
