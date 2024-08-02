// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0

module zed80 (
	HEARTBEAT,
	areset,
	clk29,
	nRTS,
	UART_TX,
	UART_RX);

	output HEARTBEAT;
	input areset;
	input clk29;
	output nRTS;
	output UART_TX;
	input UART_RX;

	wire [7:0]	dataToZ80;
	wire [7:0]	dataFromZ80;
	wire [15:0] address;
	wire [7:0]	dataFromACIA;
	wire [7:0]	dataFromROM;
	wire [7:0]	dataFromRAM;
	wire nM1;
	wire nMREQ;
	wire nIORQ;
	wire nRD;
	wire nWR;
	wire nRFSH;
	wire nHALT;
	wire nBUSRQ;
	wire nBUSAK;
	wire nWAIT;
	wire nINT;
	wire nNMI;
	wire nRTS;
	wire clk;

	wire romrd, ramrd, ramwr, aciard;
	reg romrdReg, ramrdReg, aciardReg;

	wire aresetn = ~areset;
	GSR uGSR(
		.GSRI(aresetn)
	);

	reg resetn, resetnmeta;
	always @(posedge clk or negedge aresetn) begin
		if (~aresetn) begin
			resetnmeta <= #1 1'b0;
			resetn <= #1 1'b0;
		end else begin
			resetnmeta <= #1 1'b1;
			resetn <= #1 resetnmeta;
		end
	end
	
	//Data from Z80 is broadcast to all devices
	//Data from devices are muxed into Z80
	assign dataToZ80 = ({8{aciardReg}} & dataFromACIA) |
						({8{ramrdReg}} & dataFromRAM) |
						({8{romrdReg}} & dataFromROM);

    mCLKDIV ubaudClock (
        .clkout (clk), 
        .hclkin (clk29), 
        .resetn(1'b1));

	reg [25:0]debugClkDiv;
	reg cleanResetn;
	assign HEARTBEAT = debugClkDiv[24];
	always @(posedge clk) begin
		if (~resetn) begin
			debugClkDiv <= #1 25'h0;
			cleanResetn <= #1 1'b0;
		end else begin
			debugClkDiv <= #1 (debugClkDiv + 1'b1);
			//remove reset after all glitches are gone
			//for synthesis -- use debugClkDiv[23] for about 1.2 seconds delay
			if (debugClkDiv[23]) cleanResetn <= #1 1'b1;
		end
	end

	always @(posedge clk) begin
		if (~cleanResetn) begin
			romrdReg <= #1 1'b0;
			ramrdReg <= #1 1'b0;
			aciardReg <= #1 1'b0;
		end else begin
			romrdReg <= #1 romrd;
			ramrdReg <= #1 ramrd;
			aciardReg <= #1 aciard;
		end
	end

	assign nWAIT = 1'b1;
	assign nNMI = 1'b1;
	assign nBUSRQ = 1'b1;
	//enable Single cycle I/O
	tv80n #(.IOWait (0)) z80(
		// Outputs
		.m1_n (nM1), 
		.mreq_n (nMREQ), 
		.iorq_n (nIORQ), 
		.rd_n (nRD), 
		.wr_n (nWR), 
		.rfsh_n (nRFSH), 
		.halt_n (nHALT), 
		.busak_n (nBUSAK), 
		.A (address), 
		.dout (dataFromZ80),
		// Inputs
		.reset_n (cleanResetn), 
		.clk (clk), 
		.wait_n (nWAIT), 
		.int_n (nINT), 
		.nmi_n (nNMI), 
		.busrq_n (nBUSRQ), 
		.di (dataToZ80));

	wire memwr = ~(nMREQ | nWR);
	wire memrd = ~(nMREQ | nRD);
	wire bottom8kAddress = ~address[15] & ~address[14] & ~address[13];
	assign romrd = memrd & bottom8kAddress;

	//ROM
    ROM8kB uROM8k(
        .dout(dataFromROM), //output [7:0] dout
        .clk(clk), //input clk
        .oce(1'b1), //input oc -- unused in bypass mode
        .ce(romrd), //input ce
        .reset(~cleanResetn), //input reset
        .ad(address[12:0]) //input [12:0] ad
    );
	assign ramrd = memrd & ~bottom8kAddress;
	assign ramwr = memwr & ~bottom8kAddress;

	//RAM
    RAM56k uRAM56k(
        .dout(dataFromRAM), //output [7:0] dout
        .clk(clk), //input clk
        .oce(1'b1), //input oce -- unused in bypass mode
        .ce(ramrd | ramwr), //input ce
        .reset(~cleanResetn), //input reset
        .wre(ramwr), //input wre
        .ad(address[15:0]), //input [15:0] ad
        .din(dataFromZ80) //input [7:0] din
    );

	wire [2:0] aciacs = {address[6], address[7], nM1};
	wire aciaselect = (aciacs == 3'b011) & ~nIORQ;
	assign aciard =  nWR & aciaselect;

	//ACIA 6850
	`ifdef FOR_SIM_ONLY
	je6850 #(.DVSIM (1)) acia(
	`else
	je6850 #(.DVSIM (0)) acia(
	`endif
		.txHeartBeat(),
		.CLK (clk),
		.nCTS (1'b0),
		.nDCD (1'b0),
		.nRESET (cleanResetn),
		.RS (address[0]),
		.RnW (nWR),
		.E (~nIORQ),
		.RXDATA (UART_RX),
		.CS (aciacs),
		.DI (dataFromZ80),
		.nIRQ (nINT), //output
		.nRTS (nRTS),
		.TXDATA (UART_TX),
		.DO (dataFromACIA));

endmodule
