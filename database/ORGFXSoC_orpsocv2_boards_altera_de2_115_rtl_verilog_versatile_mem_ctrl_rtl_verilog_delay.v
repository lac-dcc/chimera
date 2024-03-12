`timescale 1ns/1ns
module delay (d, q, clk, rst);

   parameter width = 4;
   parameter depth = 3;

   input  [width-1:0] d;
   output [width-1:0] q;
   input              clk;
   input 	      rst;

   reg [width-1:0] dffs [1:depth];

   integer i;
   
   always @ (posedge clk or posedge rst)
     if (rst)
       for ( i=1; i <= depth; i=i+1)
	 dffs[i] <= {width{1'b0}};
     else
       begin
	  dffs[1] <= d;
	  for ( i=2; i <= depth; i=i+1 )
	    dffs[i] <= dffs[i-1];
       end

   assign q = dffs[depth];   
   
endmodule //delay

   
