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

module user_led 
(
input user_clk,
input xgemac_clk_156,
input user_reset,
input [15:0] cfg_lstatus,
input [1:0] fmc_gbtclk0_fsel,
input calib_done,
input [7:0] xphy0_status,
input [7:0] xphy1_status,
output [7:1] led,
output [1:0] sfp_tx_disable,
output fmc_ok_led,
output fmc_clk_312_5

);

localparam  LED_CTR_WIDTH           = 26;   // Sets period of LED flashing

reg     [LED_CTR_WIDTH-1:0]           led_ctr;
reg                                   lane_width_error;
reg     [LED_CTR_WIDTH-1:0]           led156_ctr;

// LEDs - Status
// ---------------
// Heart beat LED; flashes when primary PCIe core clock is present
always @(posedge user_clk)
begin
    led_ctr <= led_ctr + {{(LED_CTR_WIDTH-1){1'b0}}, 1'b1};
end
always @(posedge xgemac_clk_156)
begin
    led156_ctr <= led156_ctr + {{(LED_CTR_WIDTH-1){1'b0}}, 1'b1};
end
`ifdef SIMULATION
// Initialize for simulation
initial
begin
    led_ctr = {LED_CTR_WIDTH{1'b0}};
    led156_ctr = {LED_CTR_WIDTH{1'b0}};
end
`endif

always @(posedge user_clk or posedge user_reset)
begin
    if (user_reset == 1'b1)
        lane_width_error <= 1'b0;
    else
        lane_width_error <= (cfg_lstatus[9:4] != NUM_LANES); // Negotiated Link Width
end

// led[1] lights up when PCIe core has trained
assign led[1] = user_lnk_up; 

// led[2] flashes to indicate PCIe clock is running
assign led[2] = led_ctr[LED_CTR_WIDTH-1];            // Flashes when core_clk_i_div2 is present

// led[3] lights up when the correct lane width is acheived
// If the link is not operating at full width, it flashes at twice the speed of the heartbeat on led[1]
assign led[3] = lane_width_error ? led_ctr[LED_CTR_WIDTH-2] : 1'b1;

// Flashing indicates 156.25 MHz clock is alive
assign led[4] = led156_ctr[LED_CTR_WIDTH-1];

assign led[5] = xphy0_status[0]; 

assign led[6] = xphy1_status[0]; 

`ifdef USE_DDR3_FIFO
// When glowing, the DDR3 initialization has completed
assign led[7] = calib_done;
`else
assign led[7] = 1'b0;
`endif

  //- Tie off related to SFP+
  assign sfp_tx_disable = 2'b00;

  //- This LED indicates FMC connected OK
  assign fmc_ok_led = 1'b1;
    //- This LED indicates FMC GBTCLK0 programmed OK
  assign fmc_clk_312_5 = (fmc_gbtclk0_fsel == 2'b11) ? 1'b1 : 1'b0;

endmodule
