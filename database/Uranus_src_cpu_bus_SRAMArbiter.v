// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../debug.v"

module SRAMArbiter(
    input clk,
    input rst,
    // ROM interface
    input rom_en,
    input [3:0] rom_write_en,
    input [31:0] rom_write_data,
    input [31:0] rom_addr,
    output [31:0] rom_read_data,
    // RAM interface
    input ram_en,
    input [3:0] ram_write_en,
    input [31:0] ram_write_data,
    input [31:0] ram_addr,
    output [31:0] ram_read_data,
    // inst sram-like
    input [31:0] inst_rdata,
    `DEBUG input inst_addr_ok,
    `DEBUG input inst_data_ok,
    `DEBUG output inst_req,
    output inst_wr,
    output [1:0] inst_size,
    output [31:0] inst_addr,
    output [31:0] inst_wdata,
    // data sram-like 
    input [31:0] data_rdata,
    `DEBUG input data_addr_ok,
    `DEBUG input data_data_ok,
    `DEBUG output data_req,
    output data_wr,
    output [1:0] data_size,
    output [31:0] data_addr,
    output [31:0] data_wdata,
    // CPU signals
    input exception_flag,
    output halt
);

    // state machine
    parameter kStateRun = 0, kStateWait = 1, kStateRAM = 2, kStateROM = 3;
    `DEBUG reg[1:0] state;
    reg[1:0] next_state;

    // address & data of RAM & ROM
    `DEBUG reg[31:0] last_ram_addr, last_rom_addr;
    `DEBUG reg[31:0] last_ram_data, last_rom_data;
    reg ram_data_dirty_flag;

    // flags
    wire ram_request = ram_en && (ram_addr != last_ram_addr
            || (ram_addr[31:28] >= 4'ha && ram_addr[31:28] <= 4'hb)
            || (ram_write_en ?
                    ram_write_data != last_ram_data
                    : ram_data_dirty_flag));
    wire rom_request = rom_en && rom_addr != last_rom_addr;

    // AXI control signals
    reg ram_req, rom_req;
    reg[1:0] write_data_size;
    reg[31:0] write_data_addr;

    assign rom_read_data = last_rom_data;
    assign ram_read_data = last_ram_data;

    assign inst_req = rom_req;
    assign inst_wr = 0;
    assign inst_size = 2'b10;
    assign inst_addr = rom_addr;
    assign inst_wdata = 0;

    assign data_req = ram_req;
    assign data_wr = |ram_write_en;
    assign data_size = write_data_size;
    assign data_addr = write_data_addr;
    assign data_wdata = ram_write_data;

    // stall signal
    assign halt = exception_flag ? 0 : state != kStateRun;

    // generate write_data_size & write_data_addr
    always @(*) begin
        if (!rst) begin
            write_data_size <= 0;
            write_data_addr <= 0;
        end
        else if (!data_wr) begin
            write_data_size <= 2'b10;
            write_data_addr <= ram_addr;
        end
        else begin
            case (ram_write_en)
                4'b0001: begin
                    write_data_size <= 2'b00;
                    write_data_addr <= {ram_addr[31:2], 2'b00};
                end 
                4'b0010: begin
                    write_data_size <= 2'b00;
                    write_data_addr <= {ram_addr[31:2], 2'b01};
                end 
                4'b0100: begin
                    write_data_size <= 2'b00;
                    write_data_addr <= {ram_addr[31:2], 2'b10};
                end 
                4'b1000: begin
                    write_data_size <= 2'b00;
                    write_data_addr <= {ram_addr[31:2], 2'b11};
                end 
                4'b0011: begin
                    write_data_size <= 2'b01;
                    write_data_addr <= {ram_addr[31:2], 2'b00};
                end 
                4'b1100: begin
                    write_data_size <= 2'b01;
                    write_data_addr <= {ram_addr[31:2], 2'b10};
                end 
                4'b1111: begin
                    write_data_size <= 2'b10;
                    write_data_addr <= {ram_addr[31:2], 2'b00};
                end 
                default: begin
                    write_data_size <= 0;
                    write_data_addr <= 0;
                end
            endcase
        end
    end

    // switch to next state
    always @(posedge clk) begin
        if (!rst) begin
            state <= kStateRun;
        end
        else begin
            state <= next_state;
        end
    end

    // generate next state
    always @(*) begin
        case (state)
            kStateRun: begin
                next_state <= kStateWait;
            end
            kStateWait: begin
                if (ram_request) begin
                    next_state <= kStateRAM;
                end
                else if (rom_request) begin
                    next_state <= kStateROM;
                end
                else begin
                    next_state <= kStateRun;
                end
            end
            kStateRAM: begin
                if (data_data_ok) begin
                    next_state <= rom_request ? kStateROM : kStateRun;
                end
                else begin
                    next_state <= kStateRAM;
                end
            end
            kStateROM: begin
                next_state <= inst_data_ok ? kStateRun : kStateROM;
            end
            default: begin
                next_state <= kStateRun;
            end
        endcase
    end

    // send address request
    reg ram_access_flag, rom_access_flag;
    always @(posedge clk) begin
        if (!rst) begin
            ram_req <= 0;
            rom_req <= 0;
            last_ram_addr <= 0;
            last_rom_addr <= 0;
            ram_access_flag <= 0;
            rom_access_flag <= 0;
        end
        else if (state == kStateRAM) begin
            if (!ram_access_flag) begin
                if (data_addr_ok && ram_req) begin
                    ram_req <= 0;
                    last_ram_addr <= ram_addr;
                    ram_access_flag <= 1;
                end
                else begin
                    ram_req <= 1;
                end
            end
        end
        else if (state == kStateROM) begin
            if (!rom_access_flag) begin
                if (inst_addr_ok && rom_req) begin
                    rom_req <= 0;
                    last_rom_addr <= rom_addr;
                    rom_access_flag <= 1;
                end
                else begin
                    rom_req <= 1;
                end
            end
        end
        else begin
            // restore ram_access_flag
            ram_access_flag <= 0;
            rom_access_flag <= 0;
        end
    end

    // receive data
    always @(posedge clk) begin
        if (!rst) begin
            last_ram_data <= 0;
            last_rom_data <= 0;
            ram_data_dirty_flag <= 0;
        end
        else if (ram_en && data_data_ok) begin
            if (data_wr) begin
                last_ram_data <= data_wdata;
                ram_data_dirty_flag <= write_data_size != 2'b10;
            end
            else begin
                last_ram_data <= data_rdata;
                ram_data_dirty_flag <= 0;
            end
        end
        else if (rom_en && inst_data_ok) begin
            last_rom_data <= inst_rdata;
        end
    end

endmodule // SRAMArbiter
