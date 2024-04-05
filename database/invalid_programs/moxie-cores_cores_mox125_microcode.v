// microcode.v - pipeline microcode
//
// Copyright (c) 2012 Anthony Green.
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

`include "defines.h"

module microcode (/*AUTOARG*/
   // Outputs
   q,
   // Inputs
   opcode
   );

   input [7:0] opcode;
   output [`PCB_WIDTH-1:0] q;

   reg [`PCB_WIDTH-1:0] rom[0:63];

   initial $readmemb("microcode.bin", rom);

   wire [`PCB_WIDTH-1:0] f1, f2;
   
   assign f1 = rom[opcode[5:0]];
   assign f2 = 6'b111111;
   
   assign q = (opcode[7] ? f2 : f1);
   
endmodule // microcode
