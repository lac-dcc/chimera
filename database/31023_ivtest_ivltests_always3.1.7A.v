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
//  SDW - Validate always forever statement ;

module main ;

reg [3:0] value1,value2,value3;

initial
	begin
            value1 = 0;		// Time 0 assignemnt
            value2 = 0;
            #6 ;
            if(value1 != 4'h1)
              begin
                $display("FAILED - 3.1.7A always forever (1) ");
                 value2 = 1;
              end
            #5 ;
            if(value1 != 4'h2)
              begin
                $display("FAILED - 3.1.7A always forever (2) ");
                 value2 = 1;
              end
            #5 ;
            if(value1 != 4'h3)
              begin
                $display("FAILED - 3.1.7A always forever (3) ");
                 value2 = 1;
              end
            if(value2 == 0)
               $display("PASSED");
	   $finish;
        end

always  forever begin
                   #5 ;
                   value1 = value1 + 1;
                end


endmodule
