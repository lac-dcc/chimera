/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */


module MF8A18_SoC (
	clk,
	resetn,
	UART_TXD
	);

	input clk;
	input resetn;	
	output UART_TXD;

	wire [9:0] rom_addr;
	wire [15:0] rom_data;
	
	wire [15:0] maddr;
	wire [7:0]  mwdata;
	wire [7:0]  mrdata;
	wire        mwrite;
	wire        mread;
	wire        mready;


	MF8A18 cpu (
		.CLK		(clk),
        	.RSTn		(resetn),
	        .UART_TXD	(UART_TXD),
	        .maddr		(maddr),
	        .mread		(mread),
	        .mwdata		(mwdata),
	        .mwrite		(mwrite),
	        .ramdata	(mrdata),
	        .mready		(mready),
	        .rom_addr	(rom_addr),
	        .rom_data	(rom_data)
	);

	ROM1K16 rom (
		.addr		(rom_addr),
	        .clk		(clk),
        	.dout		(rom_data)
	);

wire   [31:0] HRDATA;
wire   [31:0] HADDR;

wire          HREADY;
wire   [1:0]  HSIZE;
wire   [1:0]  HTRANS;
wire   [31:0] HWDATA;
wire          HWRITE;


proc_sys_sb proc_sys_sb_0(
        // Inputs
        .FAB_RESET_N           ( 1'b1 ),
        .CLK0_PAD              ( clk ),
        .DEVRST_N              ( resetn ),
        .FIC_0_AHB_S_HWRITE    ( HWRITE ),
        .FIC_0_AHB_S_HSEL      ( ),
        .FIC_0_AHB_S_HMASTLOCK ( ),
        .FIC_0_AHB_S_HREADY    ( ),
        .FIC_0_AHB_M_HREADY    ( 1'b1 ),
        .FIC_0_AHB_M_HRESP     ( 1'b0 ),
        .MMUART_0_RXD_F2M      ( 1'b1 ),
        .MSS_INT_F2M           (  ),
        .FIC_0_AHB_S_HADDR     ( HADDR ),
        .FIC_0_AHB_S_HTRANS    ( HTRANS ),
        .FIC_0_AHB_S_HSIZE     ( HSIZE ),
        .FIC_0_AHB_S_HWDATA    ( HWDATA ),
        .FIC_0_AHB_M_HRDATA    (  ),
        // Outputs
        .POWER_ON_RESET_N      (  ),
        .INIT_DONE             (  ),
        .FIC_0_CLK             (  ),
        .FIC_0_LOCK            (  ),
        .MSS_READY             (  ),
        .FIC_0_AHB_S_HREADYOUT ( HREADY ),
        .FIC_0_AHB_S_HRESP     (  ),
        .FIC_0_AHB_M_HWRITE    (  ),
        .MMUART_0_TXD_M2F      (  ),
        .GPIO_0_M2F            (  ),
        .FIC_0_AHB_S_HRDATA    ( HRDATA ),
        .FIC_0_AHB_M_HADDR     (  ),
        .FIC_0_AHB_M_HTRANS    (  ),
        .FIC_0_AHB_M_HSIZE     ( HSIZE ),
        .FIC_0_AHB_M_HWDATA    (  ) 
        );


RAM32KAHB RAM32KAHB_0(
        // Inputs
        .mwrite     ( mwrite ),
        .mread      ( mread ),
        .HREADY     ( HREADY ),
        .HRESP      ( ),
        .Clk        ( clk ),
        .maddr      ( maddr ),
        .mwdata     ( mwdata ),
        .HRDATA     ( HRDATA ),
        // Outputs
        .mready     ( mready ),
        .HWRITE     ( HWRITE ),
        .HSEL       ( ),
        .HMASTLOCK  ( ),
        .HREADY_OUT (  ),
        .mrdata     ( mrdata ),
        .HADDR      ( HADDR ),
        .HTRANS     ( HTRANS ),
        .HSIZE      ( HSIZE ),
        .HWDATA     ( HWDATA ) 
        );

endmodule