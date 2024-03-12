/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// ddrInput2.v
// Copyright (c) 2009-2010 Atomic Rules LLC, ALL RIGHTS RESERVED
//
// Transforms typ ddr250 (500Mb/lvds_pair/cycle) to 1/4 rate SDR (125 MHz)
//
// 2009-11-11 ssiegel Creation
// 2010-01-06 ssiegel Adapation to use V5 ISERDES_NODELAY, add IDELAY to clock
// 2010-01-07 ssiegel Fix delays on the data input; only adjust IODELAY on clock
// 2010-01-09 ssiegel Added ClkDlyVal and DataDlyVal paramaters
// 2010-01-11 ssiegel Tweak default delay; bitslip SDR by 1 click
// 2010-01-18 ssiegel Improved OSERDES Reset Synchronizer
// 2010-01-26 ssiegel Tie unused ISERDES CE2 to 1'b1 to quiet DRC check warning
// 2010-05-15 ssiegel Added the IODELAY_GRP paramater to set the IODELAY_GROUP attribute on IODELAYs

module ddrInput2#(
  parameter ClockDlyVal = 0,   // Number of 78.125 pS clicks of clock delay
  parameter DataDlyVal  = 18,  // Number of 78.125 pS clicks of data  delay
  parameter ndb         = 7, 
  parameter nsb         = 2*ndb,
  parameter IODELAY_GRP = "IODELAY_ADC") // Used to set the IODELAY_GROUP attribute on IODELAYs
( input               ddrClk,            // SE DDR clock                   ddr250    input_clock ddr
  input[ndb-1:0]      ddrDataP,ddrDataN, // DIFF DDR data                  ddr250    Bit#(7) Action
  input               psClk,             // phase shift Control Clock      c125      default_clock in
  input               psRstN,            // reset to default delay         c125      default_reset in
  input               psEna,             // CE for Clock IDELAY up/down    c125      Bool Action
  input               psInc,             // Inc/Dec                        c125      Bool Action
  output              sdrClk,            // SDR clock from BUFR            sdr125    Clock sdrClk out
  output[nsb-1:0]     sdrData0,          // SDR Data                       sdr125    First Bit#(14) Value
  output[nsb-1:0]     sdrData1           // SDR Data                       sdr125    Next  Bit#(14) Value
);
  
wire ddrClkDly, rstSerdes;
(* IODELAY_GROUP = IODELAY_GRP *) IODELAY # (
  .DELAY_SRC("I"), // Port to be used, "I"=IDATAIN,"O"=ODATAIN,"DATAIN"=DATAIN,"IO"=Bi-directional
  .HIGH_PERFORMANCE_MODE("TRUE"), // "TRUE" specifies lower jitter
  .IDELAY_TYPE("VARIABLE"),       // "FIXED" or "VARIABLE"
  .IDELAY_VALUE(ClockDlyVal),     // 0 to 63 tap values
  .ODELAY_VALUE(0),               // 0 to 63 tap values
  .REFCLK_FREQUENCY(200.0),       // Frequency used for IDELAYCTRL
  .SIGNAL_PATTERN("CLOCK")        // Input signal type, "CLOCK" or "DATA"
) IODELAY_INST (
  .DATAOUT(ddrClkDly),            // 1-bit delayed data output
  .C(psClk),                      // 1-bit clock input
  .CE(psEna),                     // 1-bit clock enable input
  .DATAIN(),                      // 1-bit internal data input
  .IDATAIN(ddrClk),               // 1-bit input data input (connect to port)
  .INC(psInc),                    // 1-bit increment/decrement input
  .ODATAIN(),                     // 1-bit output data input
  .RST(!psRstN),                  // 1-bit active high, synch reset input
  .T()                            // 1-bit 3-state control input
);
BUFIO bufio_i(.O(ddrIoClk),.I(ddrClkDly));
BUFR#(.BUFR_DIVIDE("2"),.SIM_DEVICE("VIRTEX5")) bufr_i(.O(sdrClk),.CE(1'b1),.CLR(1'b0),.I(ddrClkDly));         
FDRSE#(.INIT(1'b0))
  FRDSE_inst (.Q(rstSerdes), .C(sdrClk), .CE(1'b1), .D(!psRstN), .R(1'b0), .S(1'b0));

// The DDR/SDR Input datapath...
wire[ndb-1:0]   ddrData;
wire[(ndb-1):0] ddrDataDly;
genvar i; generate
for (i=0;i<ndb;i=i+1) begin : DDR_g
  IBUFDS#(.IOSTANDARD("LVDS_25")) ibufds_i(.O(ddrData[i]),.I(ddrDataP[i]),.IB(ddrDataN[i]));
(* IODELAY_GROUP = IODELAY_GRP *) IODELAY # (
    .DELAY_SRC("I"), // Port to be used, "I"=IDATAIN,"O"=ODATAIN,"DATAIN"=DATAIN,"IO"=Bi-directional
    .HIGH_PERFORMANCE_MODE("TRUE"), // "TRUE" specifies lower jitter
    .IDELAY_TYPE("FIXED"),          // "FIXED" or "VARIABLE"
    .IDELAY_VALUE(DataDlyVal),      // 0 to 63 tap values
    .ODELAY_VALUE(0),               // 0 to 63 tap values
    .REFCLK_FREQUENCY(200.0),       // Frequency used for IDELAYCTRL
    .SIGNAL_PATTERN("DATA")         // Input signal type, "CLOCK" or "DATA"
  ) IODELAY_INST (
    .DATAOUT(ddrDataDly[i]),        // 1-bit delayed data output
    .C(1'b0),                       // 1-bit clock input
    .CE(1'b0),                      // 1-bit clock enable input
    .DATAIN(),                      // 1-bit internal data input
    .IDATAIN(ddrData[i]),           // 1-bit input data input (connect to port)
    .INC(1'b0),                     // 1-bit increment/decrement input
    .ODATAIN(),                     // 1-bit output data input
    .RST(rstSerdes),                // 1-bit active high, synch reset input
    .T()                            // 1-bit 3-state control input
);
  ISERDES_NODELAY #(
    .BITSLIP_ENABLE("TRUE"),       // "TRUE"/"FALSE" to enable bitslip controller
    .DATA_RATE("DDR"),             // Specify data rate of "DDR" or "SDR"
    .DATA_WIDTH(4),                // Specify data width -
    .INTERFACE_TYPE("NETWORKING"), // Use model - "MEMORY" or "NETWORKING"
    .NUM_CE(1),                    // Number of clock enables used, 1 or 2
    .SERDES_MODE("MASTER")         // Set SERDES mode to "MASTER" or "SLAVE"
  ) ISERDES_NODELAY_inst (
    .Q1(),                         // 1-bit registered SERDES output
    .Q2(sdrData1[(i*2)+1]),        // 1-bit registered SERDES output (late  sample, odd  bit)
    .Q3(sdrData1[(i*2)+0]),        // 1-bit registered SERDES output (late  sample, even bit)
    .Q4(sdrData0[(i*2)+1]),        // 1-bit registered SERDES output (early sample, odd  bit)
    .Q5(sdrData0[(i*2)+0]),        // 1-bit registered SERDES output (early sample, even bit)
    .Q6(),                         // 1-bit registered SERDES output
    .SHIFTOUT1(),                  // 1-bit cascade Master/Slave output
    .SHIFTOUT2(),                  // 1-bit cascade Master/Slave output
    .BITSLIP(1'b0),                // 1-bit Bitslip enable input
    .CE1(1'b1),                    // 1-bit clock enable input
    .CE2(1'b1),                    // 1-bit clock enable input
    .CLK(ddrIoClk),                // 1-bit master clock input
    .CLKB(!ddrIoClk),              // 1-bit secondary clock input for DATA_RATE=DDR
    .CLKDIV(sdrClk),               // 1-bit divided clock input
    .D(ddrDataDly[i]),             // 1-bit data input, connects to IODELAY or input buffer
    .OCLK(),                       // 1-bit fast output clock input
    .RST(rstSerdes),               // 1-bit asynchronous reset input
    .SHIFTIN1(1'b0),               // 1-bit cascade Master/Slave input
    .SHIFTIN2(1'b0)                // 1-bit cascade Master/Slave input
  );
end
endgenerate
endmodule
