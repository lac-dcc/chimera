// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// data from rx write to fifo, then read as u64

`include "op.v"

module rx_fsm #(
    parameter BAUD = 9600, // 波特率, 默认值 9600
    parameter SYS_CLK = 50_000_000 // 时钟频率, 默认值 50MHz
)
(
    input clk_wr,
    input clk_rd,
    input wr_rst_n,
    input rd_rst_n,
    input in_rx_data,
    input op_ack,
    output reg [7:0] op,
    output reg [31:0] address,
    output reg [31:0] data
);
    // fsm
    localparam
        IDLE  = 2'b00,
        FETCH = 2'b01,
        READY = 2'b11;


    reg [1:0] state;

    reg rd_req;
    wire wr_full;
    wire [7:0] rd_data;
    reg [3:0] rd_data_cnt;
    reg [63:0] rd_data_cache;

    wire rx_data_en;
    wire [7:0] rx_data;

    always @ (posedge clk_rd or negedge rd_rst_n) begin
        if (! rd_rst_n) begin
            state <= IDLE;
            rd_req <= 1'b0;
            rd_data_cnt <= 4'b0;
            rd_data_cache <= 64'b0;
            op <= 8'b0;
        end else begin
            case (state)
            IDLE: begin
                if (wr_full) begin
                    // 在下一个周期读取fifo:
                    state <= FETCH;
                    rd_req <= 1'b1;
                    rd_data_cnt <= 4'd7;
                end
            end
            FETCH: begin
                // 读fifo:
                if (rd_data_cnt > 0) begin
                    rd_data_cache[7:0] <= rd_data;
                    rd_data_cache[63:8] <= rd_data_cache[55:0];
                    rd_data_cnt <= rd_data_cnt + 1;
                end else begin
                    rd_req <= 1'b0;
                    if (rd_data_cache[63:56] == `OP_READ || rd_data_cache[63:56] == `OP_WRITE) begin
                        op <= rd_data_cache[63:56];
                        address <= {8'b0, rd_data_cache[55:32]};
                        data <= rd_data_cache[31:0];
                        state <= READY;
                    end else begin
                        state <= IDLE;
                    end
                end
            end
            READY: begin
                if (op_ack) begin
                    op <= 8'b0;
                    address <= 32'b0;
                    data <= 32'b0;
                    state <= IDLE;
                end
            end
            default: state <= IDLE;
            endcase
        end
    end

    fifo_async_8bit rx_fifo_inst (
        // 写入fifo:
        .wrclk (clk_wr),
	    .wrreq (rx_data_en),
	    .data (rx_data),
        .wrfull (wr_full),
        // 读取fifo:
	    .rdclk (clk_rd),
	    .rdreq (rd_req),
	    .q (rd_data)
	);

    uart_rx #(
        .BAUD (BAUD),
        .SYS_CLK (SYS_CLK)
    )
    uart_rx_inst (
        .clk (clk_wr),
        .rst_n (wr_rst_n),
        .in_data (in_rx_data),
        .out_en (rx_data_en),
        .out_data (rx_data)
    );

endmodule
