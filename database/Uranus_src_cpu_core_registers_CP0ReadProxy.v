// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"
`include "../define/cp0.v"

module CP0ReadProxy(
    input [`CP0_ADDR_BUS] cp0_read_addr,
    // from coprocessor 0
    input [`DATA_BUS] cp0_status_in,
    input [`DATA_BUS] cp0_cause_in,
    input [`DATA_BUS] cp0_epc_in,
    input [`DATA_BUS] cp0_ebase_in,
    input [`DATA_BUS] cp0_read_data_in,
    // from MEM stage
    input mem_cp0_write_flag,
    input [`CP0_ADDR_BUS] mem_cp0_write_addr,
    input [`DATA_BUS] mem_cp0_data_in,
    // from WB stage
    input wb_cp0_write_flag,
    input [`CP0_ADDR_BUS] wb_cp0_write_addr,
    input [`DATA_BUS] wb_cp0_data_in,
    // coprocessor 0 register data output
    output [`DATA_BUS] cp0_status_out,
    output [`DATA_BUS] cp0_cause_out,
    output [`DATA_BUS] cp0_epc_out,
    output [`DATA_BUS] cp0_ebase_out,
    output reg[`DATA_BUS] cp0_read_data_out
);

    // generate output
    always @(*) begin
        if (mem_cp0_write_flag && mem_cp0_write_addr == cp0_read_addr) begin
            cp0_read_data_out <= mem_cp0_data_in;
        end
        else if (wb_cp0_write_flag && wb_cp0_write_addr == cp0_read_addr) begin
            cp0_read_data_out <= wb_cp0_data_in;
        end
        else begin
            cp0_read_data_out <= cp0_read_data_in;
        end
    end

    // generate data output of cp0 registers (MEM stage)
    assign cp0_status_out = wb_cp0_write_flag
            && wb_cp0_write_addr == `CP0_REG_STATUS ?
            wb_cp0_data_in : cp0_status_in;
    assign cp0_cause_out = wb_cp0_write_flag
            && wb_cp0_write_addr == `CP0_REG_CAUSE ?
            wb_cp0_data_in : cp0_cause_in;
    assign cp0_epc_out = wb_cp0_write_flag
            && wb_cp0_write_addr == `CP0_REG_EPC ?
            wb_cp0_data_in : cp0_epc_in;
    assign cp0_ebase_out = wb_cp0_write_flag
            && wb_cp0_write_addr == `CP0_REG_EBASE ?
            wb_cp0_data_in : cp0_ebase_in;

endmodule // CP0ReadProxy
