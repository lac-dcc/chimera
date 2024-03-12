`include "tune.v"

module ram(
	addr,
	data,
	ce_n,oe_n,we_n
);

   input [15:0] addr;
   inout [7:0] data;
   wire [7:0] data;
   input ce_n,oe_n,we_n;
	reg [7:0] array [0:65535];

   reg [7:0] dou;


	integer i;

	initial
	begin
		for(i=0;i<65536;i=i+1)
			array[i] = 8'd0;
	end


  assign data = dou;


	always @*
	begin
		if( !ce_n && !oe_n && we_n )
			dou <= array[addr];
		else
			dou <= 8'bZZZZZZZZ;


		if( !ce_n && !we_n )
			array[addr] <= data;


	end




endmodule

