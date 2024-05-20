// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : pad_models.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------
module PDIDGZ (PAD, C);
   input PAD;
   output C;
	assign C = PAD;
endmodule


module PDB04DGZ (I, OEN, PAD, C);
    input I, OEN;
    inout PAD;
    output C;

    bufif0	(PAD, I, OEN);
    buf		(C, PAD);
endmodule


module PDISDGZ (PAD, C);
   input PAD;
   output C;
	assign C = PAD;
endmodule


module PDO04CDG (I, PAD);
    input I;
    output PAD;
	assign PAD = I;
endmodule


module PDT04DGZ (I, OEN, PAD);
    input I, OEN;
    output PAD;
    bufif0	(PAD, I, OEN);
endmodule


module PDB04SDGZ (I, OEN, PAD, C);
    input I, OEN;
    inout PAD;
    output C;

    bufif0	(PAD, I, OEN);
    buf		(C, PAD);
endmodule


module PRB08DGZ (I, OEN, PAD, C);
    input I, OEN;
    inout PAD;
    output C;

    bufif0	(PAD, I, OEN);
    buf		(C, PAD);
endmodule
