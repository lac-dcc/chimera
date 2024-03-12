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

// arSRLFIFO.v
// Copyright (c) 2009-2012 Atomic Rules LLC, ALL RIGHTS RESERVED
//
// 2009-05-10 ssiegel Creation in VHDL
// 2009-11-01 ssiegel Converted to Verilog from VHDL
// 2010-07-23 ssiegel Logic change for empty and full
// 2011-06-17 ssiegel No logic change, scrub comments, formatting
// 2012-01-20 ssiegel Place dat[] update logic outside of reset conditional

module arSRLFIFO (CLK,RST_N,ENQ,DEQ,FULL_N,EMPTY_N,D_IN,D_OUT,CLR);

  parameter  width   = 128;
  parameter  l2depth = 5;
  localparam depth   = 2**l2depth;

  input             CLK;
  input             RST_N;
  input             CLR;
  input             ENQ;
  input             DEQ;
  output            FULL_N;
  output            EMPTY_N;
  input[width-1:0]  D_IN;
  output[width-1:0] D_OUT;

  reg[l2depth-1:0]  pos;             // head position
  reg[width-1:0]    dat[depth-1:0];  // SRL FIFO
  reg               empty, full;

  integer i;

  // Note that proper SRL inference in XST 13.4 seems to require that there be
  // a separate, not-conditional-upon-reset always block for the SRL data
  // array to be updated in...
  always@(posedge CLK) begin
    if (ENQ) begin
      for(i=depth-1;i>0;i=i-1) dat[i] <= dat[i-1];
      dat[0] <= D_IN;
    end
  end

  always@(posedge CLK) begin
    if(!RST_N || CLR) begin
      pos     <= 1'b0;
      empty   <= 1'b1;
      full    <= 1'b0;
    end else begin
      if (!ENQ &&  DEQ) pos <= pos - 1;
      if ( ENQ && !DEQ) pos <= pos + 1;
      empty <= ((pos==0         && !ENQ) || (pos==1         && (DEQ&&!ENQ)));
      full  <= ((pos==(depth-1) && !DEQ) || (pos==(depth-2) && (ENQ&&!DEQ)));
    end
  end

  assign FULL_N  = !full;
  assign EMPTY_N = !empty;
  assign D_OUT   = dat[pos-1];

endmodule
