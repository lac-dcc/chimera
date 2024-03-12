`timescale 1 ns/100 ps
// Version: 8.6 8.6.0.34


module orpsoc_flashROM(CLK,ADDR,DOUT);
input CLK;
input [6:0] ADDR;
output [7:0] DOUT;

    wire U_7_PIN2;
    
    GND GND_1_net(.Y(U_7_PIN2));
    UFROMH #( .MEMORYFILE("devboard_flashROM.mem"), .ACT_PROGFILE("devboard_flashROM.ufc")
         )  UFROM0(.CLK(CLK), .DO0(DOUT[0]), .DO1(DOUT[1]), .DO2(
        DOUT[2]), .DO3(DOUT[3]), .DO4(DOUT[4]), .DO5(DOUT[5]), 
        .DO6(DOUT[6]), .DO7(DOUT[7]), .ADDR0(ADDR[0]), .ADDR1(
        ADDR[1]), .ADDR2(ADDR[2]), .ADDR3(ADDR[3]), .ADDR4(
        ADDR[4]), .ADDR5(ADDR[5]), .ADDR6(ADDR[6]));
    
endmodule
