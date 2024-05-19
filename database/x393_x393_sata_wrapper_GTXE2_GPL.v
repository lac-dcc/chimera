// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>GTXE2_GPL
 * @file GTXE2_GPL.v
 * @date  2015-09-08
 * @author Alexey     
 *
 * @brief emulates GTXE2_CHANNEL primitive behaviour. 
 *              The file is gathered from multiple files
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * GTXE2_GPL.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * GTXE2_GPL.v file is distributed in the hope that it will be useful,
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
/**
 * Original unisims primitive's interfaces, according to xilinx's user guide:
 * "7 Series FPGAs GTX/GTH Transceivers User Guide UG476(v1.11)", which is further 
 * referenced as ug476 or UG476
 *
 * Due to lack of functionality of gtxe2_gpl project as compared to the xilinx's primitive, 
 * not all of the inputs are used and not all of the outputs are driven.
 **/
// cpll reference clock mux
module gtxe2_chnl_cpll_inmux(
    input   wire    [2:0]   CPLLREFCLKSEL,
    input   wire            GTREFCLK0,
    input   wire            GTREFCLK1,
    input   wire            GTNORTHREFCLK0,
    input   wire            GTNORTHREFCLK1,
    input   wire            GTSOUTHREFCLK0,
    input   wire            GTSOUTHREFCLK1,
    input   wire            GTGREFCLK,
    output  wire            CPLL_MUX_CLK_OUT
);

// clock multiplexer - pre-syntesis simulation only
assign CPLL_MUX_CLK_OUT = CPLLREFCLKSEL == 3'b000 ?     1'b0 // reserved
                        : CPLLREFCLKSEL == 3'b001 ?     GTREFCLK0
                        : CPLLREFCLKSEL == 3'b010 ?     GTREFCLK1
                        : CPLLREFCLKSEL == 3'b011 ?     GTNORTHREFCLK0
                        : CPLLREFCLKSEL == 3'b100 ?     GTNORTHREFCLK1
                        : CPLLREFCLKSEL == 3'b101 ?     GTSOUTHREFCLK0
                        : CPLLREFCLKSEL == 3'b110 ?     GTSOUTHREFCLK1
                        : /*CPLLREFCLKSEL == 3'b111 ?*/ GTGREFCLK;

endmodule

module gtxe2_chnl_outclk_mux(
    input   wire            TXPLLREFCLK_DIV1,
    input   wire            TXPLLREFCLK_DIV2,
    input   wire            TXOUTCLKPMA,
    input   wire            TXOUTCLKPCS,
    input   wire    [2:0]   TXOUTCLKSEL,
    input   wire            TXDLYBYPASS,
    output  wire            TXOUTCLK
);

assign  TXOUTCLK    = TXOUTCLKSEL == 3'b001 ? TXOUTCLKPCS                       
                    : TXOUTCLKSEL == 3'b010 ? TXOUTCLKPMA                      
                    : TXOUTCLKSEL == 3'b011 ? TXPLLREFCLK_DIV1                           
                    : TXOUTCLKSEL == 3'b100 ? TXPLLREFCLK_DIV2
                    : /* 3'b000 */            1'b1; 
endmodule

`timescale 1ps/1ps
`define GTXE2_CHNL_CPLL_LOCK_TIME 60

module gtxe2_chnl_cpll(
// top-level interfaces
    input   wire    CPLLLOCKDETCLK,
    input   wire    CPLLLOCKEN,
    input   wire    CPLLPD,
    input   wire    CPLLRESET,  // active high
    output  wire    CPLLFBCLKLOST,
    output  wire    CPLLLOCK,
    output  wire    CPLLREFCLKLOST,

    input   wire    [15:0]  GTRSVD,
    input   wire    [15:0]  PCSRSVDIN,
    input   wire    [4:0]   PCSRSVDIN2,
    input   wire    [4:0]   PMARSVDIN,
    input   wire    [4:0]   PMARSVDIN2,
    input   wire    [19:0]  TSTIN,
    output  wire    [9:0]   TSTOUT,

// internal
    input   wire    ref_clk,
    output  wire    clk_out,
    output  wire    pll_locked // equals CPLLLOCK
);

parameter   [23:0]  CPLL_CFG        = 29'h00BC07DC;
parameter   integer CPLL_FBDIV      = 4;
parameter   integer CPLL_FBDIV_45   = 5;
parameter   [23:0]  CPLL_INIT_CFG   = 24'h00001E;
parameter   [15:0]  CPLL_LOCK_CFG   = 16'h01E8;
parameter   integer CPLL_REFCLK_DIV = 1;
parameter   integer RXOUT_DIV       = 2;
parameter   integer TXOUT_DIV       = 2;
parameter           SATA_CPLL_CFG = "VCO_3000MHZ";
parameter   [1:0]   PMA_RSV3        = 1;

localparam          multiplier  = CPLL_FBDIV * CPLL_FBDIV_45;
localparam          divider     = CPLL_REFCLK_DIV;

assign  pll_locked = locked;
assign  CPLLLOCK = pll_locked;

wire    fb_clk_out;
wire    reset;
reg     mult_clk;
reg     mult_dev_clk;

assign  clk_out = mult_dev_clk;

// generate internal async reset
assign reset = CPLLPD | CPLLRESET;

// apply multipliers
time    last_edge;  // reference clock edge's absolute time
time    period;     // reference clock's period
integer locked_f;
reg     locked;

initial 
begin
    last_edge = 0;
    period = 0;
    forever @ (posedge ref_clk or posedge reset)
    begin
        period      = reset ? 0 : $time - (last_edge == 0 ? $time : last_edge);
        last_edge   = reset ? 0 : $time;
    end
end
reg tmp = 0;
initial
begin
    @ (posedge reset);
    forever @ (posedge ref_clk)
    begin
        tmp = ~tmp;
        if (period > 0)
        begin
            locked_f = 1;
            mult_clk = 1'b1;
            repeat (multiplier * 2 - 1)
            begin
                #(period/multiplier/2) 
                mult_clk = ~mult_clk;
            end
        end
        else
            locked_f = 0;
    end
end

// apply dividers
initial
begin
    mult_dev_clk = 1'b1;
    forever
    begin
        repeat (divider)
            @ (mult_clk);
        mult_dev_clk = ~mult_dev_clk;
    end
end

// show if 'pll' is locked
reg [31:0]  counter;
always @ (posedge ref_clk or posedge reset)
    counter <= reset | locked_f == 0 ? 0 : counter == `GTXE2_CHNL_CPLL_LOCK_TIME ? counter : counter + 1;

always @ (posedge ref_clk)
    locked <= counter == `GTXE2_CHNL_CPLL_LOCK_TIME;
/*
always @ (posedge ref_clk or posedge reset)
begin
    if (locked_f == 1 && ~reset)
    begin
        repeat (`GTXE2_CHNL_CPLL_LOCK_TIME) @ (posedge ref_clk);
        locked <= 1'b1;
    end
    else
        locked <= 1'b0;
end*/

endmodule

 /**
  * Divides input clock either by input 'div' or by parameter 'divide_by' if divide_by_param
  * was set to 1
  **/
`ifndef CLOCK_DIVIDER_V
`define CLOCK_DIVIDER_V
// non synthesisable!
module clock_divider(
    input   wire    clk_in,
    output  reg     clk_out,

    input   wire    [31:0]  div
);
parameter divide_by = 1;
parameter divide_by_param = 1;

reg     [31:0]  cnt = 0;

reg [31:0]  div_r;
initial
begin
    cnt = 0;
    clk_out = 1'b1;
    forever
    begin
        if (divide_by_param == 0)
        begin
            if (div > 32'h0) 
                div_r = div;
            else    
                div_r = 1;
            repeat (div_r)
                @ (clk_in);
        end
        else
        begin
            repeat (divide_by)
                @ (clk_in);
        end
        clk_out = ~clk_out;
    end
end

endmodule
`endif

module gtxe2_chnl_clocking#(
    parameter   [23:0]  CPLL_CFG        = 29'h00BC07DC,
    parameter   integer CPLL_FBDIV      = 4,
    parameter   integer CPLL_FBDIV_45   = 5,
    parameter   [23:0]  CPLL_INIT_CFG   = 24'h00001E,
    parameter   [15:0]  CPLL_LOCK_CFG   = 16'h01E8,
    parameter   integer CPLL_REFCLK_DIV = 1,
    parameter           SATA_CPLL_CFG = "VCO_3000MHZ",
    parameter   [1:0]   PMA_RSV3        = 1,
    parameter   TXOUT_DIV   = 2,
    //parameter   TXRATE      = 3'b000;
    parameter   RXOUT_DIV   = 2,
    //parameter   RXRATE      = 3'b000;
    parameter   TX_INT_DATAWIDTH    = 0,
    parameter   TX_DATA_WIDTH       = 20,
    parameter   RX_INT_DATAWIDTH    = 0,
    parameter   RX_DATA_WIDTH       = 20
)(
// top-level interfaces
    input   wire    [2:0]   CPLLREFCLKSEL,
    input   wire            GTREFCLK0,
    input   wire            GTREFCLK1,
    input   wire            GTNORTHREFCLK0,
    input   wire            GTNORTHREFCLK1,
    input   wire            GTSOUTHREFCLK0,
    input   wire            GTSOUTHREFCLK1,
    input   wire            GTGREFCLK,
    input   wire            QPLLCLK,
    input   wire            QPLLREFCLK, 
    input   wire    [1:0]   RXSYSCLKSEL,
    input   wire    [1:0]   TXSYSCLKSEL,
    input   wire    [2:0]   TXOUTCLKSEL,
    input   wire    [2:0]   RXOUTCLKSEL,
    input   wire            TXDLYBYPASS,
    input   wire            RXDLYBYPASS,
    output  wire            GTREFCLKMONITOR,

    input   wire            CPLLLOCKDETCLK, 
    input   wire            CPLLLOCKEN,
    input   wire            CPLLPD,
    input   wire            CPLLRESET,
    output  wire            CPLLFBCLKLOST,
    output  wire            CPLLLOCK,
    output  wire            CPLLREFCLKLOST,

    input   wire    [2:0]   TXRATE,
    input   wire    [2:0]   RXRATE,

// phy-level interfaces
    output  wire            TXOUTCLKPMA,
    output  wire            TXOUTCLKPCS,
    output  wire            TXOUTCLK,
    output  wire            TXOUTCLKFABRIC,
    output  wire            tx_serial_clk,
    output  wire            tx_piso_clk,

    output  wire            RXOUTCLKPMA,
    output  wire            RXOUTCLKPCS,
    output  wire            RXOUTCLK,
    output  wire            RXOUTCLKFABRIC,
    output  wire            rx_serial_clk,
    output  wire            rx_sipo_clk,

// additional ports to cpll
    output  [9:0]       TSTOUT,
    input   [15:0]      GTRSVD,
    input   [15:0]      PCSRSVDIN,
    input   [4:0]       PCSRSVDIN2,
    input   [4:0]       PMARSVDIN,
    input   [4:0]       PMARSVDIN2,
    input   [19:0]      TSTIN
);
// CPLL
/*
parameter   [23:0]  CPLL_CFG        = 29'h00BC07DC;
parameter   integer CPLL_FBDIV      = 4;
parameter   integer CPLL_FBDIV_45   = 5;
parameter   [23:0]  CPLL_INIT_CFG   = 24'h00001E;
parameter   [15:0]  CPLL_LOCK_CFG   = 16'h01E8;
parameter   integer CPLL_REFCLK_DIV = 1;
parameter           SATA_CPLL_CFG = "VCO_3000MHZ";
parameter   [1:0]   PMA_RSV3        = 1;

parameter   TXOUT_DIV   = 2;
//parameter   TXRATE      = 3'b000;
parameter   RXOUT_DIV   = 2;
//parameter   RXRATE      = 3'b000;

parameter   TX_INT_DATAWIDTH    = 0;
parameter   TX_DATA_WIDTH       = 20;
parameter   RX_INT_DATAWIDTH    = 0;
parameter   RX_DATA_WIDTH       = 20;
*/

localparam  tx_pma_divider1 = TX_INT_DATAWIDTH == 1 ? 4 : 2;
localparam  tx_pcs_divider1 = tx_pma_divider1;
localparam  tx_pma_divider2 = TX_DATA_WIDTH == 20 | TX_DATA_WIDTH == 40 | TX_DATA_WIDTH == 80 ? 5 : 4;
localparam  tx_pcs_divider2 = tx_pma_divider2;
localparam  rx_pma_divider1 = RX_INT_DATAWIDTH == 1 ? 4 : 2;
localparam  rx_pma_divider2 = RX_DATA_WIDTH == 20 | RX_DATA_WIDTH == 40 | RX_DATA_WIDTH == 80 ? 5 : 4;

wire    clk_mux_out;
wire    cpll_clk_out;
wire    tx_phy_clk;
wire    rx_phy_clk;
wire    TXPLLREFCLK_DIV1;
wire    TXPLLREFCLK_DIV2;
wire    RXPLLREFCLK_DIV1;
wire    RXPLLREFCLK_DIV2;

    assign            GTREFCLKMONITOR = 'bx; // Was not assigned
    assign            TXOUTCLKFABRIC = 'bx; // Was not assigned
    assign            RXOUTCLKFABRIC = 'bx; // Was not assigned


assign  tx_phy_clk          = TXSYSCLKSEL[0] ? QPLLCLK : cpll_clk_out;
assign  TXPLLREFCLK_DIV1    = TXSYSCLKSEL[1] ? QPLLREFCLK : clk_mux_out;
assign  rx_phy_clk          = RXSYSCLKSEL[0] ? QPLLCLK : cpll_clk_out;
assign  RXPLLREFCLK_DIV1    = RXSYSCLKSEL[1] ? QPLLREFCLK : clk_mux_out;

assign  tx_serial_clk = tx_phy_clk;
assign  rx_serial_clk = rx_phy_clk;

// piso and sipo clocks
// are not used in the design - no need to use ddr mode during simulation. much easier just multi serial clk by 2
wire    [31:0]  tx_serial_divider;
wire    [31:0]  rx_serial_divider;
assign  tx_serial_divider = TXRATE == 3'b001 ? 1
                          : TXRATE == 3'b010 ? 2
                          : TXRATE == 3'b011 ? 4
                          : TXRATE == 3'b100 ? 8
                          : TXRATE == 3'b101 ? 16 : TXOUT_DIV ;
assign  rx_serial_divider = RXRATE == 3'b001 ? 1
                          : RXRATE == 3'b010 ? 2
                          : RXRATE == 3'b011 ? 4
                          : RXRATE == 3'b100 ? 8
                          : RXRATE == 3'b101 ? 16 : RXOUT_DIV ;
clock_divider #(
//    .divide_by  (tx_serial_divider),
    .divide_by_param (0)
)
tx_toserialclk_div(
    .clk_in     (tx_phy_clk),
    .clk_out    (tx_piso_clk),

    .div        (tx_serial_divider)
);
clock_divider #(
//    .divide_by  (rx_serial_divider),
    .divide_by_param (0)
)
rx_toserialclk_div(
    .clk_in     (rx_phy_clk),
    .clk_out    (rx_sipo_clk),

    .div        (rx_serial_divider)
);

// TXOUTCLKPCS/TXOUTCLKPMA generation
wire    tx_pma_div1_clk;
assign  TXOUTCLKPCS = TXOUTCLKPMA;

clock_divider #(
    .divide_by (tx_pma_divider1)
)
tx_pma_div1(
    .div        (1),
    .clk_in     (tx_piso_clk),
    .clk_out    (tx_pma_div1_clk)
);

clock_divider #(
    .divide_by (tx_pma_divider2)
)
tx_pma_div2(
    .div        (1),
    .clk_in     (tx_pma_div1_clk),
    .clk_out    (TXOUTCLKPMA)
);

// RXOUTCLKPCS/RXOUTCLKPMA generation
wire    rx_pma_div1_clk;
assign  RXOUTCLKPCS = RXOUTCLKPMA;
clock_divider #(
    .divide_by  (rx_pma_divider1)
)
rx_pma_div1(
    .div        (1),
    .clk_in     (rx_sipo_clk),
    .clk_out    (rx_pma_div1_clk)
);

clock_divider #(
    .divide_by  (rx_pma_divider2)
)
rx_pma_div2(
    .div        (1),
    .clk_in     (rx_pma_div1_clk),
    .clk_out    (RXOUTCLKPMA)
);

//
clock_divider #(
    .divide_by  (2)
)
txpllrefclk_div2(
    .div        (1),
    .clk_in     (TXPLLREFCLK_DIV1),
    .clk_out    (TXPLLREFCLK_DIV2)
);
clock_divider #(
    .divide_by  (2)
)
rxpllrefclk_div2(
    .div        (1),
    .clk_in     (RXPLLREFCLK_DIV1),
    .clk_out    (RXPLLREFCLK_DIV2)
);

gtxe2_chnl_outclk_mux tx_out_mux(
    .TXPLLREFCLK_DIV1  (TXPLLREFCLK_DIV1),
    .TXPLLREFCLK_DIV2  (TXPLLREFCLK_DIV2),
    .TXOUTCLKPMA       (TXOUTCLKPMA),
    .TXOUTCLKPCS       (TXOUTCLKPCS),
    .TXOUTCLKSEL       (TXOUTCLKSEL),
    .TXDLYBYPASS       (TXDLYBYPASS),
    .TXOUTCLK          (TXOUTCLK)
);

gtxe2_chnl_outclk_mux rx_out_mux(
    .TXPLLREFCLK_DIV1  (RXPLLREFCLK_DIV1),
    .TXPLLREFCLK_DIV2  (RXPLLREFCLK_DIV2),
    .TXOUTCLKPMA       (RXOUTCLKPMA),
    .TXOUTCLKPCS       (RXOUTCLKPCS),
    .TXOUTCLKSEL       (RXOUTCLKSEL),
    .TXDLYBYPASS       (RXDLYBYPASS),
    .TXOUTCLK          (RXOUTCLK)
);


gtxe2_chnl_cpll_inmux clk_mux(
    .CPLLREFCLKSEL      (CPLLREFCLKSEL),

    .GTREFCLK0          (GTREFCLK0),
    .GTREFCLK1          (GTREFCLK1),
    .GTNORTHREFCLK0     (GTNORTHREFCLK0),
    .GTNORTHREFCLK1     (GTNORTHREFCLK1),
    .GTSOUTHREFCLK0     (GTSOUTHREFCLK0),
    .GTSOUTHREFCLK1     (GTSOUTHREFCLK1),
    .GTGREFCLK          (GTGREFCLK),

    .CPLL_MUX_CLK_OUT   (clk_mux_out)
);

gtxe2_chnl_cpll #(
    .CPLL_FBDIV      (4),
    .CPLL_FBDIV_45   (5),
    .CPLL_REFCLK_DIV (1)
)
cpll(
    .CPLLLOCKDETCLK     (CPLLLOCKDETCLK),
    .CPLLLOCKEN         (CPLLLOCKEN),
    .CPLLPD             (CPLLPD),
    .CPLLRESET          (CPLLRESET),
    .CPLLFBCLKLOST      (CPLLFBCLKLOST),
    .CPLLLOCK           (CPLLLOCK),
    .CPLLREFCLKLOST     (CPLLREFCLKLOST),
    
    .GTRSVD             (GTRSVD),
    .PCSRSVDIN          (PCSRSVDIN),
    .PCSRSVDIN2         (PCSRSVDIN2),
    .PMARSVDIN          (PMARSVDIN),
    .PMARSVDIN2         (PMARSVDIN2),
    .TSTIN              (TSTIN),
    .TSTOUT             (TSTOUT),
    
    .ref_clk            (clk_mux_out),
    .clk_out            (cpll_clk_out),
    .pll_locked         ()
);

endmodule

// simplified resynchronisation fifo, could cause metastability
// because of that shall not be syntesisable
// TODO add shift registers and gray code to fix that
`ifndef RESYNC_FIFO_NOSYNT_V
`define RESYNC_FIFO_NOSYNT_V
module resync_fifo_nonsynt #(
    parameter [31:0] width = 20,
    //parameter [31:0] depth = 7
    parameter [31:0] log_depth = 3
)
(
    input   wire                        rst_rd,
    input   wire                        rst_wr,
    input   wire                        clk_wr,
    input   wire                        val_wr,
    input   wire    [width - 1:0]       data_wr,
    input   wire                        clk_rd,
    input   wire                        val_rd,
    output  wire    [width - 1:0]       data_rd,

    output  wire                        empty_rd,
    output  wire                        almost_empty_rd,
    output  wire                        full_wr
);
/*
function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1) begin
            value = value >> 1;
        end
    end
endfunction

localparam  log_depth = clogb2(depth);
*/
localparam  depth = 1 << log_depth;

reg     [width -1:0]        fifo [depth - 1:0];
// wr_clk domain
reg     [log_depth - 1:0]   cnt_wr;
// rd_clk domain
reg     [log_depth - 1:0]   cnt_rd;

assign  data_rd           = fifo[cnt_rd];
assign  empty_rd          = cnt_wr == cnt_rd;
assign  full_wr           = (cnt_wr + 1'b1) == cnt_rd;
assign  almost_empty_rd   = (cnt_rd + 1'b1) == cnt_wr;

always @ (posedge clk_wr)
    fifo[cnt_wr] <= val_wr ? data_wr : fifo[cnt_wr];

always @ (posedge clk_wr)
    cnt_wr      <= rst_wr ? 0 : val_wr ? cnt_wr + 1'b1 : cnt_wr;

always @ (posedge clk_rd)
    cnt_rd      <= rst_rd ? 0 : val_rd ? cnt_rd + 1'b1 : cnt_rd;

endmodule
`endif

module gtxe2_chnl_tx_ser #(
    parameter [31:0] width = 20
)
(
    input   wire                    reset,
    input   wire                    trim,
    input   wire                    inclk,
    input   wire                    outclk,
    input   wire    [width - 1:0]   indata,
    input   wire                    idle_in,
    output  wire                    outdata,
    output  wire                    idle_out
);

localparam trimmed_width = width * 4 / 5;

reg     [31:0]          bitcounter;
wire    [width - 1:0]   data_resynced;
wire                    almost_empty_rd;
wire                    empty_rd;
wire                    full_wr;
wire                    val_rd;
wire                    bitcounter_limit;

assign  bitcounter_limit = trim ? bitcounter == (trimmed_width - 1) : bitcounter == (width - 1);

always @ (posedge outclk)
    bitcounter  <= reset | bitcounter_limit ? 32'h0 : bitcounter + 1'b1;
 
assign  outdata = data_resynced[bitcounter];
assign  val_rd  = ~almost_empty_rd & ~empty_rd & bitcounter_limit;

resync_fifo_nonsynt #(
    .width      (width + 1), // +1 is for a flag of an idle line (both TXP and TXN = 0)
    .log_depth  (3)
)
fifo(
    .rst_rd     (reset),
    .rst_wr     (reset),
    .clk_wr     (inclk),
    .val_wr     (1'b1),
    .data_wr    ({idle_in, indata}),
    .clk_rd     (outclk),
    .val_rd     (val_rd),
    .data_rd    ({idle_out, data_resynced}),

    .empty_rd   (empty_rd),
    .full_wr    (full_wr),

    .almost_empty_rd   (almost_empty_rd)
);


endmodule

// for some reason overall trasmitted disparity is tracked at the top level
module gtxe2_chnl_tx_8x10enc #(
    parameter iwidth = 16,
    parameter iskwidth = 2,
    parameter owidth = 20
)
(
    input   wire    [iskwidth - 1:0]    TX8B10BBYPASS,
    input   wire                        TX8B10BEN,
    input   wire    [iskwidth - 1:0]    TXCHARDISPMODE,
    input   wire    [iskwidth - 1:0]    TXCHARDISPVAL,
    input   wire    [iskwidth - 1:0]    TXCHARISK,
    input   wire                        disparity,
    input   wire    [iwidth - 1:0]      data_in,
    output  wire    [owidth - 1:0]      data_out,
    output  wire                        next_disparity
);

wire    [owidth - 1:0]  enc_data_out;
wire    [owidth - 1:0]  bp_data_out;

assign  data_out = TX8B10BEN ? enc_data_out : bp_data_out;


// only full 8/10 encoding and width=20 case is implemented

localparam  word_count = owidth / 10;

wire    [word_count - 1:0]  word_disparity;
wire    [word_count - 1:0]  interm_disparity;
wire    [5:0]               six     [word_count - 1:0];
wire    [3:0]               four    [word_count - 1:0];
wire    [9:0]               oword   [word_count - 1:0];
wire    [iwidth - 1:0]      iword   [word_count - 1:0];
wire    [word_count - 1:0]  is_control;

// typical approach: 8x10 = 5x6 + 3x4
// word disparity[i] = calculated disparity for the i-th 8-bit word
// interm_disparity[i] - disparity after 5x6 encoding for the i-th word 
genvar ii;
generate
for (ii = 0; ii < 2; ii = ii + 1)
begin: encode_by_word
    assign  is_control[ii]      = TXCHARISK[ii];
    assign  iword[ii]           = data_in[ii*8 + 7:ii*8];
    assign  interm_disparity[ii]= ^six[ii] ? word_disparity[ii] : ~word_disparity[ii];
    assign  word_disparity[ii]  = (ii == 0)  ? disparity :
                                               (^oword[ii - 1] ? word_disparity[ii - 1] : ~word_disparity[ii - 1]); // if there're 5 '1's - do no change the disparity, 6 or 4 - change
    assign  six[ii] = iword[ii][4:0] == 5'b00000 ? (~word_disparity[ii] ? 6'b100111 : 6'b011000)
                    : iword[ii][4:0] == 5'b00001 ? (~word_disparity[ii] ? 6'b011101 : 6'b100010)
                    : iword[ii][4:0] == 5'b00010 ? (~word_disparity[ii] ? 6'b101101 : 6'b010010)
                    : iword[ii][4:0] == 5'b00011 ? (~word_disparity[ii] ? 6'b110001 : 6'b110001)
                    : iword[ii][4:0] == 5'b00100 ? (~word_disparity[ii] ? 6'b110101 : 6'b001010)
                    : iword[ii][4:0] == 5'b00101 ? (~word_disparity[ii] ? 6'b101001 : 6'b101001)
                    : iword[ii][4:0] == 5'b00110 ? (~word_disparity[ii] ? 6'b011001 : 6'b011001)
                    : iword[ii][4:0] == 5'b00111 ? (~word_disparity[ii] ? 6'b111000 : 6'b000111)
                    : iword[ii][4:0] == 5'b01000 ? (~word_disparity[ii] ? 6'b111001 : 6'b000110)
                    : iword[ii][4:0] == 5'b01001 ? (~word_disparity[ii] ? 6'b100101 : 6'b100101)
                    : iword[ii][4:0] == 5'b01010 ? (~word_disparity[ii] ? 6'b010101 : 6'b010101)
                    : iword[ii][4:0] == 5'b01011 ? (~word_disparity[ii] ? 6'b110100 : 6'b110100)
                    : iword[ii][4:0] == 5'b01100 ? (~word_disparity[ii] ? 6'b001101 : 6'b001101)
                    : iword[ii][4:0] == 5'b01101 ? (~word_disparity[ii] ? 6'b101100 : 6'b101100)
                    : iword[ii][4:0] == 5'b01110 ? (~word_disparity[ii] ? 6'b011100 : 6'b011100)
                    : iword[ii][4:0] == 5'b01111 ? (~word_disparity[ii] ? 6'b010111 : 6'b101000)
                    : iword[ii][4:0] == 5'b10000 ? (~word_disparity[ii] ? 6'b011011 : 6'b100100)
                    : iword[ii][4:0] == 5'b10001 ? (~word_disparity[ii] ? 6'b100011 : 6'b100011)
                    : iword[ii][4:0] == 5'b10010 ? (~word_disparity[ii] ? 6'b010011 : 6'b010011)
                    : iword[ii][4:0] == 5'b10011 ? (~word_disparity[ii] ? 6'b110010 : 6'b110010)
                    : iword[ii][4:0] == 5'b10100 ? (~word_disparity[ii] ? 6'b001011 : 6'b001011)
                    : iword[ii][4:0] == 5'b10101 ? (~word_disparity[ii] ? 6'b101010 : 6'b101010)
                    : iword[ii][4:0] == 5'b10110 ? (~word_disparity[ii] ? 6'b011010 : 6'b011010)
                    : iword[ii][4:0] == 5'b10111 ? (~word_disparity[ii] ? 6'b111010 : 6'b000101)
                    : iword[ii][4:0] == 5'b11000 ? (~word_disparity[ii] ? 6'b110011 : 6'b001100)
                    : iword[ii][4:0] == 5'b11001 ? (~word_disparity[ii] ? 6'b100110 : 6'b100110)
                    : iword[ii][4:0] == 5'b11010 ? (~word_disparity[ii] ? 6'b010110 : 6'b010110)
                    : iword[ii][4:0] == 5'b11011 ? (~word_disparity[ii] ? 6'b110110 : 6'b001001)
                    : iword[ii][4:0] == 5'b11100 ? (~word_disparity[ii] ? 6'b001110 : 6'b001110)
                    : iword[ii][4:0] == 5'b11101 ? (~word_disparity[ii] ? 6'b101110 : 6'b010001)
                    : iword[ii][4:0] == 5'b11110 ? (~word_disparity[ii] ? 6'b011110 : 6'b100001)
                    :/*iword[ii][4:0] == 5'b11111*/(~word_disparity[ii] ? 6'b101011 : 6'b010100);
    assign  four[ii] = iword[ii][7:5] == 3'd0 ? (~interm_disparity[ii] ? 4'b1011 : 4'b0100)
                     : iword[ii][7:5] == 3'd1 ? (~interm_disparity[ii] ? 4'b1001 : 4'b1001)
                     : iword[ii][7:5] == 3'd2 ? (~interm_disparity[ii] ? 4'b0101 : 4'b0101)
                     : iword[ii][7:5] == 3'd3 ? (~interm_disparity[ii] ? 4'b1100 : 4'b0011)
                     : iword[ii][7:5] == 3'd4 ? (~interm_disparity[ii] ? 4'b1101 : 4'b0010)
                     : iword[ii][7:5] == 3'd5 ? (~interm_disparity[ii] ? 4'b1010 : 4'b1010)
                     : iword[ii][7:5] == 3'd6 ? (~interm_disparity[ii] ? 4'b0110 : 4'b0110)
                     :/*iword[ii][7:5] == 3'd7*/(~interm_disparity[ii] ? (six[ii][1:0] == 2'b11 ? 4'b0111 : 4'b1110) 
                                                                       : (six[ii][1:0] == 2'b00 ? 4'b1000 : 4'b0001));
    assign  oword[ii] = ~is_control[ii] ? {six[ii], four[ii]} 
                                        : iword[ii][7:0] == 8'b00011100 ? (~word_disparity[ii] ? 10'b0011110100 : 10'b1100001011)
                                        : iword[ii][7:0] == 8'b00111100 ? (~word_disparity[ii] ? 10'b0011111001 : 10'b1100000110)
                                        : iword[ii][7:0] == 8'b01011100 ? (~word_disparity[ii] ? 10'b0011110101 : 10'b1100001010)
                                        : iword[ii][7:0] == 8'b01111100 ? (~word_disparity[ii] ? 10'b0011110011 : 10'b1100001100)
                                        : iword[ii][7:0] == 8'b10011100 ? (~word_disparity[ii] ? 10'b0011110010 : 10'b1100001101)
                                        : iword[ii][7:0] == 8'b10111100 ? (~word_disparity[ii] ? 10'b0011111010 : 10'b1100000101)
                                        : iword[ii][7:0] == 8'b11011100 ? (~word_disparity[ii] ? 10'b0011110110 : 10'b1100001001)
                                        : iword[ii][7:0] == 8'b11111100 ? (~word_disparity[ii] ? 10'b0011111000 : 10'b1100000111)
                                        : iword[ii][7:0] == 8'b11110111 ? (~word_disparity[ii] ? 10'b1110101000 : 10'b0001010111)
                                        : iword[ii][7:0] == 8'b11111011 ? (~word_disparity[ii] ? 10'b1101101000 : 10'b0010010111)
                                        : iword[ii][7:0] == 8'b11111101 ? (~word_disparity[ii] ? 10'b1011101000 : 10'b0100010111)
                                        :/*iword[ii][7:0] == 8'b11111110*/(~word_disparity[ii] ? 10'b0111101000 : 10'b1000010111);

    assign  enc_data_out[ii*10 + 9:ii * 10] = oword[ii];

    // case of a disabled encoder
    assign  bp_data_out[ii*10 + 9:ii*10] = {TXCHARDISPMODE[ii], TXCHARDISPVAL[ii], data_in[ii*8 + 7:ii*8]};
end
endgenerate
assign  next_disparity = ^oword[word_count - 1] ? word_disparity[word_count - 1] : ~word_disparity[word_count - 1];

endmodule

module gtxe2_chnl_tx_oob #(
    parameter width = 20
)
(
// top-level ifaces
    input   wire                    TXCOMINIT,
    input   wire                    TXCOMWAKE,
    output  wire                    TXCOMFINISH,

// internal ifaces
    input   wire                    clk,
    input   wire                    reset,
    input   wire                    disparity,
    output  wire    [width - 1:0]   outdata,
    output  wire                    outval
);
parameter   [3:0]   SATA_BURST_SEQ_LEN = 4'b0101;
parameter           SATA_CPLL_CFG = "VCO_3000MHZ";

localparam  burst_len_mult  = SATA_CPLL_CFG == "VCO_3000MHZ" ? 2 // assuming each usrclk cycle == 20 sata serial clk cycles
                            : SATA_CPLL_CFG == "VCO_1500MHZ" ? 4 
                            : /*                VCO_6000MHZ */ 1;
localparam  burst_len       = /*burst_len_mult * 8*/ 32; // = 106.7ns; each burst contains 16 SATA Gen1 words
localparam  quiet_len_init  = burst_len * 3; // = 320ns
localparam  quiet_len_wake  = burst_len; // = 106.7ns
localparam  init_bursts_cnt = SATA_BURST_SEQ_LEN;//3;
localparam  wake_bursts_cnt = SATA_BURST_SEQ_LEN;//5;

reg     [31:0]  bursts_cnt;
reg     [31:0]  stopwatch;
wire            stopwatch_clr;
wire            bursts_cnt_inc;
wire            bursts_cnt_clr;
wire    [31:0]  quiet_len;

// FSM Declarations
reg     state_burst;
reg     state_quiet;
wire    state_idle;

wire    set_burst;
wire    set_quiet;
wire    clr_burst;
wire    clr_quiet;

// remember what command was issued
reg             issued_init;
reg             issued_wake;

always @ (posedge clk)
begin
    issued_init <= reset | TXCOMFINISH | issued_wake ? 1'b0 : TXCOMINIT ? 1'b1 : state_idle ? 1'b0 : issued_init;
    issued_wake <= reset | TXCOMFINISH | issued_init ? 1'b0 : TXCOMWAKE ? 1'b1 : state_idle ? 1'b0 : issued_wake;
end

wire    [31:0]  bursts_cnt_togo;
assign  bursts_cnt_togo = issued_wake ? wake_bursts_cnt : init_bursts_cnt ;

// FSM

assign  state_idle = ~state_burst & ~state_quiet;
always @ (posedge clk)
begin
    state_burst <= (state_burst | set_burst) & ~reset & ~clr_burst;
    state_quiet <= (state_quiet | set_quiet) & ~reset & ~clr_quiet;
end

assign  set_burst = state_idle & (TXCOMINIT | TXCOMWAKE) | state_quiet & clr_quiet & ~TXCOMFINISH;
assign  set_quiet = state_burst & (bursts_cnt < bursts_cnt_togo - 1) & clr_burst;

assign  clr_burst = state_burst & stopwatch == (burst_len - burst_len_mult);
assign  clr_quiet = state_quiet & stopwatch == (quiet_len - burst_len_mult);

// bursts timing
assign  quiet_len = issued_wake ? quiet_len_wake : quiet_len_init;
assign  stopwatch_clr = set_burst | set_quiet | state_idle;
always @ (posedge clk)
    stopwatch   <= reset | stopwatch_clr ? 0 : stopwatch + burst_len_mult;

// total bursts count
assign  bursts_cnt_clr = state_idle;
assign  bursts_cnt_inc = state_burst & clr_burst;
always @ (posedge clk)
    bursts_cnt  <= reset | bursts_cnt_clr ? 0 : bursts_cnt_inc ? bursts_cnt + 1 : bursts_cnt;

// data to serializer
// only datawidth = 20 is supported for now
wire    [width - 1:0]   outdata_pos;
wire    [width - 1:0]   outdata_neg;
// outdata = {Align2 + Align1}, disparity always flips
assign  outdata_pos = stopwatch[0] == 1'b0 ? {10'b0101010101, 10'b1100000101}
                                           : {10'b1101100011, 10'b0101010101};
assign  outdata_neg = stopwatch[0] == 1'b0 ? {10'b0101010101, 10'b0011111010}
                                           : {10'b0010011100, 10'b0101010101};
assign  outdata     = disparity ? outdata_pos : outdata_neg;
assign  outval      = state_burst;

assign  TXCOMFINISH = bursts_cnt_clr & bursts_cnt == bursts_cnt_togo;

endmodule

/*
 * According to the doc, p110
 * If TX_INT_DATAWIDTH, the inner width = 32 bits, otherwise 16.
 */

module gtxe2_chnl_tx_dataiface #(
    parameter   internal_data_width = 16,
    parameter   interface_data_width = 32,
    parameter   internal_isk_width = 2,
    parameter   interface_isk_width = 4
)
(
    input   wire    usrclk,
    input   wire    usrclk2,
    input   wire    reset,
    output  wire    [internal_data_width - 1:0]     outdata,
    output  wire    [internal_isk_width - 1:0]      outisk,
    input   wire    [interface_data_width - 1:0]    indata,
    input   wire    [interface_isk_width - 1:0]     inisk
);

localparam div = interface_data_width / internal_data_width;

wire    [interface_data_width + interface_isk_width - 1:0] data_resynced;

reg     [31:0]          wordcounter;
wire                    almost_empty_rd;
wire                    empty_rd;
wire                    full_wr;
wire                    val_rd;

always @ (posedge usrclk)
    wordcounter <= reset | wordcounter == (div - 1) ? 32'h0 : wordcounter + 1'b1;
 

assign  outdata = data_resynced[(wordcounter + 1) * internal_data_width - 1 -: internal_data_width];
assign  outisk  = data_resynced[(wordcounter + 1) * internal_isk_width + internal_data_width * div - 1 -: internal_isk_width];
assign  val_rd  = ~almost_empty_rd & ~empty_rd & wordcounter == (div - 1);

resync_fifo_nonsynt #(
    .width      (interface_data_width + interface_isk_width),
    .log_depth  (3)
)
fifo(
    .rst_rd     (reset),
    .rst_wr     (reset),
    .clk_wr     (usrclk2),
    .val_wr     (1'b1),
    .data_wr    ({inisk, indata}),
    .clk_rd     (usrclk),
    .val_rd     (val_rd),
    .data_rd    ({data_resynced}),

    .empty_rd   (empty_rd),
    .full_wr    (full_wr),

    .almost_empty_rd   (almost_empty_rd)
);

endmodule

module gtxe2_chnl_tx(
    input   wire            reset,
    output  wire            TXP,
    output  wire            TXN,

    input   wire    [63:0]  TXDATA,
    input   wire            TXUSRCLK,
    input   wire            TXUSRCLK2,

// 8/10 encoder
    input   wire    [7:0]   TX8B10BBYPASS,
    input   wire            TX8B10BEN,
    input   wire    [7:0]   TXCHARDISPMODE,
    input   wire    [7:0]   TXCHARDISPVAL,
    input   wire    [7:0]   TXCHARISK,

// TX Buffer
    output  wire    [1:0]   TXBUFSTATUS,

// TX Polarity
    input   wire            TXPOLARITY,

// TX Fabric Clock Control
    input   wire    [2:0]   TXRATE,
    output  wire            TXRATEDONE,

// TX OOB
    input   wire            TXCOMINIT,
    input   wire            TXCOMWAKE,
    output  wire            TXCOMFINISH,

// TX Driver Control
    input   wire            TXELECIDLE,

// internal
    input   wire            serial_clk
);
parameter   TX_DATA_WIDTH       = 20;
parameter   TX_INT_DATAWIDTH    = 0;

parameter   [3:0]   SATA_BURST_SEQ_LEN = 4'b1111;
parameter           SATA_CPLL_CFG = "VCO_3000MHZ";

function integer calc_idw;
    input   TX8B10BEN;
//    input   TX_INT_DATAWIDTH;
//    input   TX_DATA_WIDTH;
    begin
//    if (TX8B10BEN == 1)
        calc_idw = TX_INT_DATAWIDTH == 1 ? 40 : 20;
/*    else
    begin
        if (TX_INT_DATAWIDTH == 1)
            calc_idw    = TX_DATA_WIDTH == 32 ? 32
                        : TX_DATA_WIDTH == 40 ? 40
                        : TX_DATA_WIDTH == 64 ? 32 : 40;
        else
            calc_idw    = TX_DATA_WIDTH == 16 ? 16  
                        : TX_DATA_WIDTH == 20 ? 20 
                        : TX_DATA_WIDTH == 32 ? 16 : 20;
    end*/
    end
endfunction

function integer calc_ifdw;
    input   TX8B10BEN;
    begin
//    if (TX8B10BEN == 1)
       calc_ifdw = TX_DATA_WIDTH == 16 ? 20 :
                   TX_DATA_WIDTH == 32 ? 40 :
                   TX_DATA_WIDTH == 64 ? 80 : TX_DATA_WIDTH;
/*    else
    begin
        if (TX_INT_DATAWIDTH == 1)
            calc_ifdw    = TX_DATA_WIDTH == 32 ? 32
                         : TX_DATA_WIDTH == 40 ? 40
                         : TX_DATA_WIDTH == 64 ? 64 : 80;
        else
            calc_ifdw    = TX_DATA_WIDTH == 16 ? 16  
                         : TX_DATA_WIDTH == 20 ? 20 
                         : TX_DATA_WIDTH == 32 ? 16 : 20;
    end*/
    end
endfunction

// can be 20 or 40, if it shall be 16 or 32, extra bits wont be used
localparam  internal_data_width     = calc_idw(1);//PTX8B10BEN);//, TX_INT_DATAWIDTH, TX_DATA_WIDTH);
localparam  interface_data_width    = calc_ifdw(1);
localparam  internal_isk_width      = internal_data_width / 10;
localparam  interface_isk_width     = interface_data_width / 10;
// used in case of TX8B10BEN = 0
localparam  data_width_odd          = TX_DATA_WIDTH == 16 | TX_DATA_WIDTH == 32 | TX_DATA_WIDTH == 64;
// TX PMA

// serializer
wire    serial_data;
wire    line_idle;
wire    line_idle_pcs; // line_idle in pcs clock domain
wire    [internal_data_width - 1:0] ser_input;
wire    oob_active;
reg     oob_in_process;
always @ (posedge TXUSRCLK)
    oob_in_process <= reset | TXCOMFINISH ? 1'b0 : TXCOMINIT | TXCOMWAKE ? 1'b1 : oob_in_process;

assign  TXP = ~line_idle ? serial_data : 1'bz;
assign  TXN = ~line_idle ? ~serial_data : 1'bz;


assign  line_idle_pcs = (TXELECIDLE | oob_in_process) & ~oob_active | reset;

// Serializer
wire    [internal_data_width - 1:0] parallel_data;
wire    [internal_data_width - 1:0] inv_parallel_data;

gtxe2_chnl_tx_ser #(
    .width      (internal_data_width)
)
ser(
    .reset      (reset),
    .trim       (data_width_odd & ~TX8B10BEN),
    .inclk      (TXUSRCLK),
    .outclk     (serial_clk),
    .indata     (inv_parallel_data),
    .idle_in    (line_idle_pcs),
    .outdata    (serial_data),
    .idle_out   (line_idle)
);

// TX PCS

// fit data width
localparam  iface_databus_width = interface_data_width * 8 / 10;
localparam  intern_databus_width = internal_data_width * 8 / 10;

wire [intern_databus_width - 1:0]   internal_data;
wire [internal_isk_width  - 1:0]    internal_isk;
wire [internal_isk_width  - 1:0]    internal_dispval;
wire [internal_isk_width  - 1:0]    internal_dispmode;
wire [internal_data_width - 1:0]    dataiface_data_out;
wire [interface_data_width - 1:0]   dataiface_data_in;

//assign  dataiface_data_in  = {TXCHARDISPMODE[interface_isk_width - 1:0], TXCHARDISPVAL[interface_isk_width - 1:0], TXDATA[iface_databus_width - 1:0]};
genvar ii;
localparam outdiv = interface_data_width / internal_data_width;
generate
for (ii = 1; ii < (outdiv + 1); ii = ii + 1)
begin: asdadfdsf
    assign  dataiface_data_in[ii*internal_data_width - 1-:internal_data_width]  = {TXCHARDISPMODE[ii*interface_isk_width - 1-:interface_isk_width],
                                                                                   TXCHARDISPVAL[ii*interface_isk_width - 1-:interface_isk_width],
                                                                                   TXDATA[ii*intern_databus_width - 1-:intern_databus_width]
                                                                                  };
end
endgenerate

assign  internal_dispmode  = dataiface_data_out[intern_databus_width + internal_isk_width + internal_isk_width - 1-:internal_isk_width];
assign  internal_dispval   = dataiface_data_out[intern_databus_width + internal_isk_width - 1-:internal_isk_width];
assign  internal_data      = dataiface_data_out[intern_databus_width - 1:0];

gtxe2_chnl_tx_dataiface #(
    .internal_data_width    (internal_data_width),
    .interface_data_width   (interface_data_width),
    .internal_isk_width     (internal_isk_width),
    .interface_isk_width    (interface_isk_width)
)
dataiface
(
    .usrclk     (TXUSRCLK),
    .usrclk2    (TXUSRCLK2),
    .reset      (reset),
    .outdata    (dataiface_data_out),
    .outisk     (internal_isk),
    .indata     (dataiface_data_in),
    .inisk      (TXCHARISK[interface_isk_width - 1:0])
);


wire    [internal_data_width - 1:0] polarized_data;

// invert data (get words as [abdceifghj] after 8/10, each word shall be transmitter in a reverse bit order)
genvar jj;
generate
    for (ii = 0; ii < internal_data_width; ii = ii + 10)
    begin: select_each_word
        for (jj = 0; jj < 10; jj = jj + 1)
        begin: reverse_bits
            assign inv_parallel_data[ii + jj] = TX8B10BEN ? polarized_data[ii + 9 - jj] : polarized_data[ii + jj];
        end
    end
endgenerate

// Polarity:

assign  ser_input = polarized_data;
generate
for (ii = 0; ii < internal_data_width; ii = ii + 1)
begin: invert_dataword
    assign polarized_data[ii] = TXPOLARITY == 1'b1 ? ~parallel_data[ii] : parallel_data[ii];
end
endgenerate


// SATA OOB
reg                                 disparity;
wire    [internal_data_width - 1:0] oob_data;
wire                                oob_val;

assign  oob_active = oob_val;
gtxe2_chnl_tx_oob #(
    .width              (internal_data_width),
    .SATA_BURST_SEQ_LEN (SATA_BURST_SEQ_LEN),
    .SATA_CPLL_CFG      (SATA_CPLL_CFG)
)
tx_oob(
    .TXCOMINIT      (TXCOMINIT),
    .TXCOMWAKE      (TXCOMWAKE),
    .TXCOMFINISH    (TXCOMFINISH),

    .clk            (TXUSRCLK),
    .reset          (reset),
    .disparity      (disparity),
    .outdata        (oob_data),
    .outval         (oob_val)
);

// Disparity control
wire    next_disparity;
always @ (posedge TXUSRCLK)
    disparity <= reset | line_idle_pcs? 1'b0 : oob_val ? ~disparity : next_disparity;

// 8/10 endoding
wire    [internal_data_width - 1:0] encoded_data;
gtxe2_chnl_tx_8x10enc #(
    .iwidth     (intern_databus_width),//TX_DATA_WIDTH),
    .iskwidth   (internal_isk_width),
    .owidth     (internal_data_width)
//    .oddwidth   (data_width_odd)
)
encoder_8x10(
    .TX8B10BBYPASS      (TX8B10BBYPASS[internal_isk_width - 1:0]),
    .TX8B10BEN          (TX8B10BEN),
    .TXCHARDISPMODE     (internal_dispmode),
    .TXCHARDISPVAL      (internal_dispval),
    .TXCHARISK          (internal_isk),
    .disparity          (disparity),
    .data_in            (internal_data),
    .data_out           (encoded_data),
    .next_disparity     (next_disparity)
);

// OOB-OrdinaryData Arbiter
assign  parallel_data = oob_val ? oob_data : encoded_data;


endmodule

 /**
  * For now contains only deserializer, oob, 10x8 decoder, aligner and polarity invertor blocks
  **/
// TODO resync all output signals
// simplified resynchronisation fifo, could cause metastability
// because of that shall not be syntesisable
// TODO add shift registers and gray code to fix that
`ifndef RESYNC_FIFO_NOSYNT_V
`define RESYNC_FIFO_NOSYNT_V
module resync_fifo_nonsynt #(
    parameter [31:0] width = 20,
    //parameter [31:0] depth = 7
    parameter [31:0] log_depth = 3
)
(
    input   wire                        rst_rd,
    input   wire                        rst_wr,
    input   wire                        clk_wr,
    input   wire                        val_wr,
    input   wire    [width - 1:0]       data_wr,
    input   wire                        clk_rd,
    input   wire                        val_rd,
    output  wire    [width - 1:0]       data_rd,

    output  wire                        empty_rd,
    output  wire                        almost_empty_rd,
    output  wire                        full_wr
);
/*
function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1) begin
            value = value >> 1;
        end
    end
endfunction

localparam  log_depth = clogb2(depth);
*/
localparam  depth = 1 << log_depth;

reg     [width -1:0]        fifo [depth - 1:0];
// wr_clk domain
reg     [log_depth - 1:0]   cnt_wr;
// rd_clk domain
reg     [log_depth - 1:0]   cnt_rd;

assign  data_rd           = fifo[cnt_rd];
assign  empty_rd          = cnt_wr == cnt_rd;
assign  full_wr           = (cnt_wr + 1'b1) == cnt_rd;
assign  almost_empty_rd   = (cnt_rd + 1'b1) == cnt_wr;

always @ (posedge clk_wr)
    fifo[cnt_wr] <= val_wr ? data_wr : fifo[cnt_wr];

always @ (posedge clk_wr)
    cnt_wr      <= rst_wr ? 0 : val_wr ? cnt_wr + 1'b1 : cnt_wr;

always @ (posedge clk_rd)
    cnt_rd      <= rst_rd ? 0 : val_rd ? cnt_rd + 1'b1 : cnt_rd;

endmodule
`endif

module gtxe2_chnl_rx_des #(
    parameter [31:0] width = 20
)
(
    input   wire                    reset,
    input   wire                    trim,
    input   wire                    inclk,
    input   wire                    outclk,
    input   wire                    indata,
    output  wire    [width - 1:0]   outdata
);

localparam trimmed_width = width * 4 / 5;

reg     [31:0]          bitcounter;
reg     [width - 1:0]   inbuffer;
wire                    empty_rd;
wire                    full_wr;
wire                    val_wr;
wire                    val_rd;
wire                    bitcounter_limit;
wire                    almost_empty_rd;
reg                     need_reset = 1;
assign  bitcounter_limit = trim ? bitcounter == (trimmed_width - 1) : bitcounter == (width - 1);

always @ (posedge inclk)
    bitcounter  <= reset | bitcounter_limit ? 32'h0 : bitcounter + 1'b1;

genvar ii;
generate
for (ii = 0; ii < width; ii = ii + 1)
begin: splicing
    always @ (posedge inclk)
        if ((ii >= trimmed_width) & trim)
            inbuffer[ii] <= 1'bx;
        else
            inbuffer[ii] <= reset ? 1'b0 : (bitcounter == ii) ? indata : inbuffer[ii];
end
endgenerate

assign  val_rd  = ~empty_rd & ~almost_empty_rd;
assign  val_wr  = ~full_wr & bitcounter == (width - 1);

always @ (posedge inclk) begin
    if (reset) need_reset <= 0;
    else if (full_wr && !need_reset) begin
        $display("1:FIFO in %m is full, that is not an appropriate behaviour - needs reset @%time", $time);
        bitcounter <= 'bx;
        need_reset <= 1'b1;
//        $finish;
    end
end
resync_fifo_nonsynt #(
    .width      (width),
    .log_depth  (3)
)
fifo(
    .rst_rd     (reset),
    .rst_wr     (reset),
    .clk_wr     (inclk),
    .val_wr     (val_wr),
    .data_wr    ({indata, inbuffer[width - 2:0]}),
    .clk_rd     (outclk),
    .val_rd     (val_rd),
    .data_rd    (outdata),

    .empty_rd   (empty_rd),
    .full_wr    (full_wr),

    .almost_empty_rd (almost_empty_rd)
);


endmodule

// doesnt support global parameters for now. instead uses localparams
// in case global parameters are needed, have to translate them in terms of localparams
module gtxe2_chnl_rx_oob #(
    parameter width = 20,

// parameters are not used for now
    parameter   [2:0]   SATA_BURST_VAL  = 3'b100,
    parameter   [2:0]   SATA_EIDLE_VAL  = 3'b100,
    parameter           SATA_MIN_INIT   = 12,
    parameter           SATA_MIN_WAKE   = 4,
    parameter           SATA_MAX_BURST  = 8,
    parameter           SATA_MIN_BURST  = 4,
    parameter           SATA_MAX_INIT   = 21,
    parameter           SATA_MAX_WAKE   = 7
)
(
    input   wire            reset,
    input   wire            clk,
    input   wire            usrclk2,
    input   wire            RXN,
    input   wire            RXP,

    input   wire    [1:0]   RXELECIDLEMODE,
    output  wire            RXELECIDLE,

    output  wire            RXCOMINITDET,
    output  wire            RXCOMWAKEDET
);


localparam burst_min_len = 150;
localparam burst_max_len = 340;
localparam wake_idle_min_len = 150;
localparam wake_idle_max_len = 340;
localparam init_idle_min_len = 450;
localparam init_idle_max_len = 990;
localparam wake_bursts_cnt = SATA_BURST_VAL;
localparam init_bursts_cnt = SATA_BURST_VAL;

wire    idle;
assign  idle = (RXN == RXP) | (RXP === 1'bx) | (RXP === 1'bz);

wire    state_notrans;
wire    state_error; //nostrans substate
wire    state_done; //notrans substate
reg     state_idle;
reg     state_burst;

wire    set_notrans;
wire    set_done;
wire    set_error;
wire    set_idle;
wire    set_burst;
wire    clr_idle;
wire    clr_burst;

assign  state_notrans = ~state_idle & ~state_burst;
always @ (posedge clk)
begin
    state_idle  <= (state_idle | set_idle) & ~reset & ~clr_idle;
    state_burst <= (state_burst | set_burst) & ~reset & ~clr_burst;
end

assign  set_notrans = set_done | set_error;
assign  set_idle    = state_burst & clr_burst & idle;
assign  set_burst   = state_notrans & ~idle | state_idle & clr_idle & ~idle;
assign  clr_idle    = ~idle | set_notrans;
assign  clr_burst   = idle | set_notrans;

reg     [31:0]  burst_len;
reg     [31:0]  idle_len;
reg     [31:0]  bursts_cnt;
always @ (posedge clk)
begin
    burst_len   <= reset | ~state_burst ? 0 : burst_len + 1;
    idle_len    <= reset | ~state_idle ? 0 : idle_len + 1;
    bursts_cnt  <= reset | state_notrans ? 0 : state_burst & clr_burst ? bursts_cnt + 1 : bursts_cnt;
end

wire    burst_len_violation;
wire    idle_len_violation;
wire    wake_idle_violation;
wire    init_idle_violation;
//reg     burst_len_ok;
reg     wake_idle_ok;
reg     init_idle_ok;
reg     burst_len_curr_ok;
reg     init_idle_curr_ok;
reg     wake_idle_curr_ok;
wire    done_wake;
wire    done_init;

always @ (posedge clk)
begin
    wake_idle_ok <= reset | state_notrans ? 1'b1 : wake_idle_violation ? 1'b0 : wake_idle_ok;
    init_idle_ok <= reset | state_notrans ? 1'b1 : init_idle_violation ? 1'b0 : init_idle_ok;
//    burst_len_ok <= reset | state_notrans ? 1'b1 : burst_len_violation ? 1'b0 : burst_len_ok;
    
    wake_idle_curr_ok <= reset | ~state_idle ? 1'b0 : idle_len == wake_idle_min_len ? 1'b1 : wake_idle_curr_ok;
    init_idle_curr_ok <= reset | ~state_idle ? 1'b0 : idle_len == init_idle_min_len ? 1'b1 : init_idle_curr_ok;
    burst_len_curr_ok <= reset | ~state_burst? 1'b0 : burst_len == burst_min_len ? 1'b1 : burst_len_curr_ok;
end

assign  burst_len_violation = state_burst & set_idle & ~burst_len_curr_ok | state_burst & burst_len == burst_max_len;
assign  wake_idle_violation = state_idle & set_burst & ~wake_idle_curr_ok | state_idle & idle_len == wake_idle_max_len;
assign  init_idle_violation = state_idle & set_burst & ~init_idle_curr_ok | state_idle & idle_len == init_idle_max_len;
assign  idle_len_violation = (~wake_idle_ok | wake_idle_violation) & init_idle_violation | wake_idle_violation & (~init_idle_ok | init_idle_violation);

assign  done_wake   = state_burst & ~idle & bursts_cnt == (wake_bursts_cnt - 1) & wake_idle_ok;
assign  done_init   = state_burst & ~idle & bursts_cnt == (init_bursts_cnt - 1)& init_idle_ok;
assign  set_error   = idle_len_violation | burst_len_violation;
assign  set_done    = ~set_error & (done_wake | done_init);

// just to rxcominit(wake)det be synchronous to usrclk2
reg rxcominitdet_clk = 1'b0;
reg rxcominitdet_usrclk2 = 1'b0;
reg rxcomwakedet_clk = 1'b0;
reg rxcomwakedet_usrclk2 = 1'b0;
always @ (posedge clk)
begin
    rxcominitdet_clk <= reset ? 1'b0 : done_init | rxcominitdet_clk & ~rxcominitdet_usrclk2;
    rxcomwakedet_clk <= reset ? 1'b0 : done_wake | rxcomwakedet_clk & ~rxcomwakedet_usrclk2;
end
always @ (posedge usrclk2)
begin
    rxcominitdet_usrclk2 <= reset ? 1'b0 : rxcominitdet_clk & ~rxcominitdet_usrclk2;
    rxcomwakedet_usrclk2 <= reset ? 1'b0 : rxcomwakedet_clk & ~rxcomwakedet_usrclk2;
end
assign  RXCOMINITDET = rxcominitdet_usrclk2;
assign  RXCOMWAKEDET = rxcomwakedet_usrclk2;
assign  RXELECIDLE = RXP === 1'bz ? 1'b1 : RXP === 1'bx ? 1'b1 : RXP == RXN;

endmodule

// always enabled, wasnt tested with width parameters, disctinct from 20
module gtxe2_chnl_rx_10x8dec #(
    parameter iwidth = 20,
    parameter iskwidth = 2,
    parameter owidth = 20,

    parameter DEC_MCOMMA_DETECT = "TRUE",
    parameter DEC_PCOMMA_DETECT = "TRUE"
)
(
    input   wire                        clk,
    input   wire                        rst,
    input   wire    [iwidth - 1:0]      indata,
    input   wire                        RX8B10BEN,
    input   wire                        data_width_odd,

    output  wire    [iskwidth - 1:0]    rxchariscomma,
    output  wire    [iskwidth - 1:0]    rxcharisk,
    output  wire    [iskwidth - 1:0]    rxdisperr,
    output  wire    [iskwidth - 1:0]    rxnotintable,

    output  wire    [owidth - 1:0]      outdata
);
wire    [iskwidth - 1:0]    rxcharisk_dec;
wire    [iskwidth - 1:0]    rxdisperr_dec;
wire    [owidth - 1:0]      outdata_dec;

localparam word_count = iwidth / 10;
localparam add_2out_bits = owidth == 20 | owidth == 40 | owidth == 80 ? "TRUE" : "FALSE";

wire    [iwidth - 2 * word_count - 1:0] pure_data;
wire    [iwidth - 1:0]                  data;
wire    [word_count - 1:0]              disp; //consecutive disparity calculations;
wire    [word_count - 1:0]              disp_word; // 0 - negative, 1 - positive
wire    [word_count - 1:0]              no_disp_word; // ignore disp_word, '1's and '0's have equal count
wire    [word_count - 1:0]              disp_err;

reg     disp_init; // disparity after last clock's portion of data
always @ (posedge clk)
    disp_init <= rst ? 1'b0 : disp[word_count - 1];

genvar ii;
generate
for (ii = 0; ii < word_count; ii = ii + 1)
begin: asdf
    //data = {1'(is in table) + 3'(decoded 4/3) + 1'(is in table) + 5'(decoded 6/5)}

    //6/5 decoding
    assign  data[ii*10+5:ii*10] = rxcharisk_dec[ii] ? (
                                  indata[ii*10 + 9:ii*10] == 10'b0010111100 | indata[ii*10 + 9:ii*10] == 10'b1101000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b1001111100 | indata[ii*10 + 9:ii*10] == 10'b0110000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b1010111100 | indata[ii*10 + 9:ii*10] == 10'b0101000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b1100111100 | indata[ii*10 + 9:ii*10] == 10'b0011000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b0100111100 | indata[ii*10 + 9:ii*10] == 10'b1011000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b0101111100 | indata[ii*10 + 9:ii*10] == 10'b1010000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b0110111100 | indata[ii*10 + 9:ii*10] == 10'b1001000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b0001111100 | indata[ii*10 + 9:ii*10] == 10'b1110000011 ? 6'b011100 :
                                  indata[ii*10 + 9:ii*10] == 10'b0001010111 | indata[ii*10 + 9:ii*10] == 10'b1110101000 ? 6'b010111 :
                                  indata[ii*10 + 9:ii*10] == 10'b0001011011 | indata[ii*10 + 9:ii*10] == 10'b1110100100 ? 6'b011011 :
                                  indata[ii*10 + 9:ii*10] == 10'b0001011101 | indata[ii*10 + 9:ii*10] == 10'b1110100010 ? 6'b011101 :
                                  indata[ii*10 + 9:ii*10] == 10'b0001011110 | indata[ii*10 + 9:ii*10] == 10'b1110100001 ? 6'b011110 :
                                                                                                                          6'b100000)
                                  :
                                 (indata[ii*10 + 5:ii*10] == 6'b111001 | indata[ii*10 + 5:ii*10] == 6'b000110 ? 6'b000000 :// Data VVV
                                  indata[ii*10 + 5:ii*10] == 6'b101110 | indata[ii*10 + 5:ii*10] == 6'b010001 ? 6'b000001 :
                                  indata[ii*10 + 5:ii*10] == 6'b101101 | indata[ii*10 + 5:ii*10] == 6'b010010 ? 6'b000010 :
                                  indata[ii*10 + 5:ii*10] == 6'b100011 | indata[ii*10 + 5:ii*10] == 6'b100011 ? 6'b000011 :
                                  indata[ii*10 + 5:ii*10] == 6'b101011 | indata[ii*10 + 5:ii*10] == 6'b010100 ? 6'b000100 :
                                  indata[ii*10 + 5:ii*10] == 6'b100101 | indata[ii*10 + 5:ii*10] == 6'b100101 ? 6'b000101 :
                                  indata[ii*10 + 5:ii*10] == 6'b100110 | indata[ii*10 + 5:ii*10] == 6'b100110 ? 6'b000110 :
                                  indata[ii*10 + 5:ii*10] == 6'b000111 | indata[ii*10 + 5:ii*10] == 6'b111000 ? 6'b000111 :
                                  indata[ii*10 + 5:ii*10] == 6'b100111 | indata[ii*10 + 5:ii*10] == 6'b011000 ? 6'b001000 :
                                  indata[ii*10 + 5:ii*10] == 6'b101001 | indata[ii*10 + 5:ii*10] == 6'b101001 ? 6'b001001 :
                                  indata[ii*10 + 5:ii*10] == 6'b101010 | indata[ii*10 + 5:ii*10] == 6'b101010 ? 6'b001010 :
                                  indata[ii*10 + 5:ii*10] == 6'b001011 | indata[ii*10 + 5:ii*10] == 6'b001011 ? 6'b001011 :
                                  indata[ii*10 + 5:ii*10] == 6'b101100 | indata[ii*10 + 5:ii*10] == 6'b101100 ? 6'b001100 :
                                  indata[ii*10 + 5:ii*10] == 6'b001101 | indata[ii*10 + 5:ii*10] == 6'b001101 ? 6'b001101 :
                                  indata[ii*10 + 5:ii*10] == 6'b001110 | indata[ii*10 + 5:ii*10] == 6'b001110 ? 6'b001110 :
                                  indata[ii*10 + 5:ii*10] == 6'b111010 | indata[ii*10 + 5:ii*10] == 6'b000101 ? 6'b001111 :
                                  indata[ii*10 + 5:ii*10] == 6'b110110 | indata[ii*10 + 5:ii*10] == 6'b001001 ? 6'b010000 :
                                  indata[ii*10 + 5:ii*10] == 6'b110001 | indata[ii*10 + 5:ii*10] == 6'b110001 ? 6'b010001 :
                                  indata[ii*10 + 5:ii*10] == 6'b110010 | indata[ii*10 + 5:ii*10] == 6'b110010 ? 6'b010010 :
                                  indata[ii*10 + 5:ii*10] == 6'b010011 | indata[ii*10 + 5:ii*10] == 6'b010011 ? 6'b010011 :
                                  indata[ii*10 + 5:ii*10] == 6'b110100 | indata[ii*10 + 5:ii*10] == 6'b110100 ? 6'b010100 :
                                  indata[ii*10 + 5:ii*10] == 6'b010101 | indata[ii*10 + 5:ii*10] == 6'b010101 ? 6'b010101 :
                                  indata[ii*10 + 5:ii*10] == 6'b010110 | indata[ii*10 + 5:ii*10] == 6'b010110 ? 6'b010110 :
                                  indata[ii*10 + 5:ii*10] == 6'b010111 | indata[ii*10 + 5:ii*10] == 6'b101000 ? 6'b010111 :
                                  indata[ii*10 + 5:ii*10] == 6'b110011 | indata[ii*10 + 5:ii*10] == 6'b001100 ? 6'b011000 :
                                  indata[ii*10 + 5:ii*10] == 6'b011001 | indata[ii*10 + 5:ii*10] == 6'b011001 ? 6'b011001 :
                                  indata[ii*10 + 5:ii*10] == 6'b011010 | indata[ii*10 + 5:ii*10] == 6'b011010 ? 6'b011010 :
                                  indata[ii*10 + 5:ii*10] == 6'b011011 | indata[ii*10 + 5:ii*10] == 6'b100100 ? 6'b011011 :
                                  indata[ii*10 + 5:ii*10] == 6'b011100 | indata[ii*10 + 5:ii*10] == 6'b011100 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b011101 | indata[ii*10 + 5:ii*10] == 6'b100010 ? 6'b011101 :
                                  indata[ii*10 + 5:ii*10] == 6'b011110 | indata[ii*10 + 5:ii*10] == 6'b100001 ? 6'b011110 :
                                  indata[ii*10 + 5:ii*10] == 6'b110101 | indata[ii*10 + 5:ii*10] == 6'b001010 ? 6'b011111 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :// Controls VVV
/*                                indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b111100 | indata[ii*10 + 5:ii*10] == 6'b000011 ? 6'b011100 :
                                  indata[ii*10 + 5:ii*10] == 6'b010111 | indata[ii*10 + 5:ii*10] == 6'b101000 ? 6'b010111 :
                                  indata[ii*10 + 5:ii*10] == 6'b011011 | indata[ii*10 + 5:ii*10] == 6'b100100 ? 6'b011011 :
                                  indata[ii*10 + 5:ii*10] == 6'b011101 | indata[ii*10 + 5:ii*10] == 6'b100010 ? 6'b011101 :
                                  indata[ii*10 + 5:ii*10] == 6'b011110 | indata[ii*10 + 5:ii*10] == 6'b100001 ? 6'b011110 :*/
                                                                                                                6'b100000); // not in a table
    //4/3 decoding                                                                                                 
    assign  data[ii*10+ 9:ii*10+ 6] = rxcharisk_dec[ii] ? (
                                      indata[ii*10 + 9:ii*10] == 10'b0010111100 | indata[ii*10 + 9:ii*10] == 10'b1101000011 ? 4'b0000 :
                                      indata[ii*10 + 9:ii*10] == 10'b1001111100 | indata[ii*10 + 9:ii*10] == 10'b0110000011 ? 4'b0001 :
                                      indata[ii*10 + 9:ii*10] == 10'b1010111100 | indata[ii*10 + 9:ii*10] == 10'b0101000011 ? 4'b0010 :
                                      indata[ii*10 + 9:ii*10] == 10'b1100111100 | indata[ii*10 + 9:ii*10] == 10'b0011000011 ? 4'b0011 :
                                      indata[ii*10 + 9:ii*10] == 10'b0100111100 | indata[ii*10 + 9:ii*10] == 10'b1011000011 ? 4'b0100 :
                                      indata[ii*10 + 9:ii*10] == 10'b0101111100 | indata[ii*10 + 9:ii*10] == 10'b1010000011 ? 4'b0101 :
                                      indata[ii*10 + 9:ii*10] == 10'b0110111100 | indata[ii*10 + 9:ii*10] == 10'b1001000011 ? 4'b0110 :
                                      indata[ii*10 + 9:ii*10] == 10'b0001111100 | indata[ii*10 + 9:ii*10] == 10'b1110000011 ? 4'b0111 :
                                      indata[ii*10 + 9:ii*10] == 10'b0001010111 | indata[ii*10 + 9:ii*10] == 10'b1110101000 ? 4'b0111 :
                                      indata[ii*10 + 9:ii*10] == 10'b0001011011 | indata[ii*10 + 9:ii*10] == 10'b1110100100 ? 4'b0111 :
                                      indata[ii*10 + 9:ii*10] == 10'b0001011101 | indata[ii*10 + 9:ii*10] == 10'b1110100010 ? 4'b0111 :
                                      indata[ii*10 + 9:ii*10] == 10'b0001011110 | indata[ii*10 + 9:ii*10] == 10'b1110100001 ? 4'b0111 :
                                                                                                                              4'b1000)
                                      :
                                     (indata[ii*10 + 9:ii*10 + 6] == 4'b1101 | indata[ii*10 + 9:ii*10 + 6] == 4'b0010 ? 4'b0000 : // Data VVV
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b1001 | indata[ii*10 + 9:ii*10 + 6] == 4'b1001 ? 4'b0001 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b1010 | indata[ii*10 + 9:ii*10 + 6] == 4'b1010 ? 4'b0010 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0011 | indata[ii*10 + 9:ii*10 + 6] == 4'b1100 ? 4'b0011 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b1011 | indata[ii*10 + 9:ii*10 + 6] == 4'b0100 ? 4'b0100 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0101 | indata[ii*10 + 9:ii*10 + 6] == 4'b0101 ? 4'b0101 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0110 | indata[ii*10 + 9:ii*10 + 6] == 4'b0110 ? 4'b0110 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0111 | indata[ii*10 + 9:ii*10 + 6] == 4'b1110 ? 4'b0111 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0001 | indata[ii*10 + 9:ii*10 + 6] == 4'b1000 ? 4'b0111 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0010 | indata[ii*10 + 9:ii*10 + 6] == 4'b1101 ? 4'b0000 : // Control VVV
/*                                    indata[ii*10 + 9:ii*10 + 6] == 4'b1001 | indata[ii*10 + 9:ii*10 + 6] == 4'b0110 ? 4'b0001 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b1010 | indata[ii*10 + 9:ii*10 + 6] == 4'b0101 ? 4'b0010 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b1100 | indata[ii*10 + 9:ii*10 + 6] == 4'b0011 ? 4'b0011 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0100 | indata[ii*10 + 9:ii*10 + 6] == 4'b1011 ? 4'b0100 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0101 | indata[ii*10 + 9:ii*10 + 6] == 4'b1010 ? 4'b0101 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0110 | indata[ii*10 + 9:ii*10 + 6] == 4'b1001 ? 4'b0110 :
                                      indata[ii*10 + 9:ii*10 + 6] == 4'b0001 | indata[ii*10 + 9:ii*10 + 6] == 4'b1110 ? 4'b0111 :*/
                                                                                                                        4'b1000); // not in a table
    assign  disp_word[ii]   = (4'd0 + indata[ii*10] + indata[ii*10 + 1] + indata[ii*10 + 2] + indata[ii*10 + 3] + indata[ii*10 + 4] 
                                    + indata[ii*10 + 5] + indata[ii*10 + 6] + indata[ii*10 + 7] + indata[ii*10 + 8] + indata[ii*10 + 9]) > 5;
    assign  no_disp_word[ii]= (4'd0 + indata[ii*10] + indata[ii*10 + 1] + indata[ii*10 + 2] + indata[ii*10 + 3] + indata[ii*10 + 4] 
                                    + indata[ii*10 + 5] + indata[ii*10 + 6] + indata[ii*10 + 7] + indata[ii*10 + 8] + indata[ii*10 + 9]) == 5;

    assign  pure_data[ii*8 + 7:ii*8] = {data[ii*10 + 8:ii*10 + 6], data[ii*10 + 4:ii*10]};

    assign  outdata_dec[ii*8 + 7:ii*8]  = pure_data[ii*8 + 7:ii*8];

    assign  outdata[ii*8 + 7:ii*8]  = RX8B10BEN ? outdata_dec[ii*8 + 7:ii*8]   : ~data_width_odd ? indata[ii*10 + 7:ii*10]  : indata[ii*8 + 7:ii*8];
    assign  rxcharisk[ii]           = RX8B10BEN ? rxcharisk_dec[ii] : ~data_width_odd ? indata[ii*10 + 8]        : 1'bx;
    assign  rxdisperr[ii]           = RX8B10BEN ? rxdisperr_dec[ii] : ~data_width_odd ? indata[ii*10 + 9]        : 1'bx; 
/*    if (RX8B10BEN) begin
    end
    else 
    if (data_width_odd) begin
        assign  outdata[ii*8 + 7:ii*8]  = indata[ii*8 + 7:ii*8];
        assign  rxcharisk[ii]           = 1'bx;
        assign  rxdisperr[ii]           = 1'bx; 
    end
    else begin
        assign  outdata[ii*8 + 7:ii*8]  = indata[ii*10 + 7:ii*10];
        assign  rxcharisk[ii]           = indata[ii*10 + 8];
        assign  rxdisperr[ii]           = indata[ii*10 + 9];
    end*/
end
endgenerate

assign  disp_err = ~no_disp_word & (~disp_word ^ {disp[word_count - 2:0], disp_init});
assign  disp     = ~no_disp_word & disp_word | no_disp_word & {disp[word_count - 2:0], disp_init};


generate 
for (ii = 0; ii < word_count; ii = ii + 1)
begin:dfsga
    assign  rxnotintable[ii]    = ii >= word_count ? 1'b0 : data[ii*10 + 9] | data[ii*10 + 5];

    assign  rxdisperr_dec[ii]   = ii >= word_count ?  1'b0 : disp_err[ii];
    assign  rxcharisk_dec[ii]   = ii >= word_count ?  1'b0 :
                                                      indata[ii*10 + 9:ii*10] == 10'b0010111100 | indata[ii*10 + 9:ii*10] == 10'b1101000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b1001111100 | indata[ii*10 + 9:ii*10] == 10'b0110000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b1010111100 | indata[ii*10 + 9:ii*10] == 10'b0101000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b1100111100 | indata[ii*10 + 9:ii*10] == 10'b0011000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0100111100 | indata[ii*10 + 9:ii*10] == 10'b1011000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0101111100 | indata[ii*10 + 9:ii*10] == 10'b1010000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0110111100 | indata[ii*10 + 9:ii*10] == 10'b1001000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0001111100 | indata[ii*10 + 9:ii*10] == 10'b1110000011 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0001010111 | indata[ii*10 + 9:ii*10] == 10'b1110101000 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0001011011 | indata[ii*10 + 9:ii*10] == 10'b1110100100 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0001011101 | indata[ii*10 + 9:ii*10] == 10'b1110100010 |
                                                      indata[ii*10 + 9:ii*10] == 10'b0001011110 | indata[ii*10 + 9:ii*10] == 10'b1110100001;

    assign  rxchariscomma[ii] = ii >= word_count ?  1'b0 :
                                                   (indata[ii*10 + 9:ii*10] == 10'b1001111100 | 
                                                    indata[ii*10 + 9:ii*10] == 10'b0101111100 | 
                                                    indata[ii*10 + 9:ii*10] == 10'b0001111100) & DEC_PCOMMA_DETECT |
                                                   (indata[ii*10 + 9:ii*10] == 10'b0110000011 |
                                                    indata[ii*10 + 9:ii*10] == 10'b1010000011 |
                                                    indata[ii*10 + 9:ii*10] == 10'b1110000011) & DEC_MCOMMA_DETECT;
end
endgenerate


endmodule

module gtxe2_chnl_rx_align #(
    parameter width = 20,
    parameter   [9:0]   ALIGN_MCOMMA_VALUE  = 10'b1010000011,
    parameter           ALIGN_MCOMMA_DET    = "TRUE",
    parameter   [9:0]   ALIGN_PCOMMA_VALUE  = 10'b0101111100,
    parameter           ALIGN_PCOMMA_DET    = "TRUE",
    parameter   [9:0]   ALIGN_COMMA_ENABLE  = 10'b1111111111,
    parameter           ALIGN_COMMA_DOUBLE  = "FALSE",
    parameter           ALIGN_COMMA_WORD    = 1
)
(
    input   wire                    clk,
    input   wire                    rst,
    input   wire    [width - 1:0]   indata,
    output  wire    [width - 1:0]   outdata,

    input   wire                    rxelecidle,

    output  wire                    RXBYTEISALIGNED,
    output  wire                    RXBYTEREALIGN,
    output  wire                    RXCOMMADET,

    input   wire                    RXCOMMADETEN,
    input   wire                    RXPCOMMAALIGNEN,
    input   wire                    RXMCOMMAALIGNEN
);

localparam  comma_width = ALIGN_COMMA_DOUBLE == "FALSE" ? 10 : 20;
localparam  window_size = width;//comma_width + width;

// prepare a buffer to be scanned on comma matches
reg     [width - 1:0]       indata_r;
wire    [width*2 - 1:0]     data;

// looking for matches in all related bit history - in 'data'
assign  data    = {indata, indata_r};//{indata_r, indata};
always @ (posedge clk)
    indata_r <= indata;

// finding matches
wire    [comma_width - 1:0] comma_window [window_size - 1:0];
//initial
//  for (idx = 0; idx < window_size; idx = idx + 1) $dumpvars(0, comma_width[idx]);
wire    [window_size - 1:0] comma_match; // shows all matches
wire    [window_size - 1:0] comma_pos; // shows the first match
wire    [window_size - 1:0] pcomma_match;
wire    [window_size - 1:0] mcomma_match;

genvar ii;
generate
for (ii = 0; ii < window_size; ii = ii + 1)
begin: filter
    assign  comma_window[ii]    = data[comma_width + ii - 1:ii];
    assign  pcomma_match[ii]    = (comma_window[ii] & ALIGN_COMMA_ENABLE) == (ALIGN_PCOMMA_VALUE & ALIGN_COMMA_ENABLE);
    assign  mcomma_match[ii]    = (comma_window[ii] & ALIGN_COMMA_ENABLE) == (ALIGN_MCOMMA_VALUE & ALIGN_COMMA_ENABLE);
    assign  comma_match[ii]     = pcomma_match[ii] & RXPCOMMAALIGNEN | mcomma_match[ii] & RXMCOMMAALIGNEN;
end
endgenerate

// so, comma_match indicates bits, from whose comma/doublecomma (or commas) occurs in the window buffer
// all we need from now is to get one of these bits, [x], and say [x+width-1:x] is an aligned data

// doing it in a hard way
generate
for (ii = 1; ii < window_size; ii = ii + 1)
begin: filter_comma_pos
    assign  comma_pos[ii] = comma_match[ii] & ~|comma_match[ii - 1:0];
end
endgenerate
assign  comma_pos[0] = comma_match[0];
// so, comma_pos's '1' indicates the first comma occurence. there is only one '1' in the vector

function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1) begin
            value = value >> 1;
        end
    end
endfunction

function integer powerof2;
    input [31:0] value;
    begin
        value = 1 << value;
    end
endfunction

localparam pwidth = clogb2(width * 2 -1);

// decoding (finding an index, representing '1' in comma_pos)
wire    [pwidth - 1:0]      pointer;
reg     [pwidth - 1:0]      pointer_latched;
wire                        pointer_set;
wire    [window_size - 1:0] pbits [pwidth - 1:0];
genvar jj;
generate
for (ii = 0; ii < pwidth; ii = ii + 1)
begin: for_each_pointers_bit
    for (jj = 0; jj < window_size; jj = jj + 1)
    begin: calculate_encoder_mask
        assign pbits[ii][jj] = jj[ii];
    end
    assign pointer[ii] = |(pbits[ii] & comma_pos);
end
endgenerate

//here we are: pointer = index of a beginning of the required output data
reg     is_aligned;

assign  outdata     = ~RXCOMMADETEN ? indata : pointer_set ? data[pointer + width - 1 -:width] : data[pointer_latched + width - 1 -:width];
assign  pointer_set = |comma_pos;
assign  RXCOMMADET  = RXCOMMADETEN & pointer_set & (|pcomma_match & ALIGN_PCOMMA_DET == "TRUE" | |mcomma_match & ALIGN_MCOMMA_DET == "TRUE");
assign  RXBYTEISALIGNED = RXCOMMADETEN & is_aligned;
assign  RXBYTEREALIGN = RXCOMMADETEN & is_aligned & pointer_set;

always @ (posedge clk)
begin
    is_aligned      <= rst | pointer_set === 1'bx | rxelecidle ? 1'b0 : ~is_aligned & pointer_set | is_aligned;
    pointer_latched <= rst ? {pwidth{1'b0}} : pointer_set ? pointer : pointer_latched;
end

endmodule

/*
 * According to the doc, p110
 * If RX_INT_DATAWIDTH, the inner width = 32 bits, otherwise 16.
 */

module gtxe2_chnl_rx_dataiface #(
    parameter   internal_data_width = 16,
    parameter   interface_data_width = 32,
    parameter   internal_isk_width = 2,
    parameter   interface_isk_width = 4
)
(
    input   wire    usrclk,
    input   wire    usrclk2,
    input   wire    reset,
    output  wire    [interface_data_width - 1:0]    outdata,
    output  wire    [interface_isk_width - 1:0]     outisk,
    input   wire    [internal_data_width - 1:0]     indata,
    input   wire    [internal_isk_width - 1:0]      inisk,
    input   wire                                    realign
);

localparam div = interface_data_width / internal_data_width;
localparam internal_total_width = internal_data_width + internal_isk_width;
localparam interface_total_width = interface_data_width + interface_isk_width;

reg     [interface_data_width - 1:0]   inbuffer_data;
reg     [interface_isk_width - 1:0]    inbuffer_isk;
reg     [31:0]          wordcounter;
wire                    empty_rd;
wire                    full_wr;
wire                    val_wr;
wire                    val_rd;
wire                    almost_empty_rd;
reg                     need_reset = 1;

always @ (posedge usrclk)
    wordcounter  <= reset ? 32'h0 : realign & ~(div == 0) ? 32'd1 : wordcounter == (div - 1) ? 32'h0 : wordcounter + 1'b1;

genvar ii;
generate
for (ii = 0; ii < div; ii = ii + 1)
begin: splicing
    always @ (posedge usrclk)
        inbuffer_data[(ii + 1) * internal_data_width - 1 -: internal_data_width] <= reset ? {internal_data_width{1'b0}} : ((wordcounter == ii) | realign & (0 == ii)) ? indata : inbuffer_data[(ii + 1) * internal_data_width - 1 -: internal_data_width];
end
endgenerate
generate
for (ii = 0; ii < div; ii = ii + 1)
begin: splicing2
    always @ (posedge usrclk)
        inbuffer_isk[(ii + 1) * internal_isk_width - 1 -: internal_isk_width] <= reset ? {internal_isk_width{1'b0}} : ((wordcounter == ii) | realign & (0 == ii)) ? inisk : inbuffer_isk[(ii + 1) * internal_isk_width - 1 -: internal_isk_width];
end
endgenerate

assign  val_rd  = ~empty_rd & ~almost_empty_rd;
assign  val_wr  = ~full_wr & wordcounter == (div - 1);

always @ (posedge usrclk)
    if (reset) need_reset <= 0;
    else   if (full_wr && !need_reset) begin
        $display("2:FIFO in %m is full, that is not an appropriate behaviour, needs reset @%time", $time);
        wordcounter = 'bx;
        need_reset <= 1;
//        $finish;
    end

wire    [interface_total_width - 1:0] resync;
assign  outdata = resync[interface_data_width - 1:0];
assign  outisk  = resync[interface_data_width + interface_isk_width - 1:interface_data_width];

wire [interface_total_width - 1:0] data_wr;
generate
if (interface_data_width > internal_data_width)
    assign  data_wr = {inisk, inbuffer_isk[interface_isk_width - internal_isk_width - 1 : 0], indata, inbuffer_data[interface_data_width - internal_data_width - 1 : 0]};
else
    assign  data_wr = {inisk, indata};
endgenerate

resync_fifo_nonsynt #(
    .width      (interface_total_width),
    .log_depth  (3)
)
fifo(
    .rst_rd     (reset),
    .rst_wr     (reset),
    .clk_wr     (usrclk),
    .val_wr     (val_wr),
    .data_wr    (data_wr),
    .clk_rd     (usrclk2),
    .val_rd     (val_rd),
    .data_rd    (resync),

    .empty_rd   (empty_rd),
    .full_wr    (full_wr),

    .almost_empty_rd (almost_empty_rd)
);

endmodule

module gtxe2_chnl_rx(
    input   wire            reset,
    input   wire            RXP,
    input   wire            RXN,
    
    input   wire            RXUSRCLK,
    input   wire            RXUSRCLK2,

    output  wire    [63:0]  RXDATA,

// oob
    input   wire    [1:0]   RXELECIDLEMODE,
    output  wire            RXELECIDLE,

    output  wire            RXCOMINITDET,
    output  wire            RXCOMWAKEDET,

// polarity
    input   wire            RXPOLARITY,

// aligner
    output  wire            RXBYTEISALIGNED,
    output  wire            RXBYTEREALIGN,
    output  wire            RXCOMMADET,

    input   wire            RXCOMMADETEN,
    input   wire            RXPCOMMAALIGNEN,
    input   wire            RXMCOMMAALIGNEN,

// 10/8 decoder
    input   wire            RX8B10BEN,

    output  wire    [7:0]   RXCHARISCOMMA,
    output  wire    [7:0]   RXCHARISK,
    output  wire    [7:0]   RXDISPERR,
    output  wire    [7:0]   RXNOTINTABLE,

// internal
    input   wire            serial_clk

);

parameter   integer RX_DATA_WIDTH       = 20;
parameter   integer RX_INT_DATAWIDTH    = 0;

parameter   DEC_MCOMMA_DETECT = "TRUE";
parameter   DEC_PCOMMA_DETECT = "TRUE";

parameter   [9:0]   ALIGN_MCOMMA_VALUE  = 10'b1010000011;
parameter           ALIGN_MCOMMA_DET    = "TRUE";
parameter   [9:0]   ALIGN_PCOMMA_VALUE  = 10'b0101111100;
parameter           ALIGN_PCOMMA_DET    = "TRUE";
parameter   [9:0]   ALIGN_COMMA_ENABLE  = 10'b1111111111;
parameter           ALIGN_COMMA_DOUBLE  = "FALSE";

function integer calc_idw;
    input   dummy;
    begin
        calc_idw = RX_INT_DATAWIDTH == 1 ? 40 : 20;
    end
endfunction

function integer calc_ifdw;
    input   dummy;
    begin
       calc_ifdw = RX_DATA_WIDTH == 16 ? 20 :
                   RX_DATA_WIDTH == 32 ? 40 :
                   RX_DATA_WIDTH == 64 ? 80 : RX_DATA_WIDTH;
    end
endfunction

// can be 20 or 40, if it shall be 16 or 32, extra bits wont be used
localparam  internal_data_width     = calc_idw(1);
localparam  interface_data_width    = calc_ifdw(1);
localparam  internal_isk_width      = internal_data_width / 10;
localparam  interface_isk_width     = interface_data_width / 10;
// used in case of TX8B10BEN = 0
localparam  data_width_odd          = RX_DATA_WIDTH == 16 | RX_DATA_WIDTH == 32 | RX_DATA_WIDTH == 64;


// OOB
gtxe2_chnl_rx_oob #(
    .width          (internal_data_width)
)
rx_oob(
    .reset          (reset),
    .clk            (serial_clk),
    .usrclk2        (RXUSRCLK2),
    .RXN            (RXN),
    .RXP            (RXP),

    .RXELECIDLEMODE (RXELECIDLEMODE),
    .RXELECIDLE     (RXELECIDLE),

    .RXCOMINITDET   (RXCOMINITDET),
    .RXCOMWAKEDET   (RXCOMWAKEDET)
);

// Polarity
// no need to invert data after a deserializer, no need to resync or make a buffer trigger for simulation
wire    indata_ser;
assign  indata_ser = RXPOLARITY ^ RXP;

// due to non-syntasisable usage, CDR is missing

// deserializer
wire    [internal_data_width - 1:0] parallel_data; // in trimmed case highest bites shall be 'x'
gtxe2_chnl_rx_des #(
    .width      (internal_data_width)
)
des(
    .reset      (reset),
    .trim       (data_width_odd & ~RX8B10BEN),
    .inclk      (serial_clk),
    .outclk     (RXUSRCLK),
    .indata     (indata_ser),
    .outdata    (parallel_data)
);

// aligner
wire    [internal_data_width - 1:0] aligned_data;
gtxe2_chnl_rx_align #(
    .width                  (internal_data_width),
    .ALIGN_MCOMMA_VALUE     (ALIGN_MCOMMA_VALUE),
    .ALIGN_MCOMMA_DET       (ALIGN_MCOMMA_DET),
    .ALIGN_PCOMMA_VALUE     (ALIGN_PCOMMA_VALUE),
    .ALIGN_PCOMMA_DET       (ALIGN_PCOMMA_DET),
    .ALIGN_COMMA_ENABLE     (ALIGN_COMMA_ENABLE),
    .ALIGN_COMMA_DOUBLE     (ALIGN_COMMA_DOUBLE)
)
aligner(
    .clk                (RXUSRCLK),
    .rst                (reset),
    .indata             (parallel_data),
    .outdata            (aligned_data),

    .rxelecidle         (RXELECIDLE),

    .RXBYTEISALIGNED    (RXBYTEISALIGNED),
    .RXBYTEREALIGN      (RXBYTEREALIGN),
    .RXCOMMADET         (RXCOMMADET),

    .RXCOMMADETEN       (RXCOMMADETEN),
    .RXPCOMMAALIGNEN    (RXPCOMMAALIGNEN),
    .RXMCOMMAALIGNEN    (RXMCOMMAALIGNEN)
);

localparam  iface_databus_width = interface_data_width * 8 / 10;
localparam  intern_databus_width = internal_data_width * 8 / 10;

wire [intern_databus_width - 1:0] internal_data;
wire [internal_isk_width  - 1:0]  internal_isk;
wire [internal_isk_width  - 1:0]  internal_chariscomma;
wire [internal_isk_width  - 1:0]  internal_notintable;
wire [internal_isk_width  - 1:0]  internal_disperr;
// 10x8 decoder
gtxe2_chnl_rx_10x8dec #(
    .iwidth             (internal_data_width),
    .iskwidth           (internal_isk_width),
    .owidth             (intern_databus_width),
    .DEC_MCOMMA_DETECT  (DEC_MCOMMA_DETECT),
    .DEC_PCOMMA_DETECT  (DEC_PCOMMA_DETECT)
)
decoder_10x8(
    .clk            (RXUSRCLK),
    .rst            (reset),
    .indata         (aligned_data),
    .RX8B10BEN      (RX8B10BEN),
    .data_width_odd (data_width_odd),

    .rxchariscomma  (internal_chariscomma),
    .rxcharisk      (internal_isk),
    .rxdisperr      (internal_disperr),
    .rxnotintable   (internal_notintable),

    .outdata        (internal_data)
);

// fit data width

localparam outdiv = interface_data_width / internal_data_width;
// if something is written into dataiface_data_in _except_ internal_data and internal_isk => count all extra bits in this parameter
localparam internal_data_extra = 4;
localparam interface_data_extra = outdiv * internal_data_extra;

wire [interface_data_width - 1 + interface_data_extra:0]  dataiface_data_out;
wire [internal_data_width - 1 + internal_data_extra:0]   dataiface_data_in;

assign  dataiface_data_in  = {internal_notintable, internal_chariscomma, internal_disperr, internal_isk, internal_data};

genvar ii;
generate
for (ii = 1; ii < (outdiv + 1); ii = ii + 1)
begin: asdadfdsf
    assign  RXDATA[ii*intern_databus_width - 1 -: intern_databus_width]    = dataiface_data_out[(ii-1)*(internal_data_width + internal_data_extra) + intern_databus_width - 1 -: intern_databus_width];
    assign  RXCHARISK[ii*internal_isk_width - 1 -: internal_isk_width]     = dataiface_data_out[(ii-1)*(internal_data_width + internal_data_extra) + intern_databus_width - 1 + internal_isk_width -: internal_isk_width];
    assign  RXDISPERR[ii*internal_isk_width - 1 -: internal_isk_width]     = dataiface_data_out[(ii-1)*(internal_data_width + internal_data_extra) + intern_databus_width - 1 + internal_isk_width*2 -: internal_isk_width];
    assign  RXCHARISCOMMA[ii*internal_isk_width - 1 -: internal_isk_width] = dataiface_data_out[(ii-1)*(internal_data_width + internal_data_extra) + intern_databus_width - 1 + internal_isk_width*3 -: internal_isk_width];
    assign  RXNOTINTABLE[ii*internal_isk_width - 1 -: internal_isk_width]  = dataiface_data_out[(ii-1)*(internal_data_width + internal_data_extra) + intern_databus_width - 1 + internal_isk_width*4 -: internal_isk_width];
end
endgenerate
assign  RXDATA[63:iface_databus_width]       = {64 - iface_databus_width{1'bx}};
assign  RXDISPERR[7:interface_isk_width]     = {8 - interface_isk_width{1'bx}};
assign  RXCHARISK[7:interface_isk_width]     = {8 - interface_isk_width{1'bx}};
assign  RXCHARISCOMMA[7:interface_isk_width] = {8 - interface_isk_width{1'bx}};
assign  RXNOTINTABLE[7:interface_isk_width]  = {8 - interface_isk_width{1'bx}};

gtxe2_chnl_rx_dataiface #(
    .internal_data_width    (internal_data_width + internal_data_extra),
    .interface_data_width   (interface_data_width + interface_data_extra),
    .internal_isk_width     (internal_isk_width),
    .interface_isk_width    (interface_isk_width)
)
dataiface
(
    .usrclk     (RXUSRCLK),
    .usrclk2    (RXUSRCLK2),
    .reset      (reset),
    .indata     (dataiface_data_in),
    .inisk      (internal_isk), // not used actually
    .outdata    (dataiface_data_out),
    .outisk     (),
    .realign    (RXBYTEREALIGN === 1'bx ? 1'b0 : RXBYTEREALIGN)
);

endmodule

module gtxe2_chnl(
    input   wire            reset,
/*
 * TX
 */
    output  wire            TXP,
    output  wire            TXN,

    input   wire    [63:0]  TXDATA,
    input   wire            TXUSRCLK,
    input   wire            TXUSRCLK2,

// 8/10 encoder
    input   wire    [7:0]   TX8B10BBYPASS,
    input   wire            TX8B10BEN,
    input   wire    [7:0]   TXCHARDISPMODE,
    input   wire    [7:0]   TXCHARDISPVAL,
    input   wire    [7:0]   TXCHARISK,

// TX Buffer
    output  wire    [1:0]   TXBUFSTATUS,

// TX Polarity
    input   wire            TXPOLARITY,

// TX Fabric Clock Control
    input   wire    [2:0]   TXRATE,
    output  wire            TXRATEDONE,

// TX OOB
    input   wire            TXCOMINIT,
    input   wire            TXCOMWAKE,
    output  wire            TXCOMFINISH,

// TX Driver Control
    input   wire            TXELECIDLE,

/*
 * RX
 */ 
    input   wire            RXP,
    input   wire            RXN,
    
    input   wire            RXUSRCLK,
    input   wire            RXUSRCLK2,

    output  wire    [63:0]  RXDATA,

    input   wire    [2:0]   RXRATE,

// oob
    input   wire    [1:0]   RXELECIDLEMODE,
    output  wire            RXELECIDLE,

    output  wire            RXCOMINITDET,
    output  wire            RXCOMWAKEDET,

// polarity
    input   wire            RXPOLARITY,

// aligner
    output  wire            RXBYTEISALIGNED,
    output  wire            RXBYTEREALIGN,
    output  wire            RXCOMMADET,

    input   wire            RXCOMMADETEN,
    input   wire            RXPCOMMAALIGNEN,
    input   wire            RXMCOMMAALIGNEN,

// 10/8 decoder
    input   wire            RX8B10BEN,

    output  wire    [7:0]   RXCHARISCOMMA,
    output  wire    [7:0]   RXCHARISK,
    output  wire    [7:0]   RXDISPERR,
    output  wire    [7:0]   RXNOTINTABLE,

/*
 * Clocking
 */
// top-level interfaces
    input   wire    [2:0]   CPLLREFCLKSEL,
    input   wire            GTREFCLK0,
    input   wire            GTREFCLK1,
    input   wire            GTNORTHREFCLK0,
    input   wire            GTNORTHREFCLK1,
    input   wire            GTSOUTHREFCLK0,
    input   wire            GTSOUTHREFCLK1,
    input   wire            GTGREFCLK,
    input   wire            QPLLCLK,
    input   wire            QPLLREFCLK, 
    input   wire    [1:0]   RXSYSCLKSEL,
    input   wire    [1:0]   TXSYSCLKSEL,
    input   wire    [2:0]   TXOUTCLKSEL,
    input   wire    [2:0]   RXOUTCLKSEL,
    input   wire            TXDLYBYPASS,
    input   wire            RXDLYBYPASS,
    output  wire            GTREFCLKMONITOR,

    input   wire            CPLLLOCKDETCLK, 
    input   wire            CPLLLOCKEN,
    input   wire            CPLLPD,
    input   wire            CPLLRESET,
    output  wire            CPLLFBCLKLOST,
    output  wire            CPLLLOCK,
    output  wire            CPLLREFCLKLOST,

// phy-level interfaces
    output  wire            TXOUTCLKPMA,
    output  wire            TXOUTCLKPCS,
    output  wire            TXOUTCLK,
    output  wire            TXOUTCLKFABRIC,
    output  wire            tx_serial_clk,

    output  wire            RXOUTCLKPMA,
    output  wire            RXOUTCLKPCS,
    output  wire            RXOUTCLK,
    output  wire            RXOUTCLKFABRIC,
    output  wire            rx_serial_clk,

// additional ports to pll
    output  [9:0]       TSTOUT,
    input   [15:0]      GTRSVD,
    input   [15:0]      PCSRSVDIN,
    input   [4:0]       PCSRSVDIN2,
    input   [4:0]       PMARSVDIN,
    input   [4:0]       PMARSVDIN2,
    input   [19:0]      TSTIN
);
parameter   [23:0]  CPLL_CFG        = 29'h00BC07DC;
parameter   integer CPLL_FBDIV      = 4;
parameter   integer CPLL_FBDIV_45   = 5;
parameter   [23:0]  CPLL_INIT_CFG   = 24'h00001E;
parameter   [15:0]  CPLL_LOCK_CFG   = 16'h01E8;
parameter   integer CPLL_REFCLK_DIV = 1;
parameter   [1:0]   PMA_RSV3        = 1;

parameter   TXOUT_DIV   = 2;
//parameter   TXRATE      = 3'b000;
parameter   RXOUT_DIV   = 2;
//parameter   RXRATE      = 3'b000;

parameter   integer TX_INT_DATAWIDTH    = 0;
parameter   integer TX_DATA_WIDTH       = 20;

parameter   integer RX_DATA_WIDTH       = 20;
parameter   integer RX_INT_DATAWIDTH    = 0;

parameter   DEC_MCOMMA_DETECT = "TRUE";
parameter   DEC_PCOMMA_DETECT = "TRUE";

parameter   [9:0]   ALIGN_MCOMMA_VALUE  = 10'b1010000011;
parameter           ALIGN_MCOMMA_DET    = "TRUE";
parameter   [9:0]   ALIGN_PCOMMA_VALUE  = 10'b0101111100;
parameter           ALIGN_PCOMMA_DET    = "TRUE";
parameter   [9:0]   ALIGN_COMMA_ENABLE  = 10'b1111111111;
parameter           ALIGN_COMMA_DOUBLE  = "FALSE";


parameter   [3:0]   SATA_BURST_SEQ_LEN = 4'b1111;
parameter           SATA_CPLL_CFG = "VCO_3000MHZ";

gtxe2_chnl_tx #(
    .TX_DATA_WIDTH      (TX_DATA_WIDTH),
    .TX_INT_DATAWIDTH   (TX_INT_DATAWIDTH),
    .SATA_BURST_SEQ_LEN (SATA_BURST_SEQ_LEN),
    .SATA_CPLL_CFG      (SATA_CPLL_CFG)
)
tx(
    .reset              (reset),
    .TXP                (TXP),
    .TXN                (TXN),

    .TXDATA             (TXDATA),
    .TXUSRCLK           (TXUSRCLK),
    .TXUSRCLK2          (TXUSRCLK2),

    .TX8B10BBYPASS      (TX8B10BBYPASS),
    .TX8B10BEN          (TX8B10BEN),
    .TXCHARDISPMODE     (TXCHARDISPMODE),
    .TXCHARDISPVAL      (TXCHARDISPVAL),
    .TXCHARISK          (TXCHARISK),

    .TXBUFSTATUS        (TXBUFSTATUS),

    .TXPOLARITY         (TXPOLARITY),

    .TXRATE             (TXRATE),
    .TXRATEDONE         (TXRATEDONE),

    .TXCOMINIT          (TXCOMINIT),
    .TXCOMWAKE          (TXCOMWAKE),
    .TXCOMFINISH        (TXCOMFINISH),

    .TXELECIDLE         (TXELECIDLE),

    .serial_clk         (tx_serial_clk)
);

gtxe2_chnl_rx #(
    .RX_DATA_WIDTH          (RX_DATA_WIDTH),
    .RX_INT_DATAWIDTH       (RX_INT_DATAWIDTH),

    .DEC_MCOMMA_DETECT      (DEC_MCOMMA_DETECT),
    .DEC_PCOMMA_DETECT      (DEC_PCOMMA_DETECT),

    .ALIGN_MCOMMA_VALUE     (ALIGN_MCOMMA_VALUE),
    .ALIGN_MCOMMA_DET       (ALIGN_MCOMMA_DET),
    .ALIGN_PCOMMA_VALUE     (ALIGN_PCOMMA_VALUE),
    .ALIGN_PCOMMA_DET       (ALIGN_PCOMMA_DET),
    .ALIGN_COMMA_ENABLE     (ALIGN_COMMA_ENABLE),
    .ALIGN_COMMA_DOUBLE     (ALIGN_COMMA_DOUBLE)
)
rx(
    .reset              (reset),
    .RXP                (RXP),
    .RXN                (RXN),

    .RXUSRCLK           (RXUSRCLK),
    .RXUSRCLK2          (RXUSRCLK2),

    .RXDATA             (RXDATA),

    .RXELECIDLEMODE     (RXELECIDLEMODE),
    .RXELECIDLE         (RXELECIDLE),
    .RXCOMINITDET       (RXCOMINITDET),
    .RXCOMWAKEDET       (RXCOMWAKEDET),

    .RXPOLARITY         (RXPOLARITY),

    .RXBYTEISALIGNED    (RXBYTEISALIGNED),
    .RXBYTEREALIGN      (RXBYTEREALIGN),
    .RXCOMMADET         (RXCOMMADET),

    .RXCOMMADETEN       (RXCOMMADETEN),
    .RXPCOMMAALIGNEN    (RXPCOMMAALIGNEN),
    .RXMCOMMAALIGNEN    (RXMCOMMAALIGNEN),

    .RX8B10BEN          (RX8B10BEN),

    .RXCHARISCOMMA      (RXCHARISCOMMA),
    .RXCHARISK          (RXCHARISK),
    .RXDISPERR          (RXDISPERR),
    .RXNOTINTABLE       (RXNOTINTABLE),

    .serial_clk         (rx_serial_clk)
);

wire tx_piso_clk;
wire rx_sipo_clk;
gtxe2_chnl_clocking #(
    .CPLL_CFG           (CPLL_CFG),
    .CPLL_FBDIV         (CPLL_FBDIV),
    .CPLL_FBDIV_45      (CPLL_FBDIV_45),
    .CPLL_INIT_CFG      (CPLL_INIT_CFG),
    .CPLL_LOCK_CFG      (CPLL_LOCK_CFG),
    .CPLL_REFCLK_DIV    (CPLL_REFCLK_DIV),
    .RXOUT_DIV          (RXOUT_DIV),
    .TXOUT_DIV          (TXOUT_DIV),
    .SATA_CPLL_CFG      (SATA_CPLL_CFG),
    .PMA_RSV3           (PMA_RSV3),

    .TX_INT_DATAWIDTH   (TX_INT_DATAWIDTH),
    .TX_DATA_WIDTH      (TX_DATA_WIDTH),
    .RX_INT_DATAWIDTH   (RX_INT_DATAWIDTH),
    .RX_DATA_WIDTH      (RX_DATA_WIDTH)
) clocking_i ( // was "clocking" w/o "_i" - is it a keyword?
    .CPLLREFCLKSEL      (CPLLREFCLKSEL),
    .GTREFCLK0          (GTREFCLK0),
    .GTREFCLK1          (GTREFCLK1),
    .GTNORTHREFCLK0     (GTNORTHREFCLK0),
    .GTNORTHREFCLK1     (GTNORTHREFCLK1),
    .GTSOUTHREFCLK0     (GTSOUTHREFCLK0),
    .GTSOUTHREFCLK1     (GTSOUTHREFCLK1),
    .GTGREFCLK          (GTGREFCLK),
    .QPLLCLK            (QPLLCLK),
    .QPLLREFCLK         (QPLLREFCLK ),
    .RXSYSCLKSEL        (RXSYSCLKSEL),
    .TXSYSCLKSEL        (TXSYSCLKSEL),
    .TXOUTCLKSEL        (TXOUTCLKSEL),
    .RXOUTCLKSEL        (RXOUTCLKSEL),
    .TXDLYBYPASS        (TXDLYBYPASS),
    .RXDLYBYPASS        (RXDLYBYPASS),
    .GTREFCLKMONITOR    (GTREFCLKMONITOR),

    .CPLLLOCKDETCLK     (CPLLLOCKDETCLK),
    .CPLLLOCKEN         (CPLLLOCKEN),
    .CPLLPD             (CPLLPD),
    .CPLLRESET          (CPLLRESET),
    .CPLLFBCLKLOST      (CPLLFBCLKLOST),
    .CPLLLOCK           (CPLLLOCK),
    .CPLLREFCLKLOST     (CPLLREFCLKLOST),

    .TXRATE             (TXRATE),
    .RXRATE             (RXRATE),

    .TXOUTCLKPMA        (TXOUTCLKPMA),
    .TXOUTCLKPCS        (TXOUTCLKPCS),
    .TXOUTCLK           (TXOUTCLK),
    .TXOUTCLKFABRIC     (TXOUTCLKFABRIC),
    .tx_serial_clk      (tx_serial_clk),
    .tx_piso_clk        (tx_piso_clk),

    .GTRSVD             (GTRSVD),
    .PCSRSVDIN          (PCSRSVDIN),
    .PCSRSVDIN2         (PCSRSVDIN2),
    .PMARSVDIN          (PMARSVDIN),
    .PMARSVDIN2         (PMARSVDIN2),
    .TSTIN              (TSTIN),
    .TSTOUT             (TSTOUT),
    
    .RXOUTCLKPMA        (RXOUTCLKPMA),
    .RXOUTCLKPCS        (RXOUTCLKPCS),
    .RXOUTCLK           (RXOUTCLK),
    .RXOUTCLKFABRIC     (RXOUTCLKFABRIC),
    .rx_serial_clk      (rx_serial_clk),
    .rx_sipo_clk        (rx_sipo_clk)
);


endmodule

module GTXE2_GPL(
// clocking ports, UG476 p.37
    input   [2:0]       CPLLREFCLKSEL,
    input               GTGREFCLK,
    input               GTNORTHREFCLK0,
    input               GTNORTHREFCLK1,
    input               GTREFCLK0,
    input               GTREFCLK1,
    input               GTSOUTHREFCLK0,
    input               GTSOUTHREFCLK1,
    input   [1:0]       RXSYSCLKSEL,
    input   [1:0]       TXSYSCLKSEL,
    output              GTREFCLKMONITOR,
// CPLL Ports, UG476 p.48
    input               CPLLLOCKDETCLK,
    input               CPLLLOCKEN,
    input               CPLLPD,
    input               CPLLRESET,
    output              CPLLFBCLKLOST,
    output              CPLLLOCK,
    output              CPLLREFCLKLOST,
    output  [9:0]       TSTOUT,
    input   [15:0]      GTRSVD,
    input   [15:0]      PCSRSVDIN,
    input   [4:0]       PCSRSVDIN2,
    input   [4:0]       PMARSVDIN,
    input   [4:0]       PMARSVDIN2,
    input   [19:0]      TSTIN,
// Reset Mode ports, ug476 p.62
    input               GTRESETSEL,
    input               RESETOVRD,
// TX Reset ports, ug476 p.65
    input               CFGRESET,
    input               GTTXRESET,
    input               TXPCSRESET,
    input               TXPMARESET,
    output              TXRESETDONE,
    input               TXUSERRDY,
    output  [15:0]      PCSRSVDOUT,
// RX Reset ports, UG476 p.73
    input               GTRXRESET,
    input               RXPMARESET,
    input               RXCDRRESET,
    input               RXCDRFREQRESET,
    input               RXDFELPMRESET,
    input               EYESCANRESET,
    input               RXPCSRESET,
    input               RXBUFRESET,
    input               RXUSERRDY,
    output              RXRESETDONE,
    input               RXOOBRESET,
// Power Down ports, ug476 p.88
    input   [1:0]       RXPD,
    input   [1:0]       TXPD,
    input               TXPDELECIDLEMODE,
    input               TXPHDLYPD,
    input               RXPHDLYPD,
// Loopback ports, ug476 p.91
    input   [2:0]       LOOPBACK,
// Dynamic Reconfiguration Port, ug476 p.92
    input   [8:0]       DRPADDR,
    input               DRPCLK,
    input   [15:0]      DRPDI,
    output  [15:0]      DRPDO,
    input               DRPEN,
    output              DRPRDY,
    input               DRPWE,
// Digital Monitor Ports, ug476 p.95
    input   [3:0]       CLKRSVD,
    output  [7:0]       DMONITOROUT,
// TX Interface Ports, ug476 p.110
    input   [7:0]       TXCHARDISPMODE,
    input   [7:0]       TXCHARDISPVAL,
    input   [63:0]      TXDATA,
    input               TXUSRCLK,
    input               TXUSRCLK2,
// TX 8B/10B encoder ports, ug476 p.118
    input   [7:0]       TX8B10BBYPASS,
    input               TX8B10BEN,
    input   [7:0]       TXCHARISK,
// TX Gearbox ports, ug476 p.122
    output              TXGEARBOXREADY,
    input   [2:0]       TXHEADER,
    input   [6:0]       TXSEQUENCE,
    input               TXSTARTSEQ,
// TX BUffer Ports, ug476 p.134
    output  [1:0]       TXBUFSTATUS,
// TX Buffer Bypass Ports, ug476 p.136
    input               TXDLYSRESET,
    input               TXPHALIGN,
    input               TXPHALIGNEN,
    input               TXPHINIT,
    input               TXPHOVRDEN,
    input               TXPHDLYRESET,
    input               TXDLYBYPASS,
    input               TXDLYEN,
    input               TXDLYOVRDEN,
    input               TXPHDLYTSTCLK,
    input               TXDLYHOLD,
    input               TXDLYUPDOWN,
    output              TXPHALIGNDONE,
    output              TXPHINITDONE,
    output              TXDLYSRESETDONE,
/*    input               TXSYNCMODE,
    input               TXSYNCALLIN,
    input               TXSYNCIN,
    output              TXSYNCOUT,
    output              TXSYNCDONE,*/
// TX Pattern Generator, ug476 p.147
    input   [2:0]       TXPRBSSEL,
    input               TXPRBSFORCEERR,
// TX Polarity Control Ports, ug476 p.149
    input               TXPOLARITY,
// TX Fabric Clock Output Control Ports, ug476 p.152
    input   [2:0]       TXOUTCLKSEL,
    input   [2:0]       TXRATE,
    output              TXOUTCLKFABRIC,
    output              TXOUTCLK,
    output              TXOUTCLKPCS,
    output              TXRATEDONE,
// TX Phase Interpolator PPM Controller Ports, ug476 p.154
// GTH only
/*    input               TXPIPPMEN,
    input               TXPIPPMOVRDEN,
    input               TXPIPPMSEL,
    input               TXPIPPMPD,
    input   [4:0]       TXPIPPMSTEPSIZE,*/
// TX Configurable Driver Ports, ug476 p.156
    input   [2:0]       TXBUFDIFFCTRL,
    input               TXDEEMPH,
    input   [3:0]       TXDIFFCTRL,
    input               TXELECIDLE,
    input               TXINHIBIT,
    input   [6:0]       TXMAINCURSOR,
    input   [2:0]       TXMARGIN,
    input               TXQPIBIASEN,
    output              TXQPISENN,
    output              TXQPISENP,
    input               TXQPISTRONGPDOWN,
    input               TXQPIWEAKPUP,
    input   [4:0]       TXPOSTCURSOR,
    input               TXPOSTCURSORINV,
    input   [4:0]       TXPRECURSOR,
    input               TXPRECURSORINV,
    input               TXSWING,
    input               TXDIFFPD,
    input               TXPISOPD,
// TX Receiver Detection Ports, ug476 p.165
    input               TXDETECTRX,
    output              PHYSTATUS,
    output  [2:0]       RXSTATUS,
// TX OOB Signaling Ports, ug476 p.166
    output              TXCOMFINISH,
    input               TXCOMINIT,
    input               TXCOMSAS,
    input               TXCOMWAKE,
// RX AFE Ports, ug476 p.171
    output              RXQPISENN,
    output              RXQPISENP,
    input               RXQPIEN,
// RX OOB Signaling Ports, ug476 p.178
    input   [1:0]       RXELECIDLEMODE,
    output              RXELECIDLE,
    output              RXCOMINITDET,
    output              RXCOMSASDET,
    output              RXCOMWAKEDET,
// RX Equalizer Ports, ug476 p.189
    input               RXLPMEN,
    input               RXOSHOLD,
    input               RXOSOVRDEN,
    input               RXLPMLFHOLD,
    input               RXLPMLFKLOVRDEN,
    input               RXLPMHFHOLD,
    input               RXLPMHFOVRDEN,
    input               RXDFEAGCHOLD,
    input               RXDFEAGCOVRDEN,
    input               RXDFELFHOLD,
    input               RXDFELFOVRDEN,
    input               RXDFEUTHOLD,
    input               RXDFEUTOVRDEN,
    input               RXDFEVPHOLD,
    input               RXDFEVPOVRDEN,
    input               RXDFETAP2HOLD,
    input               RXDFETAP2OVRDEN,
    input               RXDFETAP3HOLD,
    input               RXDFETAP3OVRDEN,
    input               RXDFETAP4HOLD,
    input               RXDFETAP4OVRDEN,
    input               RXDFETAP5HOLD,
    input               RXDFETAP5OVRDEN,
    input               RXDFECM1EN,
    input               RXDFEXYDHOLD,
    input               RXDFEXYDOVRDEN,
    input               RXDFEXYDEN,
    input   [1:0]       RXMONITORSEL,
    output  [6:0]       RXMONITOROUT,
// CDR Ports, ug476 p.202
    input               RXCDRHOLD,
    input               RXCDROVRDEN,
    input               RXCDRRESETRSV,
    input   [2:0]       RXRATE,
    output              RXCDRLOCK,
// RX Fabric Clock Output Control Ports, ug476 p.213
    input   [2:0]       RXOUTCLKSEL,
    output              RXOUTCLKFABRIC,
    output              RXOUTCLK,
    output              RXOUTCLKPCS,
    output              RXRATEDONE,
    input               RXDLYBYPASS,
// RX Margin Analysis Ports, ug476 p.220
    output              EYESCANDATAERROR,
    input               EYESCANTRIGGER,
    input               EYESCANMODE,
// RX Polarity Control Ports, ug476 p.224
    input               RXPOLARITY,
// Pattern Checker Ports, ug476 p.225
    input               RXPRBSCNTRESET,
    input   [2:0]       RXPRBSSEL,
    output              RXPRBSERR,
// RX Byte and Word Alignment Ports, ug476 p.233
    output              RXBYTEISALIGNED,
    output              RXBYTEREALIGN,
    output              RXCOMMADET,
    input               RXCOMMADETEN,
    input               RXPCOMMAALIGNEN,
    input               RXMCOMMAALIGNEN,
    input               RXSLIDE,
// RX 8B/10B Decoder Ports, ug476 p.241
    input               RX8B10BEN,
    output  [7:0]       RXCHARISCOMMA,
    output  [7:0]       RXCHARISK,
    output  [7:0]       RXDISPERR,
    output  [7:0]       RXNOTINTABLE,
    input               SETERRSTATUS,
// RX Buffer Bypass Ports, ug476 p.244
    input               RXPHDLYRESET,
    input               RXPHALIGN,
    input               RXPHALIGNEN,
    input               RXPHOVRDEN,
    input               RXDLYSRESET,
    input               RXDLYEN,
    input               RXDLYOVRDEN,
    input               RXDDIEN,
    output              RXPHALIGNDONE,
    output  [4:0]       RXPHMONITOR,
    output  [4:0]       RXPHSLIPMONITOR,
    output              RXDLYSRESETDONE,
// RX Buffer Ports, ug476 p.259
    output  [2:0]       RXBUFSTATUS,
// RX Clock Correction Ports, ug476 p.263
    output  [1:0]       RXCLKCORCNT,
// RX Channel Bonding Ports, ug476 p.274
    output              RXCHANBONDSEQ,
    output              RXCHANISALIGNED,
    output              RXCHANREALIGN,
    input   [4:0]       RXCHBONDI,
    output  [4:0]       RXCHBONDO,
    input   [2:0]       RXCHBONDLEVEL,
    input               RXCHBONDMASTER,
    input               RXCHBONDSLAVE,
    input               RXCHBONDEN,
// RX Gearbox Ports, ug476 p.285
    output              RXDATAVALID,
    input               RXGEARBOXSLIP,
    output  [2:0]       RXHEADER,
    output              RXHEADERVALID,
    output              RXSTARTOFSEQ,
// FPGA RX Interface Ports, ug476 p.299
    output  [63:0]      RXDATA,
    input               RXUSRCLK,
    input               RXUSRCLK2,

// ug476, p.323
    output              RXVALID,
// for correct clocking scheme in case of multilane structure
    input               QPLLCLK,
    input               QPLLREFCLK,
    
// dunno
    input               RXDFEVSEN,

// Diffpairs
    input               GTXRXP,
    input               GTXRXN,
    output              GTXTXN,
    output              GTXTXP
);
// simulation common attributes, UG476 p.28
parameter   SIM_RESET_SPEEDUP            = "TRUE";
parameter   SIM_CPLLREFCLK_SEL           = 3'b001;
parameter   SIM_RECEIVER_DETECT_PASS     = "TRUE"; 
parameter   SIM_TX_EIDLE_DRIVE_LEVEL     = "X";
parameter   SIM_VERSION                  = "1.0";
// Clocking Atributes, UG476 p.38
parameter   OUTREFCLK_SEL_INV            = 1'b0;
// CPLL Attributes, UG476 p.49
parameter   CPLL_CFG                     = 24'h0;
parameter   CPLL_FBDIV                   = 4;
parameter   CPLL_FBDIV_45                = 5;
parameter   CPLL_INIT_CFG                = 24'h0;
parameter   CPLL_LOCK_CFG                = 16'h0;
parameter   CPLL_REFCLK_DIV              = 1;
parameter   RXOUT_DIV                    = 2;
parameter   TXOUT_DIV                    = 2;
parameter   SATA_CPLL_CFG                = "VCO_3000MHZ";
parameter   PMA_RSV3                     = 2'b00;
// TX Initialization and Reset Attributes, ug476 p.66
parameter   TXPCSRESET_TIME              = 5'b00001;
parameter   TXPMARESET_TIME              = 5'b00001;
// RX Initialization and Reset Attributes, UG476 p.75
parameter   RXPMARESET_TIME              = 5'h0;
parameter   RXCDRPHRESET_TIME            = 5'h0;
parameter   RXCDRFREQRESET_TIME          = 5'h0;
parameter   RXDFELPMRESET_TIME           = 7'h0;
parameter   RXISCANRESET_TIME            = 7'h0;
parameter   RXPCSRESET_TIME              = 5'h0;
parameter   RXBUFRESET_TIME              = 5'h0;
// Power Down attributes, ug476 p.88
parameter   PD_TRANS_TIME_FROM_P2        = 12'h0;
parameter   PD_TRANS_TIME_NONE_P2        = 8'h0;
parameter   PD_TRANS_TIME_TO_P2          = 8'h0;
parameter   TRANS_TIME_RATE              = 8'h0;
parameter   RX_CLKMUX_PD                 = 1'b0;
parameter   TX_CLKMUX_PD                 = 1'b0;
// GTX Digital Monitor Attributes, ug476 p.96
parameter   DMONITOR_CFG                 = 24'h008101;
// TX Interface attributes, ug476 p.111
parameter   TX_DATA_WIDTH                = 20;
parameter   TX_INT_DATAWIDTH             = 0;
// TX Gearbox Attributes, ug476 p.121
parameter   GEARBOX_MODE                 = 3'h0;
parameter   TXGEARBOX_EN                 = "FALSE";
// TX BUffer Attributes, ug476 p.134
parameter   TXBUF_EN                     = "TRUE";
// TX Bypass buffer, ug476 p.138
parameter   TX_XCLK_SEL                  = "TXOUT";
parameter   TXPH_CFG                     = 16'h0;
parameter   TXPH_MONITOR_SEL             = 5'h0;
parameter   TXPHDLY_CFG                  = 24'h0;
parameter   TXDLY_CFG                    = 16'h0;
parameter   TXDLY_LCFG                   = 9'h0;
parameter   TXDLY_TAP_CFG                = 16'h0;
parameter   TXSYNC_MULTILANE             = 1'b0;
parameter   TXSYNC_SKIP_DA               = 1'b0;
parameter   TXSYNC_OVRD                  = 1'b1;
parameter   LOOPBACK_CFG                 = 1'b0;
// TX Pattern Generator, ug476 p.147
parameter   RXPRBS_ERR_LOOPBACK          = 1'b0;
// TX Fabric Clock Output Control Attributes, ug476 p. 153
parameter   TXBUF_RESET_ON_RATE_CHANGE   = "TRUE";
// TX Phase Interpolator PPM Controller Attributes, ug476 p.155
// GTH only
/*parameter   TXPI_SYNCFREQ_PPM            = 3'b001;
parameter   TXPI_PPM_CFG                 = 8'd0;
parameter   TXPI_INVSTROBE_SEL           = 1'b0;
parameter   TXPI_GREY_SEL                = 1'b0;
parameter   TXPI_PPMCLK_SEL              = "12345";*/
// TX Configurable Driver Attributes, ug476 p.162
parameter   TX_DEEMPH0                   = 5'b10100;
parameter   TX_DEEMPH1                   = 5'b01101;
parameter   TX_DRIVE_MODE                = "DIRECT";
parameter   TX_MAINCURSOR_SEL            = 1'b0;
parameter   TX_MARGIN_FULL_0             = 7'b0;
parameter   TX_MARGIN_FULL_1             = 7'b0;
parameter   TX_MARGIN_FULL_2             = 7'b0;
parameter   TX_MARGIN_FULL_3             = 7'b0;
parameter   TX_MARGIN_FULL_4             = 7'b0;
parameter   TX_MARGIN_LOW_0              = 7'b0;
parameter   TX_MARGIN_LOW_1              = 7'b0;
parameter   TX_MARGIN_LOW_2              = 7'b0;
parameter   TX_MARGIN_LOW_3              = 7'b0;
parameter   TX_MARGIN_LOW_4              = 7'b0;
parameter   TX_PREDRIVER_MODE            = 1'b0;
parameter   TX_QPI_STATUS_EN             = 1'b0;
parameter   TX_EIDLE_ASSERT_DELAY        = 3'b110;
parameter   TX_EIDLE_DEASSERT_DELAY      = 3'b100;
parameter   TX_LOOPBACK_DRIVE_HIZ        = "FALSE";
// TX Receiver Detection Attributes, ug476 p.165
parameter   TX_RXDETECT_CFG              = 14'h0;
parameter   TX_RXDETECT_REF              = 3'h0;
// TX OOB Signaling Attributes
parameter   SATA_BURST_SEQ_LEN           = 4'b0101;
// RX AFE Attributes, ug476 p.171
parameter   RX_CM_SEL                    = 2'b11;
parameter   TERM_RCAL_CFG                = 5'b0;
parameter   TERM_RCAL_OVRD               = 1'b0;
parameter   RX_CM_TRIM                   = 3'b010;
// RX OOB Signaling Attributes, ug476 p.179
parameter   PCS_RSVD_ATTR                = 48'h0100; // oob is up
parameter   RXOOB_CFG                    = 7'b0000110;
parameter   SATA_BURST_VAL               = 3'b110;
parameter   SATA_EIDLE_VAL               = 3'b110;
parameter   SAS_MIN_COM                  = 36;
parameter   SATA_MIN_INIT                = 12;
parameter   SATA_MIN_WAKE                = 4;
parameter   SATA_MAX_BURST               = 8;
parameter   SATA_MIN_BURST               = 4;
parameter   SAS_MAX_COM                  = 64;
parameter   SATA_MAX_INIT                = 21;
parameter   SATA_MAX_WAKE                = 7;
// RX Equalizer Attributes, ug476 p.193
parameter   RX_OS_CFG                    = 13'h0080;
parameter   RXLPM_LF_CFG                 = 14'h00f0;
parameter   RXLPM_HF_CFG                 = 14'h00f0;
parameter   RX_DFE_LPM_CFG               = 16'h0;
parameter   RX_DFE_GAIN_CFG              = 23'h020FEA;
parameter   RX_DFE_H2_CFG                = 12'h0;
parameter   RX_DFE_H3_CFG                = 12'h040;
parameter   RX_DFE_H4_CFG                = 11'h0e0;
parameter   RX_DFE_H5_CFG                = 11'h0e0;
parameter   PMA_RSV                      = 32'h00018480;
parameter   RX_DFE_LPM_HOLD_DURING_EIDLE = 1'b0;
parameter   RX_DFE_XYD_CFG               = 13'h0;
parameter   PMA_RSV4                     = 32'h0;
parameter   PMA_RSV2                     = 16'h0;
parameter   RX_BIAS_CFG                  = 12'h040;
parameter   RX_DEBUG_CFG                 = 12'h0;
parameter   RX_DFE_KL_CFG                = 13'h0;
parameter   RX_DFE_KL_CFG2               = 32'h0;
parameter   RX_DFE_UT_CFG                = 17'h11e00;
parameter   RX_DFE_VP_CFG                = 17'h03f03;
// CDR Attributes, ug476 p.203
parameter   RXCDR_CFG                    = 72'h0;
parameter   RXCDR_LOCK_CFG               = 6'h0;
parameter   RXCDR_HOLD_DURING_EIDLE      = 1'b0;
parameter   RXCDR_FR_RESET_ON_EIDLE      = 1'b0;
parameter   RXCDR_PH_RESET_ON_EIDLE      = 1'b0;
// RX Fabric Clock Output Control Attributes
parameter   RXBUF_RESET_ON_RATE_CHANGE   = "TRUE";
// RX Margin Analysis Attributes
parameter   ES_VERT_OFFSET               = 9'h0;
parameter   ES_HORZ_OFFSET               = 12'h0;
parameter   ES_PRESCALE                  = 5'h0;
parameter   ES_SDATA_MASK                = 80'h0;
parameter   ES_QUALIFIER                 = 80'h0;
parameter   ES_QUAL_MASK                 = 80'h0;
parameter   ES_EYE_SCAN_EN               = 1'b1;
parameter   ES_ERRDET_EN                 = 1'b0;
parameter   ES_CONTROL                   = 6'h0;
parameter   es_control_status            = 4'b000;
parameter   es_rdata                     = 80'h0;
parameter   es_sdata                     = 80'h0;
parameter   es_error_count               = 16'h0;
parameter   es_sample_count              = 16'h0;
parameter   RX_DATA_WIDTH                = 20;
parameter   RX_INT_DATAWIDTH             = 0;
parameter   ES_PMA_CFG                   = 10'h0;
// Pattern Checker Attributes, ug476 p.226
parameter   RX_PRBS_ERR_CNT              = 16'h15c;
// RX Byte and Word Alignment Attributes, ug476 p.235
parameter   ALIGN_COMMA_WORD             = 1;
parameter   ALIGN_COMMA_ENABLE           = 10'b1111111111;
parameter   ALIGN_COMMA_DOUBLE           = "FALSE";
parameter   ALIGN_MCOMMA_DET             = "TRUE";
parameter   ALIGN_MCOMMA_VALUE           = 10'b1010000011;
parameter   ALIGN_PCOMMA_DET             = "TRUE";
parameter   ALIGN_PCOMMA_VALUE           = 10'b0101111100;
parameter   SHOW_REALIGN_COMMA           = "TRUE";
parameter   RXSLIDE_MODE                 = "OFF";
parameter   RXSLIDE_AUTO_WAIT            = 7;
parameter   RX_SIG_VALID_DLY             = 10;
parameter   COMMA_ALIGN_LATENCY          = 9'h14e;
// RX 8B/10B Decoder Attributes, ug476 p.242
parameter   RX_DISPERR_SEQ_MATCH         = "TRUE";
parameter   DEC_MCOMMA_DETECT            = "TRUE";
parameter   DEC_PCOMMA_DETECT            = "TRUE";
parameter   DEC_VALID_COMMA_ONLY         = "FALSE";
parameter   UCODEER_CLR                  = 1'b0;
// RX Buffer Bypass Attributes, ug476 p.247
parameter   RXBUF_EN                     = "TRUE";
parameter   RX_XCLK_SEL                  = "RXREC";
parameter   RXPH_CFG                     = 24'h0;
parameter   RXPH_MONITOR_SEL             = 5'h0;
parameter   RXPHDLY_CFG                  = 24'h0;
parameter   RXDLY_CFG                    = 16'h0;
parameter   RXDLY_LCFG                   = 9'h0;
parameter   RXDLY_TAP_CFG                = 16'h0;
parameter   RX_DDI_SEL                   = 6'h0;
parameter   TST_RSV                      = 32'h0;
// RX Buffer Attributes, ug476 p.259
parameter   RX_BUFFER_CFG                = 6'b0;
parameter   RX_DEFER_RESET_BUF_EN        = "TRUE";
parameter   RXBUF_ADDR_MODE              = "FAST";
parameter   RXBUF_EIDLE_HI_CNT           = 4'b0;
parameter   RXBUF_EIDLE_LO_CNT           = 4'b0;
parameter   RXBUF_RESET_ON_CB_CHANGE     = "TRUE";
parameter   RXBUF_RESET_ON_COMMAALIGN    = "FALSE";
parameter   RXBUF_RESET_ON_EIDLE         = "FALSE";
parameter   RXBUF_THRESH_OVFLW           = 0;
parameter   RXBUF_THRESH_OVRD            = "FALSE";
parameter   RXBUF_THRESH_UNDFLW          = 0;
// RX Clock Correction Attributes, ug476 p.265
parameter   CBCC_DATA_SOURCE_SEL         = "DECODED";
parameter   CLK_CORRECT_USE              = "FALSE";
parameter   CLK_COR_SEQ_2_USE            = "FALSE";
parameter   CLK_COR_KEEP_IDLE            = "FALSE";
parameter   CLK_COR_MAX_LAT              = 9;
parameter   CLK_COR_MIN_LAT              = 7;
parameter   CLK_COR_PRECEDENCE           = "TRUE";
parameter   CLK_COR_REPEAT_WAIT          = 0;
parameter   CLK_COR_SEQ_LEN              = 1;
parameter   CLK_COR_SEQ_1_ENABLE         = 4'b1111;
parameter   CLK_COR_SEQ_1_1              = 10'b0;
parameter   CLK_COR_SEQ_1_2              = 10'b0;
parameter   CLK_COR_SEQ_1_3              = 10'b0;
parameter   CLK_COR_SEQ_1_4              = 10'b0;
parameter   CLK_COR_SEQ_2_ENABLE         = 4'b1111;
parameter   CLK_COR_SEQ_2_1              = 10'b0;
parameter   CLK_COR_SEQ_2_2              = 10'b0;
parameter   CLK_COR_SEQ_2_3              = 10'b0;
parameter   CLK_COR_SEQ_2_4              = 10'b0;
// RX Channel Bonding Attributes, ug476 p.276
parameter   CHAN_BOND_MAX_SKEW           = 1;
parameter   CHAN_BOND_KEEP_ALIGN         = "FALSE";
parameter   CHAN_BOND_SEQ_LEN            = 1;
parameter   CHAN_BOND_SEQ_1_1            = 10'b0;
parameter   CHAN_BOND_SEQ_1_2            = 10'b0;
parameter   CHAN_BOND_SEQ_1_3            = 10'b0;
parameter   CHAN_BOND_SEQ_1_4            = 10'b0;
parameter   CHAN_BOND_SEQ_1_ENABLE       = 4'b1111;
parameter   CHAN_BOND_SEQ_2_1            = 10'b0;
parameter   CHAN_BOND_SEQ_2_2            = 10'b0;
parameter   CHAN_BOND_SEQ_2_3            = 10'b0;
parameter   CHAN_BOND_SEQ_2_4            = 10'b0;
parameter   CHAN_BOND_SEQ_2_ENABLE       = 4'b1111;
parameter   CHAN_BOND_SEQ_2_USE          = "FALSE";
parameter   FTS_DESKEW_SEQ_ENABLE        = 4'b1111;
parameter   FTS_LANE_DESKEW_CFG          = 4'b1111;
parameter   FTS_LANE_DESKEW_EN           = "FALSE";
parameter   PCS_PCIE_EN                  = "FALSE";
// RX Gearbox Attributes, ug476 p.287
parameter   RXGEARBOX_EN                 = "FALSE";

// ug476 table p.326 - undocumented parameters
parameter   RX_CLK25_DIV                 = 6;
parameter   TX_CLK25_DIV                 = 6;

// clocking reset ( + TX PMA)
//wire clk_reset = EYESCANRESET | RXCDRFREQRESET | RXCDRRESET | RXCDRRESETRSV | RXPRBSCNTRESET | RXBUFRESET | RXDLYSRESET | RXPHDLYRESET | RXDFELPMRESET | GTRXRESET | RXOOBRESET | RXPCSRESET | RXPMARESET | CFGRESET | GTTXRESET | GTRESETSEL | RESETOVRD | TXDLYSRESET | TXPHDLYRESET | TXPCSRESET | TXPMARESET;
wire clk_reset = EYESCANRESET | RXCDRFREQRESET | RXCDRRESET | RXCDRRESETRSV | RXPRBSCNTRESET | RXBUFRESET | RXPHDLYRESET | RXDFELPMRESET | GTRXRESET | RXOOBRESET | RXPCSRESET | RXPMARESET | CFGRESET | GTTXRESET | GTRESETSEL | RESETOVRD | TXDLYSRESET | TXPHDLYRESET | TXPCSRESET | TXPMARESET;
// have to wait before an external pll (mmcm) locks with usrclk, after that PCS can be resetted. Actually, we reset PMA also, because why not
reg reset;
reg [31:0] reset_timer = 0;
always @ (posedge TXUSRCLK)
    reset_timer <= ~TXUSERRDY ? 32'h0 : reset_timer == 32'hffffffff ? reset_timer : reset_timer + 1'b1;

always @ (posedge TXUSRCLK)
    reset <= ~TXUSERRDY ? 1'b0 : reset_timer < 32'd20 ? 1'b1 : 1'b0;


reg rx_rst_done = 1'b0;
reg tx_rst_done = 1'b0;
reg rxcdrlock = 1'b0;
reg rxdlysresetdone = 1'b0;
reg rxphaligndone = 1'b0;

assign  RXRESETDONE = rx_rst_done;
assign  TXRESETDONE = tx_rst_done;

assign RXCDRLOCK =        rxcdrlock;
assign RXDLYSRESETDONE =  rxdlysresetdone;
assign RXPHALIGNDONE =    rxphaligndone;

localparam DRP_LATENCY = 5;
integer      drp_latency_counter;
reg          drp_rdy_r;
reg   [15:0] drp_ram[0:511];
reg   [ 8:0] drp_raddr;

assign DRPDO = drp_rdy_r ? drp_ram[drp_raddr] : 16'bz;
assign DRPRDY = drp_rdy_r;
always @ (posedge DRPCLK) begin
    if      (DRPEN)                    drp_latency_counter <= DRP_LATENCY;
    else if (drp_latency_counter != 0) drp_latency_counter <= drp_latency_counter - 1;
    
    if (DRPEN && DRPWE) drp_ram[DRPADDR] <= DRPDI;
    
    drp_rdy_r <= (drp_latency_counter == 1);
    
    if (DRPEN) drp_raddr <= DRPADDR;
end

wire reset_or_GTRXRESET = reset || GTRXRESET;

initial
forever @ (posedge reset_or_GTRXRESET)
begin
    tx_rst_done <= 1'b0;
    @ (negedge reset_or_GTRXRESET);
    repeat (80)
        @ (posedge GTREFCLK0);
    tx_rst_done <= 1'b1;
end
initial
forever @ (posedge reset_or_GTRXRESET)
begin
    rx_rst_done <= 1'b0;
    @ (negedge reset_or_GTRXRESET);
    repeat (100)
        @ (posedge GTREFCLK0);
    rx_rst_done <= 1'b1;
end
localparam RXCDRLOCK_DELAY = 10; // Refclk periods
localparam RXDLYSRESET_MIN_DURATION = 50; // ns 
localparam RXDLYSRESETDONE_DELAY = 10;
localparam RXDLYSRESETDONE_DURATION = 7; // 100ns
localparam RXPHALIGNDONE_DELAY1 = 15;    // 0.45 usec from the end of reset (measured)
localparam RXPHALIGNDONE_DURATION1 = 7;
localparam RXPHALIGNDONE_DELAY2 = 311;    // 4.9 usec from the end of reset (measured)

initial forever @ (posedge (reset || RXELECIDLE)) begin
    rxcdrlock <= 1'b0;
    @ (negedge (reset || RXELECIDLE));
    repeat (RXCDRLOCK_DELAY) @ (posedge GTREFCLK0);
    rxcdrlock <= 1'b1;
    
end

initial forever @ (posedge RXDLYSRESET) begin
    rxdlysresetdone <= 1'b0;
    rxphaligndone <= 1'b0;
    # (RXDLYSRESET_MIN_DURATION);
    if (!RXDLYSRESET) begin
        $display ("%m: RXDLYSRESET is too short - minimal duration is 50 nsec");
    end else begin
        @ (negedge RXDLYSRESET);
//        if (!RXELECIDLE && rxcdrlock) begin
        if (!RXELECIDLE) begin // removed that condition - rxcdrlock seems to go up/down (SS?)
            repeat (RXDLYSRESETDONE_DELAY) @ (posedge GTREFCLK0);
            rxdlysresetdone <= 1'b1;
            repeat (RXDLYSRESETDONE_DURATION) @ (posedge GTREFCLK0);
            rxdlysresetdone <= 1'b0;
            repeat (RXPHALIGNDONE_DELAY1) @ (posedge GTREFCLK0);
            rxphaligndone <= 1'b1;
            repeat (RXPHALIGNDONE_DURATION1) @ (posedge GTREFCLK0);
            rxphaligndone <= 1'b0;
            repeat (RXPHALIGNDONE_DELAY2) @ (posedge GTREFCLK0);
            rxphaligndone <= 1'b1;
        end else $display ("%m: RXELECIDLE in active or rxcdrlock is inactive when applying RXDLYSRESET"); 
    end
end
//RXELECIDLE
gtxe2_chnl #(
    .CPLL_CFG               (CPLL_CFG),
    .CPLL_FBDIV             (CPLL_FBDIV),
    .CPLL_FBDIV_45          (CPLL_FBDIV_45),
    .CPLL_INIT_CFG          (CPLL_INIT_CFG),
    .CPLL_LOCK_CFG          (CPLL_LOCK_CFG),
    .CPLL_REFCLK_DIV        (CPLL_REFCLK_DIV),
    .RXOUT_DIV              (RXOUT_DIV),
    .TXOUT_DIV              (TXOUT_DIV),
    .SATA_CPLL_CFG          (SATA_CPLL_CFG),
    .PMA_RSV3               (PMA_RSV3),

    .TX_INT_DATAWIDTH       (TX_INT_DATAWIDTH),
    .TX_DATA_WIDTH          (TX_DATA_WIDTH),

    .RX_DATA_WIDTH          (RX_DATA_WIDTH),
    .RX_INT_DATAWIDTH       (RX_INT_DATAWIDTH),

    .DEC_MCOMMA_DETECT      (DEC_MCOMMA_DETECT),
    .DEC_PCOMMA_DETECT      (DEC_PCOMMA_DETECT),

    .ALIGN_MCOMMA_VALUE     (ALIGN_MCOMMA_VALUE),
    .ALIGN_MCOMMA_DET       (ALIGN_MCOMMA_DET),
    .ALIGN_PCOMMA_VALUE     (ALIGN_PCOMMA_VALUE),
    .ALIGN_PCOMMA_DET       (ALIGN_PCOMMA_DET),
    .ALIGN_COMMA_ENABLE     (ALIGN_COMMA_ENABLE),
    .ALIGN_COMMA_DOUBLE     (ALIGN_COMMA_DOUBLE),

    .TX_DATA_WIDTH          (TX_DATA_WIDTH),
    .TX_INT_DATAWIDTH       (TX_INT_DATAWIDTH),

    .SATA_BURST_SEQ_LEN     (SATA_BURST_SEQ_LEN)
)
channel(
    .reset                  (reset),
    .TXP                    (GTXTXP),
    .TXN                    (GTXTXN),

    .TXDATA                 (TXDATA),
    .TXUSRCLK               (TXUSRCLK),
    .TXUSRCLK2              (TXUSRCLK2),

    .TX8B10BBYPASS          (TX8B10BBYPASS),
    .TX8B10BEN              (TX8B10BEN),
    .TXCHARDISPMODE         (TXCHARDISPMODE),
    .TXCHARDISPVAL          (TXCHARDISPVAL),
    .TXCHARISK              (TXCHARISK),

    .TXBUFSTATUS            (TXBUFSTATUS),

    .TXPOLARITY             (TXPOLARITY),

    .TXRATE                 (TXRATE),
    .RXRATE                 (RXRATE),
    .TXRATEDONE             (TXRATEDONE),

    .TXCOMINIT              (TXCOMINIT),
    .TXCOMWAKE              (TXCOMWAKE),
    .TXCOMFINISH            (TXCOMFINISH),

    .TXELECIDLE             (TXELECIDLE),

    .RXP                    (GTXRXP),
    .RXN                    (GTXRXN),

    .RXUSRCLK               (RXUSRCLK),
    .RXUSRCLK2              (RXUSRCLK2),

    .RXDATA                 (RXDATA),

    .RXELECIDLEMODE         (RXELECIDLEMODE),
    .RXELECIDLE             (RXELECIDLE),
    .RXCOMINITDET           (RXCOMINITDET),
    .RXCOMWAKEDET           (RXCOMWAKEDET),

    .RXPOLARITY             (RXPOLARITY),

    .RXBYTEISALIGNED        (RXBYTEISALIGNED),
    .RXBYTEREALIGN          (RXBYTEREALIGN),
    .RXCOMMADET             (RXCOMMADET),

    .RXCOMMADETEN           (RXCOMMADETEN),
    .RXPCOMMAALIGNEN        (RXPCOMMAALIGNEN),
    .RXMCOMMAALIGNEN        (RXMCOMMAALIGNEN),

    .RX8B10BEN              (RX8B10BEN),

    .RXCHARISCOMMA          (RXCHARISCOMMA),
    .RXCHARISK              (RXCHARISK),
    .RXDISPERR              (RXDISPERR),
    .RXNOTINTABLE           (RXNOTINTABLE),

    .CPLLREFCLKSEL          (CPLLREFCLKSEL),
    .GTREFCLK0              (GTREFCLK0),
    .GTREFCLK1              (GTREFCLK1),
    .GTNORTHREFCLK0         (GTNORTHREFCLK0),
    .GTNORTHREFCLK1         (GTNORTHREFCLK1),
    .GTSOUTHREFCLK0         (GTSOUTHREFCLK0),
    .GTSOUTHREFCLK1         (GTSOUTHREFCLK1),
    .GTGREFCLK              (GTGREFCLK),
    .QPLLCLK                (QPLLCLK),
    .QPLLREFCLK             (QPLLREFCLK),
    .RXSYSCLKSEL            (RXSYSCLKSEL),
    .TXSYSCLKSEL            (TXSYSCLKSEL),
    .TXOUTCLKSEL            (TXOUTCLKSEL),
    .RXOUTCLKSEL            (RXOUTCLKSEL),
    .TXDLYBYPASS            (TXDLYBYPASS),
    .GTREFCLKMONITOR        (GTREFCLKMONITOR),

    .CPLLLOCKDETCLK         (CPLLLOCKDETCLK ),
    .CPLLLOCKEN             (CPLLLOCKEN),
    .CPLLPD                 (CPLLPD),
    .CPLLRESET              (CPLLRESET),
    .CPLLFBCLKLOST          (CPLLFBCLKLOST),
    .CPLLLOCK               (CPLLLOCK),
    .CPLLREFCLKLOST         (CPLLREFCLKLOST),

    .GTRSVD                 (GTRSVD),
    .PCSRSVDIN              (PCSRSVDIN),
    .PCSRSVDIN2             (PCSRSVDIN2),
    .PMARSVDIN              (PMARSVDIN),
    .PMARSVDIN2             (PMARSVDIN2),
    .TSTIN                  (TSTIN),
    .TSTOUT                 (TSTOUT),
    
    .TXOUTCLKPMA            (),
    .TXOUTCLKPCS            (TXOUTCLKPCS),
    .TXOUTCLK               (TXOUTCLK),
    .TXOUTCLKFABRIC         (TXOUTCLKFABRIC),
    .tx_serial_clk          (),

    .RXOUTCLKPMA            (),
    .RXOUTCLKPCS            (RXOUTCLKPCS),
    .RXOUTCLK               (RXOUTCLK),
    .RXOUTCLKFABRIC         (RXOUTCLKFABRIC),
    .rx_serial_clk          (),

    .RXDLYBYPASS            (RXDLYBYPASS)
);


endmodule
            
        

