// sim.v - Top level SoC simulation module.
//
// Copyright (c) 2009, 2010, 2011  Anthony Green.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

`timescale 1us/1ns

module sim (/*AUTOARG*/
	    );

  reg         clk;
  reg         rst;

  // synthesis translate_off 
  initial
    begin
      $dumpvars(1,soc);
    end
  // synthesis translate_on 

  muskoka soc (.clk_i (clk),
	       .rst_i (rst));

  always #4 clk = ~clk;

  initial
    begin
      clk <= 1'b1;
      rst <= 1'b0;
      #5 rst <= 1'b1;
      #5 rst <= 1'b0;
    end
  
endmodule // sim  
