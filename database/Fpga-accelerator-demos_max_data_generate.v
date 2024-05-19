// This program was cloned from: https://github.com/YutongChenVictor/Fpga-accelerator-demos
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 10:03:05
// Design Name: 
// Module Name: pic_input
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module max_data_generate(
    input           clk              ,
    input           rst_n            ,
    input           data_start       ,

    output          data_out_valid   ,
    output  [32:0]  data_out
    );

    wire    [32:0]      data_out_out         ;

    reg     [32:0]      data_out_reg         ;
    reg     [ 9:0]      addr                 ;
    reg                 work_en              ;
    reg                 data_out_valid_reg   ;

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        data_out_reg <= 16'b0;
    else if (data_out_out)
        data_out_reg <= data_out_out;
    else
        data_out_reg <= data_out_reg;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        data_out_valid_reg <= 1'b0;
    else if (work_en && addr == 9'd1)
        data_out_valid_reg <= 1'b1;
    else if (addr == 10'd576)
        data_out_valid_reg <= 1'b0;
    else
        data_out_valid_reg <= data_out_valid_reg;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        addr <= 10'b0;
    else if (work_en && addr == 10'd576)
        addr <= 10'd576;
    else if (work_en)
        addr <= addr + 1'b1;
    else
        addr <= addr;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        work_en <= 1'b0;
    else if (data_start)
        work_en <= 1'b1;
    else if (addr == 10'd576)
        work_en <= 1'b0;
end

assign  data_out = data_out_reg;
assign  data_out_valid = data_out_valid_reg;

rom_max_data rom_max_data(
    .clka   (clk            ),
    .addra  (addr           ),
    .douta  (data_out_out   )
);
endmodule

