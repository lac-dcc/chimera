//This is the data cache module


module data_cache(data_address,in_data,out_data,read_enable,write_enable,clk,isByte);
parameter data_width = 8;	//size of each data read, will be of width 16, i.e, half word by default.
parameter N =32;
parameter addr_width = 12;	//It determines the number of data (half)words in memory

reg [data_width-1:0] M [2^addr_width-1:0];	//2^addr_width-1, 16 bit data
input [N-1 :0] data_address;
input read_enable;
input write_enable;
input clk;
input isByte;

output reg [N-1:0] out_data;
input [N-1 :0] in_data;

always @ (posedge read_enable, posedge write_enable)
begin
	if(read_enable)	begin
		if(isByte == 1) out_data = {24'hzzzzzz, M[data_address[addr_width-1:0]]};
		else out_data = { M[data_address[addr_width-1:0]+3], M[data_address[addr_width-1:0]+2], M[data_address[addr_width-1:0]+1] , M[data_address[addr_width-1:0]]};
	end	
	
	else if(write_enable)
	begin
		if(isByte == 1) M[data_address[addr_width-1:0]]=in_data[data_width-1:0];
		else { M[data_address[addr_width-1:0]+3], M[data_address[addr_width-1:0]+2], M[data_address[addr_width-1:0]+1] , M[data_address[addr_width-1:0]] } = in_data;
	end
end

endmodule