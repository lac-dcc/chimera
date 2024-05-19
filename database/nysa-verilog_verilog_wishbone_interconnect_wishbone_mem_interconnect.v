// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wishbone_interconnect.v
/*
Distributed under the MIT licesnse.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/


/*
Log:
5/18/2013: Implemented new naming Scheme
*/

module wishbone_mem_interconnect (
  //Control Signals
  input 				      clk,
  input 				      rst,

  //Master Signals
  input 				      i_m_we,
  input				        i_m_stb,
  input				        i_m_cyc,
  input		    [3:0]	  i_m_sel,
  input		    [31:0]	i_m_adr,
  input  		  [31:0]	i_m_dat,
  output reg	[31:0]	o_m_dat,
  output reg			    o_m_ack,
  output reg			    o_m_int,

${PORTS}
);


${MEM_PARAMS}

${MEM_SELECT}

${DATA}

${ACK}

${INT}

${ASSIGN}

endmodule
