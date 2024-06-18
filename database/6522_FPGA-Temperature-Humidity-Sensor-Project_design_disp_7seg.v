// This program was cloned from: https://github.com/aarontartz/FPGA-Temperature-Humidity-Sensor-Project
// License: MIT License

`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aaron Tartz
// 
// Create Date: 04/02/2024 02:38:11 AM
// Design Name: 
// Module Name: top4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Prints tens, ones, and tenths place on three 7 segment displays
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module disp_7seg(
    input wire clk100MHz,
    input wire [1:0] cmd_in,
    //input wire [4:0] data_in_first,
    //input wire [4:0] data_in_second,
    input wire [15:0] data_in,
    output reg [7:0] data_out_tens,
    output reg [7:0] data_out_ones,
    output reg [7:0] data_out_decimal
    );
    //assign AN = 8'b11111110;
    //reg [15:0] data_out = {ck_io41, ck_io40, ck_io13, ck_io12, ck_io11, ck_io10, ck_io9, ck_io8, ck_io7, ck_io6, ck_io5, ck_io4, ck_io3, ck_io2, ck_io1, ck_io0};
    
    //wire [7:0] temp = 8'b00111000;
    //assign data_in = temp; 
    
    // ((175 * data_in) / 65536) - 47;
    //wire [7:0] data = data_in;
    
    //reg [23:0] data;
    //reg [3:0] data_in_tens;
    //reg [3:0] data_in_ones;
    
    //wire [23:0] data;
    wire [3:0] data_in_tens;
    wire [3:0] data_in_ones;
    wire [3:0] data_in_decimal;
    
    //reg [31:0] temp = 1'b0;
    
    //wire [15:0] driver = 16'b110010001011100;
    //reg [31:0] 
    /*
    always @(posedge cmd_in) begin      // combinational logic
        if (cmd_in == 2'b00) begin
            data_in_tens = (((125 * data_in) >> 17) - 6) / 10;
            data_in_ones = (((125 * data_in) >> 17) - 6) % 10;
            data_in_decimal = (((1250 * data_in) >> 17) - 60) - (data_in_tens * 100) - (data_in_ones * 10);
        end
        else if (cmd_in == 2'b01) begin
            data_in_tens = ((((1581 * data_in) >> 17) / 5) - 52) / 10;
            data_in_ones = ((((1581 * data_in) >> 17) / 5) - 52) % 10;
            data_in_decimal = ((((15810 * data_in) >> 17) / 5 ) - 520) - (data_in_tens * 100) - (data_in_ones * 10);
        end
        else if (cmd_in == 2'b10) begin
            data_in_tens = ((((176 * data_in) >> 17) / 5) - 52) / 10;
            data_in_ones = (((176 * data_in) >> 17) - 47) % 10;
            data_in_decimal = (((1760 * data_in) >> 17) - 470) - (data_in_tens * 100) - (data_in_ones * 10);
        end
    end
    */
    //assign data_in_tens = (((176 * data_in) >> 17) - 47) / 10;
    //assign data_in_ones = (((176 * data_in) >> 17) - 47) % 10;
    //assign data_in_decimal = (((1760 * data_in) >> 17) - 470) - (data_in_tens * 100) - (data_in_ones * 10);
    
    //assign data_in_tens = ((((125 * data_in) >> 17) - 6) / 10) >= 5 ? ((((125 * data_in) >> 17) - 6) / 10) - 4 : ((((125 * data_in) >> 17) - 6) / 10);
    //assign data_in_tens = (((125 * data_in) >> 17) - 6) / 10;
    //assign data_in_ones = (((125 * data_in) >> 17) - 6) % 10;
    //assign data_in_decimal = (((1250 * data_in) >> 17) - 60) - (data_in_tens * 100) - (data_in_ones * 10);
    
    assign data_in_tens = ((((1581 * data_in) >> 17) / 5) - 52) / 10;
    assign data_in_ones = ((((1581 * data_in) >> 17) / 5) - 52) % 10;
    assign data_in_decimal = ((((15810 * data_in) >> 17) / 5 ) - 520) - (data_in_tens * 100) - (data_in_ones * 10);
    
    always @(posedge clk100MHz) begin       // sequential logic
        //data <= 8'd176 * data_in_driver;
        ////data <= 176 * data_in;   //put into separate func later
        //data <= data >> 16;
        //data <= data - 6'd47;
        
        //data <= 5'b10101; //21
        
        case (data_in_tens)
            4'b0000: 
                data_out_tens <= 8'b00000000;  //zero
            4'b0001:
                data_out_tens <= 8'b00100001;  //one
            4'b0010:
                data_out_tens <= 8'b11001011;  //two
            4'b0011:
                data_out_tens <= 8'b01101011;  //three
            4'b0100:
                data_out_tens <= 8'b00101101;  //four
            4'b0101:
                data_out_tens <= 8'b01101110;  //five
            4'b0110:
                data_out_tens <= 8'b11101110;  //six
            4'b0111:
                data_out_tens <= 8'b00100011;  //seven
            4'b1000:
                data_out_tens <= 8'b11101111;  //eight
            4'b1001:
                data_out_tens <= 8'b01101111;  //nine
            default:
                data_out_tens <= 8'b00001000;  //-
        endcase
        case (data_in_ones)
            4'b0000: 
                data_out_ones <= 8'b11110111;  //zero
            4'b0001:
                data_out_ones <= 8'b00110001;  //one
            4'b0010:
                data_out_ones <= 8'b11011011;  //two
            4'b0011:
                data_out_ones <= 8'b01111011;  //three
            4'b0100:
                data_out_ones <= 8'b00111101;  //four
            4'b0101:
                data_out_ones <= 8'b01111110;  //five
            4'b0110:
                data_out_ones <= 8'b11111110;  //six
            4'b0111:
                data_out_ones <= 8'b00110011;  //seven
            4'b1000:
                data_out_ones <= 8'b11111111;  //eight
            4'b1001:
                data_out_ones <= 8'b01111111;  //nine
            default:
                data_out_ones <= 8'b00001000;  //-
        endcase
        case (data_in_decimal)
            4'b0000: 
                data_out_decimal <= 8'b01111110;  //zero
            4'b0001:
                data_out_decimal <= 8'b00010010;  //one
            4'b0010:
                data_out_decimal <= 8'b10111100;  //two
            4'b0011:
                data_out_decimal <= 8'b10110110;  //three
            4'b0100:
                data_out_decimal <= 8'b11010010;  //four
            4'b0101:
                data_out_decimal <= 8'b11100110;  //five
            4'b0110:
                data_out_decimal <= 8'b11101110;  //six
            4'b0111:
                data_out_decimal <= 8'b00110010;  //seven
            4'b1000:
                data_out_decimal <= 8'b11111110;  //eight
            4'b1001:
                data_out_decimal <= 8'b11110110;  //nine
            default:
                data_out_decimal <= 8'b10000000;  //-
        endcase
    end
endmodule
