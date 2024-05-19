// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/09 15:21:11
// Design Name: 
// Module Name: AdcFrame
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


module AdcFrame#(
    parameter AdcBits = 14,
    parameter FrmPattern = 16'b0011111110000000
)
(
    input FrmFCLK_p,
    input FrmFCLK_n,
    input FrmClk,
    input FrmClkb,
    input FrmClkDiv,
    input FrmRst,
    input BitClkDone,
    output FrmBitslip,
    output FrmAlignDone
);
    
    wire [15:0] wFrmPattern;
    
    reg rFrmBitslip;
    reg [7:0] rBitslipCnt;
    reg rFrmAlignDone;
   
    generate 
    
        if (AdcBits == 14) begin
            Serdes_1x14_DDR inst_Serdes_1x14_DDR_Data_Line
             (
                 .CLK     (FrmClk),
                 .CLKB    (FrmClkb),
                 .CLKDIV  (FrmClkDiv),
                 .BITSLIP (rFrmBitslip),
                 .D_p     (FrmFCLK_p),
                 .D_n     (FrmFCLK_n),
                 .RST     (FrmRst),
                 .Q       (wFrmPattern[AdcBits-1:0])
             );
        end else if (AdcBits == 12) begin
            Serdes_1x12_DDR inst_Serdes_1x12_DDR_Data_Line
             (
                 .CLK     (FrmClk),
                 .CLKB    (FrmClkb),
                 .CLKDIV  (FrmClkDiv),
                 .BITSLIP (rFrmBitslip),
                 .D_p     (FrmFCLK_p),
                 .D_n     (FrmFCLK_n),
                 .RST     (FrmRst),
                 .Q       (wFrmPattern[AdcBits-1:0])
             );
        end else if (AdcBits == 10) begin
            Serdes_1x10_DDR inst_Serdes_1x10_DDR_Data_Line
             (
                 .CLK     (FrmClk),
                 .CLKB    (FrmClkb),
                 .CLKDIV  (FrmClkDiv),
                 .BITSLIP (rFrmBitslip),
                 .D_p     (FrmFCLK_p),
                 .D_n     (FrmFCLK_n),
                 .RST     (FrmRst),
                 .Q       (wFrmPattern[AdcBits-1:0])
             );
        end else if (AdcBits == 8) begin
            Serdes_1x8_DDR inst_Serdes_1x8_DDR_Data_Line
             (
                 .CLK     (FrmClk),
                 .CLKB    (FrmClkb),
                 .CLKDIV  (FrmClkDiv),
                 .BITSLIP (rFrmBitslip),
                 .D_p     (FrmFCLK_p),
                 .D_n     (FrmFCLK_n),
                 .RST     (FrmRst),
                 .Q       (wFrmPattern[AdcBits-1:0])
             );
        end
    
    endgenerate

    always @(posedge FrmClkDiv) begin
        if ((FrmRst == 1) || (BitClkDone == 0))begin
            rFrmBitslip <= 0;
            rBitslipCnt <= 0;
            rFrmAlignDone <= 0;
        end else begin
            if (rBitslipCnt == 31) begin
                rBitslipCnt <= 0;
                rFrmBitslip <= 0;
                rFrmAlignDone <= rFrmAlignDone;
            end else if (rBitslipCnt == 0) begin
                rBitslipCnt <= rBitslipCnt + 1;
                if (wFrmPattern[AdcBits-1:0] == FrmPattern[AdcBits-1:0]) begin
                    rFrmAlignDone <= 1;
                    rFrmBitslip <= 0;
                end else begin
                    rFrmAlignDone <= 0;
                    rFrmBitslip <= 1;
                end
            end else begin
                rBitslipCnt <= rBitslipCnt + 1;
                rFrmBitslip <= 0;
                rFrmAlignDone <= rFrmAlignDone;
            end
        end
    end
    
    assign FrmBitslip = rFrmBitslip;
    assign FrmAlignDone = rFrmAlignDone;
    
//    // Debug
//    ila_1 ila_frame
//    (
//        .clk(FrmClkDiv),
//        .probe0(wFrmPattern),
//        .probe1(rFrmBitslip)
//     );
endmodule
