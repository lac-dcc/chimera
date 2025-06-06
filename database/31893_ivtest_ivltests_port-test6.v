// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * Copyright (c) 2002 Stephen Williams (steve@icarus.com)
 *
 *    This source code is free software; you can redistribute it
 *    and/or modify it in source code form under the terms of the GNU
 *    General Public License as published by the Free Software
 *    Foundation; either version 2 of the License, or (at your option)
 *    any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 */

module main;

   reg [7:0] a, b;
   wire [8:0] res;

   has_ports test(res, a, b);

   initial begin
      a = 0;
      b = 0;
      #1 $display("has_ports (%b, %b, %b)", res, a, b);
      if (res !== (a + b)) begin
	 $display("FAILED");
	 $finish;
      end

      a = 10;
      #1 $display("has_ports (%b, %b, %b)", res, a, b);
      if (res !== (a + b)) begin
	 $display("FAILED");
	 $finish;
      end

      b = 11;
      #1 $display("has_ports (%b, %b, %b)", res, a, b);
      if (res !== (a + b)) begin
	 $display("FAILED");
	 $finish;
      end

      $display("PASSED");
   end // initial begin

endmodule // main

module has_ports (output reg [8:0] o,
		  input wire [7:0] a,
		  input wire [7:0] b);

   always @* o <= a + b;

endmodule // has_ports
