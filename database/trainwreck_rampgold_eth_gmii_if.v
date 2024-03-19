//----------------------------------------------------------------------
// Title      : Gigabit Media Independent Interface (GMII) Physical I/F
// Project    : Virtex-5 Ethernet MAC Wrappers
//----------------------------------------------------------------------
// File       : gmii_if.v
//----------------------------------------------------------------------
// Copyright (c) 2004-2008 by Xilinx, Inc. All rights reserved.
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you 
// a license to use this text/file solely for design, simulation, 
// implementation and creation of design files limited 
// to Xilinx devices or technologies. Use with non-Xilinx 
// devices or technologies is expressly prohibited and 
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information 
// "as is" solely for use in developing programs and 
// solutions for Xilinx devices. By providing this design, 
// code, or information as one possible implementation of 
// this feature, application or standard, Xilinx is making no 
// representation that this implementation is free from any 
// claims of infringement. You are responsible for 
// obtaining any rights you may require for your implementation. 
// Xilinx expressly disclaims any warranty whatsoever with 
// respect to the adequacy of the implementation, including 
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied 
// warranties of merchantability or fitness for a particular 
// purpose. 
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications are
// expressly prohibited.
// 
// This copyright and support notice must be retained as part 
// of this text at all times. (c) Copyright 2004-2008 Xilinx, Inc.
// All rights reserved.

//----------------------------------------------------------------------
// Description:  This module creates a Gigabit Media Independent 
//               Interface (GMII) by instantiating Input/Output buffers  
//               and Input/Output flip-flops as required.
//
//               This interface is used to connect the Ethernet MAC to
//               an external 1000Mb/s (or Tri-speed) Ethernet PHY.
//----------------------------------------------------------------------


`timescale 1 ps / 1 ps

module gmii_if
    (
        RESET,
        // GMII Interface
        GMII_TXD,
        GMII_TX_EN,
        GMII_TX_ER,
        GMII_TX_CLK,
        GMII_RXD,
        GMII_RX_DV,
        GMII_RX_ER,
        // MAC Interface
        TXD_FROM_MAC,
        TX_EN_FROM_MAC,
        TX_ER_FROM_MAC,
        TX_CLK,
        RXD_TO_MAC,
        RX_DV_TO_MAC,
        RX_ER_TO_MAC,
        RX_CLK);

  input  RESET;

  output [7:0] GMII_TXD;
  output GMII_TX_EN;
  output GMII_TX_ER;
  output GMII_TX_CLK;
  
  input  [7:0] GMII_RXD;
  input  GMII_RX_DV;
  input  GMII_RX_ER;
  
  input  [7:0] TXD_FROM_MAC;
  input  TX_EN_FROM_MAC;
  input  TX_ER_FROM_MAC;
  input  TX_CLK;

  output [7:0] RXD_TO_MAC;
  output RX_DV_TO_MAC;
  output RX_ER_TO_MAC;
  input  RX_CLK;

  reg  [7:0] RXD_TO_MAC /* synthesis syn_useioff = 1 */;
  reg  RX_DV_TO_MAC /* synthesis syn_useioff = 1 */;
  reg  RX_ER_TO_MAC /* synthesis syn_useioff = 1 */;

  reg  [7:0] GMII_TXD /* synthesis syn_useioff = 1 */;
  reg  GMII_TX_EN /* synthesis syn_useioff = 1 */;
  reg  GMII_TX_ER /* synthesis syn_useioff = 1 */;

  wire [7:0] GMII_RXD_DLY;
  wire GMII_RX_DV_DLY;
  wire GMII_RX_ER_DLY;

  //------------------------------------------------------------------------
  // GMII Transmitter Clock Management
  //------------------------------------------------------------------------
  // Instantiate a DDR output register.  This is a good way to drive
  // GMII_TX_CLK since the clock-to-PAD delay will be the same as that for
  // data driven from IOB Ouput flip-flops eg GMII_TXD[7:0].
  ODDR gmii_tx_clk_oddr (
      .Q(GMII_TX_CLK),
      .C(TX_CLK),
      .CE(1'b1),
      .D1(1'b0),
      .D2(1'b1),
      .R(RESET),
      .S(1'b0)
  );

  //------------------------------------------------------------------------
  // GMII Transmitter Logic : Drive TX signals through IOBs onto GMII
  // interface
  //------------------------------------------------------------------------
  // Infer IOB Output flip-flops.
  always @(posedge TX_CLK, posedge RESET)
  begin
      if (RESET == 1'b1)
      begin
          GMII_TX_EN <= 1'b0;
          GMII_TX_ER <= 1'b0;
          GMII_TXD   <= 8'h00;
      end
      else
      begin
          GMII_TX_EN <= TX_EN_FROM_MAC;
          GMII_TX_ER <= TX_ER_FROM_MAC;
          GMII_TXD   <= TXD_FROM_MAC;
      end
  end        

  // Route GMII inputs through IO delays
  IODELAY ideld0(.IDATAIN(GMII_RXD[0]), .DATAOUT(GMII_RXD_DLY[0]), .ODATAIN(1'b0), .DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld0.IDELAY_TYPE = "FIXED";
  defparam ideld0.IDELAY_VALUE = 38;

  IODELAY ideld1(.IDATAIN(GMII_RXD[1]), .DATAOUT(GMII_RXD_DLY[1]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld1.IDELAY_TYPE = "FIXED";
  defparam ideld1.IDELAY_VALUE = 38;  

  IODELAY ideld2(.IDATAIN(GMII_RXD[2]), .DATAOUT(GMII_RXD_DLY[2]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld2.IDELAY_TYPE = "FIXED";
  defparam ideld2.IDELAY_VALUE = 38;  

  IODELAY ideld3(.IDATAIN(GMII_RXD[3]), .DATAOUT(GMII_RXD_DLY[3]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld3.IDELAY_TYPE = "FIXED";
  defparam ideld3.IDELAY_VALUE = 38;  

  IODELAY ideld4(.IDATAIN(GMII_RXD[4]), .DATAOUT(GMII_RXD_DLY[4]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld4.IDELAY_TYPE = "FIXED";
  defparam ideld4.IDELAY_VALUE = 38;  

  IODELAY ideld5(.IDATAIN(GMII_RXD[5]), .DATAOUT(GMII_RXD_DLY[5]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld5.IDELAY_TYPE = "FIXED";
  defparam ideld5.IDELAY_VALUE = 0;  

  IODELAY ideld6(.IDATAIN(GMII_RXD[6]), .DATAOUT(GMII_RXD_DLY[6]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld6.IDELAY_TYPE = "FIXED";
  defparam ideld6.IDELAY_VALUE = 38;  

  IODELAY ideld7(.IDATAIN(GMII_RXD[7]), .DATAOUT(GMII_RXD_DLY[7]), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideld7.IDELAY_TYPE = "FIXED";
  defparam ideld7.IDELAY_VALUE = 38;    
  
  IODELAY ideldv(.IDATAIN(GMII_RX_DV), .DATAOUT(GMII_RX_DV_DLY), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideldv.IDELAY_TYPE = "FIXED";
  defparam ideldv.IDELAY_VALUE = 38;  

  IODELAY ideler(.IDATAIN(GMII_RX_ER), .DATAOUT(GMII_RX_ER_DLY), .ODATAIN(1'b0),.DATAIN(),
					  .T(1'b1), .C(1'b0), .CE(1'b0), .INC(1'b0), .RST(1'b0));
  defparam ideler.IDELAY_TYPE = "FIXED";
  defparam ideler.IDELAY_VALUE = 38;    

  //------------------------------------------------------------------------
  // GMII Receiver Logic : Receive RX signals through IOBs from GMII
  // interface
  //------------------------------------------------------------------------ 
  // Infer IOB Input flip-flops
  always @(posedge RX_CLK, posedge RESET)
  begin
      if (RESET == 1'b1)
      begin
          RX_DV_TO_MAC <= 1'b0;
          RX_ER_TO_MAC <= 1'b0;
          RXD_TO_MAC   <= 8'h00;
      end
      else
      begin
          RX_DV_TO_MAC <= GMII_RX_DV_DLY;
          RX_ER_TO_MAC <= GMII_RX_ER_DLY;
          RXD_TO_MAC   <= GMII_RXD_DLY;
      end
  end

endmodule
