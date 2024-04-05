`include "timescale.v"
`include "define.v"

module ram_Synch(clk, rst_n, wr_n, rd_n, wr_addr, rd_addr, data_in, data_out);

  parameter data_width = 4;	//will be overrided during module instantiation
  parameter addr_width = 3; 

  input clk;
  input rst_n;
  input wr_n;
  input rd_n; 
  input [addr_width-1:0] wr_addr;
  input [addr_width-1:0] rd_addr;
  input  [data_width-1:0] data_in;
  output [data_width-1:0] data_out;
  
  reg [data_width-1:0] data_out; 
  reg [data_width-1:0] ram [(1<<addr_width)-1:0];

   
  //read
  always @ (posedge clk or negedge rst_n)
  	if (rst_n == 1'b0)
  		data_out <= 0;
  	else if (!rd_n)
  		data_out <= ram[rd_addr];
      
	//write
	always @ (posedge clk)
		if (!wr_n)
			ram[wr_addr] <= data_in;
			
endmodule
		
