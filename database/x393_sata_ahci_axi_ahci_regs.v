// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>axi_ahci_regs
 * @file axi_ahci_regs.v
 * @date 2015-12-29  
 * @author Andrey Filippov
 *
 * @brief Registers for single-port AHCI over AXI implementation
 * Combination of PCI Headers, PCI power management, and HBA memory
 * 128 DWORD registers 
 * Registers, with bits being RO, RW, RWC, RW1
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * axi_ahci_regs.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  axi_ahci_regs.v is distributed in the hope that it will be useful,
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


module  axi_ahci_regs#(
//    parameter ADDRESS_BITS = 8 // number of memory address bits
    parameter ADDRESS_BITS =  10, // number of memory address bits - now fixed. Low half - RO/RW/RWC,RW1 (2-cycle write), 2-nd just RW (single-cycle)
    parameter HBA_RESET_BITS = 9, // duration of HBA reset in aclk periods (9: ~10usec)
    parameter RESET_TO_FIRST_ACCESS = 1 // keep port reset until first R/W any register by software
)(
    input             aclk,    // clock - should be buffered
    input             arst,     // @aclk sync reset, active high
   
// AXI Write Address
    input      [31:0] awaddr,  // AWADDR[31:0], input
    input             awvalid, // AWVALID, input
    output            awready, // AWREADY, output
    input      [11:0] awid,    // AWID[11:0], input
    input      [ 3:0] awlen,   // AWLEN[3:0], input
    input      [ 1:0] awsize,  // AWSIZE[1:0], input
    input      [ 1:0] awburst, // AWBURST[1:0], input
// AXI PS Master GP0: Write Data
    input      [31:0] wdata,   // WDATA[31:0], input
    input             wvalid,  // WVALID, input
    output            wready,  // WREADY, output
    input      [11:0] wid,     // WID[11:0], input
    input             wlast,   // WLAST, input
    input      [ 3:0] wstb,    // WSTRB[3:0], input
// AXI PS Master GP0: Write response
    output            bvalid,  // BVALID, output
    input             bready,  // BREADY, input
    output     [11:0] bid,     // BID[11:0], output
    output     [ 1:0] bresp,    // BRESP[1:0], output
// AXI Read Address   
    input      [31:0] araddr,  // ARADDR[31:0], input 
    input             arvalid, // ARVALID, input
    output            arready, // ARREADY, output
    input      [11:0] arid,    // ARID[11:0], input
    input      [ 3:0] arlen,   // ARLEN[3:0], input
    input      [ 1:0] arsize,  // ARSIZE[1:0], input
    input      [ 1:0] arburst, // ARBURST[1:0], input
// AXI Read Data
    output     [31:0] rdata,   // RDATA[31:0], output
    output            rvalid,  // RVALID, output
    input             rready,  // RREADY, input
    output     [11:0] rid,     // RID[11:0], output
    output            rlast,   // RLAST, output
    output     [ 1:0] rresp,   // RRESP
   
// HBA interface
// 1. Notification of data written @ hba_clk
    output [ADDRESS_BITS-1:0] soft_write_addr,  // register address written by software
    output             [31:0] soft_write_data,  // register data written (after applying wstb and type (RO, RW, RWC, RW1)
    output                    soft_write_en,    // write enable for data write
    // Apply next 2 resets and arst OR-ed to SATA.extrst
    output                    hba_arst,          // hba async reset (currently does ~ the same as port reset)
    output                    port_arst,         // port0 async reset by software
    output                    port_arst_any,     // port0 async reset by POR or software

// 2. HBA R/W registers, use hba clock
    input                     hba_clk,          // SATA clock, now 75MHz
    input                     hba_rst,          // when PLL locked, SATA PHY reset is over, this signal is released
    input  [ADDRESS_BITS-1:0] hba_addr,
    input                     hba_we,
//   input               [3:0] hba_wstb, Needed?
    input               [1:0] hba_re, // [0] - re, [1] - regen
    input              [31:0] hba_din,
    output             [31:0] hba_dout,
    
// Program FSM memory
    output reg         [17:0] pgm_ad, // @aclk, address/data to program the AHCI FSM
    output reg                pgm_wa, // @aclk, address strobe to program the AHCI FSM
    output reg                pgm_wd, // @aclk, data strobe to program the AHCI FSM
    
    
    
//  other control signals
    output reg         [ 3:0] afi_wcache,
    output reg         [ 3:0] afi_rcache,
    output                    afi_cache_set,
    output                    was_hba_rst,    // last reset was hba reset (not counting system reset)
    output                    was_port_rst,    // last reset was port reset
    input              [31:0] debug_in0,
    input              [31:0] debug_in1,
    input              [31:0] debug_in2,
    input              [31:0] debug_in3
`ifdef USE_DRP
   ,output reg                drp_en, // @aclk strobes drp_ad
    output reg                drp_we,
    output reg         [14:0] drp_addr,       
    output reg         [15:0] drp_di,
    input                     drp_rdy,
    input              [15:0] drp_do 
`endif    
`ifdef USE_DATASCOPE
// Datascope interface (write to memory that can be software-read)
   ,input                     datascope_clk,
    input  [ADDRESS_BITS-1:0] datascope_waddr,      
    input                     datascope_we,
    input              [31:0] datascope_di,
    
    input                     datascope1_clk,
    input  [ADDRESS_BITS-1:0] datascope1_waddr,      
    input                     datascope1_we,
    input              [31:0] datascope1_di
`endif    
);
`ifdef USE_DRP
    localparam DRP_ADDR =     'h3fb;
    reg                [15:0] drp_read_data;
    reg                       drp_read_r;
    reg                       drp_ready_r;
`endif
`ifdef USE_DATASCOPE
//    localparam AXIBRAM_BITS = ADDRESS_BITS + 1; // number of axi address outputs (one more than ADDRESS_BITS when using datascope)
    localparam AXIBRAM_BITS = ADDRESS_BITS + 2; // number of axi address outputs (one more than ADDRESS_BITS when using datascope)
    wire               [31:0] datascope_rdata;
    reg                [1:0]  datascope_sel;    // read datascope memory instead of the registers
    wire               [31:0] datascope1_rdata;
    reg                [1:0]  datascope1_sel;    // read datascope memory instead of the registers
    always @ (posedge aclk) begin
        datascope_sel <=  {datascope_sel[0],  ~bram_raddr[ADDRESS_BITS+1] &  bram_raddr[ADDRESS_BITS]};
        datascope1_sel <= {datascope1_sel[0],  bram_raddr[ADDRESS_BITS+1] & ~bram_raddr[ADDRESS_BITS]};
    end
`else 
    localparam AXIBRAM_BITS =  ADDRESS_BITS; // number of axi address outputs (one more than ADDRESS_BITS when using datascope)
`endif
`include "includes/ahci_localparams.vh" // @SuppressThisWarning VEditor : Unused localparams
    wire   [AXIBRAM_BITS-1:0] bram_waddr;
//    wire   [ADDRESS_BITS-1:0] pre_awaddr;
    wire   [AXIBRAM_BITS-1:0] bram_raddr;
    wire               [31:0] bram_rdata;
    wire                      pre_bram_wen; // one cycle ahead of bram_wen, nut not masked by dev_ready
    wire                      bram_wen;
    wire               [ 3:0] bram_wstb; 
    wire               [31:0] bram_wdata; 
    wire   [ADDRESS_BITS-1:0] bram_addr; 
   

    wire             [1:0] bram_ren;
    reg                    write_busy_r;
    wire                   write_start_burst;
//    wire         nowrite;          // delay write in read-modify-write register accesses
///    wire                   write_busy_w = write_busy_r || write_start_burst;
    wire                   write_busy_w = write_busy_r || write_start_burst || bram_wen_r;
    reg             [31:0] bram_wdata_r;
    reg             [31:0] bram_rdata_r;
//    reg                    bram_wen_d;
    wire            [63:0] regbit_type;
    wire            [31:0] ahci_regs_di;
    reg             [ 3:0] bram_wstb_r;
    reg                    bram_wen_r;
//    wire  [31:0] wmask = {{8{bram_wstb[3]}},{8{bram_wstb[2]}},{8{bram_wstb[1]}},{8{bram_wstb[0]}}};
    wire            [31:0] wmask = {{8{bram_wstb_r[3]}},{8{bram_wstb_r[2]}},{8{bram_wstb_r[1]}},{8{bram_wstb_r[0]}}};
    reg [ADDRESS_BITS-1:0] bram_waddr_r;
    
    reg [HBA_RESET_BITS-1:0] hba_reset_cntr; // time to keep hba_reset_r active after writing to GHC.HR
    reg                      hba_rst_r;      // hba _reset (currently does ~ the same as port reset)
    reg                      port_rst_r;     // port _reset by software
    reg                      port_arst_any_r = 1;   // port _reset by software or POR
    
    wire                   high_sel = bram_waddr_r[ADDRESS_BITS-1]; // high addresses - use single-cycle writes without read-modify-write
    wire                   afi_cache_set_w = bram_wen_r && !high_sel && (bram_addr == HBA_PORT__AFI_CACHE__WR_CM__ADDR);
    wire                   pgm_fsm_set_w =   bram_wen_r && !high_sel && (bram_addr == HBA_PORT__PGM_AHCI_SM__PGM_AD__ADDR);
    wire                   pgm_fsm_and_w = |(ahci_regs_di & HBA_PORT__PGM_AHCI_SM__AnD__MASK);
    
    wire                   set_hba_rst =  bram_wen_r && !high_sel && (bram_addr == GHC__GHC__HR__ADDR) && (ahci_regs_di & GHC__GHC__HR__MASK);
    localparam HBA_PORT__PxSCTL__DET__MASK01 = HBA_PORT__PxSCTL__DET__MASK & ~1; // == 'he
    wire                   set_port_rst = bram_wen_r && !high_sel && (bram_addr == HBA_PORT__PxSCTL__DET__ADDR) &&
                                          ((ahci_regs_di & HBA_PORT__PxSCTL__DET__MASK01) == 0); // writing only 0/1
                                                                 //  in lower 4 bits
    
    wire                   port_rst_on = set_port_rst && ahci_regs_di[0];
    reg                    was_hba_rst_aclk;     // last reset was hba reset (not counting system reset)
    reg                    was_port_rst_aclk;    // last reset was port reset
    reg             [2:0]  was_hba_rst_r;        // last reset was hba reset (not counting system reset)
    reg             [2:0]  was_port_rst_r;       // last reset was port reset
    reg             [2:0]  arst_r = ~0;          // previous state of arst
    reg                    wait_first_access = RESET_TO_FIRST_ACCESS;    // keep port reset until first access
    wire                   any_access = bram_wen_r || bram_ren[0];
    reg                    debug_rd_r = 0;
    reg             [31:0] debug_r;
    

    assign bram_addr =     bram_ren[0] ? bram_raddr[ADDRESS_BITS-1:0] : (bram_wen_r ? bram_waddr_r : bram_waddr[ADDRESS_BITS-1:0]);
    
    assign hba_arst =      hba_rst_r;       // hba _reset (currently does ~ the same as port reset)
    assign port_arst =     port_rst_r;     // port _reset by software
    assign port_arst_any = port_arst_any_r;
    assign was_hba_rst =   was_hba_rst_r[0]; 
    assign was_port_rst =  was_port_rst_r[0];
    
    
    always @(posedge aclk) begin
`ifdef USE_DRP
    if (bram_waddr == DRP_ADDR) begin
        drp_di <=   bram_wdata[15: 0];
        drp_addr <= bram_wdata[30:16];
//        drp_we <=   bram_wdata[31];
    end
    
    drp_en <= (bram_waddr == DRP_ADDR);
    drp_we <= (bram_waddr == DRP_ADDR) && bram_wdata[31];
    
    if (arst || (bram_waddr == DRP_ADDR)) drp_ready_r <= 0;
    else if (drp_rdy)                     drp_ready_r <= 1;
    
    if (drp_rdy)                          drp_read_data <= drp_do;
    
    if (bram_ren[0])                      drp_read_r <= (bram_raddr == DRP_ADDR);
    
`endif    

       
        if      (arst)              write_busy_r <= 0;
        else if (write_start_burst) write_busy_r <= 1;
        else if (!pre_bram_wen)     write_busy_r <= 0;

        if (bram_wen)               bram_wdata_r <= bram_wdata;
        
        bram_wstb_r <= {4{bram_wen}} & bram_wstb;
        
        bram_wen_r <= bram_wen;
        
        if (bram_wen) bram_waddr_r <= bram_waddr[ADDRESS_BITS-1:0];
`ifndef NO_DEBUG_OUT        
    `ifdef USE_DATASCOPE        
            if (bram_ren[0])            debug_rd_r <= (&bram_raddr[ADDRESS_BITS-1:4]) &&
    //                                                  (bram_raddr[3:2] == 0) &&
                                                      !bram_raddr[ADDRESS_BITS]; // 
    `else
            if (bram_ren[0])            debug_rd_r <= (&bram_raddr[ADDRESS_BITS-1:4]); // &&
    //                                                  (bram_raddr[3:2] == 0); // 
    `endif                                                  
`endif // `else `ifdef NO_DEBUG_OUT
        if (bram_ren[0])            debug_r <= bram_raddr[1]? (bram_raddr[0] ? debug_in3: debug_in2):
                                                              (bram_raddr[0] ? debug_in1: debug_in0);
        

`ifdef USE_DRP
        if (bram_ren[1])            bram_rdata_r <= drp_read_r? {drp_ready_r, 15'b0,drp_read_data}:
                                                                (debug_rd_r? debug_r : bram_rdata);
`else
        if (bram_ren[1])            bram_rdata_r <= debug_rd_r? debug_r : bram_rdata;
`endif
    end

    //debug_rd_r    

    generate
        genvar i;
        for (i=0; i < 32; i=i+1) begin: bit_type_block
            assign ahci_regs_di[i] = (regbit_type[2*i+1] && wmask[i] && !high_sel)?
                                       ((regbit_type[2*i] && wmask[i])?
                                          (bram_rdata[i] || bram_wdata_r[i]):   // 3: RW1
                                          (bram_rdata[i] && !bram_wdata_r[i])): // 2: RWC
                                       (((regbit_type[2*i] && wmask[i]) || high_sel)?
                                          (bram_wdata_r[i]):                    // 1: RW write new data - get here for high_sel
                                          (bram_rdata[i]));                     // 0: R0 (keep old data)
        end
    endgenerate    

//    always @ (posedge aclk or posedge arst) begin
    always @ (posedge aclk) begin
        if      (arst)                      wait_first_access <= RESET_TO_FIRST_ACCESS;
        else if (any_access)                wait_first_access <= 0;
    
        if      (arst)                            port_arst_any_r <= 1;
        else if (set_port_rst)                    port_arst_any_r <= ahci_regs_di[0]; // write "1" - reset on, write 0 - reset off
        else if (wait_first_access && any_access) port_arst_any_r <= 0;
        else if (arst_r[2] && !arst_r[1])         port_arst_any_r <= wait_first_access;
    end

    always @(posedge aclk) begin
        if      (arst)            hba_reset_cntr <= 0; // 1; no HBA reset at arst
        else if (set_hba_rst)     hba_reset_cntr <= {HBA_RESET_BITS{1'b1}};
        else if (|hba_reset_cntr) hba_reset_cntr <= hba_reset_cntr - 1;
        
        hba_rst_r <= hba_reset_cntr != 0;
        
        if      (arst)         port_rst_r <= 0;
        else if (set_port_rst) port_rst_r <= ahci_regs_di[0]; // write "1" - reset on, write 0 - reset off
        
        if (arst || port_rst_on) was_hba_rst_aclk <= 0;
        else if (set_hba_rst)    was_hba_rst_aclk <= 1;
        
        if (arst || set_hba_rst) was_port_rst_aclk <= 0;
        else if (port_rst_on)    was_port_rst_aclk <= 1;
        
        if (arst) arst_r <= ~0;
        else      arst_r <= arst_r << 1;

    end

////    always @ (hba_clk) begin
    always @ (posedge aclk) begin
        was_hba_rst_r <= {was_hba_rst_aclk, was_hba_rst_r[2:1]};
        was_port_rst_r <= {was_port_rst_aclk, was_port_rst_r[2:1]};
    end
    


    always @(posedge aclk) begin
        if      (arst)             {afi_wcache,afi_rcache}  <= 8'h33;
        else if (afi_cache_set_w)  {afi_wcache,afi_rcache}  <= ahci_regs_di[7:0];
    end    

    always @(posedge aclk) begin
        if (arst) {pgm_wa,pgm_wd}  <= 0;
        else      {pgm_wa,pgm_wd}  <= {2{pgm_fsm_set_w}} & {pgm_fsm_and_w, ~pgm_fsm_and_w};
        
        if (pgm_fsm_set_w) pgm_ad <= ahci_regs_di[17:0];
    end
    


/*
Will generate async reset on both HBA reset(for some time) and port reset (until released) 
until it is more clear about GTX reset options. Such reset will be applied to both PLL and GTX,
sata_phy_rst_out will be released after the sata clock is stable
    output                    soft_arst,        // reset SATA PHY not relying on SATA clock
                                                // TODO: Decode from {bram_addr, ahci_regs_di}, bram_wen_d
    input                     sata_phy_rst_out,  // when PLL locked, SATA PHY reset is over, this signal is released
    localparam GHC__GHC__HR__ADDR = 'h1;
    localparam GHC__GHC__HR__MASK = 'h1;
    localparam GHC__GHC__HR__DFLT = 'h0;
    
    reg [HBA_RESET_BITS-1:0] hba_reset_cntr; // time to keep hba_reset_r active after writing to GHC.HR
    reg                      hba_rst_r;      // hba reset (currently does ~ the same as port reset)
    reg                      port_rst_r;     // port reset by software
        .rst        (1'b0),                              // input
        .rrst       (hba_rst),                           // input
        .wrst       (arst),                              // input
        .rclk       (hba_clk),                           // input
        .wclk       (aclk),                              // input
        .we         (bram_wen_r && !high_sel),           // input
        .re         (soft_write_en),                     // input
        .data_in    ({bram_addr, ahci_regs_di}),         // input[15:0] 
        .data_out   ({soft_write_addr,soft_write_data}), // output[15:0] 
        .nempty     (soft_write_en),                     // output
        .half_empty ()                                   // output
 
// RO: Device Detection Initialization
    localparam HBA_PORT__PxSCTL__DET__ADDR = 'h4b;
    localparam HBA_PORT__PxSCTL__DET__MASK = 'hf;
    localparam HBA_PORT__PxSCTL__DET__DFLT = 'h0;
    

*/


    axibram_write #(
        .ADDRESS_BITS(AXIBRAM_BITS) // in debug mode - 1 bit more than ADDERSS_BITS
    ) axibram_write_i (
        .aclk        (aclk),                     // input
        .arst        (arst),                     // input
        .awaddr      (awaddr),                   // input[31:0] 
        .awvalid     (awvalid),                  // input
        .awready     (awready),                  // output
        .awid        (awid),                     // input[11:0] 
        .awlen       (awlen),                    // input[3:0] 
        .awsize      (awsize),                   // input[1:0] 
        .awburst     (awburst),                  // input[1:0] 
        .wdata       (wdata),                    // input[31:0] 
        .wvalid      (wvalid),                   // input
        .wready      (wready),                   // output
        .wid         (wid),                      // input[11:0] 
        .wlast       (wlast),                    // input
        .wstb        (wstb),                     // input[3:0] 
        .bvalid      (bvalid),                   // output
        .bready      (bready),                   // input
        .bid         (bid),                      // output[11:0] 
        .bresp       (bresp),                    // output[1:0] 
        .pre_awaddr  (), //pre_awaddr),          // output[9:0] 
        .start_burst (write_start_burst),        // output
//        .dev_ready   (!nowrite && !bram_ren[0]), // input
        .dev_ready   (!bram_wen),                // input   There will be no 2 bram_wen in a row
        .bram_wclk   (),                         // output
        .bram_waddr  (bram_waddr),               // output[9:0]
        .pre_bram_wen(pre_bram_wen),             // output
        .bram_wen    (bram_wen),                 // output
        .bram_wstb   (bram_wstb),                // output[3:0] 
        .bram_wdata  (bram_wdata)                // output[31:0] 
    );

    axibram_read #(
        .ADDRESS_BITS(AXIBRAM_BITS) // in debug mode - 1 bit more than ADDERSS_BITS
    ) axibram_read_i (
        .aclk        (aclk),                     // input
        .arst        (arst),                     // input
        .araddr      (araddr),                   // input[31:0] 
        .arvalid     (arvalid),                  // input
        .arready     (arready),                  // output
        .arid        (arid),                     // input[11:0] 
        .arlen       (arlen),                    // input[3:0] 
        .arsize      (arsize),                   // input[1:0] 
        .arburst     (arburst),                  // input[1:0] 
        .rdata       (rdata),                    // output[31:0] 
        .rvalid      (rvalid),                   // output reg 
        .rready      (rready),                   // input
        .rid         (rid),                      // output[11:0] reg 
        .rlast       (rlast),                    // output reg 
        .rresp       (rresp),                    // output[1:0] 
        .pre_araddr  (),                         // output[9:0] 
        .start_burst (),                         // output
        .dev_ready   (!write_busy_w),            // input
        .bram_rclk   (),                         // output
        .bram_raddr  (bram_raddr),               // output[9:0] 
        .bram_ren    (bram_ren[0]),              // output
        .bram_regen  (bram_ren[1]),              // output
`ifdef USE_DATASCOPE        
        .bram_rdata  ((datascope_sel[1] | datascope1_sel[1]) ?
                      (datascope1_sel[1]? datascope1_rdata : datascope_rdata) :
                       bram_rdata_r)              // input[31:0] 
`else
        .bram_rdata  (bram_rdata_r)              // input[31:0] 
`endif        
    );

    // Register memory, lower half uses read-modify-write using bit type from ahci_regs_type_i ROM, 2 aclk cycles/per write and
    // high addresses half are just plain write registers, they heve single-cycle write
    // Only low registers write generates cross-clock writes over the FIFO.
    // All registers can be accessed in byte/word/dword mode over the AXI
    
    // Lower registers are used as AHCI memory registers, high - for AHCI command list(s), to eliminate the need to update transfer count
    // in the system memory.

    ramt_var_wb_var_r #(
        .REGISTERS_A (0),
        .REGISTERS_B (1),
        .LOG2WIDTH_A (5),
        .LOG2WIDTH_B (5),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("NO_CHANGE")
        `include "includes/ahci_defaults.vh" 
    ) ahci_regs_i (
        .clk_a        (aclk),                                  // input
        .addr_a       (bram_addr),                             // input[9:0] 
        .en_a         (bram_ren[0] || bram_wen || bram_wen_r), // input
        .regen_a      (1'b0),                                  // input
        .we_a         (bram_wstb_r),                           // input[3:0]
//        
        .data_out_a   (bram_rdata),                            // output[31:0] 
        .data_in_a    (ahci_regs_di),                          // input[31:0] 
        .clk_b        (hba_clk),                               // input
        .addr_b       (hba_addr),                              // input[9:0] 
        .en_b         (hba_we || hba_re[0]),                   // input
        .regen_b      (hba_re[1]),                             // input
        .we_b         ({4{hba_we}}),                           // input
        .data_out_b   (hba_dout),                              // output[31:0] 
        .data_in_b    (hba_din)                                // input[31:0] 
    );

    ram_var_w_var_r #(
        .REGISTERS    (0),
        .LOG2WIDTH_WR (6),
        .LOG2WIDTH_RD (6),
        .DUMMY(0)
        `include "includes/ahci_types.vh" 
    ) ahci_regs_type_i (
        .rclk         (aclk),                       // input
        .raddr        (bram_addr[8:0]),             // input[8:0] 
        .ren          (bram_wen && !bram_addr[9]),  // input
        .regen        (1'b0),                       // input
        .data_out     (regbit_type),                // output[63:0] 
        .wclk         (1'b0),                       // input
        .waddr        (9'b0),                       // input[8:0] 
        .we           (1'b0),                       // input
        .web          (8'b0),                       // input[7:0] 
        .data_in      (64'b0)                       // input[63:0] 
    );
    
`ifdef USE_DATASCOPE
        ram_var_w_var_r #(
            .REGISTERS    (0),
            .LOG2WIDTH_WR (5),
            .LOG2WIDTH_RD (5),
            .DUMMY(0)
        ) datascope_mem_i (
            .rclk         (aclk),                       // input
            .raddr        (bram_raddr[9:0]),            // input[9:0] 
            .ren          (bram_ren[0]),                // input
            .regen        (bram_ren[1]),                // input
            .data_out     (datascope_rdata),            // output[31:0] 
            .wclk         (datascope_clk),              // input
            .waddr        (datascope_waddr),            // input[9:0] 
            .we           (datascope_we),               // input
            .web          (8'hff),                      // input[7:0] 
            .data_in      (datascope_di)                // input[31:0] 
        );

        ram_var_w_var_r #(
            .REGISTERS    (0),
            .LOG2WIDTH_WR (5),
            .LOG2WIDTH_RD (5),
            .DUMMY(0)
        ) datascope1_mem_i (
            .rclk         (aclk),                       // input
            .raddr        (bram_raddr[9:0]),            // input[9:0] 
            .ren          (bram_ren[0]),                // input
            .regen        (bram_ren[1]),                // input
            .data_out     (datascope1_rdata),           // output[31:0] 
            .wclk         (datascope1_clk),             // input
            .waddr        (datascope1_waddr),           // input[9:0] 
            .we           (datascope1_we),              // input
            .web          (8'hff),                      // input[7:0] 
            .data_in      (datascope1_di)               // input[31:0] 
        );
`endif

    fifo_cross_clocks #(
        .DATA_WIDTH(ADDRESS_BITS+32),
        .DATA_DEPTH(4)
    ) ahci_regs_set_i (
        .rst        (1'b0),                              // input
        .rrst       (hba_rst),                           // input
        .wrst       (arst),                              // input
        .rclk       (hba_clk),                           // input
        .wclk       (aclk),                              // input
        .we         (bram_wen_r && !high_sel),           // input
        .re         (soft_write_en),                     // input
        .data_in    ({bram_addr, ahci_regs_di}),         // input[15:0] 
        .data_out   ({soft_write_addr,soft_write_data}), // output[15:0] 
        .nempty     (soft_write_en),                     // output
        .half_empty ()                                   // output
    );

    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) afi_cache_set_i (
        .rst       (arst),             // input
        .src_clk   (aclk),             // input
        .dst_clk   (hba_clk),          // input
        .in_pulse  (afi_cache_set_w),  // input
        .out_pulse (afi_cache_set),    // output
        .busy()                        // output
    );


endmodule

