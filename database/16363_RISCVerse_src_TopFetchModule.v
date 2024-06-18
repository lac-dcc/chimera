// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module TopFetchModule(
    input clk,
    input rst,
    input pc_select_execute,
  	input rd_wr,
    input [31:0] pc_target_execute,
  output reg [31:0]  pc_fetch,
  output reg [31:0] next_pc_fetch,
  output reg [31:0] instruction_fetch
);
  
  wire [31:0] read_addr;
  wire [31:0] read_data;
  
  Fetch fetch_inst (
        .clk(clk),
        .rst(rst),
        .pc_select_execute(pc_select_execute),
        .pc_target_execute(pc_target_execute),
        .pc_fetch(pc_fetch),
    .next_pc_fetch(next_pc_fetch)

    );
  
 assign read_addr = pc_fetch;
  
  Memory #(
        .data_width(32),
        .addr_width(32)
    ) memory_inst (
        .clk(clk),
        .rst(rst),
        .mem_en(1'b1),        // Always enable memory for 
        .rd_wr(1'b1),         // Read operation
        .read_addr(read_addr),
        .write_addr(32'b0),    
        .write_data(32'b0),  
        .read_data(read_data)
    );
  
  always @(pc_fetch) begin 
  instruction_fetch = read_data;
  end
    
endmodule

`timescale 1ns / 1ps
module Fetch(
    input clk, rst,
    input pc_select_execute,
    input [31:0] pc_target_execute,
  	output reg [31:0] pc_fetch, next_pc_fetch 
);

    reg [31:0] instr_mem [1023:0];

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            pc_fetch <= 32'h0;
            next_pc_fetch <= 32'h0;
        end else begin
            if (pc_select_execute == 0) begin
                pc_fetch <= next_pc_fetch;
                next_pc_fetch <= next_pc_fetch + 4;
            end else begin
                pc_fetch <= pc_target_execute;
                next_pc_fetch <= pc_fetch + 4;
            end
        end
    end

endmodule

`timescale 1ns / 1ps
module Memory #(
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
                instr_mem[i] = 8'h0;
            read_data = 32'h0;
        end
        else if (mem_en && rd_wr)
        begin
            read_data = {instr_mem[read_addr+3], instr_mem[read_addr+2], instr_mem[read_addr+1], instr_mem[read_addr]};
        end
    end

    always @(posedge clk or negedge rst)
    begin
        if (!rst)
        begin
            
        end
        else if (mem_en && !rd_wr)
        begin
            instr_mem[write_addr]     <= write_data[7:0];
            instr_mem[write_addr + 1] <= write_data[15:8];
            instr_mem[write_addr + 2] <= write_data[23:16];
            instr_mem[write_addr + 3] <= write_data[31:24];
        end
    end

endmodule
