// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module cpu_top(
    input clk,

    output reg [15:0]data_out0 = 16'b0
    /* Problem 2: define data bus to UART transmitter */
);

localparam PROG_FILE = "samples/no_uart.txt";
localparam START_PC = 32'h0;
localparam ROM_ADDR_WIDTH = 3; // Set the parameter according to program size!

wire [31:0]instr_addr;
wire [31:0]instr_data;
rom #(.ADDR_WIDTH(ROM_ADDR_WIDTH), .FILE(PROG_FILE)) rom(
    .clk(clk),
    .addr(instr_addr[ROM_ADDR_WIDTH - 1:0]),
    .q(instr_data)
);

/* Problem 1: look here carefully */
wire io_line;
wire [15:0]io_data;
wire io_we;
always @(posedge clk) begin
    if (io_we) begin
        case (io_line)
        1'b0: data_out0 <= io_data;
        /* Problem 2: send data to UART */
        endcase
    end
end

wire [31:0]mem_addr;
wire [31:0]mem_data;
wire [31:0]mem_q;
wire mem_we;
mem_ctrl mem_ctrl(
    .addr(mem_addr), .data(mem_data), .we(mem_we),
    .mmio_addr(io_line), .mmio_data(io_data), .mmio_we(io_we)
);

core #(START_PC, ROM_ADDR_WIDTH) core(
    .clk(clk),
    .instr_data(instr_data), .instr_addr(instr_addr),
    .mem_addr(mem_addr), .mem_data(mem_data),
    .mem_we(mem_we)
);

endmodule
