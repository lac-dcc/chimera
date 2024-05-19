// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"
`include "../../define/cp0.v"
`include "../../define/exception.v"

module MEM(
    input rst,
    // memory accessing signals
    input mem_read_flag_in,
    input mem_write_flag_in,
    input mem_sign_ext_flag_in,
    input [3:0] mem_sel_in,
    input [`DATA_BUS] mem_write_data,
    // from EX stage
    input [`DATA_BUS] result_in,
    input  write_reg_en_in,
    input [`REG_ADDR_BUS] write_reg_addr_in,
    input hilo_write_en_in,
    input [`DATA_BUS] hi_in,
    input [`DATA_BUS] lo_in,
    input cp0_write_en_in,
    input [`CP0_ADDR_BUS] cp0_addr_in,
    input [`DATA_BUS] cp0_write_data_in,
    // exception signals
    input [`DATA_BUS] cp0_status_in,
    input [`DATA_BUS] cp0_cause_in,
    input [`DATA_BUS] cp0_epc_in,
    input [`DATA_BUS] cp0_ebase_in,
    input [`EXC_TYPE_BUS] exception_type_in,
    input delayslot_flag_in,
    input [`ADDR_BUS] current_pc_addr_in,
    // RAM control signals
    output reg ram_en,
    output reg[3:0] ram_write_en,
    output reg[`ADDR_BUS] ram_addr,
    output reg[`DATA_BUS] ram_write_data,
    // to ID stage
    output mem_load_flag,
    // to WB stage
    output mem_read_flag_out,
    output mem_write_flag_out,
    output mem_sign_ext_flag_out,
    output [3:0] mem_sel_out,
    output [`DATA_BUS] result_out,
    output write_reg_en_out,
    output [`REG_ADDR_BUS] write_reg_addr_out,
    output hilo_write_en_out,
    output [`DATA_BUS] hi_out,
    output [`DATA_BUS] lo_out,
    output cp0_write_en_out,
    output [`CP0_ADDR_BUS] cp0_addr_out,
    output [`DATA_BUS] cp0_write_data_out,
    output reg[`ADDR_BUS] cp0_badvaddr_write_data,
    output [`DATA_BUS] cp0_epc_out,
    output reg[`EXC_TYPE_BUS] exception_type_out,
    output [`DATA_BUS] exc_base_out,
    output delayslot_flag_out,
    output [`ADDR_BUS] current_pc_addr_out
);

    // internal ram_write_sel control signal
    reg[3:0] ram_write_sel;

    // to ID stage
    assign mem_load_flag = rst ? mem_read_flag_in : 0;
    // to WB stage
    assign mem_read_flag_out = rst ? mem_read_flag_in : 0;
    assign mem_write_flag_out = rst ? mem_write_flag_in : 0;
    assign mem_sign_ext_flag_out = rst ? mem_sign_ext_flag_in : 0;
    assign mem_sel_out = rst ? mem_sel_in : 0;
    assign result_out = rst ? result_in : 0;
    assign write_reg_en_out = rst ? write_reg_en_in : 0;
    assign write_reg_addr_out = rst ? write_reg_addr_in : 0;
    assign hilo_write_en_out = rst ? hilo_write_en_in : 0;
    assign hi_out = rst ? hi_in : 0;
    assign lo_out = rst ? lo_in : 0;
    assign cp0_write_en_out = rst ? cp0_write_en_in : 0;
    assign cp0_addr_out = rst ? cp0_addr_in : 0;
    assign cp0_write_data_out = rst ? cp0_write_data_in : 0;

    wire[`ADDR_BUS] address = result_in;

    // generate ram_en signal
    always @(*) begin
        if (!rst) begin
            ram_en <= 0;
        end
        else if (mem_write_flag_in || mem_read_flag_in) begin
            ram_en <= exception_type_out == `EXC_TYPE_NULL;
        end
        else begin
            ram_en <= 0;
        end
    end
    
    // generate ram_write_en signal
    always @(*) begin
        if (!rst) begin
            ram_write_en <= 4'b0000;
        end
        else if (mem_write_flag_in) begin
            ram_write_en <= ram_write_sel;
        end
        else begin
            ram_write_en <= 4'b0000;
        end
    end

    // generate ram_write_addr signal
    always @(*) begin
        if (!rst) begin
            ram_addr <= 0;
        end
        else if (mem_write_flag_in || mem_read_flag_in) begin
            ram_addr <= {address[31:2], 2'b00};
        end
        else begin
            ram_addr <= 0;
        end
    end

    // generate ram_write_sel signal
    always @(*) begin
        if (!rst) begin
            ram_write_sel <= 4'b0000;
        end
        else if (mem_write_flag_in) begin
            if (mem_sel_in == 4'b0001) begin   // byte
                case (address[1:0])
                    2'b00: ram_write_sel <= 4'b0001;
                    2'b01: ram_write_sel <= 4'b0010;
                    2'b10: ram_write_sel <= 4'b0100;
                    2'b11: ram_write_sel <= 4'b1000;
                    default: ram_write_sel <= 4'b0000;
                endcase
            end
            else if (mem_sel_in == 4'b0011) begin   // half word
                case (address[1:0])
                    2'b00: ram_write_sel <= 4'b0011;
                    2'b10: ram_write_sel <= 4'b1100;
                    default: ram_write_sel <= 4'b0000;
                endcase
            end
            else if (mem_sel_in == 4'b1111) begin   // word
                case (address[1:0])
                    2'b00: ram_write_sel <= 4'b1111;
                    default: ram_write_sel <= 4'b0000;
                endcase
            end
            else begin
                ram_write_sel <= 4'b0000;
            end
        end
        else begin
            ram_write_sel <= 4'b0000;
        end
    end

    // generate ram_write_data signal
    always @(*) begin
        if (!rst) begin
            ram_write_data <= 0;
        end
        else if (mem_write_flag_in) begin
            if (mem_sel_in == 4'b0001) begin
                case (address[1:0])
                    2'b00: ram_write_data <= mem_write_data;
                    2'b01: ram_write_data <= mem_write_data << 8;
                    2'b10: ram_write_data <= mem_write_data << 16;
                    2'b11: ram_write_data <= mem_write_data << 24;
                endcase
            end
            else if (mem_sel_in == 4'b0011) begin
                case (address[1:0])
                    2'b00: ram_write_data <= mem_write_data;
                    2'b10: ram_write_data <= mem_write_data << 16;
                    default: ram_write_data <= 0;
                endcase
            end
            else if (mem_sel_in == 4'b1111) begin
                case (address[1:0])
                    2'b00: ram_write_data <= mem_write_data;
                    default: ram_write_data <= 0;
                endcase
            end
            else begin
                ram_write_data <= 0;
            end
        end
        else begin
            ram_write_data <= 0;
        end
    end

    // generate exception signals
    reg adel_flag, ades_flag;
    wire int_occured, int_enabled;

    assign cp0_epc_out = rst ? cp0_epc_in : 0;
    assign exc_base_out = rst ?
            (cp0_status_in[`CP0_SEG_BEV] ? `EXC_BASE : cp0_ebase_in) : 0;
    assign delayslot_flag_out = rst ? delayslot_flag_in : 0;
    assign current_pc_addr_out = rst ? current_pc_addr_in : 0;
    assign int_occured = |(cp0_cause_in[`CP0_SEG_INT] & cp0_status_in[`CP0_SEG_IM]);
    assign int_enabled = !cp0_status_in[`CP0_SEG_EXL] && cp0_status_in[`CP0_SEG_IE];

    always @(*) begin
        if (!rst) begin
            {adel_flag, ades_flag} <= 2'b0;
            cp0_badvaddr_write_data <= 0;
        end
        else if (current_pc_addr_in[1:0]) begin   // inst addr
            {adel_flag, ades_flag} <= 2'b10;
            cp0_badvaddr_write_data <= current_pc_addr_in;
        end
        else if (mem_sel_in == 4'b0011 && address[0]) begin   // half word
            {adel_flag, ades_flag} <= {mem_read_flag_in, mem_write_flag_in};
            cp0_badvaddr_write_data <= address;
        end
        else if (mem_sel_in == 4'b1111 && address[1:0]) begin   // word
            {adel_flag, ades_flag} <= {mem_read_flag_in, mem_write_flag_in};
            cp0_badvaddr_write_data <= address;
        end
        else begin
            {adel_flag, ades_flag} <= 2'b0;
            cp0_badvaddr_write_data <= 0;
        end
    end

    always @(*) begin
        if (!rst) begin
            exception_type_out <= `EXC_TYPE_NULL;
        end
        else if (int_occured && int_enabled) begin
            exception_type_out <= `EXC_TYPE_INT;
        end
        else if (current_pc_addr_in[1:0]) begin
            exception_type_out <= `EXC_TYPE_IF;
        end
        else if (exception_type_in[`EXC_TYPE_POS_RI]) begin
            exception_type_out <= `EXC_TYPE_RI;
        end
        else if (exception_type_in[`EXC_TYPE_POS_OV]) begin
            exception_type_out <= `EXC_TYPE_OV;
        end
        else if (exception_type_in[`EXC_TYPE_POS_BP]) begin
            exception_type_out <= `EXC_TYPE_BP;
        end
        else if (exception_type_in[`EXC_TYPE_POS_SYS]) begin
            exception_type_out <= `EXC_TYPE_SYS;
        end
        else if (adel_flag) begin
            exception_type_out <= `EXC_TYPE_ADEL;
        end
        else if (ades_flag) begin
            exception_type_out <= `EXC_TYPE_ADES;
        end
        else if (exception_type_in[`EXC_TYPE_POS_ERET]) begin
            exception_type_out <= `EXC_TYPE_ERET;
        end
        else begin
            exception_type_out <= `EXC_TYPE_NULL;
        end
    end

endmodule // MEM
