// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

`include "../lib/assertion.v"
`include "pc.v"

`timescale 1ns/1ns

module test();
logic clk;
logic _MR;
logic _pclo_in;
logic _pc_in;
logic _pchitmp_in;
logic [7:0] D;
wire [7:0] PCHI, PCLO;

wire #8 _clk = ! clk;

localparam T=25;
localparam SETTLE=50;

pc PC ( .clk, ._MR, ._pc_in, ._pclo_in, ._pchitmp_in, .D, .PCLO, .PCHI);

task clkpulse;
  begin
  #T
  clk= 1'b0;
  #T
  clk= 1'b1;
  end
endtask

logic LOG=1;

  always @(*)
    if (LOG) $display("%8d TEST : clk=%1b    PC=%8b,%8b _pc_in=%1b _pclo_in=%1b _pchitmp_in=%1b ", $time, clk, PCHI, PCLO, _pc_in, _pclo_in, _pchitmp_in);

int c;

initial begin
  
  $display("initial undefined");
  `Equals(PCLO, 8'bxxxxxxxx);
  `Equals(PCHI, 8'bxxxxxxxx);
  _pc_in = 1'b1;
  _pchitmp_in = 1'b1;
  _pclo_in = 1'b1;
  _MR = 1'b0;
  D = 8'b0;
  clk = 1'b0;
  #T
  `Equals(PCLO, 8'bxxxxxxxx);
  `Equals(PCHI, 8'bxxxxxxxx);

  
  $display("resetting");
  clk = 1'b1;
  #T
  `Equals(PCLO, 8'b0);
  `Equals(PCHI, 8'b0);

  clk= 1'b1;
  #T
  `Equals(PCLO, 8'b0);
  `Equals(PCHI, 8'b0);


  $display("still reset because _ME is low");
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b0);
  `Equals(PCHI, 8'b0);


  $display("releasing _MR but no CLK yet so still 0x00");
  _MR = 1'b1;
  #SETTLE
  `Equals(PCLO, 8'b0);
  `Equals(PCHI, 8'b0);

  $display("clk incr to 0x01");
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b00000001);
  `Equals(PCHI, 8'b00000000);


  $display("clk incr to 0x02");
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b00000010);
  `Equals(PCHI, 8'b00000000);


  // Set PCHITmp + PC advances
  D = 8'b11111111;
  $display("load PCHITmp with %8b - PC should advance on +ve edge", D);
  _pc_in = 1'b1;
  _pchitmp_in = 1'b0;
  _pclo_in = 1'b1;
  clk= 1'b0;
  #SETTLE
  `Equals(PCLO, 8'b00000010);
  `Equals(PCHI, 8'b00000000);

  clk= 1'b1;
  #SETTLE
  `Equals(PCLO, 8'b00000011);
  `Equals(PCHI, 8'b00000000);

  $display("PC should NOT advance on -ve edge");
  clk= 1'b0;
  #SETTLE
  `Equals(PCLO, 8'b00000011);
  `Equals(PCHI, 8'b00000000);

  $display("PC should advance on +ve edge");
  clk= 1'b1;
  #SETTLE
  `Equals(PCLO, 8'b00000100);
  `Equals(PCHI, 8'b00000000);

  $display("PC should NOT advance on -ve edge");
  clk= 1'b0;
  #SETTLE
  `Equals(PCLO, 8'b00000100);
  `Equals(PCHI, 8'b00000000);


// Set PCHI=PCTMPHI=11111111 and PCLO=10101010 - PC does not advance

  D = 8'b10101010; // distinctive value that should be loaded to LO
  $display("load PCLO with %8b - PCHI should load with PCHITMP and PC not advance", D);
  _pc_in = 1'b0;
  _pchitmp_in = 1'b1;
  _pclo_in = 1'b1;
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b10101010);
  `Equals(PCHI, 8'b11111111);

// Set only PCLO - PC should not advance
  D = 8'b11111110;
  $display("load PCLO with %8b - PCLO should load and PC not advance", D);
  _pc_in = 1'b1;
  _pchitmp_in = 1'b1;
  _pclo_in = 1'b0;
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b11111110);
  `Equals(PCHI, 8'b11111111);

// count PC
  $display("count - Should count to ff:ff");
  _pc_in = 1'b1;
  _pchitmp_in = 1'b1;
  _pclo_in = 1'b1;
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b11111111);
  `Equals(PCHI, 8'b11111111);

  $display("count - Should count to 00:00");
  clkpulse();
  #SETTLE
  `Equals(PCLO, 8'b00000000);
  `Equals(PCHI, 8'b00000000);

  $display("count - full range");
  _MR = 1'b0;
  clkpulse();
  #SETTLE
  `Equals({PCHI,PCLO}, 8'b0);

  _pc_in = 1'b1;
  _pchitmp_in = 1'b1;
  _pclo_in = 1'b1;
  _MR = 1'b1;
  LOG=0; // no logging or it's slow
  #SETTLE

  `Equals({PCHI,PCLO}, 16'(c));
  // count full range a couple of times with wrap around
  for (c=0; c<3 * (2**16); c++) begin
      #SETTLE
      `Equals({PCHI,PCLO}, 16'(c));
      clkpulse();
  end

  $display("count - full range - completed at %d", c);


end

endmodule: test
