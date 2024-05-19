// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// read / write sdram

`include "op.v"

module sdram_fsm (
    input clk,
    input clk_for_sdr,
    input rst_n,

    input [7:0] op,
    input [31:0] address,
    input [31:0] data,
    output op_ack,

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

    assign sdr_clk = clk_for_sdr;

    localparam
        IDLE = 2'b00,
        READ = 2'b01,
        WRITE = 2'b10;

    reg [1:0] state;

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            state <= IDLE;
        end else begin
            case (state)
            IDLE: begin
                if (op == `OP_READ) begin
                end
            end
            READ: begin
            end
            WRITE: begin
            end
            default: state <= IDLE;
            endcase
        end
    end

    reg sdr_rd_req;
    reg sdr_wr_req;
    reg [31:0] sdr_wr_data;
    wire [31:0] sdr_rd_data;

    wire sdr_rd_ack;
    wire sdr_rd_done;
    wire sdr_wr_ack;

    sdram_ctrl sdram_ctrl_inst (
        .clk (clk_100m),
        .rst_n (pll_rst_n),
        .in_addr (addr),
        .in_rd_req (),
        .out_rd_ack (),
        .out_rd_data (sdr_rd_data),
        .out_rd_done (),
        .in_wr_req (),
        .in_wr_dqm (2'b00),
        .in_wr_data (),
        .out_wr_ack (),
        .out_wr_done (),

        // connect to sdr:
        .out_wr_dqm (sdr_dqm),
        .inout_data (inout_sdr_dq),
        .cmd ({sdr_cs_n, sdr_ras_n, sdr_cas_n, sdr_we_n}),
        .ba (sdr_ba),
        .addr (sdr_addr)
    );

endmodule
