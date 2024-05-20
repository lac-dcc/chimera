// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 12:09:42 PM
// Design Name: 
// Module Name: OneBankMux
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


module Reram_mux(
    input [5:0] Data_In,
    input Reram_In_Enable,
    output reg [5:0] Reram_In
);

//assign Reram_In = Reram_In_Enable ? Data_In[5:0] : 6'b000000;

    always@(*) begin
        if (Reram_In_Enable) Reram_In <= Data_In;
        else Reram_In <= 6'b000000;
    end
endmodule
