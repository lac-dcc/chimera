// This program was cloned from: https://github.com/JosephBerman/fpga-injection
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 09:50:37 PM
// Design Name: 
// Module Name: injection
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


module injection(
    input clk,
    input clk_in,     
    input data_in,    
    input reset,
    output reg clk_out,
    output reg data_out 
);

     parameter [7:0] DATA_TO_SEND = 8'b00101011; 
     //11010100;
     //00101011;

   
    reg [23:0] shift_reg;
    
    // position of bit in slide register
    reg [4:0] shift_pos;
    
    //this is fors 8 bits fot the 4th byte
    integer i;
    
    wire [7:0] checksum; 
    
    CheckSum CSC(.shift_reg(shift_reg), .inject_data(DATA_TO_SEND), .checksum(checksum));
    
    //INPUT
    always @(posedge clk_in or posedge reset) begin
    if (reset) begin
        shift_reg <= 24'b0;  
        shift_pos <= 5'b0;    
    end else begin
        // shift data in 
        if (shift_pos < 24) begin
            shift_reg <= {shift_reg[23:0], data_in}; 
            shift_pos <= shift_pos + 1;              
        end
    end
    end
    
    //OUTPUT
    always @(posedge clk) begin
         

        // Shift in data
        if (shift_pos == 24 && !clk_in && !data_in) begin
           //This is outputting 4th faulty byte and checksum
           for (i=0; i < 8; i = i+1) begin
               clk_out <= 1;
               data_out <= DATA_TO_SEND[i];
               @(clk);
               clk_out <= 0;
               @(clk);
           end
           
           //Sending out checksum
           for (i=0; i < 8; i = i+1) begin
           
               clk_out <= 1;
               data_out <= checksum[i];
               @(clk);
               clk_out <= 0;
               @(clk);
           end
           
            #1;
            shift_pos = shift_pos+1;
        end
        
        clk_out <=0;
        data_out <= 0;

     end


endmodule
