// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0

//(C) Anirban Banerjee 2024
//License: GNU GPL (3)
//For FPGA implementation
//Used in JE6850
//Basic UART without FIFOs


/*
Plan to implement parity:

	{ws2,	ws1,	ws0}
	-- all others --	--> 8N1
	1		0		1	--> 8N1
	1		1		0	-->	8E1
	1		1		1	-->	8O1

*/

`timescale 1ns/1ps
module uart (
	ECHO,
	clk,
	rstn, //synchronous reset
	UART_TX,
	UART_RX,
	clkdivval,
	rdr,
	rdrrd,
	rdrf, //Receive data register full
	tdr,
	tdrwr,
	tdre,
	fe,
	rxBitTick,
	txBitTick);

	`define DATA_WIDTH 4'd8

	input ECHO; //echos UART_RX to UART_TX
	input clk, rstn;
	output UART_TX;
	input UART_RX;
	output [`DATA_WIDTH-1:0] rdr; //data received from serial
	input rdrrd; //receive data register read
	output rdrf;
	input [`DATA_WIDTH-1:0] tdr; //data to be sent out on serial
	input tdrwr;
	output tdre; //tdr empty
	output fe; //receive buffer overflow or other error
	input [19:0] clkdivval;
	output rxBitTick;
	output txBitTick;

	reg uartRxR0;
	reg uartRxReg;
	reg fe;
	reg [`DATA_WIDTH-1:0] rxDataReg;
	reg rdrf;
	reg [19:0] rxClockDividerReg;
	reg [3:0] rxBitCount;
	
	reg uartTxReg;
	reg [`DATA_WIDTH:0] txDataReg;
	reg [19:0] txClockDividerReg;
	reg [3:0] txBitCount;

	reg [`DATA_WIDTH-1:0] rdr;

	always @(posedge clk) begin
	    if (~rstn) begin
	        uartRxR0 <= #1 1'b1;
	        uartRxReg <= #1 1'b1;
	        rxClockDividerReg <= #1 20'h0;
	        rxBitCount <= #1 4'h0;
			rxDataReg <= #1 {`DATA_WIDTH{1'b0}};
	        fe <= #1 1'b0;
			rdr <= #1 {`DATA_WIDTH{1'b0}};
	        rdrf <= #1 1'b0;
	    end else begin
	        uartRxR0 <= #1 UART_RX;
			uartRxReg <= #1 uartRxR0;
	        fe <= #1 1'b0;
	        if (rxClockDividerReg > 20'h0) begin
	            rxClockDividerReg <= #1 rxClockDividerReg - 1'b1;
	        end else if (rxBitCount > 4'h0) begin
	            if (rxBitCount > `DATA_WIDTH+1) begin
					//start
	                if (~uartRxReg) begin
	                    rxBitCount <= #1 rxBitCount - 1'b1;
	                    rxClockDividerReg <= #1 clkdivval;
	                end else begin
	                    rxBitCount <= #1 4'h0;
	                    rxClockDividerReg <= #1 20'h0;
	                end
	            end else if (rxBitCount > 4'h1) begin
					//data
	                rxBitCount <= #1 rxBitCount - 1'b1;
	                rxClockDividerReg <= #1 clkdivval;
	                rxDataReg <= #1 {uartRxReg, rxDataReg[`DATA_WIDTH-1:1]};
	            end else if (rxBitCount == 4'h1) begin
					//stop
	                rxBitCount <= #1 rxBitCount - 1'b1;
	                if (~uartRxReg) begin
						//missing stop bit frame error
	                    fe <= #1 1'b1;
	                end
					rdr <= #1 rxDataReg;
					rdrf <= #1 1'b1;
	            end
	        end else begin
	            if (~uartRxReg) begin
					//pre-start
	                rxClockDividerReg <= #1 {1'b0, clkdivval[19:1]};
	                rxBitCount <= #1 `DATA_WIDTH+2;
	                rxDataReg <= #1 {`DATA_WIDTH{1'b0}};
	            end
	        end
	    end
		if (rdrrd) rdrf <= #1 1'b0;
	end

	wire rxDone = (rxBitCount == 1'b1) & (rxClockDividerReg == 20'h0);

	always @(posedge clk) begin
	    if (~rstn) begin
	        uartTxReg <= #1 1'b1;
	        txClockDividerReg <= #1 20'b0;
	        txBitCount <= #1 4'h0;
	    end else begin
	        if (txClockDividerReg > 20'h0) begin
	            txClockDividerReg <= #1 txClockDividerReg - 1'b1;
	        end else if (txBitCount == 4'h0) begin
				//start
				if (tdrwr & ~ECHO | rdrf & ECHO) begin
					txClockDividerReg <= #1 clkdivval;
					txBitCount <= #1 `DATA_WIDTH + 1'b1;
					txDataReg <= #1 {1'b1, (ECHO)? rdr: tdr};
					uartTxReg <= #1 1'b0;
				end
	        end else begin
	            if (txBitCount > 4'h1) begin
					//data
	                txBitCount <= #1 txBitCount - 1'b1;
	                txClockDividerReg <= #1 clkdivval;
	                {txDataReg, uartTxReg} <= #1 {1'b0, txDataReg};
	            end else if (txBitCount == 4'h1) begin
					//stop
	                txBitCount <= #1 txBitCount - 1'b1;
	                txClockDividerReg <= #1 clkdivval;
	                uartTxReg <= #1 1'b1;
	            end
	        end
	    end
	end
	assign UART_TX = uartTxReg;
	assign rxBitTick = (rxClockDividerReg == clkdivval);
	assign txBitTick = (txClockDividerReg == clkdivval);
	assign tdre = (txClockDividerReg == 20'h1) & (txBitCount == 4'h0); //done with Tx
endmodule
