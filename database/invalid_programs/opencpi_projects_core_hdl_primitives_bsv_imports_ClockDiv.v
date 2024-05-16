
// Copyright (c) 2000-2012 Bluespec, Inc.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// $Revision: 29441 $
// $Date: 2012-08-27 21:58:03 +0000 (Mon, 27 Aug 2012) $

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif


// A clock divider circuit.
// Division is based on the parameters, where
// Division is upper - lower + 1
// Duty cycle is :
//       let half = 1 << (width-1)
//       (upper - half) / upper - lower + 1
// E.g., (2,1,3) is a divide by 3  duty cycle  2/3
//       (2,0,3) is a divide by 4  duty cycle  2/4
//       (1,0,1) is a divide by 2, duty cycle  1/2
//       (3,1,5) is a divide by 5  duty cycle  2/5
//       (3,2,6) is a divide by 5  duty cycle  3/5
// The offset allow edges for seperate modules to be determined
// relative to each other. a clock divider with offset 1 occurs one
// (fast) clock later than a clock with offset 0.
module ClockDiv(CLK_IN, RST, PREEDGE,  CLK_OUT);

   parameter width = 2 ;        // must be sufficient to hold upper
   parameter lower = 1 ;        //
   parameter upper = 3 ;
   parameter offset = 0;        // offset for relative edges.
                                // (0 <= offset <= (upper - lower)

   input     CLK_IN;            // input clock
   input     RST;

   output    PREEDGE;           // output signal announcing an upcoming edge
   output    CLK_OUT;           // output clock

   reg [ width -1 : 0 ] cntr ;
   reg                  PREEDGE ;

   // Wire constants for the parameters
   wire [width-1:0]     upper_w ;
   wire [width-1:0]     lower_w ;

   assign               CLK_OUT = cntr[width-1] ;
   assign               upper_w = upper ;
   assign               lower_w = lower ;

   // The clock is about to tick when counter is about to set its msb
   //  Note some simulators do not allow 0 width expressions
   wire [width-1:0]     nexttick = ~ ( 'b01 << (width-1) )  ;

   // Combinational block to generate next edge signal
   always@( cntr or nexttick )
     begin
        #0
        // The nonblocking assignment use to delay the update of the edge ready signal
        // Since this read by other always blocks trigger by the output CLK of this module
        PREEDGE <= `BSV_ASSIGNMENT_DELAY  (cntr == nexttick) ;
     end

   always@( posedge CLK_IN or `BSV_RESET_EDGE RST )
     begin
        // The use of blocking assignment within this block insures
        // that the clock generated from cntr[MSB] occurs before any
        // LHS of nonblocking assigments also from CLK_IN occur.
        // Basically, this insures that CLK_OUT and CLK_IN occur within
        // the same phase of the execution cycle,  before any state
        // updates occur. see
        // http://www.sunburst-design.com/papers/CummingsSNUG2002Boston_NBAwithDelays.pdf

        if ( RST == `BSV_RESET_VALUE )
          cntr = upper - offset ;
        else
          begin
             if ( cntr < upper_w )
               cntr = cntr + 1 ;
             else
               cntr = lower_w ;
          end // else: !if( RST == `BSV_RESET_VALUE )
     end // always@ ( posedge CLK_IN or `BSV_RESET_EDGE RST )

`ifdef BSV_NO_INITIAL_BLOCKS
`else // not BSV_NO_INITIAL_BLOCKS
  // synopsys translate_off
  initial
    begin
       #0 ;
       cntr = (upper - offset)  ;
       PREEDGE = 0 ;
    end // initial begin
  // synopsys translate_on
`endif // BSV_NO_INITIAL_BLOCKS


endmodule // ClockDiv
