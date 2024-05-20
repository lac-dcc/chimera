// This program was cloned from: https://github.com/aarontartz/FPGA-Temperature-Humidity-Sensor-Project
// License: MIT License

`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2024 10:01:25 PM
// Design Name: 
// Module Name: i2c_master_tb
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


module i2c_master_tb;
    reg clk100MHz;
    reg [1:0] cmd_in;
    reg sda_in;
    //input wire clk_100MHz_count,
    //input wire clk_100kHz,
    wire sda_out;
    wire sda_en;
    //inout wire sda,
    wire scl_out;
    wire [15:0] data_out;          //
    //output reg [15:0] data_out
    
    //TESTING
    wire clk100kHz_double;
    wire nack_ack_w;
    
    i2c_master i2c_tb (
        .clk100MHz(clk100MHz),
        .cmd_in(cmd_in),
        .sda_in(sda_in),
        .sda_out(sda_out),
        .sda_en(sda_en),
        .scl_out(scl_out),
        .data_out(data_out),
        .clk100kHz_double(clk100kHz_double),
        .nack_ack_w(nack_ack_w)
        );

    localparam [7:0] MSB = 8'b01011101,     // arbitrary values to represent temp reading
                     LSB = 8'b01110100;
    
    reg i_bit;
    reg [3:0] counter;
    reg [3:0] msb_counter;
    reg [3:0] lsb_counter;
    
    initial begin
        clk100MHz = 1;
        i_bit = 0;
        counter = 0;
        msb_counter = 8;
        lsb_counter = 8;
        
    end
    
    always #1 clk100MHz = ~clk100MHz;
    
    // TESTS ONLY RETRIEVING SINGLE MEASUREMENT
    
    always @(negedge sda_en) begin
        if (counter == 0 || counter == 1) begin
            i_bit = 0;
            counter = counter + 1;
        end
        else if (counter == 2 || counter == 3) begin
            i_bit = 1;
            counter = counter + 1;
        end
        else if (counter == 4) begin
            i_bit = 0;
            counter = counter + 1;
        end
        else if (counter >= 5) begin
            if (msb_counter >= 1) begin
                i_bit = MSB[msb_counter - 1];
                msb_counter = msb_counter - 1;
            end
            else if (lsb_counter >= 1) begin
                i_bit = LSB[lsb_counter - 1];
                lsb_counter = lsb_counter - 1;
            end
        end
        else begin
            i_bit = 0;
            counter = 0;
            msb_counter = 8;
            lsb_counter = 8;
        end
    end
endmodule
