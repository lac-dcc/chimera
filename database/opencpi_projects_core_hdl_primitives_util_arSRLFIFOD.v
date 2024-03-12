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

// arSRLFIFOD.v
// Copyright (c) 2009-2012 Atomic Rules LLC, ALL RIGHTS RESERVED
//
// 2009-05-10 ssiegel Creation in VHDL
// 2009-11-01 ssiegel Converted to Verilog from VHDL
// 2009-11-14 ssiegel Add D flop at back end for greater Fmax
// 2011-06-17 ssiegel Update logic to follow non-registered version
// 2011-07-28 hyzeng  Changed ENQ action so that XST for both V5 and V6 would infer SRL
// 2011-08-15 ssiegel Reverse index of SRL FIFO register to get SRL inference
// 2012-01-20 ssiegel Place dat[] update logic outside of reset conditional

module arSRLFIFOD (CLK,RST_N,ENQ,DEQ,FULL_N,EMPTY_N,D_IN,D_OUT,CLR);

  parameter width = 128;
  parameter l2depth = 5;
  localparam depth = 2**l2depth;

  input CLK;
  input RST_N;
  input CLR;
  input ENQ;
  input DEQ;
  output FULL_N;
  output EMPTY_N;
  input[width-1:0] D_IN;
  output[width-1:0] D_OUT;

  reg[l2depth-1:0] pos;          // Head position
  reg[width-1:0] dat[depth-1:0]; // SRL FIFO
  reg[width-1:0] dreg;           // Ouput register
  reg sempty, sfull, dempty;     // Flags
  wire sdx;                      // SRL-DEQ and D-ENQ

  integer i;
  // Standard stupidity since there is no builtin verilog way to do this
  function [l2depth-1:0] trunc(input [31:0] val);
    trunc = val[l2depth-1:0];
  endfunction

  // Note that proper SRL inference in XST 13.4 seems to require that there be
  // a separate, not-conditional-upon-reset always block for the SRL data
  // array to be updated in...
  always@(posedge CLK) begin
    if (ENQ) begin // SRL should be inferred here...
      for(i=depth-1;i>0;i=i-1) dat[i] <= dat[i-1];
      dat[0] <= D_IN;
    end
  end

  // We have also pulled dreg out into its own block as it neither needs to
  // have any defined state upon reset; and we do not want it in the reset
  // conditional block where it would take on an implicit clock-enable of RST_N...
  always@(posedge CLK) begin
    if (sdx) begin
      dreg   <= dat[pos-1]; // transfer the SRL to the D reg
    end
  end

  always@(posedge CLK) begin
    if(!RST_N || CLR) begin
      pos    <=  'b0;
      sempty <= 1'b1;
      sfull  <= 1'b0;
      dempty <= 1'b1;
    end else begin
      if (!ENQ &&  sdx) pos <= trunc(pos - 1); // suppress warning
      if ( ENQ && !sdx) pos <= trunc(pos + 1); // suppress warning

      sempty <= ((pos==0 && !ENQ)        || (pos==1 && (sdx&&!ENQ)));
      sfull <= ((pos==(depth-1) && !sdx) || (pos==(depth-2) && (ENQ&&!sdx)));

      // This registered version of the SRLFIFO operates as if there is 1-deep FIFO
      // appended to the output of the SRL FIFO. An ENQ of of the 1-deep FIFO
      // must happen with a DEQ of the SRL FIFO, this internal signal is "sdx"
      if (sdx) begin
        dempty <= 1'b0; // dempty becomes False when we load the 1-deep FIFO
      end
      if (DEQ && sempty) begin
        dempty <= 1'b1; // dempty becomes True when we DEQ and nothing to sdx
      end
    end
  end

  assign sdx     = ((dempty && !sempty) || (!dempty && DEQ && !sempty));
  assign FULL_N  = !sfull;
  assign EMPTY_N = !dempty;
  assign D_OUT   = dreg;

endmodule
