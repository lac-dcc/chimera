// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"

module WB(
    input rst,
    // RAM data
    input [`DATA_BUS] ram_read_data,
    // memory accessing signals
    input mem_read_flag,
    input mem_write_flag,
    input mem_sign_ext_flag,
    input [3:0] mem_sel,
    // from MEM stage
    input [`DATA_BUS] result_in,
    input  write_reg_en_in,
    input [`REG_ADDR_BUS] write_reg_addr_in,
    input hilo_write_en_in,
    input [`DATA_BUS] hi_in,
    input [`DATA_BUS] lo_in,
    input cp0_write_en_in,
    input [`CP0_ADDR_BUS] cp0_addr_in,
    input [`DATA_BUS] cp0_write_data_in,
    input [`ADDR_BUS] debug_pc_addr_in,
    // regfile
    output reg[`DATA_BUS] result_out,
    output write_reg_en_out,
    output [`REG_ADDR_BUS] write_reg_addr_out,
    // HI & LO
    output hilo_write_en_out,
    output [`DATA_BUS] hi_out,
    output [`DATA_BUS] lo_out,
    // coprocessor 0 control
    output cp0_write_en_out,
    output [`CP0_ADDR_BUS] cp0_addr_out,
    output [`DATA_BUS] cp0_write_data_out,
    // debug signals
    output [`ADDR_BUS] debug_pc_addr_out,
    output [3:0] debug_reg_write_en
);

    assign write_reg_en_out = rst ? write_reg_en_in : 0;
    assign write_reg_addr_out = rst ? write_reg_addr_in : 0;
    assign hilo_write_en_out = rst ? hilo_write_en_in : 0;
    assign hi_out = rst ? hi_in : 0;
    assign lo_out = rst ? lo_in : 0;
    assign cp0_write_en_out = rst ? cp0_write_en_in : 0;
    assign cp0_addr_out = rst ? cp0_addr_in : 0;
    assign cp0_write_data_out = rst ? cp0_write_data_in : 0;
    assign debug_pc_addr_out = rst ? debug_pc_addr_in : 0;
    assign debug_reg_write_en = {4{write_reg_en_out}};

    wire[`ADDR_BUS] address = result_in;

    // generate result_out signal
    // because load instructions will use this signal
    always @(*) begin
        if (!rst) begin
            result_out <= 0;
        end
        else begin
            if (mem_read_flag) begin
                if (mem_sel == 4'b0001) begin
                    case(address[1:0])
                        2'b00: result_out <= mem_sign_ext_flag ? {{24{ram_read_data[7]}}, ram_read_data[7:0]} : {24'b0, ram_read_data[7:0]};
                        2'b01: result_out <= mem_sign_ext_flag ? {{24{ram_read_data[15]}}, ram_read_data[15:8]} : {24'b0, ram_read_data[15:8]};
                        2'b10: result_out <= mem_sign_ext_flag ? {{24{ram_read_data[23]}}, ram_read_data[23:16]} : {24'b0, ram_read_data[23:16]};
                        2'b11: result_out <= mem_sign_ext_flag ? {{24{ram_read_data[31]}}, ram_read_data[31:24]} : {24'b0, ram_read_data[31:24]};
                    endcase
                end
                else if (mem_sel == 4'b0011) begin
                    case (address[1:0])
                        2'b00: result_out <= mem_sign_ext_flag ? {{16{ram_read_data[15]}}, ram_read_data[15:0]} : {16'b0, ram_read_data[15:0]};
                        2'b10: result_out <= mem_sign_ext_flag ? {{16{ram_read_data[31]}}, ram_read_data[31:16]} : {16'b0, ram_read_data[31:16]};
                        default: result_out <= 0;
                    endcase
                end
                else if (mem_sel == 4'b1111) begin
                    case (address[1:0])
                        2'b00: result_out <= ram_read_data;
                        default: result_out <= 0;
                    endcase
                end
                else begin
                    result_out <= 0;
                end
            end
            else if (mem_write_flag) begin
                result_out <= 0;
            end
            else begin
                result_out <= result_in;
            end
        end
    end

endmodule // WB
