// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 12:08:37 PM
// Design Name: 
// Module Name: BankWordDecoder
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


module Trunk_Decoder(
    input Byte_mode,
    input [4:0] sel,
    input Trunk_enable,
    output reg [31:0] address
);

    integer i;
    integer k;
    reg [31:0] address_tmp;
    reg [31:0] address_byte;

   always @(address_tmp, address_byte, Trunk_enable) begin
        for(k=0; k<32; k=k+1) begin
            if (Byte_mode)
                address[k] <= address_tmp[k] & Trunk_enable;       
            else
                address[k] <= address_byte[k] & Trunk_enable; 
        end
    end
    
    always @(*) begin
        case (sel)
        0: address_byte <= 32'b00000001_00000001_00000001_00000001;
        1: address_byte <= 32'b00000010_00000010_00000010_00000010;
        2: address_byte <= 32'b00000100_00000100_00000100_00000100;
        3: address_byte <= 32'b00001000_00001000_00001000_00001000;
        4: address_byte <= 32'b00010000_00010000_00010000_00010000;
        5: address_byte <= 32'b00100000_00100000_00100000_00100000;
        6: address_byte <= 32'b01000000_01000000_01000000_01000000;
        7: address_byte <= 32'b10000000_10000000_10000000_10000000;
        default : address_byte <= 32'b00000000_00000000_0000000_0000000;
        endcase
    end

    always @(*) begin
        for(i=0; i<32; i=i+1) begin
            address_tmp[i] <= (sel==i)?1'b1:1'b0;
        end
    end
    
endmodule
