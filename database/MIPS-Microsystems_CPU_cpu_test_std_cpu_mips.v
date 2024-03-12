module mips(
    input clk,
    input reset,
    input interrupt,
    output [31:0] addr
);

    wire [31:0] PrAddr, PrWD, PrRD, DEV_Addr, DEV_WD, DEV0_RD, DEV1_RD;
    wire [7:2] HWInt;
    wire [3:0] PrBE;
    wire PrWE, DEV0_WE, DEV1_WE, INT_Timer0, INT_Timer1;

    cpu CPU(
        .clk(clk), .reset(reset),
        .PrAddr(PrAddr), .PrBE(PrBE), .PrWE(PrWE), .PrWD(PrWD), .PrEPC(addr),
        .PrRD(PrRD), .HWInt(HWInt)
    );
    bridge BRIDGE(
        .PrAddr(PrAddr), .PrBE(PrBE), .PrWE(PrWE), .PrWD(PrWD),
        .PrRD(PrRD), .HWInt(HWInt),
        .DEV0_RD(DEV0_RD), .DEV1_RD(DEV1_RD), .INT_Timer0(INT_Timer0), .INT_Timer1(INT_Timer1), .INT_Outer(interrupt),
        .DEV_Addr(DEV_Addr), .DEV_WD(DEV_WD), .DEV0_WE(DEV0_WE), .DEV1_WE(DEV1_WE)
    );
    TC TIMER_0(
        .clk(clk), .reset(reset),
        .Addr(DEV_Addr[31:2]), .WE(DEV0_WE), .Din(DEV_WD),
        .Dout(DEV0_RD), .IRQ(INT_Timer0)
    );
    TC TIMER_1(
        .clk(clk), .reset(reset),
        .Addr(DEV_Addr[31:2]), .WE(DEV1_WE), .Din(DEV_WD),
        .Dout(DEV1_RD), .IRQ(INT_Timer1)
    );

/***************************
****  simulate output  *****
****************************/
    always @(posedge clk) begin
        if(!reset) begin
            if(CPU.ID_UNIT.myGRF.WE && CPU.ID_UNIT.myGRF.A3!=5'd0)
                $display("@%h: $%d <= %h", CPU.MEM_WB_Pipe.pc8_out-8, CPU.ID_UNIT.myGRF.A3, CPU.ID_UNIT.myGRF.WD);
            if(CPU.MEM_UNIT.myDM.WE)
                $display("@%h: *%h <= %h", CPU.EX_MEM_Pipe.pc8_out-8, {18'd0, CPU.MEM_UNIT.myDM.addr[13:2], 2'd0}, CPU.MEM_UNIT.myDM.data);
        end
    end

endmodule // mips
