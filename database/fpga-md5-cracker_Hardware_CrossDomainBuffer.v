module CrossDomainBuffer(
   input wire clk,
	input wire [31:0] in,
	input wire save,	
	output reg [31:0] out = 0,
   output wire saved
);

always @(posedge save) 
   begin
      out <= in;      
   end

reg [1:0] syncSaved;
   
always @(posedge clk)
   begin
      syncSaved[0] <= save;
      syncSaved[1] <= syncSaved[0];
   end
 
 assign saved = syncSaved[1];

endmodule
