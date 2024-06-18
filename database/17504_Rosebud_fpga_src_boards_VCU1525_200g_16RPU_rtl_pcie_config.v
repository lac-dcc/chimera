// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

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

`resetall
`timescale 1ns / 1ps
`default_nettype none

module pcie_config # (
  parameter PCIE_ADDR_WIDTH         = 64,
  parameter PCIE_RAM_ADDR_WIDTH     = 32,
  parameter PCIE_DMA_LEN_WIDTH      = 16,
  parameter HOST_DMA_TAG_WIDTH      = 32,
  parameter AXIL_DATA_WIDTH         = 32,
  parameter AXIL_STRB_WIDTH         = (AXIL_DATA_WIDTH/8),
  parameter AXIL_ADDR_WIDTH         = 32,
  parameter IF_COUNT                = 2,
  parameter PORTS_PER_IF            = 1,
  parameter FW_ID                   = 32'd0,
  parameter FW_VER                  = {16'd0, 16'd1},
  parameter BOARD_ID                = {16'h1ce4, 16'h0003},
  parameter BOARD_VER               = {16'd0, 16'd1},
  parameter FPGA_ID                 = 32'h3823093
) (
  input  wire                           clk,
  input  wire                           rst,

  // AXI lite
  input  wire [AXIL_ADDR_WIDTH-1:0]     axil_ctrl_awaddr,
  input  wire [2:0]                     axil_ctrl_awprot,
  input  wire                           axil_ctrl_awvalid,
  output reg                            axil_ctrl_awready,
  input  wire [AXIL_DATA_WIDTH-1:0]     axil_ctrl_wdata,
  input  wire [AXIL_STRB_WIDTH-1:0]     axil_ctrl_wstrb,
  input  wire                           axil_ctrl_wvalid,
  output reg                            axil_ctrl_wready,
  output wire [1:0]                     axil_ctrl_bresp,
  output reg                            axil_ctrl_bvalid,
  input  wire                           axil_ctrl_bready,
  input  wire [AXIL_ADDR_WIDTH-1:0]     axil_ctrl_araddr,
  input  wire [2:0]                     axil_ctrl_arprot,
  input  wire                           axil_ctrl_arvalid,
  output reg                            axil_ctrl_arready,
  output reg  [AXIL_DATA_WIDTH-1:0]     axil_ctrl_rdata,
  output wire [1:0]                     axil_ctrl_rresp,
  output reg                            axil_ctrl_rvalid,
  input  wire                           axil_ctrl_rready,

  // DMA requests from Host
  output reg  [PCIE_ADDR_WIDTH-1:0]     host_dma_read_desc_pcie_addr,
  output reg  [PCIE_RAM_ADDR_WIDTH-1:0] host_dma_read_desc_ram_addr,
  output reg  [PCIE_DMA_LEN_WIDTH-1:0]  host_dma_read_desc_len,
  output reg  [HOST_DMA_TAG_WIDTH-1:0]  host_dma_read_desc_tag,
  output reg                            host_dma_read_desc_valid,
  input  wire                           host_dma_read_desc_ready,
  input  wire [HOST_DMA_TAG_WIDTH-1:0]  host_dma_read_desc_status_tag,
  input  wire                           host_dma_read_desc_status_valid,

  output reg  [PCIE_ADDR_WIDTH-1:0]     host_dma_write_desc_pcie_addr,
  output reg  [PCIE_RAM_ADDR_WIDTH-1:0] host_dma_write_desc_ram_addr,
  output reg  [PCIE_DMA_LEN_WIDTH-1:0]  host_dma_write_desc_len,
  output reg  [HOST_DMA_TAG_WIDTH-1:0]  host_dma_write_desc_tag,
  output reg                            host_dma_write_desc_valid,
  input  wire                           host_dma_write_desc_ready,
  input  wire [HOST_DMA_TAG_WIDTH-1:0]  host_dma_write_desc_status_tag,
  input  wire                           host_dma_write_desc_status_valid,

  // I2C and config
  input  wire                           i2c_scl_i,
  output reg                            i2c_scl_o,
  output reg                            i2c_scl_t,
  input  wire                           i2c_sda_i,
  output reg                            i2c_sda_o,
  output reg                            i2c_sda_t,

  output wire                           qsfp0_modsell,
  output reg                            qsfp0_resetl,
  input  wire                           qsfp0_modprsl,
  input  wire                           qsfp0_intl,
  output reg                            qsfp0_lpmode,

  output wire                           qsfp1_modsell,
  output reg                            qsfp1_resetl,
  input  wire                           qsfp1_modprsl,
  input  wire                           qsfp1_intl,
  output reg                            qsfp1_lpmode,

  // Host commands
  output reg  [31:0]                    host_cmd,
  output reg  [31:0]                    host_cmd_wr_data,
  input  wire [31:0]                    host_cmd_rd_data,
  output reg                            host_cmd_valid,
  input  wire                           host_cmd_ready,

  // PCIe DMA enable and interrupts
  output reg                            pcie_dma_enable,
  output reg                            corundum_loopback,
  input  wire [31:0]                    if_msi_irq,
  output wire [31:0]                    msi_irq
);

// Interface and port count, and address space allocation. If corundum is used.
parameter IF_AXIL_ADDR_WIDTH  = AXIL_ADDR_WIDTH-$clog2(IF_COUNT);
parameter AXIL_CSR_ADDR_WIDTH = IF_AXIL_ADDR_WIDTH-5-$clog2((PORTS_PER_IF+3)/8);

// State registers for readback
reg [HOST_DMA_TAG_WIDTH-1:0]  host_dma_read_status_tags;
reg [HOST_DMA_TAG_WIDTH-1:0]  host_dma_write_status_tags;

assign axil_ctrl_bresp  = 2'b00;
assign axil_ctrl_rresp  = 2'b00;

reg i2c_scl_i_r;
reg i2c_scl_o_r;
reg i2c_sda_i_r;
reg i2c_sda_o_r;
reg qsfp0_resetl_r;
reg qsfp0_modprsl_r;
reg qsfp0_intl_r;
reg qsfp0_lpmode_r;
reg qsfp1_resetl_r;
reg qsfp1_modprsl_r;
reg qsfp1_intl_r;
reg qsfp1_lpmode_r;

reg i2c_scl_i_rr;
reg i2c_scl_o_rr;
reg i2c_scl_t_rr;
reg i2c_sda_i_rr;
reg i2c_sda_o_rr;
reg qsfp0_resetl_rr;
reg qsfp0_modprsl_rr;
reg qsfp0_intl_rr;
reg qsfp0_lpmode_rr;
reg qsfp1_resetl_rr;
reg qsfp1_modprsl_rr;
reg qsfp1_intl_rr;
reg qsfp1_lpmode_rr;

assign qsfp0_modsell = 1'b0;
assign qsfp1_modsell = 1'b0;

always @(posedge clk) begin
    if (rst) begin
        axil_ctrl_awready          <= 1'b0;
        axil_ctrl_wready           <= 1'b0;
        axil_ctrl_bvalid           <= 1'b0;
        axil_ctrl_arready          <= 1'b0;
        axil_ctrl_rvalid           <= 1'b0;

        host_dma_read_desc_valid   <= 1'b0;
        host_dma_write_desc_valid  <= 1'b0;
        host_cmd_valid             <= 1'b0;
        host_dma_read_status_tags  <= {HOST_DMA_TAG_WIDTH{1'b0}};
        host_dma_write_status_tags <= {HOST_DMA_TAG_WIDTH{1'b0}};
        pcie_dma_enable            <= 1'b1;
        corundum_loopback          <= 1'b0;

        qsfp0_lpmode_r             <= 1'b0;
        qsfp1_lpmode_r             <= 1'b0;
        qsfp0_resetl_r             <= 1'b1;
        qsfp1_resetl_r             <= 1'b1;
        i2c_scl_o_r                <= 1'b1;
        i2c_sda_o_r                <= 1'b1;

    end else begin

        axil_ctrl_awready <= 1'b0;
        axil_ctrl_wready  <= 1'b0;
        axil_ctrl_bvalid  <= axil_ctrl_bvalid && !axil_ctrl_bready;
        axil_ctrl_arready <= 1'b0;
        axil_ctrl_rvalid  <= axil_ctrl_rvalid && !axil_ctrl_rready;

        host_dma_read_desc_valid  <= host_dma_read_desc_valid && !host_dma_read_desc_ready;
        host_dma_write_desc_valid <= host_dma_write_desc_valid && !host_dma_write_desc_ready;
        host_cmd_valid            <= host_cmd_valid && !host_cmd_ready;

        if (axil_ctrl_awvalid && axil_ctrl_wvalid && !axil_ctrl_bvalid) begin
            // write operation
            axil_ctrl_awready <= 1'b1;
            axil_ctrl_wready  <= 1'b1;
            axil_ctrl_bvalid  <= 1'b1;

            case ({axil_ctrl_awaddr[15:2], 2'b00})
                // GPIO
                16'h0110: begin
                    // GPIO I2C 0
                    if (axil_ctrl_wstrb[0]) begin
                        i2c_scl_o_r <= axil_ctrl_wdata[1];
                    end
                    if (axil_ctrl_wstrb[1]) begin
                        i2c_sda_o_r <= axil_ctrl_wdata[9];
                    end
                end
                16'h0120: begin
                    // GPIO XCVR 0123
                    if (axil_ctrl_wstrb[0]) begin
                        qsfp0_resetl_r <= !axil_ctrl_wdata[4];
                        qsfp0_lpmode_r <= axil_ctrl_wdata[5];
                    end
                    if (axil_ctrl_wstrb[1]) begin
                        qsfp1_resetl_r <= !axil_ctrl_wdata[12];
                        qsfp1_lpmode_r <= axil_ctrl_wdata[13];
                    end
                end

                // Cores control
                16'h0400: pcie_dma_enable  <= axil_ctrl_wdata[0];
                16'h0404: host_cmd_wr_data <= axil_ctrl_wdata;
                16'h0408: begin
                    host_cmd       <= axil_ctrl_wdata;
                    host_cmd_valid <= 1'b1;
                end

                // DMA request
                16'h0440: host_dma_read_desc_pcie_addr[31:0] <= axil_ctrl_wdata;
                16'h0444: host_dma_read_desc_pcie_addr[63:32] <= axil_ctrl_wdata;
                16'h0448: host_dma_read_desc_ram_addr[31:0] <= axil_ctrl_wdata;
                16'h0450: host_dma_read_desc_len <= axil_ctrl_wdata;
                16'h0454: begin
                    host_dma_read_desc_tag <= axil_ctrl_wdata;
                    host_dma_read_desc_valid <= 1'b1;
                end
                16'h0460: host_dma_write_desc_pcie_addr[31:0] <= axil_ctrl_wdata;
                16'h0464: host_dma_write_desc_pcie_addr[63:32] <= axil_ctrl_wdata;
                16'h0468: host_dma_write_desc_ram_addr[31:0] <= axil_ctrl_wdata;
                16'h0470: host_dma_write_desc_len <= axil_ctrl_wdata;
                16'h0474: begin
                    host_dma_write_desc_tag <= axil_ctrl_wdata;
                    host_dma_write_desc_valid <= 1'b1;
                end
                16'h0480: corundum_loopback <= axil_ctrl_wdata[0];
            endcase
        end

        if (axil_ctrl_arvalid && !axil_ctrl_rvalid) begin
            // read operation
            axil_ctrl_arready <= 1'b1;
            axil_ctrl_rvalid  <= 1'b1;
            axil_ctrl_rdata   <= {AXIL_DATA_WIDTH{1'b0}};

            case ({axil_ctrl_araddr[15:2], 2'b00})
                16'h0000: axil_ctrl_rdata <= FW_ID;      // fw_id
                16'h0004: axil_ctrl_rdata <= FW_VER;     // fw_ver
                16'h0008: axil_ctrl_rdata <= BOARD_ID;   // board_id
                16'h000C: axil_ctrl_rdata <= BOARD_VER;  // board_ver
                16'h0010: axil_ctrl_rdata <= 0;          // phc_count
                16'h0014: axil_ctrl_rdata <= 16'h0200;   // phc_offset
                16'h0018: axil_ctrl_rdata <= 16'h0080;   // phc_stride
                16'h0020: axil_ctrl_rdata <= IF_COUNT;   // if_count
                16'h0024: axil_ctrl_rdata <= 2**IF_AXIL_ADDR_WIDTH; // if_stride
                16'h002C: axil_ctrl_rdata <= 2**AXIL_CSR_ADDR_WIDTH; // if_ctrl_offset
                16'h0040: axil_ctrl_rdata <= FPGA_ID;    // fpga_id

                // GPIO
                16'h0110: begin
                    // GPIO I2C 0
                    axil_ctrl_rdata[0] <= i2c_scl_i_rr;
                    axil_ctrl_rdata[1] <= i2c_scl_o_rr;
                    axil_ctrl_rdata[8] <= i2c_sda_i_rr;
                    axil_ctrl_rdata[9] <= i2c_sda_o_rr;
                end
                16'h0120: begin
                    // GPIO XCVR 0123
                    axil_ctrl_rdata[0]  <= !qsfp0_modprsl_rr;
                    axil_ctrl_rdata[1]  <= !qsfp0_intl_rr;
                    axil_ctrl_rdata[4]  <= !qsfp0_resetl_rr;
                    axil_ctrl_rdata[5]  <= qsfp0_lpmode_rr;
                    axil_ctrl_rdata[8]  <= !qsfp1_modprsl_rr;
                    axil_ctrl_rdata[9]  <= !qsfp1_intl_rr;
                    axil_ctrl_rdata[12] <= !qsfp1_resetl_rr;
                    axil_ctrl_rdata[13] <= qsfp1_lpmode_rr;
                end

                // Cores control and DMA request response
                16'h0400: axil_ctrl_rdata <= pcie_dma_enable;
                16'h0404: axil_ctrl_rdata <= host_cmd_rd_data;
                16'h0458: axil_ctrl_rdata <= host_dma_read_status_tags;
                16'h0478: axil_ctrl_rdata <= host_dma_write_status_tags;
                16'h0480: axil_ctrl_rdata <= corundum_loopback;
            endcase
        end

        if (axil_ctrl_arvalid && !axil_ctrl_rvalid && ({axil_ctrl_araddr[15:2], 2'd0}==16'h0458))
            if (!host_dma_read_desc_status_valid)
                host_dma_read_status_tags <= {HOST_DMA_TAG_WIDTH{1'b0}};
            else
                host_dma_read_status_tags <= host_dma_read_desc_status_tag;
        else if (host_dma_read_desc_status_valid)
          host_dma_read_status_tags <= host_dma_read_status_tags | host_dma_read_desc_status_tag;

        if (axil_ctrl_arvalid && !axil_ctrl_rvalid && ({axil_ctrl_araddr[15:2], 2'd0}==16'h0478))
            if (!host_dma_write_desc_status_valid)
                host_dma_write_status_tags <= {HOST_DMA_TAG_WIDTH{1'b0}};
            else
                host_dma_write_status_tags <= host_dma_write_desc_status_tag;
        else if (host_dma_write_desc_status_valid)
          host_dma_write_status_tags <= host_dma_write_status_tags | host_dma_write_desc_status_tag;

    end
end

// One level register before i2c and flash input/outputs for better timing
always @(posedge clk)
    if (rst) begin
        qsfp0_lpmode     <= 1'b0;
        qsfp1_lpmode     <= 1'b0;
        qsfp0_resetl     <= 1'b1;
        qsfp1_resetl     <= 1'b1;
        i2c_scl_o        <= 1'b1;
        i2c_scl_t        <= 1'b1;
        i2c_sda_o        <= 1'b1;
        i2c_sda_t        <= 1'b1;
        qsfp0_lpmode_rr  <= 1'b0;
        qsfp1_lpmode_rr  <= 1'b0;
        qsfp0_resetl_rr  <= 1'b1;
        qsfp1_resetl_rr  <= 1'b1;
        i2c_scl_o_rr     <= 1'b1;
        i2c_scl_t_rr     <= 1'b1;
        i2c_sda_o_rr     <= 1'b1;

        i2c_scl_i_rr     <= 1'b1;
        i2c_sda_i_rr     <= 1'b1;
        qsfp0_modprsl_rr <= 1'b0;
        qsfp1_modprsl_rr <= 1'b0;
        qsfp0_intl_rr    <= 1'b0;
        qsfp1_intl_rr    <= 1'b0;
        i2c_scl_i_r      <= 1'b1;
        i2c_sda_i_r      <= 1'b1;
        qsfp0_modprsl_r  <= 1'b0;
        qsfp1_modprsl_r  <= 1'b0;
        qsfp0_intl_r     <= 1'b0;
        qsfp1_intl_r     <= 1'b0;
    end else begin
        qsfp0_lpmode     <= qsfp0_lpmode_rr;
        qsfp1_lpmode     <= qsfp1_lpmode_rr;
        qsfp0_resetl     <= qsfp0_resetl_rr;
        qsfp1_resetl     <= qsfp1_resetl_rr;
        i2c_scl_o        <= i2c_scl_o_rr;
        i2c_scl_t        <= i2c_scl_t_rr;
        i2c_sda_o        <= i2c_sda_o_rr;
        i2c_sda_t        <= i2c_sda_o_rr;
        qsfp0_lpmode_rr  <= qsfp0_lpmode_r;
        qsfp1_lpmode_rr  <= qsfp1_lpmode_r;
        qsfp0_resetl_rr  <= qsfp0_resetl_r;
        qsfp1_resetl_rr  <= qsfp1_resetl_r;
        i2c_scl_o_rr     <= i2c_scl_o_r;
        i2c_scl_t_rr     <= i2c_scl_o_r;
        i2c_sda_o_rr     <= i2c_sda_o_r;

        i2c_scl_i_rr     <= i2c_scl_i_r;
        i2c_sda_i_rr     <= i2c_sda_i_r;
        qsfp0_modprsl_rr <= qsfp0_modprsl_r;
        qsfp1_modprsl_rr <= qsfp1_modprsl_r;
        qsfp0_intl_rr    <= qsfp0_intl_r;
        qsfp1_intl_rr    <= qsfp1_intl_r;
        i2c_scl_i_r      <= i2c_scl_i;
        i2c_sda_i_r      <= i2c_sda_i;
        qsfp0_modprsl_r  <= qsfp0_modprsl;
        qsfp1_modprsl_r  <= qsfp1_modprsl;
        qsfp0_intl_r     <= qsfp0_intl;
        qsfp1_intl_r     <= qsfp1_intl;
    end

// assign msi_irq[0] = host_dma_read_desc_status_valid || host_dma_write_desc_status_valid;
assign msi_irq = if_msi_irq;

endmodule

`resetall
