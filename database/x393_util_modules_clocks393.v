// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>clocks393
 * @file clocks393.v
 * @date 2015-07-17  
 * @author Andrey  Filippov   
 *
 * @brief Generating global clocks for x393 (excluding memcntrl and SATA)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * clocks393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  clocks393.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  clocks393#(
        parameter CLK_ADDR =                  'h728, // ..'h729
        parameter CLK_MASK =                  'h7fe, //
        parameter CLK_STATUS_REG_ADDR =       'h3a,  //  
        parameter CLK_CNTRL =                 0,
        parameter CLK_STATUS =                1,
        
        parameter CLK_RESET =                'h0, // which clocks should stay reset after release of masrter reset {ff1,ff0,mem,sync,xclk,pclk,xclk}
        parameter CLK_PWDWN =                'h0, // which clocks should stay powered down  after release of masrter reset {sync,xclk,pclk,xclk}
        
        parameter CLKIN_PERIOD_AXIHP =        20, //ns >1.25, 600<Fvco<1200
        parameter DIVCLK_DIVIDE_AXIHP =       1,
        parameter CLKFBOUT_MULT_AXIHP =       18, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
        parameter CLKOUT_DIV_AXIHP =           6,   // To get 150MHz for the reference clock
        parameter BUF_CLK1X_AXIHP =           "BUFG", // "BUFG", "BUFH", "BUFR", "NONE"
        
        parameter CLKIN_PERIOD_PCLK =         42, // 24MHz 
        parameter DIVCLK_DIVIDE_PCLK =         1,
        parameter CLKFBOUT_MULT_PCLK =        40, // 960 MHz
        parameter CLKOUT_DIV_PCLK =           10, // 96MHz 
        parameter BUF_CLK1X_PCLK =            "BUFG",
`ifdef USE_PCLK2X    
        parameter CLKOUT_DIV_PCLK2X =          5, // 192 MHz
        parameter PHASE_CLK2X_PCLK =           0.000, 
        parameter BUF_CLK1X_PCLK2X =          "BUFG",  
`endif        
        parameter CLKIN_PERIOD_XCLK =         20, // 50MHz 
        parameter DIVCLK_DIVIDE_XCLK =         1,
        parameter CLKFBOUT_MULT_XCLK =        20, // 50*20=1000 MHz
        parameter CLKOUT_DIV_XCLK =           10, // 100 MHz
        parameter BUF_CLK1X_XCLK =            "BUFG",
`ifdef  USE_XCLK2X     
        parameter CLKOUT_DIV_XCLK2X =          5, // 200 MHz
        parameter PHASE_CLK2X_XCLK =           0.000, 
        parameter BUF_CLK1X_XCLK2X =          "BUFG",  
`endif        
        parameter CLKIN_PERIOD_SYNC =         20, // 50MHz 
        parameter DIVCLK_DIVIDE_SYNC =         1,
        parameter CLKFBOUT_MULT_SYNC =        20, // 50*20=1000 MHz
        parameter CLKOUT_DIV_SYNC =           10, // 100 MHz 
        parameter BUF_CLK1X_SYNC =            "BUFG",
        
        parameter MEMCLK_CAPACITANCE =        "DONT_CARE",
        parameter MEMCLK_IBUF_LOW_PWR =       "TRUE",
        parameter MEMCLK_IOSTANDARD =         "DEFAULT",

        parameter FFCLK0_CAPACITANCE =        "DONT_CARE",
        parameter FFCLK0_DIFF_TERM =          "FALSE",
        parameter FFCLK0_IBUF_LOW_PWR =       "TRUE",
        parameter FFCLK0_IOSTANDARD =         "DEFAULT",
        
        parameter FFCLK1_CAPACITANCE =        "DONT_CARE",
        parameter FFCLK1_DIFF_TERM =          "FALSE",
        parameter FFCLK1_IBUF_LOW_PWR =       "TRUE",
        parameter FFCLK1_IOSTANDARD =         "DEFAULT"
        
)(
    input       async_rst, // always reset MMCM/PLL 
    input       mclk, // global clock, comes from the memory controller (uses aclk generated here)
    input       mrst,
    // command/status interface
    input                   [7:0] cmd_ad,       // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,      // strobe (with first byte) for the command a/d
    output                  [7:0] status_ad,    // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,    // input request to send status downstream
    input                         status_start, // Acknowledge of the first status packet byte (address)
    input [3:0] fclk, // 4 clocks coming from the Zynq PS. Currently only [0] is used
    input       memclk_pad, // connected to external clock generator (VDD=1.5V)
    input       ffclk0p_pad, // differential clock (P) same power as sensors 0 and 1 (VCC_SENS01) 
    input       ffclk0n_pad, // differential clock (N) same power as sensors 0 and 1 (VCC_SENS01)
    input       ffclk1p_pad, // differential clock (P) same power as sensors 0 and 1 (VCC_SENS01) 
    input       ffclk1n_pad, // differential clock (N) same power as sensors 0 and 1 (VCC_SENS01)
    output      aclk,        // global clock 50 MHz (used for maxi0)
    output      hclk,        // global clock 150MHz (used for afi*, saxi*)
    output      pclk,        // global clock for sensors (now 96MHz), based on external clock generator
`ifdef USE_PCLK2X    
    output      pclk2x,      // global clock for sennors, 2x frequency (now 192MHz)
`endif
    output      xclk,        // global clock for compressor (now 100MHz) 
`ifdef  USE_XCLK2X     
    output      xclk2x,      // global clock for compressor, 2x frequency (now 200MHz)
`endif    
    output      sync_clk,    // global clock for camsync module (96 MHz for 353 compatibility - switch to 100MHz)?
    output      time_ref,     // non-global, just RTC (currently just mclk/8 = 25 MHz)
    input [1:0] extra_status, // just extra two status bits from the top module
    output      locked_sync_clk,
    output      locked_xclk,
    output      locked_pclk,
    output      locked_hclk
);
    wire         memclk;
    wire         ffclk0;
    wire         ffclk1;
    wire  [8:0] status_data;
    wire  [10:0] cmd_data;
    wire         cmd_we;
    wire   [0:0] cmd_a;
    
    wire         set_ctrl_w =   cmd_we & ((cmd_a  && CLK_MASK) == CLK_CNTRL);
    wire         set_status_w = cmd_we & ((cmd_a  && CLK_MASK) == CLK_STATUS);
    wire   [3:0] locked;
    reg    [6:0] reset_clk = CLK_RESET;
    reg    [3:0] pwrdwn_clk = CLK_PWDWN; 
    reg    [2:0] test_clk; // FF to test input clocks are running
    wire memclk_rst = reset_clk[4];
    wire ffclk0_rst = reset_clk[5];
    wire ffclk1_rst = reset_clk[6];

    assign locked_sync_clk = locked[3];
    assign locked_xclk =     locked[2];
    assign locked_pclk =     locked[1];
    assign locked_hclk =     locked[0];

    always @ (posedge mclk) begin
        if (mrst)            reset_clk <= CLK_RESET;
        else if (set_ctrl_w) reset_clk <= {cmd_data[10:8], cmd_data[3:0]};
         
        if (mrst)            pwrdwn_clk <= CLK_PWDWN;
        else if (set_ctrl_w) pwrdwn_clk <= cmd_data[7:4]; 
    end
    assign status_data = {test_clk, locked, extra_status};
    always @ (posedge memclk or posedge memclk_rst) if (async_rst || memclk_rst) test_clk[0] <= 0; else test_clk[0] <= ~test_clk[0];
    always @ (posedge ffclk0 or posedge ffclk0_rst) if (async_rst || ffclk0_rst) test_clk[1] <= 0; else test_clk[1] <= ~test_clk[1];
    always @ (posedge ffclk1 or posedge ffclk1_rst) if (async_rst || ffclk1_rst) test_clk[2] <= 0; else test_clk[2] <= ~test_clk[2];
    
    cmd_deser #(
        .ADDR       (CLK_ADDR),
        .ADDR_MASK  (CLK_MASK),
        .NUM_CYCLES (4),
        .ADDR_WIDTH (1),
        .DATA_WIDTH (11)
    ) cmd_deser_32bit_i (
        .rst        (1'b0),     // rst),      // input
        .clk        (mclk),     // input
        .srst       (mrst),     // input
        .ad         (cmd_ad),   // input[7:0] 
        .stb        (cmd_stb),  // input
        .addr       (cmd_a),    // output[3:0] 
        .data       (cmd_data), // output[31:0] 
        .we         (cmd_we)    // output
    );
 
    status_generate #(
        .STATUS_REG_ADDR     (CLK_STATUS_REG_ADDR),
        .PAYLOAD_BITS        (9),
        .REGISTER_STATUS     (0)
    ) status_generate_i (
        .rst           (1'b0),          // rst),      // input
        .clk           (mclk),          // input
        .srst          (mrst),          // input
        .we            (set_status_w),  // input
        .wd            (cmd_data[7:0]), // input[7:0] 
        .status        (status_data),   // input[14:0] 
        .ad            (status_ad),     // output[7:0] 
        .rq            (status_rq),     // output
        .start         (status_start)   // input
    );
    
    BUFG bufg_axi_aclk_i  (.O(aclk), .I(fclk[0]));

    dual_clock_source #(
        .CLKIN_PERIOD     (CLKIN_PERIOD_AXIHP),
        .DIVCLK_DIVIDE    (DIVCLK_DIVIDE_AXIHP),
        .CLKFBOUT_MULT    (CLKFBOUT_MULT_AXIHP),
        .CLKOUT_DIV_CLK1X (CLKOUT_DIV_AXIHP),
        .BUF_CLK1X        (BUF_CLK1X_AXIHP),
        .BUF_CLK2X        ("NONE")
    ) dual_clock_axihp_i (
        .rst              (async_rst || reset_clk[0]), // input
        .clk_in           (aclk),         // input
        .pwrdwn           (pwrdwn_clk[0]), // input
        .clk1x            (hclk), // output
        .clk2x            (), // output
        .locked           (locked[0]) // output
    );
    
    dual_clock_source #(
        .CLKIN_PERIOD     (CLKIN_PERIOD_PCLK),
        .DIVCLK_DIVIDE    (DIVCLK_DIVIDE_PCLK),
        .CLKFBOUT_MULT    (CLKFBOUT_MULT_PCLK),
        .CLKOUT_DIV_CLK1X (CLKOUT_DIV_PCLK),
        .BUF_CLK1X        (BUF_CLK1X_PCLK)
`ifdef USE_PCLK2X    
       ,.CLKOUT_DIV_CLK2X (CLKOUT_DIV_PCLK2X),
        .PHASE_CLK2X      (PHASE_CLK2X_PCLK),
        .BUF_CLK2X        (BUF_CLK1X_PCLK2X)
`else
       ,.BUF_CLK2X        ("NONE")
`endif        
    ) dual_clock_pclk_i (
        .rst              (async_rst || reset_clk[1]),     // input
        .clk_in           (ffclk0),           // input
        .pwrdwn           (pwrdwn_clk[1]),    // input
        .clk1x            (pclk),             // output
`ifdef USE_PCLK2X    
        .clk2x            (pclk2x),           // output
`else        
        .clk2x            (),                 // output not connected
`endif        
        .locked           (locked[1])         // output
    );
    
    dual_clock_source #(
        .CLKIN_PERIOD     (CLKIN_PERIOD_XCLK),
        .DIVCLK_DIVIDE    (DIVCLK_DIVIDE_XCLK),
        .CLKFBOUT_MULT    (CLKFBOUT_MULT_XCLK),
        .CLKOUT_DIV_CLK1X (CLKOUT_DIV_XCLK),
        .BUF_CLK1X        (BUF_CLK1X_XCLK),
`ifdef  USE_XCLK2X     
        .CLKOUT_DIV_CLK2X (CLKOUT_DIV_XCLK2X),
        .PHASE_CLK2X      (PHASE_CLK2X_XCLK),
        .BUF_CLK2X        (BUF_CLK1X_XCLK2X)
`else
        .BUF_CLK2X        ("NONE")
`endif        
    ) dual_clock_xclk_i (
        .rst              (async_rst || reset_clk[2]),     // input
        .clk_in           (aclk),             // input
        .pwrdwn           (pwrdwn_clk[2]),    // input
        .clk1x            (xclk),             // output
`ifdef  USE_XCLK2X     
        .clk2x            (xclk2x),           // output
`else
        .clk2x            (),                 // output
`endif        
        .locked           (locked[2])         // output
    );
    
    dual_clock_source #(
        .CLKIN_PERIOD     (CLKIN_PERIOD_SYNC),
        .DIVCLK_DIVIDE    (DIVCLK_DIVIDE_SYNC),
        .CLKFBOUT_MULT    (CLKFBOUT_MULT_SYNC),
        .CLKOUT_DIV_CLK1X (CLKOUT_DIV_SYNC),
        .BUF_CLK1X        (BUF_CLK1X_SYNC),
        .BUF_CLK2X        ("NONE")
    ) dual_clock_sync_clk_i (
        .rst              (async_rst || reset_clk[3]),     // input
        .clk_in           (aclk),             // input
        .pwrdwn           (pwrdwn_clk[3]),    // input
        .clk1x            (sync_clk),         // output
        .clk2x            (),                 // output
        .locked           (locked[3])         // output
    );
    

    ibuf_ibufg #(
        .CAPACITANCE      (MEMCLK_CAPACITANCE),
        .IBUF_LOW_PWR     (MEMCLK_IBUF_LOW_PWR),
        .IOSTANDARD       (MEMCLK_IOSTANDARD)
    ) ibuf_ibufg_i (
        .O    (memclk),    // output
        .I    (memclk_pad) // input
    );

    ibufds_ibufgds #(
        .CAPACITANCE      (FFCLK0_CAPACITANCE),
        .DIFF_TERM        (FFCLK0_DIFF_TERM),
        .IBUF_LOW_PWR     (FFCLK0_IBUF_LOW_PWR),
        .IOSTANDARD       (FFCLK0_IOSTANDARD)
    ) ibufds_ibufgds0_i (
        .O    (ffclk0),      // output
        .I    (ffclk0p_pad), // input
        .IB   (ffclk0n_pad)  // input
    );

    ibufds_ibufgds #(
        .CAPACITANCE      (FFCLK1_CAPACITANCE),
        .DIFF_TERM        (FFCLK1_DIFF_TERM),
        .IBUF_LOW_PWR     (FFCLK1_IBUF_LOW_PWR),
        .IOSTANDARD       (FFCLK1_IOSTANDARD)
    ) ibufds_ibufgds10_i (
        .O    (ffclk1),      // output
        .I    (ffclk1p_pad), // input
        .IB   (ffclk1n_pad)  // input
    );
    
   // RTC reference: integer number of microseconds, less than mclk/2. Not a global clock
   // temporary:
    reg [2:0] time_ref_r;
    always @ (posedge mclk) if (mrst) time_ref_r <= 0; else time_ref_r <= time_ref_r + 1;
    assign time_ref = time_ref_r[2];

endmodule

