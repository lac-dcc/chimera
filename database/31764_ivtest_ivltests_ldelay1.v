// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * Copyright (c) 2001 Stephan Boettcher <stephan@nevis.columbia.edu>
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

// $Id: ldelay1.v,v 1.2 2007/12/06 02:31:10 stevewilliams Exp $

// Test for delays in structural logic. Inertial delays

module test;

   wire q;
   reg  a, b;
   and #6 (q, a, b);

   task ok;
      input qq;
      reg error;
      begin
	 if (q !== qq)
	   begin
	      error = 1;
	      $display("%0d: FAILED: q=%b, expect %b", $time, q, qq);
	   end
      end
   endtask

   initial
     begin
	ok.error = 0;
//	$dumpvars;
	a <= 0;
	b <= 1;
	#5 ok(1'b x);
	#2 ok(1'b 0);
	a <= 1;
	#5 ok(1'b 0);
	#2 ok(1'b 1);
	a <= 0;
	#3 ok(1'b 1);
	a <= 1;
	#1 ok(1'b 1);
	#1 ok(1'b 1);
	#1 ok(1'b 1);
	#1 ok(1'b 1);
	#1 ok(1'b 1);
	#1 ok(1'b 1);
	#1 ok(1'b 1);
	if (!ok.error)
	  $display("PASSED");
     end
endmodule
