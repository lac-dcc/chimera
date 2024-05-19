// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/21 18:36:01
// Design Name: 
// Module Name: AdcSwap
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

module AdcSwap #(
    parameter AdcBits = 14,
    parameter AdcBitOrByteMode = 1, // 1 = BIT mode, 0 = BYTE mode
    parameter AdcMsbOrLsbFst = 1, // 1 = MSB first, 0 = LSB first
    parameter AdcWireMode = 1 // 1 = 1-wire, 2 = 2-wire
)
(
    input FrmClk,
    
    input [15:0] DataLine0,
    input [15:0] DataLine1,
    
    output reg [15:0] AdcData0,
    output reg [15:0] AdcData1
    
);

    wire [15:0] D0 = DataLine0;
    wire [15:0] D1 = DataLine1;

generate

if (AdcBits == 16) begin

    wire [15:0] AdcData0x16;
    wire [15:0] AdcData1x16;

end else if (AdcBits == 14) begin

    wire [13:0] AdcData0x14;
    wire [13:0] AdcData1x14;

    if (AdcWireMode == 1) begin

        if (AdcMsbOrLsbFst == 1) begin
            
            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x14 = D0[13:0];
                assign AdcData1x14 = D1[13:0];
            // end else if (AdcBitOrByteMode == 0) begin

            // end
        end else if (AdcMsbOrLsbFst == 0) begin

            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x14 = {D0[0], D0[1], D0[2], D0[3], D0[4], D0[5], D0[6], D0[7], D0[8], D0[9], D0[10], D0[11], D0[12], D0[13]};
                assign AdcData1x14 = {D1[0], D1[1], D1[2], D1[3], D1[4], D1[5], D1[6], D1[7], D1[8], D1[9], D1[10], D1[11], D1[12], D1[13]};
            // end else if (AdcBitOrByteMode == 0) begin
                
            // end
        end
    end else if (AdcWireMode == 2) begin

        if (AdcMsbOrLsbFst == 1) begin

            if (AdcBitOrByteMode == 1) begin
            // MSB first
            // Bit Mode
            // Bit          : 6,   5,   4,  3,  2,  1,  0
            // Channel 0    : D12, D10, D8, D6, D4, D2, D0
            // Channel 1    : D13, D11, D9, D7, D5, D3, D1
            assign AdcData0x14 = {D1[6+7], D0[6+7], D1[5+7], D0[5+7], D1[4+7], D0[4+7], D1[3+7], D0[3+7], D1[2+7], D0[2+7], D1[1+7], D0[1+7], D1[0+7], D0[0+7]};
            assign AdcData1x14 = {D1[6], D0[6], D1[5], D0[5], D1[4], D0[4], D1[3], D0[3], D1[2], D0[2], D1[1], D0[1], D1[0], D0[0]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, MSB First, 14-bits
            // Data Bit     : 6,   5,   4,   3,   2,   1,  0,
            // Channel 0    : D6,  D5,  D4,  D3,  D2,  D1, D0,
            // Channel 1    : D13, D12, D11, D10, D9,  D8, D7,
            assign AdcData0x14 = {D1[6+7:0+7], D0[6+7:0+7]};
            assign AdcData1x14 = {D1[6:0], D0[6:0]};
            end
        end else if (AdcMsbOrLsbFst == 0) begin

            if (AdcBitOrByteMode == 1) begin
            // Bit Mode
            // Bit mode, LSB First, 14-bits
            // Data Bit     ; 6,  5,  4,  3,  2,   1,   0
            // Channel 0    : D0, D2, D4, D6, D8, D10, D12,
            // Channel 1    : D1, D3, D5, D7, D9, D11, D13,
            assign AdcData0x14 = {D1[0+7], D0[0+7], D1[1+7], D0[1+7], D1[2+7], D0[2+7], D1[3+7], D0[3+7], D1[4+7], D0[4+7], D1[5+7], D0[5+7], D1[6+7], D0[6+7]};
            assign AdcData1x14 = {D1[0], D0[0], D1[1], D0[1], D1[2], D0[2], D1[3], D0[3], D1[4], D0[4], D1[5], D0[5], D1[6], D0[6]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, LSB First, 14-bits
            // Data Bit     : 6,  5,   4,   3,   2,   1,   0
            // Channel 0    : D0, D1, D2,  D3,  D4,  D5,  D6,
            // Channel 1    : D7, D8, D9,  D10, D11, D12, D13,
            assign AdcData0x14 = {D1[0+7], D1[1+7], D1[2+7], D1[3+7], D1[4+7], D1[5+7], D1[6+7], D0[0+7], D0[1+7], D0[2+7], D0[3+7], D0[4+7], D0[5+7], D0[6+7]};
            assign AdcData1x14 = {D1[0], D1[1], D1[2], D1[3], D1[4], D1[5], D1[6], D0[0], D0[1], D0[2], D0[3], D0[4], D0[5], D0[6]};
            end
        end
    end

    always @(posedge FrmClk) begin
        AdcData0 <= {{2{AdcData0x14[13]}}, AdcData0x14};
        AdcData1 <= {{2{AdcData1x14[13]}}, AdcData1x14};
    end

end else if (AdcBits == 12) begin

    wire [11:0] AdcData0x12;
    wire [11:0] AdcData1x12;

    if (AdcWireMode == 1) begin

        if (AdcMsbOrLsbFst == 1) begin
            
            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x12 = D0[11:0];
                assign AdcData1x12 = D1[11:0];
            // end else if (AdcBitOrByteMode == 0) begin

            // end
        end else if (AdcMsbOrLsbFst == 0) begin

            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x12 = {D0[0], D0[1], D0[2], D0[3], D0[4], D0[5], D0[6], D0[7], D0[8], D0[9], D0[10], D0[11]};
                assign AdcData1x12 = {D1[0], D1[1], D1[2], D1[3], D1[4], D1[5], D1[6], D1[7], D1[8], D1[9], D1[10], D1[11]};
            // end else if (AdcBitOrByteMode == 0) begin
                
            // end
        end
    end else if (AdcWireMode == 2) begin

        if (AdcMsbOrLsbFst == 1) begin

            if (AdcBitOrByteMode == 1) begin
            // MSB first
            // Bit Mode
            // Bit          : 5,   4,  3,  2,  1,  0
            // Channel 0    : D10, D8, D6, D4, D2, D0
            // Channel 1    : D11, D9, D7, D5, D3, D1
            assign AdcData0x12 = {D1[5+6], D0[5+6], D1[4+6], D0[4+6], D1[3+6], D0[3+6], D1[2+6], D0[2+6], D1[1+6], D0[1+6], D1[0+6], D0[0+6]};
            assign AdcData1x12 = {D1[5], D0[5], D1[4], D0[4], D1[3], D0[3], D1[2], D0[2], D1[1], D0[1], D1[0], D0[0]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, MSB First, 12-bits
            // Data Bit     : 5,   4,   3,   2,   1,   0,
            // Channel 0    : D5,  D4,  D3,  D2,  D1,  D0,
            // Channel 1    : D11, D10, D9,  D8,  D7,  D6,  
            assign AdcData0x12 = {D1[5+6:0+6], D0[5+6:0+6]};
            assign AdcData1x12 = {D1[5:0], D0[5:0]};
            end
        end else if (AdcMsbOrLsbFst == 0) begin

            if (AdcBitOrByteMode == 1) begin
            // Bit Mode
            // Bit mode, LSB First, 12-bits
            // Data Bit     ; 5,  4,  3,  2,   1,   0
            // Channel 0    : D0, D2, D4, D6, D8, D10,
            // Channel 1    : D1, D3, D5, D7, D9, D11,
            assign AdcData0x12 = {D1[0+6], D0[0+6], D1[1+6], D0[1+6], D1[2+6], D0[2+6], D1[3+6], D0[3+6], D1[4+6], D0[4+6], D1[5+6], D0[5+6]};
            assign AdcData1x12 = {D1[0], D0[0], D1[1], D0[1], D1[2], D0[2], D1[3], D0[3], D1[4], D0[4], D1[5], D0[5]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, LSB First, 12-bits
            // Data Bit     : 5,   4,   3,   2,   1,   0
            // Channel 0    : D0, D1, D2,  D3,  D4,  D5,
            // Channel 1    : D6, D7, D8,  D9,  D10, D11,
            assign AdcData0x12 = {D1[0+6], D1[1+6], D1[2+6], D1[3+6], D1[4+6], D1[5+6], D0[0+6], D0[1+6], D0[2+6], D0[3+6], D0[4+6], D0[5+6]};
            assign AdcData1x12 = {D1[0], D1[1], D1[2], D1[3], D1[4], D1[5], D0[0], D0[1], D0[2], D0[3], D0[4], D0[5]};
            end
        end
    end

    always @(posedge FrmClk) begin
        AdcData0 <= {{4{AdcData0x12[11]}}, AdcData0x12};
        AdcData1 <= {{4{AdcData1x12[11]}}, AdcData1x12};
    end

end else if (AdcBits == 10) begin

    wire [9:0] AdcData0x10;
    wire [9:0] AdcData1x10;

    if (AdcWireMode == 1) begin

        if (AdcMsbOrLsbFst == 1) begin
            
            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x10 = D0[9:0];
                assign AdcData1x10 = D1[9:0];
            // end else if (AdcBitOrByteMode == 0) begin

            // end
        end else if (AdcMsbOrLsbFst == 0) begin

            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x10 = {D0[0], D0[1], D0[2], D0[3], D0[4], D0[5], D0[6], D0[7], D0[8], D0[9]};
                assign AdcData1x10 = {D1[0], D1[1], D1[2], D1[3], D1[4], D1[5], D1[6], D1[7], D1[8], D1[9]};
            // end else if (AdcBitOrByteMode == 0) begin
                
            // end
        end
    end else if (AdcWireMode == 2) begin

        if (AdcMsbOrLsbFst == 1) begin

            if (AdcBitOrByteMode == 1) begin
            // MSB first
            // Bit Mode
            // Bit          : 4,  3,  2,  1,  0
            // Channel 0    : D8, D6, D4, D2, D0
            // Channel 1    : D9, D7, D5, D3, D1
            assign AdcData0x10 = {D1[4+5], D0[4+5], D1[3+5], D0[3+5], D1[2+5], D0[2+5], D1[1+5], D0[1+5], D1[0+5], D0[0+5]};
            assign AdcData1x10 = {D1[4], D0[4], D1[3], D0[3], D1[2], D0[2], D1[1], D0[1], D1[0], D0[0]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, MSB First, 10-bits
            // Data Bit     : 4,   3,   2,   1,   0,
            // Channel 0    : D4,  D3,  D2,  D1,  D0,
            // Channel 1    : D9,  D8,  D7,  D6,  D5,  
            assign AdcData0x10 = {D1[4+5:0+5], D0[4+5:0+5]};
            assign AdcData1x10 = {D1[4:0], D0[4:0]};
            end
        end else if (AdcMsbOrLsbFst == 0) begin

            if (AdcBitOrByteMode == 1) begin
            // Bit Mode
            // Bit mode, LSB First, 10-bits
            // Data Bit     ; 4,  3,  2,   1,   0
            // Channel 0    : D0, D2, D4, D6, D8,
            // Channel 1    : D1, D3, D5, D7, D9,
            assign AdcData0x10 = {D1[0+5], D0[0+5], D1[1+5], D0[1+5], D1[2+5], D0[2+5], D1[3+5], D0[3+5], D1[4+5], D0[4+5]};
            assign AdcData1x10 = {D1[0], D0[0], D1[1], D0[1], D1[2], D0[2], D1[3], D0[3], D1[4], D0[4]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, LSB First, 10-bits
            // Data Bit     : 4,  3,  2,   1,   0
            // Channel 0    : D0, D1, D2,  D3,  D4,  
            // Channel 1    : D5, D6, D7,  D8,  D9,
            assign AdcData0x10 = {D1[0+5], D1[1+5], D1[2+5], D1[3+5], D1[4+5], D0[0+5], D0[1+5], D0[2+5], D0[3+5], D0[4+5]};
            assign AdcData1x10 = {D1[0], D1[1], D1[2], D1[3], D1[4], D0[0], D0[1], D0[2], D0[3], D0[4]};
            end
        end
    end

    always @(posedge FrmClk) begin
        AdcData0 <= {{6{AdcData0x10[9]}}, AdcData0x10};
        AdcData1 <= {{6{AdcData1x10[9]}}, AdcData1x10};
    end

end else if (AdcBits == 8) begin

    wire [7:0] AdcData0x8;
    wire [7:0] AdcData1x8;

    if (AdcWireMode == 1) begin

        if (AdcMsbOrLsbFst == 1) begin
            
            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x8 = D0[7:0];
                assign AdcData1x8 = D1[7:0];
            // end else if (AdcBitOrByteMode == 0) begin

            // end
        end else if (AdcMsbOrLsbFst == 0) begin

            // if (AdcBitOrByteMode == 1) begin
                assign AdcData0x8 = {D0[0], D0[1], D0[2], D0[3], D0[4], D0[5], D0[6], D0[7]};
                assign AdcData1x8 = {D1[0], D1[1], D1[2], D1[3], D1[4], D1[5], D1[6], D1[7]};
            // end else if (AdcBitOrByteMode == 0) begin
                
            // end
        end
    end else if (AdcWireMode == 2) begin

        if (AdcMsbOrLsbFst == 1) begin

            if (AdcBitOrByteMode == 1) begin
            // MSB first
            // Bit Mode
            // Bit          : 3,  2,  1,  0
            // Channel 0    : D6, D4, D2, D0
            // Channel 1    : D7, D5, D3, D1
            assign AdcData0x8 = {D1[3+4], D0[3+4], D1[2+4], D0[2+4], D1[1+4], D0[1+4], D1[0+4], D0[0+4]};
            assign AdcData1x8 = {D1[3], D0[3], D1[2], D0[2], D1[1], D0[1], D1[0], D0[0]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, MSB First, 8-bits
            // Data Bit     : 3,   2,   1,   0,
            // Channel 0    : D3,  D2,  D1,  D0,
            // Channel 1    : D7,  D6,  D5,  D4,  
            assign AdcData0x8 = {D1[3+4:0+4], D0[3+4:0+4]};
            assign AdcData1x8 = {D1[3:0], D0[3:0]};
            end
        end else if (AdcMsbOrLsbFst == 0) begin

            if (AdcBitOrByteMode == 1) begin
            // Bit Mode
            // Bit mode, LSB First, 8-bits
            // Data Bit     ; 3,  2,   1,   0
            // Channel 0    : D0, D2, D4, D6,
            // Channel 1    : D1, D3, D5, D7,
            assign AdcData0x8 = {D1[0+4], D0[0+4], D1[1+4], D0[1+4], D1[2+4], D0[2+4], D1[3+4], D0[3+4]};
            assign AdcData1x8 = {D1[0], D0[0], D1[1], D0[1], D1[2], D0[2], D1[3], D0[3]};
            end else if (AdcBitOrByteMode == 0) begin
            // Byte Mode
            // Byte Mode, LSB First, 8-bits
            // Data Bit     : 3,  2,  1,   0
            // Channel 0    : D0, D1, D2,  D3,
            // Channel 1    : D4, D5, D6,  D7,
            assign AdcData0x8 = {D1[0+4], D1[1+4], D1[2+4], D1[3+4], D0[0+4], D0[1+4], D0[2+4], D0[3+4]};
            assign AdcData1x8 = {D1[0], D1[1], D1[2], D1[3], D0[0], D0[1], D0[2], D0[3]};
            end
        end
    end

    always @(posedge FrmClk) begin
        AdcData0 <= {{8{AdcData0x8[7]}}, AdcData0x8};
        AdcData1 <= {{8{AdcData1x8[7]}}, AdcData1x8};
    end

end

endgenerate

endmodule
