// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Computer Engineering Department, Chulalongkorn University
// Engineer: Pollawat Hongwimol
// 
// Create Date: 04/12/2020 04:48:16 PM
// Design Name: 
// Module Name: receiver
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


module receiver(
    input clk,
    input bit_in,
    output reg received,
    output reg [7:0] data_out
    );
    
    reg last_bit;
    reg receiving = 0;
    reg [7:0] count;
    
    always@(posedge clk) begin
        if (~receiving & last_bit & ~bit_in) 
        begin
            receiving <= 1;
            received <= 0;
            count <= 0;
        end

        last_bit <= bit_in;
      
        if (receiving) count <= count + 1;
        else count <= 0;
        
        case (count)
            8'd24: data_out[0] <= bit_in;
            8'd40: data_out[1] <= bit_in;
            8'd56: data_out[2] <= bit_in;
            8'd72: data_out[3] <= bit_in;
            8'd88: data_out[4] <= bit_in;
            8'd104: data_out[5] <= bit_in;
            8'd120: data_out[6] <= bit_in;
            8'd136: data_out[7] <= bit_in;
            8'd152: begin received <= 1; receiving <= 0; end
        endcase
    end
endmodule
