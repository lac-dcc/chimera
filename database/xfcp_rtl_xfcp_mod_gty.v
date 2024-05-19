// This program was cloned from: https://github.com/alexforencich/xfcp
// License: MIT License

/*

Copyright (c) 2017-2022 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * XFCP GTY DRP module
 */
module xfcp_mod_gty #
(
    parameter XFCP_ID_TYPE = 16'h8A82,
    parameter XFCP_ID_STR = "GTY DRP",
    parameter XFCP_EXT_ID = 0,
    parameter XFCP_EXT_ID_STR = "",
    parameter ADDR_WIDTH = 10
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * XFCP upstream interface
     */
    input  wire [7:0]             up_xfcp_in_tdata,
    input  wire                   up_xfcp_in_tvalid,
    output wire                   up_xfcp_in_tready,
    input  wire                   up_xfcp_in_tlast,
    input  wire                   up_xfcp_in_tuser,

    output wire [7:0]             up_xfcp_out_tdata,
    output wire                   up_xfcp_out_tvalid,
    input  wire                   up_xfcp_out_tready,
    output wire                   up_xfcp_out_tlast,
    output wire                   up_xfcp_out_tuser,

    /*
     * Transceiver interface
     */
    output wire [ADDR_WIDTH-1:0]  gty_drp_addr,
    output wire [15:0]            gty_drp_do,
    input  wire [15:0]            gty_drp_di,
    output wire                   gty_drp_en,
    output wire                   gty_drp_we,
    input  wire                   gty_drp_rdy,

    output wire                   gty_reset,
    output wire                   gty_tx_pcs_reset,
    output wire                   gty_tx_pma_reset,
    output wire                   gty_rx_pcs_reset,
    output wire                   gty_rx_pma_reset,
    output wire                   gty_rx_dfe_lpm_reset,
    output wire                   gty_eyescan_reset,
    input  wire                   gty_tx_reset_done,
    input  wire                   gty_tx_pma_reset_done,
    input  wire                   gty_rx_reset_done,
    input  wire                   gty_rx_pma_reset_done,

    input  wire                   gty_txusrclk2,
    output wire [3:0]             gty_txprbssel,
    output wire                   gty_txprbsforceerr,
    output wire                   gty_txpolarity,
    output wire                   gty_txelecidle,
    output wire                   gty_txinhibit,
    output wire [4:0]             gty_txdiffctrl,
    output wire [6:0]             gty_txmaincursor,
    output wire [4:0]             gty_txpostcursor,
    output wire [4:0]             gty_txprecursor,

    input  wire                   gty_rxusrclk2,
    output wire                   gty_rxpolarity,
    output wire                   gty_rxprbscntreset,
    output wire [3:0]             gty_rxprbssel,
    input  wire                   gty_rxprbserr,
    input  wire                   gty_rxprbslocked
);

wire [ADDR_WIDTH+1-1:0] wb_adr;
wire [15:0] wb_dat_m;
wire [15:0] wb_dat_drp;
wire wb_we;
wire wb_stb;
wire wb_ack_drp;
wire wb_cyc;

reg [15:0] wb_dat_int_reg = 16'd0, wb_dat_int_next;
reg wb_ack_int_reg = 1'b0, wb_ack_int_next;

reg gty_reset_reg = 1'b0, gty_reset_next;
reg gty_tx_pcs_reset_reg = 1'b0, gty_tx_pcs_reset_next;
reg gty_tx_pma_reset_reg = 1'b0, gty_tx_pma_reset_next;
reg gty_rx_pcs_reset_reg = 1'b0, gty_rx_pcs_reset_next;
reg gty_rx_pma_reset_reg = 1'b0, gty_rx_pma_reset_next;
reg gty_rx_dfe_lpm_reset_reg = 1'b0, gty_rx_dfe_lpm_reset_next;
reg gty_eyescan_reset_reg = 1'b0, gty_eyescan_reset_next;

assign gty_reset = gty_reset_reg;
assign gty_tx_pcs_reset = gty_tx_pcs_reset_reg;
assign gty_tx_pma_reset = gty_tx_pma_reset_reg;
assign gty_rx_pcs_reset = gty_rx_pcs_reset_reg;
assign gty_rx_pma_reset = gty_rx_pma_reset_reg;
assign gty_rx_dfe_lpm_reset = gty_rx_dfe_lpm_reset_reg;
assign gty_eyescan_reset = gty_eyescan_reset_reg;

reg gty_tx_reset_done_reg = 1'b0;
reg gty_tx_reset_done_sync_1_reg = 1'b0, gty_tx_reset_done_sync_2_reg = 1'b0;
reg gty_tx_pma_reset_done_reg = 1'b0;
reg gty_tx_pma_reset_done_sync_1_reg = 1'b0, gty_tx_pma_reset_done_sync_2_reg = 1'b0;
reg gty_rx_reset_done_reg = 1'b0;
reg gty_rx_reset_done_sync_1_reg = 1'b0, gty_rx_reset_done_sync_2_reg = 1'b0;
reg gty_rx_pma_reset_done_reg = 1'b0;
reg gty_rx_pma_reset_done_sync_1_reg = 1'b0, gty_rx_pma_reset_done_sync_2_reg = 1'b0;

always @(posedge gty_txusrclk2) begin
    gty_tx_reset_done_reg <= gty_tx_reset_done;
    gty_tx_pma_reset_done_reg <= gty_tx_pma_reset_done;
end

always @(posedge gty_rxusrclk2) begin
    gty_rx_reset_done_reg <= gty_rx_reset_done;
    gty_rx_pma_reset_done_reg <= gty_rx_pma_reset_done;
end

always @(posedge clk) begin
    gty_tx_reset_done_sync_1_reg <= gty_tx_reset_done_reg;
    gty_tx_reset_done_sync_2_reg <= gty_tx_reset_done_sync_1_reg;
    gty_tx_pma_reset_done_sync_1_reg <= gty_tx_pma_reset_done_reg;
    gty_tx_pma_reset_done_sync_2_reg <= gty_tx_pma_reset_done_sync_1_reg;
    gty_rx_reset_done_sync_1_reg <= gty_rx_reset_done_reg;
    gty_rx_reset_done_sync_2_reg <= gty_rx_reset_done_sync_1_reg;
    gty_rx_pma_reset_done_sync_1_reg <= gty_rx_pma_reset_done_reg;
    gty_rx_pma_reset_done_sync_2_reg <= gty_rx_pma_reset_done_sync_1_reg;
end

reg [3:0] gty_txprbssel_reg = 4'd0, gty_txprbssel_next;
reg [3:0] gty_txprbssel_sync_reg = 4'd0;
reg gty_txprbsforceerr_reg = 1'b0, gty_txprbsforceerr_next;
reg gty_txprbsforceerr_sync_1_reg = 1'b0, gty_txprbsforceerr_sync_2_reg = 1'b0, gty_txprbsforceerr_sync_3_reg = 1'b0;
reg gty_txpolarity_reg = 1'b0, gty_txpolarity_next;
reg gty_txpolarity_sync_reg = 1'b0;
reg gty_txelecidle_reg = 1'b0, gty_txelecidle_next;
reg gty_txelecidle_sync_reg = 1'b0;
reg gty_txinhibit_reg = 1'b0, gty_txinhibit_next;
reg gty_txinhibit_sync_reg = 1'b0;
reg [4:0] gty_txdiffctrl_reg = 5'd16, gty_txdiffctrl_next;
reg [4:0] gty_txdiffctrl_sync_reg = 5'd16;
reg [6:0] gty_txmaincursor_reg = 7'd64, gty_txmaincursor_next;
reg [6:0] gty_txmaincursor_sync_reg = 7'd64;
reg [4:0] gty_txpostcursor_reg = 5'd0, gty_txpostcursor_next;
reg [4:0] gty_txpostcursor_sync_reg = 5'd0;
reg [4:0] gty_txprecursor_reg = 5'd0, gty_txprecursor_next;
reg [4:0] gty_txprecursor_sync_reg = 5'd0;

always @(posedge gty_txusrclk2) begin
    gty_txprbssel_sync_reg <= gty_txprbssel_reg;
    gty_txprbsforceerr_sync_1_reg <= gty_txprbsforceerr_reg;
    gty_txprbsforceerr_sync_2_reg <= gty_txprbsforceerr_sync_1_reg;
    gty_txprbsforceerr_sync_3_reg <= gty_txprbsforceerr_sync_2_reg;
    gty_txpolarity_sync_reg <= gty_txpolarity_reg;
    gty_txelecidle_sync_reg <= gty_txelecidle_reg;
    gty_txinhibit_sync_reg <= gty_txinhibit_reg;
    gty_txdiffctrl_sync_reg <= gty_txdiffctrl_reg;
    gty_txmaincursor_sync_reg <= gty_txmaincursor_reg;
    gty_txpostcursor_sync_reg <= gty_txpostcursor_reg;
    gty_txprecursor_sync_reg <= gty_txprecursor_reg;
end

assign gty_txprbssel = gty_txprbssel_sync_reg;
assign gty_txprbsforceerr = gty_txprbsforceerr_sync_2_reg ^ gty_txprbsforceerr_sync_3_reg;
assign gty_txpolarity = gty_txpolarity_sync_reg;
assign gty_txelecidle = gty_txelecidle_sync_reg;
assign gty_txinhibit = gty_txinhibit_sync_reg;
assign gty_txdiffctrl = gty_txdiffctrl_sync_reg;
assign gty_txmaincursor = gty_txmaincursor_sync_reg;
assign gty_txpostcursor = gty_txpostcursor_sync_reg;
assign gty_txprecursor = gty_txprecursor_sync_reg;

reg gty_rxpolarity_reg = 1'b0, gty_rxpolarity_next;
reg gty_rxpolarity_sync_reg = 1'b0;
reg gty_rxprbscntreset_reg = 1'b0, gty_rxprbscntreset_next;
reg gty_rxprbscntreset_sync_1_reg = 1'b0, gty_rxprbscntreset_sync_2_reg = 1'b0, gty_rxprbscntreset_sync_3_reg = 1'b0;
reg [3:0] gty_rxprbssel_reg = 4'd0, gty_rxprbssel_next;
reg [3:0] gty_rxprbssel_sync_reg = 4'd0;
reg gty_rxprbserr_reg = 1'b0, gty_rxprbserr_next;
reg gty_rxprbserr_sync_1_reg = 1'b0, gty_rxprbserr_sync_2_reg = 1'b0, gty_rxprbserr_sync_3_reg = 1'b0;
reg gty_rxprbserr_sync_4_reg = 1'b0, gty_rxprbserr_sync_5_reg = 1'b0;
reg gty_rxprbslocked_reg = 1'b0;
reg gty_rxprbslocked_sync_1_reg = 1'b0, gty_rxprbslocked_sync_2_reg = 1'b0;

always @(posedge gty_rxusrclk2) begin
    gty_rxpolarity_sync_reg <= gty_rxpolarity_reg;
    gty_rxprbscntreset_sync_1_reg <= gty_rxprbscntreset_reg;
    gty_rxprbscntreset_sync_2_reg <= gty_rxprbscntreset_sync_1_reg;
    gty_rxprbscntreset_sync_3_reg <= gty_rxprbscntreset_sync_2_reg;
    gty_rxprbssel_sync_reg <= gty_rxprbssel_reg;
    gty_rxprbserr_sync_1_reg <= (gty_rxprbserr_sync_1_reg && !gty_rxprbserr_sync_5_reg) || gty_rxprbserr;
    gty_rxprbserr_sync_4_reg <= gty_rxprbserr_sync_3_reg;
    gty_rxprbserr_sync_5_reg <= gty_rxprbserr_sync_4_reg;
    gty_rxprbslocked_reg <= gty_rxprbslocked;
end

always @(posedge clk) begin
    gty_rxprbserr_sync_2_reg <= gty_rxprbserr_sync_1_reg;
    gty_rxprbserr_sync_3_reg <= gty_rxprbserr_sync_2_reg;
    gty_rxprbslocked_sync_1_reg <= gty_rxprbslocked_reg;
    gty_rxprbslocked_sync_2_reg <= gty_rxprbslocked_sync_1_reg;
end

assign gty_rxpolarity = gty_rxpolarity_sync_reg;
assign gty_rxprbscntreset = gty_rxprbscntreset_sync_2_reg ^ gty_rxprbscntreset_sync_3_reg;
assign gty_rxprbssel = gty_rxprbssel_sync_reg;

wire sel_drp = !wb_adr[ADDR_WIDTH];

always @* begin
    wb_dat_int_next = 16'd0;
    wb_ack_int_next = 1'b0;

    gty_reset_next = gty_reset_reg;
    gty_tx_pcs_reset_next = gty_tx_pcs_reset_reg;
    gty_tx_pma_reset_next = gty_tx_pma_reset_reg;
    gty_rx_pcs_reset_next = gty_rx_pcs_reset_reg;
    gty_rx_pma_reset_next = gty_rx_pma_reset_reg;
    gty_rx_dfe_lpm_reset_next = gty_rx_dfe_lpm_reset_reg;
    gty_eyescan_reset_next = gty_eyescan_reset_reg;

    gty_txprbssel_next = gty_txprbssel_reg;
    gty_txprbsforceerr_next = gty_txprbsforceerr_reg;
    gty_txpolarity_next = gty_txpolarity_reg;
    gty_txelecidle_next = gty_txelecidle_reg;
    gty_txinhibit_next = gty_txinhibit_reg;
    gty_txdiffctrl_next = gty_txdiffctrl_reg;
    gty_txmaincursor_next = gty_txmaincursor_reg;
    gty_txpostcursor_next = gty_txpostcursor_reg;
    gty_txprecursor_next = gty_txprecursor_reg;

    gty_rxpolarity_next = gty_rxpolarity_reg;
    gty_rxprbscntreset_next = gty_rxprbscntreset_reg;
    gty_rxprbssel_next = gty_rxprbssel_reg;
    gty_rxprbserr_next = gty_rxprbserr_reg || gty_rxprbserr_sync_3_reg;

    if (!sel_drp && wb_cyc && wb_stb && !wb_ack_int_reg) begin
        if (wb_we) begin
            // write
            case (wb_adr[7:0])
                8'h00: begin
                    gty_reset_next = wb_dat_m[0];
                    gty_tx_pcs_reset_next = wb_dat_m[1];
                    gty_tx_pma_reset_next = wb_dat_m[2];
                    gty_rx_pcs_reset_next = wb_dat_m[3];
                    gty_rx_pma_reset_next = wb_dat_m[4];
                    gty_rx_dfe_lpm_reset_next = wb_dat_m[5];
                    gty_eyescan_reset_next = wb_dat_m[6];
                end
                8'h01: begin
                    gty_txpolarity_next = wb_dat_m[0];
                    gty_rxpolarity_next = wb_dat_m[1];
                end
                8'h02: begin
                    gty_txprbssel_next = wb_dat_m[3:0];
                    gty_rxprbssel_next = wb_dat_m[7:4];
                end
                8'h03: begin
                    gty_txprbsforceerr_next = gty_txprbsforceerr_reg ^ wb_dat_m[0];
                    gty_rxprbscntreset_next = gty_rxprbscntreset_reg ^ wb_dat_m[1];
                end
                8'h04: begin
                    gty_txelecidle_next = wb_dat_m[0];
                    gty_txinhibit_next = wb_dat_m[1];
                end
                8'h05: begin
                    gty_txdiffctrl_next = wb_dat_m[4:0];
                end
                8'h06: begin
                    gty_txmaincursor_next = wb_dat_m[6:0];
                end
                8'h07: begin
                    gty_txpostcursor_next = wb_dat_m[4:0];
                end
                8'h08: begin
                    gty_txprecursor_next = wb_dat_m[4:0];
                end
            endcase
            wb_ack_int_next = 1'b1;
        end else begin
            // read
            case (wb_adr[7:0])
                8'h00: begin
                    wb_dat_int_next[0] = gty_reset_reg;
                    wb_dat_int_next[1] = gty_tx_pcs_reset_reg;
                    wb_dat_int_next[2] = gty_tx_pma_reset_reg;
                    wb_dat_int_next[3] = gty_rx_pcs_reset_reg;
                    wb_dat_int_next[4] = gty_rx_pma_reset_reg;
                    wb_dat_int_next[5] = gty_rx_dfe_lpm_reset_reg;
                    wb_dat_int_next[6] = gty_eyescan_reset_reg;
                    wb_dat_int_next[8] = gty_tx_reset_done_sync_2_reg;
                    wb_dat_int_next[9] = gty_tx_pma_reset_done_sync_2_reg;
                    wb_dat_int_next[10] = gty_rx_reset_done_sync_2_reg;
                    wb_dat_int_next[11] = gty_rx_pma_reset_done_sync_2_reg;
                end
                8'h01: begin
                    wb_dat_int_next[0] = gty_txpolarity_reg;
                    wb_dat_int_next[1] = gty_rxpolarity_reg;
                end
                8'h02: begin
                    wb_dat_int_next[3:0] = gty_txprbssel_reg;
                    wb_dat_int_next[7:4] = gty_rxprbssel_reg;
                end
                8'h03: begin
                    wb_dat_int_next[2] = gty_rxprbserr_reg;
                    wb_dat_int_next[3] = gty_rxprbslocked_sync_2_reg;

                    gty_rxprbserr_next = gty_rxprbserr_sync_3_reg;
                end
                8'h04: begin
                    wb_dat_int_next[0] = gty_txelecidle_reg;
                    wb_dat_int_next[1] = gty_txinhibit_reg;
                end
                8'h05: begin
                    wb_dat_int_next[4:0] = gty_txdiffctrl_reg;
                end
                8'h06: begin
                    wb_dat_int_next[6:0] = gty_txmaincursor_reg;
                end
                8'h07: begin
                    wb_dat_int_next[4:0] = gty_txpostcursor_reg;
                end
                8'h08: begin
                    wb_dat_int_next[4:0] = gty_txprecursor_reg;
                end
            endcase
            wb_ack_int_next = 1'b1;
        end
    end
end

always @(posedge clk) begin
    wb_dat_int_reg <= wb_dat_int_next;
    wb_ack_int_reg <= wb_ack_int_next;

    gty_reset_reg <= gty_reset_next;
    gty_tx_pcs_reset_reg <= gty_tx_pcs_reset_next;
    gty_tx_pma_reset_reg <= gty_tx_pma_reset_next;
    gty_rx_pcs_reset_reg <= gty_rx_pcs_reset_next;
    gty_rx_pma_reset_reg <= gty_rx_pma_reset_next;
    gty_rx_dfe_lpm_reset_reg <= gty_rx_dfe_lpm_reset_next;
    gty_eyescan_reset_reg <= gty_eyescan_reset_next;

    gty_txprbssel_reg <= gty_txprbssel_next;
    gty_txprbsforceerr_reg <= gty_txprbsforceerr_next;
    gty_txpolarity_reg <= gty_txpolarity_next;
    gty_txelecidle_reg <= gty_txelecidle_next;
    gty_txinhibit_reg <= gty_txinhibit_next;
    gty_txdiffctrl_reg <= gty_txdiffctrl_next;
    gty_txmaincursor_reg <= gty_txmaincursor_next;
    gty_txpostcursor_reg <= gty_txpostcursor_next;
    gty_txprecursor_reg <= gty_txprecursor_next;

    gty_rxpolarity_reg <= gty_rxpolarity_next;
    gty_rxprbscntreset_reg <= gty_rxprbscntreset_next;
    gty_rxprbssel_reg <= gty_rxprbssel_next;
    gty_rxprbserr_reg <= gty_rxprbserr_next;

    if (rst) begin
        wb_ack_int_reg <= 1'b0;
        gty_reset_reg <= 1'b0;
        gty_tx_pcs_reset_reg <= 1'b0;
        gty_tx_pma_reset_reg <= 1'b0;
        gty_rx_pcs_reset_reg <= 1'b0;
        gty_rx_pma_reset_reg <= 1'b0;
        gty_rx_dfe_lpm_reset_reg <= 1'b0;
        gty_eyescan_reset_reg <= 1'b0;
        gty_txprbssel_reg <= 4'd0;
        gty_txprbsforceerr_reg <= 1'b0;
        gty_txpolarity_reg <= 1'b0;
        gty_txelecidle_reg <= 1'b0;
        gty_txinhibit_reg <= 1'b0;
        gty_txdiffctrl_reg <= 5'd16;
        gty_txmaincursor_reg <= 7'd64;
        gty_txpostcursor_reg <= 5'd0;
        gty_txprecursor_reg <= 5'd0;
        gty_rxpolarity_reg <= 1'b0;
        gty_rxprbscntreset_reg <= 1'b0;
        gty_rxprbssel_reg <= 4'd0;
        gty_rxprbserr_reg <= 1'b0;
    end
end

xfcp_mod_wb #(
    .XFCP_ID_TYPE(XFCP_ID_TYPE),
    .XFCP_ID_STR(XFCP_ID_STR),
    .XFCP_EXT_ID(XFCP_EXT_ID),
    .XFCP_EXT_ID_STR(XFCP_EXT_ID_STR),
    .COUNT_SIZE(16),
    .WB_DATA_WIDTH(16),
    .WB_ADDR_WIDTH(ADDR_WIDTH+1),
    .WB_SELECT_WIDTH(1)
)
xfcp_mod_wb_inst (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(up_xfcp_in_tdata),
    .up_xfcp_in_tvalid(up_xfcp_in_tvalid),
    .up_xfcp_in_tready(up_xfcp_in_tready),
    .up_xfcp_in_tlast(up_xfcp_in_tlast),
    .up_xfcp_in_tuser(up_xfcp_in_tuser),
    .up_xfcp_out_tdata(up_xfcp_out_tdata),
    .up_xfcp_out_tvalid(up_xfcp_out_tvalid),
    .up_xfcp_out_tready(up_xfcp_out_tready),
    .up_xfcp_out_tlast(up_xfcp_out_tlast),
    .up_xfcp_out_tuser(up_xfcp_out_tuser),
    .wb_adr_o(wb_adr),
    .wb_dat_i(wb_ack_int_reg ? wb_dat_int_reg : wb_dat_drp),
    .wb_dat_o(wb_dat_m),
    .wb_we_o(wb_we),
    .wb_sel_o(),
    .wb_stb_o(wb_stb),
    .wb_ack_i(wb_ack_int_reg ? wb_ack_int_reg : wb_ack_drp),
    .wb_err_i(1'b0),
    .wb_cyc_o(wb_cyc)
);

wb_drp #(
    .ADDR_WIDTH(ADDR_WIDTH)
)
wb_drp_inst (
    .clk(clk),
    .rst(rst),
    .wb_adr_i(wb_adr[ADDR_WIDTH-1:0]),
    .wb_dat_i(wb_dat_m),
    .wb_dat_o(wb_dat_drp),
    .wb_we_i(wb_we),
    .wb_stb_i(wb_stb && sel_drp),
    .wb_ack_o(wb_ack_drp),
    .wb_cyc_i(wb_cyc && sel_drp),
    .drp_addr(gty_drp_addr),
    .drp_do(gty_drp_do),
    .drp_di(gty_drp_di),
    .drp_en(gty_drp_en),
    .drp_we(gty_drp_we),
    .drp_rdy(gty_drp_rdy)
);

endmodule
