// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

//
// Copyright (c) 1999 Steven Wilson (stevew@home.com)
//
//    This source code is free software; you can redistribute it
//    and/or modify it in source code form under the terms of the GNU
//    General Public License as published by the Free Software
//    Foundation; either version 2 of the License, or (at your option)
//    any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program; if not, write to the Free Software
//    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
//
//  SDW - Compount ifdef test with 2 defines
//


`define DOUBLE
`define NOCODE
module ifdef2;

reg error ;


`ifdef DOUBLE
`ifdef NOCODE
initial
   begin
     #20;
     error = 0;
     #20;
   end
`endif // NOCODE
`endif // DOUBLE
initial
 begin
   #1;
   error = 1;
   #40;
   if(error == 0)
      $display("PASSED");
   else
      $display("FAILED");
  end

endmodule // main
