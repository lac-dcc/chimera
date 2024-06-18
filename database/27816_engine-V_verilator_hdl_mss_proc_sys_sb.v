// This program was cloned from: https://github.com/micro-FPGA/engine-V
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Nov 18 21:10:06 2018
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// proc_sys_sb
module proc_sys_sb(
    // Inputs
    CLK0_PAD,
    DEVRST_N,
    FAB_RESET_N,
    FIC_0_AHB_M_HRDATA,
    FIC_0_AHB_M_HREADY,
    FIC_0_AHB_M_HRESP,

    FIC_0_AHB_S_HADDR,
    FIC_0_AHB_S_HMASTLOCK,
    FIC_0_AHB_S_HREADY,
    FIC_0_AHB_S_HSEL,
    FIC_0_AHB_S_HSIZE,
    FIC_0_AHB_S_HTRANS,
    FIC_0_AHB_S_HWDATA,
    FIC_0_AHB_S_HWRITE,

    MMUART_0_RXD_F2M,
    MSS_INT_F2M,
    // Outputs
    FIC_0_AHB_M_HADDR,
    FIC_0_AHB_M_HSIZE,
    FIC_0_AHB_M_HTRANS,
    FIC_0_AHB_M_HWDATA,
    FIC_0_AHB_M_HWRITE,
    
    FIC_0_AHB_S_HRDATA,
    FIC_0_AHB_S_HREADYOUT,
    FIC_0_AHB_S_HRESP,
    
    FIC_0_CLK,
    FIC_0_LOCK,
    GPIO_0_M2F,
    INIT_DONE,
    MMUART_0_TXD_M2F,
    MSS_READY,
    POWER_ON_RESET_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK0_PAD;
input         DEVRST_N;
input         FAB_RESET_N;
input  [31:0] FIC_0_AHB_M_HRDATA;
input         FIC_0_AHB_M_HREADY;
input         FIC_0_AHB_M_HRESP;
input  [31:0] FIC_0_AHB_S_HADDR;
input         FIC_0_AHB_S_HMASTLOCK;
input         FIC_0_AHB_S_HREADY;
input         FIC_0_AHB_S_HSEL;
input  [1:0]  FIC_0_AHB_S_HSIZE;
input  [1:0]  FIC_0_AHB_S_HTRANS;
input  [31:0] FIC_0_AHB_S_HWDATA;
input         FIC_0_AHB_S_HWRITE;
input         MMUART_0_RXD_F2M;
input  [15:0] MSS_INT_F2M;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] FIC_0_AHB_M_HADDR;
output [1:0]  FIC_0_AHB_M_HSIZE;
output [1:0]  FIC_0_AHB_M_HTRANS;
output [31:0] FIC_0_AHB_M_HWDATA;
output        FIC_0_AHB_M_HWRITE;
output [31:0] FIC_0_AHB_S_HRDATA;
output        FIC_0_AHB_S_HREADYOUT;
output        FIC_0_AHB_S_HRESP;
output        FIC_0_CLK;
output        FIC_0_LOCK;
output        GPIO_0_M2F;
output        INIT_DONE;
output        MMUART_0_TXD_M2F;
output        MSS_READY;
output        POWER_ON_RESET_N;

wire clk;
assign clk = CLK0_PAD;

reg [15:0] maddr;
wire [7:0]  mwdata;
wire [7:0]  mrdata;
reg        mwrite;
  
reg ready_1;
reg ready_2;
reg ready_3;  

wire trans;
assign trans =  FIC_0_AHB_S_HTRANS[1];

always @(posedge clk or posedge trans) begin

    if (trans == 1'b1) begin
        ready_1 <= 1'b0;
        ready_2 <= 1'b0;
        ready_3 <= 1'b0;
    
    end else begin
        ready_1 <= 1'b1;
        ready_2 <= ready_1;
        ready_3 <= ready_2;
    end
    
    // delay 1 clk
    mwrite <= FIC_0_AHB_S_HWRITE;
    
    maddr[0] <= FIC_0_AHB_S_HADDR[0];
    maddr[14:1] <= FIC_0_AHB_S_HADDR[15:2];
end

// just delay transaction a few clocks
assign FIC_0_AHB_S_HREADYOUT = ready_3;
assign FIC_0_AHB_S_HRDATA = {16'h 0000, mrdata, mrdata};

RAM32K ram (
	.addr		(maddr[14:0]),
        .clk		(clk),
       	.din		(FIC_0_AHB_S_HWDATA[7:0]),
        .dout		(mrdata),
        .we	        (mwrite)
	);

endmodule
