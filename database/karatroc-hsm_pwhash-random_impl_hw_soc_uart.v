// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

`timescale 1 ns / 1 ps

module uart #(
    parameter [31:0] ADDR = 32'hffff_ffff
) (
    input clk,
    input resetn,
    output ser_tx,
    input ser_rx,
    input ser_cts,
    output ser_rts,
    input mem_valid,
    input [31:0] mem_addr,
    input [31:0] mem_wdata,
    input [3:0] mem_wstrb,
    output uart_ready,
    output uart_sel,
    output [31:0] uart_rdata
);

// layout:
// ADDR -- UART divisor register
//   +4 -- UART data register (read/write)
//   +4 -- UART CTS
//   +4 -- send status

wire reg_div_sel = mem_valid && (mem_addr == ADDR);
wire [31:0] reg_div_do;

wire reg_dat_sel = mem_valid && (mem_addr == (ADDR + 4));
wire [31:0] reg_dat_do;
wire reg_dat_wait;

wire reg_cts_sel = mem_valid && (mem_addr == (ADDR + 8));
wire [31:0] reg_cts_do = {31'h0, ser_cts};

wire reg_status_sel = mem_valid && (mem_addr == (ADDR + 12));
wire reg_send_busy;
wire [31:0] reg_status_do = {31'h0, reg_send_busy};

assign uart_ready = reg_div_sel || reg_cts_sel || (reg_dat_sel && !reg_dat_wait) || reg_status_sel;
assign uart_sel = reg_div_sel || reg_cts_sel || reg_dat_sel || reg_status_sel;
assign uart_rdata = reg_div_sel ? reg_div_do :
                    reg_dat_sel ? reg_dat_do :
                    reg_cts_sel ? reg_cts_do :
                    reg_status_sel ? reg_status_do :
                    32'h0000_0000;

simpleuart simpleuart(
    .clk (clk),
    .resetn (resetn),

    .ser_tx (ser_tx),
    .ser_rx (ser_rx),
    .ser_rts (ser_rts),

    .reg_div_we (reg_div_sel ? mem_wstrb : 4'b0000),
    .reg_div_di (mem_wdata),
    .reg_div_do (reg_div_do),

    .reg_dat_we (reg_dat_sel ? mem_wstrb[0] : 1'b0),
    .reg_dat_re (reg_dat_sel && !(| mem_wstrb)),
    .reg_dat_di (mem_wdata),
    .reg_dat_do (reg_dat_do),
    .reg_dat_wait (reg_dat_wait),
    .reg_send_busy (reg_send_busy)
);

endmodule
