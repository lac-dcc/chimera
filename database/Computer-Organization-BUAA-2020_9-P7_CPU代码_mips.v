`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:17 12/22/2020 
// Design Name: 
// Module Name:    mips 
//////////////////////////////////////////////////////////////////////////////////
module mips(
    input clk,
    input reset,
    input interrupt,
    output [31:0] addr
    );
	
	wire [31:0] PrRD, PrWD, DEVWD, DEV1RD, DEV0RD;
	wire [31:2] DEVAddr, PrAddr;
	
	CPU cpu (
    .clk(clk), 
    .reset(reset), 
    .HWInt({3'b0, interrupt, IRQ1, IRQ0}), 
    .PrRD(PrRD), 
	
	// outputs
    .PrWE(PrWE), 
    .PrAddr(PrAddr), 
    .PrWD(PrWD), 
	.addr(addr)
    );

	 
	Bridge Bridge(
	.PrAddr(PrAddr), 
    .PrWD(PrWD), 
	.PrWE(PrWE), 
	
	.DEV0RD(DEV0RD), 
    .DEV1RD(DEV1RD),
	.PrRD(PrRD), 

	
    .DEVAddr(DEVAddr),
	
    .DEVWD(DEVWD), 
    .DEV0WE(DEV0WE), 
    .DEV1WE(DEV1WE)
    );

	TC TC0 (
	.clk(clk), 
	.reset(reset), 
	.Addr(DEVAddr), 
	.WE(DEV0WE), 
	.Din(DEVWD), 
	.Dout(DEV0RD), 
	.IRQ(IRQ0)
    );
	
	TC TC1 (
	.clk(clk), 
	.reset(reset), 
	.Addr(DEVAddr), 
	.WE(DEV1WE), 
	.Din(DEVWD), 
	.Dout(DEV1RD), 
	.IRQ(IRQ1)
    );

endmodule
