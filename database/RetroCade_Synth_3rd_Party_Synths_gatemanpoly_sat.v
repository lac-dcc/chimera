// Eric Brombaugh
module sat(in, out);
   parameter isz = 17;  // input data width
   parameter osz = 12;  // output data width

   input signed [isz-1:0] in;   // input data to be saturated
   output signed [osz-1:0] out; // output data after saturation

   // Check low & high saturation conditions
   wire min =  in[isz-1] & ~&in[isz-2:osz-1];
   wire max = ~in[isz-1] &  |in[isz-2:osz-1];

   reg [osz-1:0] out;

   // select output
   always @(min or max or in)
     case({max,min})
       2'b01:  out = {1'b1,{osz-1{1'b0}}};  // max neg
       2'b10:  out = {1'b0,{osz-1{1'b1}}};  // max pos
       default:  out = in[osz-1:0];         // pass thru
     endcase
endmodule