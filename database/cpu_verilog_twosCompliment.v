// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

module twosCompliment(in,result);
   input [31:0] in;
   output [31:0] result;
   reg [31:0] result;
	
   always@(*) 
   begin
       result = ~in + 1;
   end
endmodule
