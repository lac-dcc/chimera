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


module BankWordDecoder(
    input [9:0] sel,
    input WL_enable,
    output reg [1023:0] address
);

    integer i;
    integer k;
    reg [1023:0] address_tmp;
	
	always @(*) begin
        for(i=0; i<1024; i=i+1) begin
            address_tmp[i] <= (sel==i)?1'b1:1'b0;
        end
    end
	
    always @(address_tmp, WL_enable) begin
        for(k=0; k<1024; k=k+1) begin
            address[k] <= address_tmp[k] & WL_enable;
        end
    end
   
endmodule
