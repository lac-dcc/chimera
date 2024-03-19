`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008

module rs232rcv(
  input Ph0, //66.5 MHz clock (15.03ns)
  input RxD, //received data
  output [7:0] rData, //received character
  output ready,
  input readSR 
);

wire runCounter;
(* KEEP = "TRUE" *) wire midBit;
reg [9:0] bitCounter;
reg [9:0] sr;
reg run;

/* synthesis translate_off */
initial begin
  run = 1'b0;
  sr  = 10'b0; 
end
/* synthesis translate_on */

/*
An rs232 receiver for 115,200 bps, 8 data bits.  Holds one character, which must be read
before the following character arrives.

Initially run = bitCounter = sr == 0.  When RxD falls, bitCount increments.  If RxD is still
0 at midBit, run is set.  This keeps bitCount advancing through 0..BitTime ulntil run falls,
which occurs when the start bit shifts into sr[0].  The shift register samples every midBit.
The character is ~sr[8:1].  When the system reads the character (readSR = 1), the shift register is cleared.
*/

  assign runCounter = ~RxD | run;
//  assign midBit = bitCounter == 271;
//  assign midBit = bitCounter == 290;		//266
  assign midBit = bitCounter == 253;		//233
  
  always @(posedge Ph0)  //the bitCounter
 //   if(runCounter & (bitCounter < 542)) bitCounter <= bitCounter + 1;
//    if(runCounter & (bitCounter < 579)) bitCounter <= bitCounter + 1;	//266
    if(runCounter & (bitCounter < 506)) bitCounter <= bitCounter + 1;	//233
    else bitCounter <= 0;
    
  always @(posedge Ph0) // the run flipflop
    if(~RxD & midBit & ~run) run <= 1;
    else if(readSR) run <= 0;
    
  always @(posedge Ph0)
    if(midBit & ~sr[0]) begin
      sr[8:0] <= sr[9:1]; //right shift
      sr[9] <= ~RxD; //sample the input
    end
    else if(readSR) sr <= 0;
  
  assign ready = sr[0];
  assign rData = ~sr[8:1];
  
 endmodule
