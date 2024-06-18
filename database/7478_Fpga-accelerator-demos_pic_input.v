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


module pic_input(
    input           clk             ,
    input           rst_n           ,
    input           pic_start       ,

    output          pic_out_valid   ,
    output  [15:0]  data_pic
    );

    wire    [15:0]      data_pic_out        ;

    reg     [15:0]      data_pic_reg        ;
    reg     [ 9:0]      addr_pic            ;
    reg                 work_en_pic         ;
    reg                 pic_out_valid_reg   ;

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        data_pic_reg <= 16'b0;
    else if (data_pic_out)
        data_pic_reg <= data_pic_out;
    else
        data_pic_reg <= data_pic_reg;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        pic_out_valid_reg <= 1'b0;
    else if (work_en_pic && addr_pic == 9'd1)
        pic_out_valid_reg <= 1'b1;
    else if (addr_pic == 10'd784)
        pic_out_valid_reg <= 1'b0;
    else
        pic_out_valid_reg <= pic_out_valid_reg;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        addr_pic <= 10'b0;
    else if (work_en_pic && addr_pic == 10'd784)
        addr_pic <= 10'd784;
    else if (work_en_pic)
        addr_pic <= addr_pic + 1'b1;
    else
        addr_pic <= addr_pic;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        work_en_pic <= 1'b0;
    else if (pic_start)
        work_en_pic <= 1'b1;
    else if (addr_pic == 10'd784)
        work_en_pic <= 1'b0;
end

assign  data_pic = data_pic_reg;
assign  pic_out_valid = pic_out_valid_reg;

rom_0_388 rom_pic(
    .clka   (clk            ),
    .addra  (addr_pic       ),
    .douta  (data_pic_out   )
);
endmodule
