`timescale 1ns / 1ps

module ctrl_dly #(
	parameter DWID       = 10,
	parameter DLY_NUM    = 1
) (
  input 					clk,                       // clock old 
  input 					rst,                       // reset old
  input  [DWID-1:0]			din,                       // oringinal data
  output [DWID-1:0]			dout                       // new data after pipe
);

//////////////////////////////////////////////////////////////////////////////////
//     signal declare
//////////////////////////////////////////////////////////////////////////////////
reg [DWID*(DLY_NUM+1)-1:0] din_dly;

always@( * ) begin
	din_dly[ DWID-1 : 0] = din; 
end

//////////////////////////////////////////////////////////////////////////////////
//     the data is clocked by clock
//////////////////////////////////////////////////////////////////////////////////
always@( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				din_dly[ DWID*(DLY_NUM+1)-1 : DWID] <= 0; 
		end 
		else begin
				din_dly[ DWID*(DLY_NUM+1)-1 : DWID] <= din_dly[ DWID*DLY_NUM-1 : 0]; 
		end
end

assign dout = din_dly[ DWID*(DLY_NUM+1)-1 : DWID*DLY_NUM ];

endmodule

