// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

module ins_buffer #(
    parameter INS_BUFFER_DATA = 96,
    parameter INS_BUFFER_SIZE = 8,
    parameter INS_BUFFER_SIZE_WIDTH = 3
) (
    input clk,
    input reset,
    input flush,
    input [31:0] pc_in,
    input [31:0] next_pc_in,
    input [31:0] instruction_in,
    input rd_en,//from decode
    input wr_en,//from fetch
    // from fu

    output [31:0] pc_out,
    output [31:0] next_pc_out,
    output [31:0] instruction_out,
    output reg ins_full, //to fetch
    output reg ins_empty //to decode
);
wire [INS_BUFFER_DATA-1:0] buffer_input_line;
reg [INS_BUFFER_DATA-1:0] buffer_output_line;
assign buffer_input_line[31:0] = pc_in;
assign buffer_input_line[63:32] = next_pc_in;
assign buffer_input_line[95:64] = instruction_in;
assign pc_out = buffer_output_line[31:0];
assign next_pc_out = buffer_output_line[63:32];
assign instruction_out = buffer_output_line[95:64];
/* verilator lint_off UNUSED */
reg [INS_BUFFER_SIZE_WIDTH-1:0] fifo_num;
fifo_tmp #(
    .FIFO_DATA_WIDTH(INS_BUFFER_DATA),
    .FIFO_SIZE(INS_BUFFER_SIZE),
    .FIFO_SIZE_WIDTH(INS_BUFFER_SIZE_WIDTH)
) ins_buffer(
    .clk(clk),
    .reset(reset),
    .flush(flush),
    .wr_en(wr_en),
    .rd_en(rd_en&!ins_empty),
    .wdata(buffer_input_line),

    .rdata(buffer_output_line),
    .fifo_full(ins_full),
    .fifo_empty(ins_empty),
    .fifo_num(fifo_num)
);
/* verilator lint_on UNUSED */
endmodule
