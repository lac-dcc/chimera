`timescale 1ns/1ps

// © Copyright Microsoft Corporation, 2008

(* syn_hier = "hard" *) module dq_iob (
 input MCLK90,
 input ICLK,
 input Reset,
 input DlyInc, //Tap delay adjustment
 input DlyReset,
 input WbufQ0,  //Write buffer outputs
 input WbufQ1,
 input ReadWB,    //Controller sends DQ.
 inout DQ,     //The pin signal to/from the DIMM
 
 output IserdesQ1,   //The outputs of the input ISERDES
 output IserdesQ2
 ) /* synthesis syn_sharing = off */;
 
 wire dqIn;
 wire DelayedData;
 wire dqOut;
 (* syn_preserve = 1, syn_useioff = 1 *) reg DQen;
 always @(posedge MCLK90) DQen <= ~ReadWB;
 
 defparam oddr_dq.SRTYPE = "SYNC";
 defparam oddr_dq.DDR_CLK_EDGE = "SAME_EDGE";

 ODDR oddr_dq (
  .Q (dqOut),
  .C (MCLK90),
  .CE (1'b1),
  .D1 (WbufQ0),
  .D2 (WbufQ1),
  .R (1'b0),
  .S (1'b0)
 );
 
 IOBUF #(.IOSTANDARD("SSTL18_II_DCI"))  iobuf_dq (
  .I (dqOut),
  .T (DQen),
  .IO (DQ),
  .O (dqIn)
 );
 
 IDELAY #(
.IOBDELAY_TYPE("VARIABLE"), // "DEFAULT", "FIXED" or "VARIABLE"
.IOBDELAY_VALUE(0) // Any value from 0 to 63
) IDELAY_dq (
.O(DelayedData), // 1-bit output
.C(MCLK90), // 1-bit clock input
.CE(DlyInc), // 1-bit clock enable input
.I(dqIn), // 1-bit data input
.INC(DlyInc), // 1-bit increment input
.RST(DlyReset) // 1-bit reset input
);

ISERDES_NODELAY #(
.BITSLIP_ENABLE("FALSE"), // "TRUE"/"FALSE" to enable bitslip controller
// Must be "FALSE" if INTERFACE_TYPE set to "MEMORY"
.DATA_RATE("DDR"), // Specify data rate of "DDR" or "SDR"
.DATA_WIDTH(4), // Specify data width -
// NETWORKING SDR: 2, 3, 4, 5, 6, 7, 8 : DDR 4, 6, 8, 10
// MEMORY SDR N/A : DDR 4
.INTERFACE_TYPE("MEMORY"), // Use model - "MEMORY" or "NETWORKING"
.NUM_CE(2), // Number of clock enables used, 1 or 2
.SERDES_MODE("MASTER") // Set SERDES mode to "MASTER" or "SLAVE"

) iserdes_dq (
.Q1(IserdesQ2), // 1-bit registered SERDES output
.Q2(IserdesQ1), // 1-bit registered SERDES output
.Q3(), // 1-bit registered SERDES output
.Q4(), // 1-bit registered SERDES output
.Q5(), // 1-bit registered SERDES output
.Q6(), // 1-bit registered SERDES output
.SHIFTOUT1(), // 1-bit cascade Master/Slave output
.SHIFTOUT2(), // 1-bit cascade Master/Slave output
.BITSLIP(1'b0), // 1-bit Bitslip enable input
.CE1(1'b1), // 1-bit clock enable input
.CE2(1'b1), // 1-bit clock enable input
.CLK(~ICLK), // 1-bit master clock input
.CLKB(ICLK), // 1-bit secondary clock input for DATA_RATE=DDR
.CLKDIV(MCLK90), // 1-bit divided clock input
.D(DelayedData), // 1-bit data input, connects to IODELAY or input buffer
.OCLK(MCLK90), // 1-bit fast output clock input
.RST(Reset), // 1-bit asynchronous reset input
.SHIFTIN1(), // 1-bit cascade Master/Slave input
.SHIFTIN2() // 1-bit cascade Master/Slave input
);


/*
 (* ASYNC_REG = "TRUE" *) ISERDES #(
.BITSLIP_ENABLE("FALSE"), // TRUE/FALSE to enable bitslip controller
.DATA_RATE("DDR"), // Specify data rate of "DDR" or "SDR"
.DATA_WIDTH(4), // Specify data width - For DDR 4,6,8, or 10
// For SDR 2,3,4,5,6,7, or 8
.INIT_Q1(1'b0), // INIT for Q1 register - 1'b1 or 1'b0
.INIT_Q2(1'b0), // INIT for Q2 register - 1'b1 or 1'b0
.INIT_Q3(1'b0), // INIT for Q3 register - 1'b1 or 1'b0
.INIT_Q4(1'b0), // INIT for Q4 register - 1'b1 or 1'b0
.INTERFACE_TYPE("MEMORY"), // Use model - "MEMORY" or "NETWORKING"
.IOBDELAY("IFD"), // Specify outputs where delay chain will be applied
// "NONE", "IBUF", "IFD", or "BOTH"
.IOBDELAY_TYPE("VARIABLE"), // Set tap delay "DEFAULT", "FIXED", or "VARIABLE"
.IOBDELAY_VALUE(0), // Set initial tap delay to an integer from 0 to 63
.NUM_CE(2), // Define number or clock enables to an integer of 1 or 2
.SERDES_MODE("MASTER"), // Set SERDES mode to "MASTER" or "SLAVE"
.SRVAL_Q1(1'b0), // Define Q1 output value upon SR assertion - 1'b1 or 1'b0
.SRVAL_Q2(1'b0), // Define Q2 output value upon SR assertion - 1'b1 or 1'b0
.SRVAL_Q3(1'b0), // Define Q3 output value upon SR assertion - 1'b1 or 1'b0
.SRVAL_Q4(1'b0) // Define Q4 output value upon SR assertion - 1'b1 or 1'b0
) iserdes_dq (
  .O (),
  .Q1 (IserdesQ2),  //high order bit
  .Q2 (IserdesQ1),  //low order bit
  .Q3 (),
  .Q4 (),
  .Q5 (),
  .Q6 (),
  .SHIFTOUT1 (),
  .SHIFTOUT2 (),
  .BITSLIP (),
  .CE1 (1'b1),
  .CE2 (1'b1),
  .CLK (ICLK), //was ~MCLK90, then MCLK
  .CLKDIV (MCLK90),
  .D (dqIn),
  .DLYCE (DlyInc),
  .DLYINC (DlyInc),
  .DLYRST (DlyReset),
  .OCLK (MCLK90),
  .REV (1'b0),
  .SHIFTIN1 (),
  .SHIFTIN2 (),
  .SR (Reset)
  );
  
 */
endmodule