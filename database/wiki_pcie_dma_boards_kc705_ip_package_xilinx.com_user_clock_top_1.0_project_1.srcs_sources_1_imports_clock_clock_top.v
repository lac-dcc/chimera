//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
//
// This disclaimer is not a license and does not grant any rights to the
// materials distributed herewith. Except as otherwise provided in a valid
// license issued to you by Xilinx, and to the maximum extent permitted by
// applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
// FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
// IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
// MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
// and (2) Xilinx shall not be liable (whether in contract or tort, including
// negligence, or under any other theory of liability) for any loss or damage
// of any kind or nature related to, arising under or in connection with these
// materials, including for any direct, or any indirect, special, incidental,
// or consequential loss or damage (including loss of data, profits, goodwill,
// or any type of loss or damage suffered as a result of any action brought by
// a third party) even if such damage or loss was reasonably foreseeable or
// Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
//
// Xilinx products are not designed or intended to be fail-safe, or for use in
// any application requiring fail-safe performance, such as life-support or
// safety devices or systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any other
// applications that could lead to death, personal injury, or severe property
// or environmental damage (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and liability of any use of
// Xilinx products in Critical Applications, subject only to applicable laws
// and regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
// AT ALL TIMES.
//

module clock_top
(
input clk_ref_p,
input clk_ref_n,
input pcie_clk_p,
input pcie_clk_n,
output clk_out,
output ref_clk,
output clk_div

);

  reg [1:0] clk_divide = 2'b00;
  wire clk_out;

    IBUFDS diff_clk_200 (
      .I    (clk_ref_p),
      .IB   (clk_ref_n),
      .O    (clk_out)
    );

  always @(posedge clk_out)
    clk_divide  <= clk_divide + 1'b1;

  BUFG buffer_clk50 (
    .I  (clk_divide[1]),
    .O  (clk_div)
  );



// PCIe Reference Clock Input buffer
`ifdef SIMULATION
IBUFDS_GTE2 refclk_ibuf (

    .I      (pcie_clk_p     ),
    .IB     (pcie_clk_n     ),
    .O      (ref_clk        ),
    .CEB    (1'b0           ),
    .ODIV2  (               )

);
`else
IBUFDS_GTE2 refclk_ibuf (

    .I      (pcie_clk_p     ),
    .IB     (pcie_clk_n     ),
    .O      (ref_clk        ),
    .ODIV2  (               )

);
`endif

endmodule
