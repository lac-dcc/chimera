// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0


module ts_gen(
   clk,
   reset,
   
   timer
  );
   input clk;
   input reset;
   
   output [31:0]timer;
   reg [31:0]timer;
always@(posedge clk or negedge reset)
   if(!reset)
     begin
       timer<=32'b0;
     end
   else
     begin
       timer<=timer+1'b1;
     end
endmodule
