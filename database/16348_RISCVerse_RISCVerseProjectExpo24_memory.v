// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module memory #(
    parameter data_width = 32,
    parameter addr_width = 32
)(
    input clk,
    input rst,
    input mem_en,
    input rd_wr,
    input [addr_width-1:0] read_addr,
    input [addr_width-1:0] write_addr,
    input [data_width-1:0] write_data,
    output reg [data_width-1:0] read_data
);

    reg [7:0] instr_mem [16383:0];
    integer i;

    always @(*)
    begin
        if (!rst)
        begin
            for (i = 0; i < 16384; i = i + 1)
            begin
                instr_mem[i] = 8'h0;
            end
            read_data <= 32'h0;
        end
        else
        begin
            if (mem_en)
            begin
                if (rd_wr)
                begin
                    read_data <= {instr_mem[read_addr+3], instr_mem[read_addr+2], instr_mem[read_addr+1], instr_mem[read_addr]};
                end
            end
            else
            begin
                read_data <= read_data; // Not necessary, but added for clarity
            end
        end
    end

    always @(posedge clk or negedge rst)
    begin
        if (!rd_wr)
        begin
            instr_mem[write_addr]     <= write_data[7:0];
            instr_mem[write_addr + 1] <= write_data[15:8];
            instr_mem[write_addr + 2] <= write_data[23:16];
            instr_mem[write_addr + 3] <= write_data[31:24];
        end
    end

endmodule