// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/******************************************************************************

SDRAM read / write by rs232 port.

接收串行数据格式:

struct {
    u8: read = 0xfe, write = 0xfd
    u24: extends to 32-bits address (8'b0 + u24)
    u32: data
}

输出串行数据格式:

u32: data

******************************************************************************/

module top (
    input clk,
    input rst_n,
    input in_rx_data,
    input out_tx_data,
    output sdr_clk,
    output sdr_cs_n,
    output sdr_ras_n,
    output sdr_cas_n,
    output sdr_we_n,
    output [1:0] sdr_ba,
    output [12:0] sdr_addr,
    output [1:0] sdr_dqm,
    inout [15:0] inout_sdr_dq
);

    wire clk_100m;
    wire clk_100m_shift;
    wire pll_rst_n;

    sdr_pll sdr_pll_inst (
        .inclk0 (clk),
        .c0 (clk_100m),
        .c1 (clk_100m_shift),
        .locked (pll_locked)
    );

    assign pll_rst_n = rst_n & pll_locked;

    wire op_ack;
    wire [7:0] op;
    wire [31:0] address;
    wire [31:0] data;

    rx_fsm rx_fsm_inst (
        .clk_wr (clk),
        .clk_rd (clk_100m),
        .wr_rst_n (rst_n),
        .rd_rst_n (pll_rst_n),
        .in_rx_data (in_rx_data),
        .op_ack (op_ack),
        .op (op),
        .address (address),
        .data (data)
    );



    reg sdr_fifo_wr_en;


    reg sdr_fifo_rd_en;
    wire sdr_fifo_rd_empty;
    wire [63:0] sdr_fifo_rd_data;


endmodule
