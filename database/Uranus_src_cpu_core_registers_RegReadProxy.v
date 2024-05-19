// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"

module RegReadProxy(
    // input from ID stage
    input read_en_1,
    input read_en_2,
    input [`REG_ADDR_BUS] read_addr_1,
    input [`REG_ADDR_BUS] read_addr_2,
    // input from regfile
    input [`DATA_BUS] data_1_from_reg,
    input [`DATA_BUS] data_2_from_reg,
    // input from EX stage
    input reg_write_en_from_ex,
    input [`REG_ADDR_BUS] reg_write_addr_from_ex,
    input [`DATA_BUS] data_from_ex,
    input ex_load_flag,   // solve data hazards
    // input from MEM stage
    input reg_write_en_from_mem,
    input [`REG_ADDR_BUS] reg_write_addr_from_mem,
    input [`DATA_BUS] data_from_mem,
    input mem_load_flag,   // solve data hazards
    // load related signals
    output load_related_1,
    output load_related_2,
    // reg data output (WB stage)
    output reg[`DATA_BUS] read_data_1,
    output reg[`DATA_BUS] read_data_2
);

    // generate load related signals
    assign load_related_1 = (ex_load_flag && read_en_1
            && read_addr_1 == reg_write_addr_from_ex)
            || (mem_load_flag && read_en_1
            && read_addr_1 == reg_write_addr_from_mem);
    assign load_related_2 = (ex_load_flag && read_en_2
            && read_addr_2 == reg_write_addr_from_ex)
            || (mem_load_flag && read_en_2
            && read_addr_2 == reg_write_addr_from_mem);

    // generate output read_data_1
    always @(*) begin
        if (read_en_1 && read_addr_1) begin
            if (reg_write_en_from_ex
                    && read_addr_1 == reg_write_addr_from_ex) begin
                read_data_1 <= data_from_ex;
            end
            else if (reg_write_en_from_mem
                    && read_addr_1 == reg_write_addr_from_mem) begin
                read_data_1 <= data_from_mem;
            end
            else begin
                read_data_1 <= data_1_from_reg;
            end
        end
        else begin
            read_data_1 <= 0;
        end
    end

    // generate output read_data_2
    always @(*) begin
        if (read_en_2 && read_addr_2) begin
            if (reg_write_en_from_ex
                    && read_addr_2 == reg_write_addr_from_ex) begin
                read_data_2 <= data_from_ex;
            end
            else if (reg_write_en_from_mem
                    && read_addr_2 == reg_write_addr_from_mem) begin
                read_data_2 <= data_from_mem;
            end
            else begin
                read_data_2 <= data_2_from_reg;
            end
        end
        else begin
            read_data_2 <= 0;
        end
    end

endmodule // RegReadProxy
