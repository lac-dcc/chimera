// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 03:10:07 PM
// Design Name: 
// Module Name: N_bit_RegFile
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


module N_bit_RegFile#(parameter N=32)(input [4:0]r_addr1, r_addr2,w_addr, input [31:0]w_data,input w_en,clk, rst,
    output [31:0] r_data1, r_data2

);

    reg[N-1:0]x[31:0];
    
    
    assign r_data1 =x[r_addr1];
    assign r_data2 =x[r_addr2];
    integer i;
    always @ (negedge clk, posedge rst)
    begin
        if(rst == 1) begin
            for(i=0; i<32; i= i+1) begin
                x[i]=0;
            end

        end
        else begin
            if(w_en==1 && w_addr!=0) begin

                x[w_addr] = w_data;
            end
        end


    end

endmodule
