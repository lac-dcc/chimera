`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/08 11:07:55
// Design Name: 
// Module Name: tb_Serdes_1x14_DDR
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

`timescale 1ns/1ps

module tb_Serdes_1x14_DDR;
    
    reg TestClk;
    wire TestClk_O;
    wire TestClk_R;
    
    initial begin
        TestClk = 0;
        forever #(1.42857) TestClk = ~TestClk;
    end
    BUFIO BUFIO_Inst
    (
        .I(TestClk),
        .O(TestClk_O)
    );
    BUFR #
    (
        .BUFR_DIVIDE("7"), 
        .SIM_DEVICE("7SERIES")
    )
    BUFR_Inst
    (
        .I(TestClk),
        .O(TestClk_R),
        .CE(1),
        .CLR(0)
    );
    
    
    Serdes_1x14_DDR inst_Serdes_1x14_DDR
    (
        .CLK     (TestClk),
        .CLKDIV  (TestClk_R),
        .BITSLIP (BITSLIP),
        .CE1     (CE1),
        .CE2     (CE2),
        .D       (D),
        .DDLY    (DDLY),
        .RST     (RST),
        .Q       (Q)
    );
   
endmodule
