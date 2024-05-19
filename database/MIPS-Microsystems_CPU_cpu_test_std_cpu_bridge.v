// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module bridge(
    input [31:0] PrAddr,
    input [31:0] PrWD,
    input [3:0] PrBE,
    input PrWE,
    input INT_Timer0, INT_Timer1, INT_Outer,
    input [31:0] DEV0_RD, DEV1_RD,
    output [31:0] PrRD,
    output [31:0] DEV_Addr,
    output [31:0] DEV_WD,
    output [7:2] HWInt,
    output DEV0_WE, DEV1_WE
);

    wire CS_Timer0, CS_Timer1;

    assign CS_Timer0 = (PrAddr[31:4] == 28'h0000_7f0) ? 1'b1 : 1'b0;
    assign CS_Timer1 = (PrAddr[31:4] == 28'h0000_7f1) ? 1'b1 : 1'b0;

    assign DEV0_WE = PrWE & CS_Timer0;
    assign DEV1_WE = PrWE & CS_Timer1;

    assign DEV_Addr = PrAddr;
    assign DEV_WD = (PrBE == 4'b1111)   ?   PrWD    :
                    (PrBE == 4'b0011)   ?   {PrRD[31:16], PrWD[15:0]}    :
                    (PrBE == 4'b1100)   ?   {PrWD[31:16], PrRD[15:0]}    :
                    (PrBE == 4'b0001)   ?   {PrRD[31:8], PrWD[7:0]}    :
                    (PrBE == 4'b0010)   ?   {PrRD[31:16], PrWD[15:8], PrRD[7:0]}    :
                    (PrBE == 4'b0100)   ?   {PrRD[31:24], PrWD[23:16], PrRD[15:0]}    :
                    (PrBE == 4'b1000)   ?   {PrWD[31:24], PrRD[23:0]}    :
                                            32'h0000_0000;

    assign PrRD =   (CS_Timer0) ?   DEV0_RD :
                    (CS_Timer1) ?   DEV1_RD :
                                    32'hxxxx_xxxx;
    
    assign HWInt = {3'b000, INT_Outer, INT_Timer1, INT_Timer0};

endmodule // bridge