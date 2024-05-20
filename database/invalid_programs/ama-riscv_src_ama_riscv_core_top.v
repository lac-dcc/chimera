// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

`include "ama_riscv_defines.v"

module ama_riscv_core_top (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] mmio_instr_cnt,
    input  wire [31:0] mmio_cycle_cnt,
    input  wire [ 7:0] mmio_uart_data_out,
    input  wire        mmio_data_out_valid,
    input  wire        mmio_data_in_ready,
    output wire        store_to_uart,
    output wire        load_from_uart,
    output wire        inst_wb_nop_or_clear,
    output wire        mmio_reset_cnt,
    output wire [ 7:0] mmio_uart_data_in
);

// IMEM
wire [31:0] inst_id_read;
wire [13:0] imem_addr;
// DMEM
wire [31:0] dmem_write_data;
wire [13:0] dmem_addr;
wire        dmem_en;
wire [ 3:0] dmem_we;
wire [31:0] dmem_read_data_mem;

// core
ama_riscv_core ama_riscv_core_i(
    .clk (clk),
    .rst (rst),
    .inst_id_read (inst_id_read),
    .dmem_read_data_mem (dmem_read_data_mem),
    .imem_addr (imem_addr),
    .dmem_write_data (dmem_write_data),
    .dmem_addr (dmem_addr),
    .dmem_en (dmem_en),
    .dmem_we (dmem_we),
    .mmio_instr_cnt (mmio_instr_cnt),
    .mmio_cycle_cnt (mmio_cycle_cnt),
    .mmio_uart_data_out (mmio_uart_data_out),
    .mmio_data_out_valid (mmio_data_out_valid),
    .mmio_data_in_ready (mmio_data_in_ready),
    .store_to_uart (store_to_uart),
    .load_from_uart (load_from_uart),
    .inst_wb_nop_or_clear (inst_wb_nop_or_clear),
    .mmio_reset_cnt (mmio_reset_cnt),
    .mmio_uart_data_in (mmio_uart_data_in)
);

// IMEM
ama_riscv_imem ama_riscv_imem_i (
    .clk (clk),
    .addrb (imem_addr),
    .doutb (inst_id_read)
);

// DMEM
ama_riscv_dmem ama_riscv_dmem_i (
    .clk (clk),
    .en (dmem_en),
    .we (dmem_we),
    .addr (dmem_addr),
    .din (dmem_write_data),
    .dout (dmem_read_data_mem)
);

endmodule
