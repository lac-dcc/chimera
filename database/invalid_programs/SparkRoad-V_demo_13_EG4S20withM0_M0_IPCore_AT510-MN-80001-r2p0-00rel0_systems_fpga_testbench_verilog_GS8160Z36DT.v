//  Copyright © 2000.  GSI Technology
//            Apps@gsitechnology.com
//  1.00  06/04/04  Jeff Daugherty  1) Created

`timescale 1ns / 100ps

module GS8160Z36DT  #(
        parameter SPEED = 300,
                              A_bits = 19
)
(A, CK, nBa, nBb, nBc, nBd, nW, nE1, E2, nE3, nG, pADV,
      nCKE, DQa, DQb, DQc, DQd, ZZ, nFT, nLBO);


  parameter  A_size     = 19,    // +16M -4 bytes in parallel
      DQ_size   = 9,
    bank_size   = 2**A_bits;

  input  [A_size-1:0]    A;     // address
  input        CK;    // clock
  input        nBa;    // bank A write enable
  input        nBb;    // bank B write enable
  input        nBc;    // bank C write enable
  input        nBd;    // bank D write enable
  input        nW;     // byte write enable
  input        nE1;    // chip enable 1
  input        E2;    // chip enable 2
  input        nE3;    // chip enable 3
  input        nG;    // output enable
  input        pADV;    // Advance not / load
  input        nCKE;
  inout  [DQ_size-1:0]    DQa;    // byte A data
  inout  [DQ_size-1:0]    DQb;    // byte B data
  inout  [DQ_size-1:0]    DQc;    // byte C data
  inout  [DQ_size-1:0]    DQd;    // byte D data
  input        ZZ;      // power down
  input        nFT;    // Pipeline / Flow through
  input        nLBO;    // Linear Burst Order not
  wire        TMS;    // Scan Test Mode Select
  wire        TDI;    // Scan Test Data In
  wire        TDO;    // Scan Test Data Out
  wire        TCK;    // Scan Test Clock

  wire                      nBe = 1,
          nBf = 1,
          nBg = 1,
          nBh = 1;
  wire    [8:0]             DQe,
          DQf,
          DQg,
          DQh;

   parameter       tKQ_pipe  = (SPEED==400 | SPEED==375 | SPEED==333 | SPEED==250) ? 2.5 : SPEED==200 ? 3.0 : 3.8;
   parameter       tKQ_flow  = SPEED==400 ? 4.0 : SPEED==375 ? 4.2 : SPEED==333 ? 4.5: SPEED==250 ? 5.5 : SPEED==200 ? 6.5 : 7.5;
   parameter       tKQX_pipe = 1.5;
   parameter       tKQX_flow = 2.0;

   assign       tKQ  = nFT ? tKQ_pipe : tKQ_flow;
   assign       tKQX = nFT ? tKQX_pipe : tKQX_flow;
       
`include  "core.v"

endmodule
