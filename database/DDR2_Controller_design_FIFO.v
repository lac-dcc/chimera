////////////////////////////////////////////////////////////////////////////////////
// FIFO single clock design
////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module FIFO (clk, reset, data_in, put, get, data_out, empty_bar, full_bar, fillcount);
parameter WIDTH = 8;
parameter DEPTH_P2 = 5; // 2^ DEPTH_P2;


output [WIDTH-1:0] data_out;
output empty_bar, full_bar;
output [DEPTH_P2:0] fillcount; //if it is full,we need onemore bit

input [WIDTH-1:0] data_in;
input put, get;
input reset, clk;

reg [WIDTH-1:0] data_out;
reg [DEPTH_P2:0] fillcount;

reg [WIDTH-1:0] queue [2**DEPTH_P2 -1 :0];

reg [DEPTH_P2-1 :0] rd_ptr;
reg [DEPTH_P2-1 :0] wr_ptr;

assign full_bar = !(fillcount == 2**DEPTH_P2);
assign empty_bar = !(fillcount == 0);

always @ (posedge clk)
begin
	if(reset)
	begin
		rd_ptr<=0;
		wr_ptr<=0;
		fillcount<=0;
	end
	else if(put && get && empty_bar)
	begin
		data_out<=queue[rd_ptr];
		queue[wr_ptr]<=data_in;
		rd_ptr<=rd_ptr+1;
		wr_ptr<=wr_ptr+1;
	end
	else if(put && full_bar)
	begin
		queue[wr_ptr]<=data_in;
		wr_ptr<=wr_ptr+1;
		fillcount<=fillcount+1;
	end
	else if(get && empty_bar)
	begin
		data_out<=queue[rd_ptr];
		rd_ptr<=rd_ptr+1;
		fillcount<=fillcount-1;
	end
	else
	begin
		rd_ptr<=rd_ptr;
		wr_ptr<=wr_ptr;
		fillcount<=fillcount;
	end
end
endmodule
