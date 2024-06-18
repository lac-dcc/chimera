// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module pll(
    input         clk_in,
    output        clk_out,

    input         reset,
    output        locked
);

    // VGA Timing Parameters
    //
    // Resolution:      1024 x 768  (XGA)
    // Frame Rate:      60 Hz
    // Vertical Rate:   48.36 kHz
    // Pixel Clock:     65 MHz
    //
    // Horizontal (px):
    //   Active Area:  1024   // Horizontal active pixels
	//   Front Porch:  24     // Horizontal front porch
	//   Sync Pulse:   136    // Horizontal sync pulse
	//   Back Porch:   160    // Horizontal back porch
    //
    // Vertical (px):
	//   Active Area:  768    // Vertical active pixels
	//   Front Porch:  3      // Vertical front porch
	//   Sync Pulse:   6      // Vertical sync pulse
	//   Back Porch:   29     // Vertical back porch

    
    /* BEGIN Xilinx ISE Generated Verilog */
    // file: pll.v
    // 
    // (c) Copyright 2008 - 2011 Xilinx, Inc. All rights reserved.
    // 
    // This file contains confidential and proprietary information
    // of Xilinx, Inc. and is protected under U.S. and
    // international copyright and other intellectual property
    // laws.
    // 
    // DISCLAIMER
    // This disclaimer is not a license and does not grant any
    // rights to the materials distributed herewith. Except as
    // otherwise provided in a valid license issued to you by
    // Xilinx, and to the maximum extent permitted by applicable
    // law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    // WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    // AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    // BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    // INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    // (2) Xilinx shall not be liable (whether in contract or tort,
    // including negligence, or under any other theory of
    // liability) for any loss or damage of any kind or nature
    // related to, arising under or in connection with these
    // materials, including for any direct, or any indirect,
    // special, incidental, or consequential loss or damage
    // (including loss of data, profits, goodwill, or any type of
    // loss or damage suffered as a result of any action brought
    // by a third party) even if such damage or loss was
    // reasonably foreseeable or Xilinx had been advised of the
    // possibility of the same.
    // 
    // CRITICAL APPLICATIONS
    // Xilinx products are not designed or intended to be fail-
    // safe, or for use in any application requiring fail-safe
    // performance, such as life-support or safety devices or
    // systems, Class III medical devices, nuclear facilities,
    // applications related to the deployment of airbags, or any
    // other applications that could lead to death, personal
    // injury, or severe property or environmental damage
    // (individually and collectively, "Critical
    // Applications"). Customer assumes the sole risk and
    // liability of any use of Xilinx products in Critical
    // Applications, subject only to applicable laws and
    // regulations governing limitations on product liability.
    // 
    // THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    // PART OF THIS FILE AT ALL TIMES.
    // 
    //----------------------------------------------------------------------------
    // User entered comments
    //----------------------------------------------------------------------------
    // None
    //
    //----------------------------------------------------------------------------
    // "Output    Output      Phase     Duty      Pk-to-Pk        Phase"
    // "Clock    Freq (MHz) (degrees) Cycle (%) Jitter (ps)  Error (ps)"
    //----------------------------------------------------------------------------
    // CLK_OUT1    65.000      0.000    50.0      507.692     150.000
    //
    //----------------------------------------------------------------------------
    // "Input Clock   Freq (MHz)    Input Jitter (UI)"
    //----------------------------------------------------------------------------
    //   primary       100.000           0.010

    // Input buffering
    //------------------------------------
    /*
    IBUFG clkin1_buf(
        .O (clkin1),
        .I (clk_in)
    );
    */

    // Clocking primitive
    //------------------------------------

    // Instantiation of the DCM primitive
    //    * Unused inputs are tied off
    //    * Unused outputs are labeled unused
    wire       psdone_unused;
    wire       locked_int;
    wire [7:0] status_int;
    wire       clkfb;
    wire       clk0;
    wire       clkfx;

    DCM_SP #(
        .CLKDV_DIVIDE          (2.000),
        .CLKFX_DIVIDE          (20),
        .CLKFX_MULTIPLY        (13),
        .CLKIN_DIVIDE_BY_2     ("FALSE"),
        .CLKIN_PERIOD          (10.0),
        .CLKOUT_PHASE_SHIFT    ("NONE"),
        .CLK_FEEDBACK          ("1X"),
        .DESKEW_ADJUST         ("SYSTEM_SYNCHRONOUS"),
        .PHASE_SHIFT           (0),
        .STARTUP_WAIT          ("FALSE"))
    dcm_sp_inst(
        // Input clock
        .CLKIN                 (clk_in),
      //.CLKIN                 (clkin1),
        .CLKFB                 (clkfb),
        // Output clocks
        .CLK0                  (clk0),
        .CLK90                 (),
        .CLK180                (),
        .CLK270                (),
        .CLK2X                 (),
        .CLK2X180              (),
        .CLKFX                 (clkfx),
        .CLKFX180              (),
        .CLKDV                 (),
        // Ports for dynamic phase shift
        .PSCLK                 (1'b0),
        .PSEN                  (1'b0),
        .PSINCDEC              (1'b0),
        .PSDONE                (),
        // Other control and status signals
        .LOCKED                (locked_int),
        .STATUS                (status_int),
    
        .RST                   (reset),
        // Unused pin- tie low
        .DSSEN                 (1'b0)
    );

    assign locked = locked_int;

    // Output buffering
    //-----------------------------------
    BUFG clkf_buf(
        .O (clkfb),
        .I (clk0)
    );

    BUFG clkout1_buf(
        .O (clk_out),
        .I (clkfx)
    );
    /* END Xilinx ISE Generated Verilog */

endmodule
