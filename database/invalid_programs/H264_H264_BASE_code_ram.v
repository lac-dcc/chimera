`include "timescale.v"
`include "define.v"

module ram (clk, reset_n, cs_n, wr_n,rd_addr, wr_addr, data_in, data_out);

  parameter data_width = 4;	//will be overrided during module instantiation
  parameter addr_width = 3;

  input clk;
  input reset_n;
  input cs_n;
  input wr_n; 
  input [data_width-1:0] data_in;
  input [addr_width-1:0] rd_addr;
  input [addr_width-1:0] wr_addr;
  output [data_width-1:0] data_out;
   
  reg [data_width-1:0] ram [(1<<addr_width)-1:0];

  //read
 assign data_out = ram[rd_addr] ;
    
	//write
always @ (posedge clk)
		if (!cs_n && !wr_n)
			ram[wr_addr] <= data_in;
			
endmodule
