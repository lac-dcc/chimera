// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/09 15:32:32
// Design Name: 
// Module Name: AdcData
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


module AdcLane #(
    parameter AdcBits = 14,
    parameter AdcInvert = 0
)
(
    input           DatLine_p   ,
    input           DatLine_n   ,
    input           DatClk      ,
    input           DatClkb     ,
    input           DatClkDiv   ,
    input           DatRst      ,
    input           DatBitslip  ,
    input           FrmAlignDone,
    output  [15:0]  DatData     ,
    output          DatAlignDone
    );
    
    generate 
    
        if (AdcBits == 14) begin
        
            wire [13:0] ADCDataLine;
            reg [13:0] ADCData;
            Serdes_1x14_DDR inst_Serdes_1x14_DDR_Data_Line
             (
                 .CLK     (DatClk      ),
                 .CLKB    (DatClkb     ),
                 .CLKDIV  (DatClkDiv   ),
                 .BITSLIP (DatBitslip  ),
                 .D_p     (DatLine_p   ),
                 .D_n     (DatLine_n   ),
                 .RST     (DatRst      ),
                 .Q       (ADCDataLine )
             );
             assign DatData = {{2{ADCData[13]}},ADCData};
             if (AdcInvert == 0) begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ADCDataLine;
                 end
             end else begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ~ADCDataLine;
                 end
             end
        end else if (AdcBits == 12) begin

            wire [11:0] ADCDataLine;
            reg [11:0] ADCData;
            Serdes_1x12_DDR inst_Serdes_1x12_DDR_Data_Line
             (
                 .CLK     (DatClk      ),
                 .CLKB    (DatClkb     ),
                 .CLKDIV  (DatClkDiv   ),
                 .BITSLIP (DatBitslip  ),
                 .D_p     (DatLine_p   ),
                 .D_n     (DatLine_n   ),
                 .RST     (DatRst      ),
                 .Q       (ADCDataLine )
             );
             assign DatData = {{4{ADCData[11]}},ADCData};
             if (AdcInvert == 0) begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ADCDataLine;
                 end
             end else begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ~ADCDataLine;
                 end
             end
        end else if (AdcBits == 10) begin

            wire [9:0] ADCDataLine;
            reg [9:0] ADCData;
            Serdes_1x10_DDR inst_Serdes_1x10_DDR_Data_Line
             (
                 .CLK     (DatClk      ),
                 .CLKB    (DatClkb     ),
                 .CLKDIV  (DatClkDiv   ),
                 .BITSLIP (DatBitslip  ),
                 .D_p     (DatLine_p   ),
                 .D_n     (DatLine_n   ),
                 .RST     (DatRst      ),
                 .Q       (ADCDataLine )
             );
             assign DatData = {{6{ADCData[9]}},ADCData};
             if (AdcInvert == 0) begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ADCDataLine;
                 end
             end else begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ~ADCDataLine;
                 end
             end
        end else if (AdcBits == 8) begin

            wire [7:0] ADCDataLine;
            reg [7:0] ADCData;
            Serdes_1x8_DDR inst_Serdes_1x8_DDR_Data_Line
             (
                 .CLK     (DatClk      ),
                 .CLKB    (DatClkb     ),
                 .CLKDIV  (DatClkDiv   ),
                 .BITSLIP (DatBitslip  ),
                 .D_p     (DatLine_p   ),
                 .D_n     (DatLine_n   ),
                 .RST     (DatRst      ),
                 .Q       (ADCDataLine )
             );
             assign DatData = {{8{ADCData[7]}},ADCData};
             if (AdcInvert == 0) begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ADCDataLine;
                 end
             end else begin
                 always @ (posedge DatClkDiv) begin
                    ADCData <= ~ADCDataLine;
                 end
             end
        end
    
    endgenerate

     assign DatAlignDone = FrmAlignDone;
     
endmodule
