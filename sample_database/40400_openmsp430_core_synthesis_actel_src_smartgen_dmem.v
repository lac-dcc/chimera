// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/100 ps
// Version: 8.5 8.5.0.34


module dmem(WD,RD,WEN,REN,WADDR,RADDR,RWCLK,RESET);
input [7:0] WD;
output [7:0] RD;
input  WEN, REN;
input [9:0] WADDR, RADDR;
input RWCLK, RESET;

    wire VCC, GND;
    
    VCC VCC_1_net(.Y(VCC));
    GND GND_1_net(.Y(GND));
    RAM4K9 dmem_R0C1(.ADDRA11(GND), .ADDRA10(GND), .ADDRA9(
        WADDR[9]), .ADDRA8(WADDR[8]), .ADDRA7(WADDR[7]), .ADDRA6(
        WADDR[6]), .ADDRA5(WADDR[5]), .ADDRA4(WADDR[4]), .ADDRA3(
        WADDR[3]), .ADDRA2(WADDR[2]), .ADDRA1(WADDR[1]), .ADDRA0(
        WADDR[0]), .ADDRB11(GND), .ADDRB10(GND), .ADDRB9(RADDR[9])
        , .ADDRB8(RADDR[8]), .ADDRB7(RADDR[7]), .ADDRB6(RADDR[6]), 
        .ADDRB5(RADDR[5]), .ADDRB4(RADDR[4]), .ADDRB3(RADDR[3]), 
        .ADDRB2(RADDR[2]), .ADDRB1(RADDR[1]), .ADDRB0(RADDR[0]), 
        .DINA8(GND), .DINA7(GND), .DINA6(GND), .DINA5(GND), 
        .DINA4(GND), .DINA3(WD[7]), .DINA2(WD[6]), .DINA1(WD[5]), 
        .DINA0(WD[4]), .DINB8(GND), .DINB7(GND), .DINB6(GND), 
        .DINB5(GND), .DINB4(GND), .DINB3(GND), .DINB2(GND), 
        .DINB1(GND), .DINB0(GND), .WIDTHA0(GND), .WIDTHA1(VCC), 
        .WIDTHB0(GND), .WIDTHB1(VCC), .PIPEA(GND), .PIPEB(VCC), 
        .WMODEA(GND), .WMODEB(GND), .BLKA(WEN), .BLKB(REN), .WENA(
        GND), .WENB(VCC), .CLKA(RWCLK), .CLKB(RWCLK), .RESET(
        RESET), .DOUTA8(), .DOUTA7(), .DOUTA6(), .DOUTA5(), 
        .DOUTA4(), .DOUTA3(), .DOUTA2(), .DOUTA1(), .DOUTA0(), 
        .DOUTB8(), .DOUTB7(), .DOUTB6(), .DOUTB5(), .DOUTB4(), 
        .DOUTB3(RD[7]), .DOUTB2(RD[6]), .DOUTB1(RD[5]), .DOUTB0(
        RD[4]));
    RAM4K9 dmem_R0C0(.ADDRA11(GND), .ADDRA10(GND), .ADDRA9(
        WADDR[9]), .ADDRA8(WADDR[8]), .ADDRA7(WADDR[7]), .ADDRA6(
        WADDR[6]), .ADDRA5(WADDR[5]), .ADDRA4(WADDR[4]), .ADDRA3(
        WADDR[3]), .ADDRA2(WADDR[2]), .ADDRA1(WADDR[1]), .ADDRA0(
        WADDR[0]), .ADDRB11(GND), .ADDRB10(GND), .ADDRB9(RADDR[9])
        , .ADDRB8(RADDR[8]), .ADDRB7(RADDR[7]), .ADDRB6(RADDR[6]), 
        .ADDRB5(RADDR[5]), .ADDRB4(RADDR[4]), .ADDRB3(RADDR[3]), 
        .ADDRB2(RADDR[2]), .ADDRB1(RADDR[1]), .ADDRB0(RADDR[0]), 
        .DINA8(GND), .DINA7(GND), .DINA6(GND), .DINA5(GND), 
        .DINA4(GND), .DINA3(WD[3]), .DINA2(WD[2]), .DINA1(WD[1]), 
        .DINA0(WD[0]), .DINB8(GND), .DINB7(GND), .DINB6(GND), 
        .DINB5(GND), .DINB4(GND), .DINB3(GND), .DINB2(GND), 
        .DINB1(GND), .DINB0(GND), .WIDTHA0(GND), .WIDTHA1(VCC), 
        .WIDTHB0(GND), .WIDTHB1(VCC), .PIPEA(GND), .PIPEB(VCC), 
        .WMODEA(GND), .WMODEB(GND), .BLKA(WEN), .BLKB(REN), .WENA(
        GND), .WENB(VCC), .CLKA(RWCLK), .CLKB(RWCLK), .RESET(
        RESET), .DOUTA8(), .DOUTA7(), .DOUTA6(), .DOUTA5(), 
        .DOUTA4(), .DOUTA3(), .DOUTA2(), .DOUTA1(), .DOUTA0(), 
        .DOUTB8(), .DOUTB7(), .DOUTB6(), .DOUTB5(), .DOUTB4(), 
        .DOUTB3(RD[3]), .DOUTB2(RD[2]), .DOUTB1(RD[1]), .DOUTB0(
        RD[0]));
    
endmodule
