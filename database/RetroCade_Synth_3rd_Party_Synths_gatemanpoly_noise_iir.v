// Adapted by: Scott R. Gravenhorst
// 2007-03-23
// Posted to FPGA-Synth by: Eric Brombaugh
//
// IIR filter that requires no dedicated multipliers.
//
// This version is intended for use as an LPF for the noise
// generator LFSRs that modulate pitch.
//
// Modified for large q values.
//
// Tried to make q larger than dsz -> that can't happen, look at what coef does, if bw is zero then fb1 
// is always zero so there's never any feedback.  This version assumes an input size of 18 bits, but pads 
// with zeroes on the right for calculations.  dsz can then be made large.  Module output must then use 
// just the upper 18 bits of the ssum1.  Even when q is less than but close to dsz, it looks like there 
// can be a loss of precision for fb1.  The intention of this modification is to get more out of the low
// bw end, esp. at zero, to allow very slowly changing values, like a random LFO.  Hopefully it makes for 
// weird phasing effects.  The extra register use is not a problem because this project is rather small 
// compared to the target FPGA.
//

module noise_iir(clk, ena, bw, in, sel, out);
  parameter dsz = 18;
  parameter q = 31;                     // max coeff - still 15, seems upper end doesn't do much. I'm more interested in lower end.
  parameter isz = dsz+q;                // Accumulator and ssum1 size

  input                   clk;          // System clock
  input                   ena;
  input         [4:0]     bw;           // bandwidth
  input signed  [dsz-1:0] in;           // Input data
  input         [4:0]     sel;          // select one of 32 filters
  output signed [dsz-1:0] out;          // Output data

  wire                    clk;
  wire                    ena;
  wire          [4:0]     bw;
  wire signed   [dsz-1:0] in;           // Input data
  wire          [4:0]     sel;          // select one of 32 filters
  wire signed   [dsz-1:0] out;          // Output data


  reg signed    [isz-1:0] acc1 [31:0];  // 32 accumulators

  wire          [5:0]     coef;
  wire signed   [isz:0]   sum1;         // unsaturated sum
  wire signed   [isz-1:0] ssum1;        // saturated sum
  wire signed   [dsz-1:0] fb1;          // feedback 

  assign coef = q - bw;                 // compute amount to shift acc1

  assign fb1 = acc1[sel] >>> coef;      // scale feedback
  assign sum1 = in + acc1[sel] - fb1;   // form sum (note the padding with zeroes)
  
// Saturate sum
  sat #( .isz(isz+1), .osz(isz)) usat1 ( .in(sum1), .out(ssum1) );

// filter state
  always @( posedge clk ) if ( ena ) acc1[sel] <= ssum1;

  assign out = fb1;
endmodule
