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
//  SDW - Validate case/endcase w/ null_statement - no default

module main ();

reg error;
reg [2:0] val1,val2;
reg [2:0] result ;

always @( val1 or val2)
  case (val1 & val2 )
    3'b000,3'b001: result = 0;
    3'b101: ;
    3'b011: result = 1;
  endcase

initial
  begin
    error = 0;

    val1 = 3'b0;
    val2 = 3'b0;
    #1 if(result !==0)
      begin
        $display("FAILED case 3.8C - case (expr) lab1: ");
        error = 1;
      end
    val1 = 3'b111;
    val2 = 3'b011;
    #1 if(result !==1)
      begin
        $display("FAILED case 3.8C - case (expr) lab2: ");
        error = 1;
      end


    val2 = 3'b101;	// Should activate null statement and get no action
    #1 if(result !==1)
      begin
        $display("FAILED case 3.8C - case (expr) lab1: ");
        error = 1;
      end

    if(error == 0)
      $display("PASSED");
  end

endmodule // main
