// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0

//(C) Anirban Banerjee 2024
//License: GNU GPL (3)
//Just Enough 6850
//This a bare-minimum Verilog implementation
//of the ACIA 6850/68B50 chip, just enough to
//make most Z80 software work.
//It implements only three baud rates
//that are independent of the clock and only
//8N1 mode of operation.
//Baud rates do not depend upon the RX/TXCLK
//but are internally set using selected
//dividers.

//RXCLK and TXCLK are merged into a single clock CLK

//=== Control Register
//--- Counter Divide Select
// (cds1, cds0)	= 00 --> 300 bauds
//				= 01 --> 9600 bauds
//				= 10 --> 19200 bauds
//				= 11 --> master reset

//--- Word Select (always set to 101)
// (ws2, ws1, ws0)	= xxx --> 8N1 word select
//					= 101 --> 8N1 word select
//Eight data bits, no parity, one stop bit.

//All other register functions are fully supported.

module je6850 (
	txHeartBeat,
	CLK, //expect 7.3728MHz clock

	// the three below are asynchronous to CLK
	nRESET,
	nCTS,
	nDCD,

	// the five below are synchronous to CLK
	E,
	RS,
	RnW,
	RXDATA,
	CS,
	DI,

	nIRQ,
	nRTS,
	TXDATA,
	DO);

	parameter DVSIM = 0;
	output reg txHeartBeat;
	input CLK;
	input nCTS;
	input nDCD;
	input nRESET;
	input E;
	input RS;
	input RnW;
	input RXDATA;
	input [2:0] CS;
	input [7:0] DI;
	
	output nIRQ;
	output nRTS;
	output TXDATA;
	output [7:0] DO;

	reg nRTS;
	reg nIRQ;
	reg [7:0] DO;
	wire [7:0] nextDO;

	wire uarttx;

	reg [7:0] control;
	wire controlwr;
	wire [1:0] controlCDS = {control[1], control[0]}; //default 00
	//don't have word select WS2, WS1 and WS0
	wire [1:0] controlTC = {control[6], control[5]};  //default 10
	wire controlRIE = control[7];				//default 1

	wire [7:0] status;
	wire statusrd;
	reg statusRDRF; //receive data register full -- bit 0
	reg statusTDRE; //transmit data register empty
	reg statusNDCD; //data carrier detect
	reg statusNCTS; //clear to send
	reg statusFE  ;	//framing error
	reg statusOVR ;	//receiver overrun
	wire statusPE = 1'b0; //parity error is not supported
	reg statusIRQ ;	//interrupt request -- bit 7

	//assume 32MHz NOT 7.3728MHz
	wire [19:0] clkdivval = (DVSIM == 1)? 20'd64: 
						//	(controlCDS == 2'h0)? 20'd768: //9600 baud
						//	(controlCDS == 2'h1)? 20'd24576: //300 baud
						//	(controlCDS == 2'h2)? 20'd1667 //384: //19200 baud --> 1667 with 32MHz
							20'd384; //default: 

	wire [7:0] rdr;
	wire rdrf;
	wire rdrrd;
	reg rdrrdPending;
	wire fe;
	reg [7:0] tdr;
	wire tdre;
	wire tdrwr;
	reg tdrwrReg;
	wire masterSWReset = (controlCDS == 2'h3);

	reg nRESETR0, nRESETReg;
	reg nCTSR0, nCTSReg;
	reg nDCDR0, nDCDReg;

	always @(posedge CLK) begin
		nRESETR0 <= #1 nRESET;
		nRESETReg <= #1 nRESETR0;

		nCTSR0 <= #1 nCTS;
		nCTSReg <= #1 nCTSR0;

		nDCDR0 <= #1 nDCD;
		nDCDReg <= #1 nDCDR0;
	end

	wire nextStatusTDRE = (nCTSReg | tdrwr)? 1'b0: (tdre)? 1'b1: statusTDRE;
	wire nextRdrrdPending = (rdrrd)? 1'b0: (rdrf)? 1'b1: rdrrdPending;
	wire transmitIRQEnabled = (controlTC == 2'b01);
	wire nextStatusOVR = (nextRdrrdPending & rdrf);
	wire nextStatusIRQ = (tdrwr | rdrrd)? 1'b0: 
							((transmitIRQEnabled & nextStatusTDRE & ~nCTSReg) |
							(controlRIE & (rdrf | nextStatusOVR | nDCDReg)));

	wire nextStatusNDCD = (statusrd)? 1'b0: nDCDReg;
	
	assign status = {statusIRQ, statusPE, statusOVR, statusFE,
					statusNCTS, statusNDCD, statusTDRE, statusRDRF};

	wire txBitTick;

	always @(posedge CLK) begin
		if (~nRESETReg | masterSWReset) begin
			txHeartBeat <= #1 1'b0;
			//transmit data register
			tdr <= #1 8'h0;

			//receiver data register is inside the UART

			//status register
			statusRDRF <= #1 1'b0;
			statusTDRE <= #1 1'b1;
			statusNDCD <= #1 1'b1;
			statusNCTS <= #1 1'b1; 
			statusFE <= #1 1'b0;
			statusOVR <= #1 1'b0;
			//parity error is not supported
			statusIRQ <= #1 1'b0;

			//control register
			control <= #1 8'b110_000_00; //nRTS is inactive ('1') after reset

			//outputs
			nRTS <= #1 1'b1;
			nIRQ <= #1 1'b1;
			rdrrdPending <= #1 1'b1;
			tdrwrReg <= #1 1'b0; //delayed TDR write
			DO <= #1 8'h0;
		end else begin
			txHeartBeat <= #1 (txBitTick)? ~txHeartBeat: txHeartBeat;
			//transmit data register
			tdr <= #1 (tdrwr)? DI: tdr;

			//status register
			//receiver data register full
			statusRDRF <= #1 (rdrrd)? 1'b0: rdrf;

			//transmitter data register empty
			statusTDRE <= #1 nextStatusTDRE;

			//data carrier detect
			statusNDCD <= #1 nextStatusNDCD;

			//clear to send
			statusNCTS <= #1 nCTSReg; 

			//receive frame error
			statusFE <= #1 (rdrrd)? 1'b0: (rdrf)? fe: statusFE;

			//receive overflow
			statusOVR <= #1 nextStatusOVR;

			//parity error is not supported

			//IRQ
			statusIRQ <= #1 nextStatusIRQ;

			control <= #1 (controlwr)? DI: control;

			//outputs
			nRTS <= #1 (controlTC == 2'h2);
			nIRQ <= #1 ~nextStatusIRQ;

			//internal -- RDR read pending -- to check for receive overwrite
			rdrrdPending <= #1 nextRdrrdPending;
			tdrwrReg <= #1 tdrwr; //delayed TDR write

			DO <= #1 nextDO;
		end
	end

	wire aciaselect = (CS[2:0] == 3'b011) & E;

	//transmit data register write
	assign tdrwr = aciaselect & ~RnW & RS; //In Grant Searle's schematic, this is write to address[7:0] = $81

	//control register write
	assign controlwr = aciaselect & ~RnW & ~RS; //In Grant Searle's schematic, this is write to address[7:0] = $80

	//status register read
	assign statusrd = aciaselect & RnW & ~RS; //In Grant Searle's schematic, this is read from address[7:0] = $80

	//receive data register read
	assign rdrrd = aciaselect & RnW & RS; //In Grant Searle's schematic, this is read from address[7:0] = $81

	assign nextDO = (({8{rdrrd}} & rdr) | ({8{statusrd}} & status));

	//break character
	assign TXDATA = (controlTC == 2'b11)? 1'b0: uarttx;
	
	uart uuart (
		.ECHO (1'b0),
		.clk (CLK),
		.rstn (nRESETReg & ~masterSWReset),
		.UART_TX (uarttx),
		.UART_RX (RXDATA),
		.clkdivval(clkdivval), //default 20'd384 = 19200 baud
		.rdr (rdr),
		.rdrrd (rdrrd),
		.rdrf (rdrf),
		.fe (fe),
		.tdr (tdr),
		.tdrwr (tdrwrReg),
		.tdre (tdre),
		.rxBitTick(),
		.txBitTick(txBitTick));

endmodule
