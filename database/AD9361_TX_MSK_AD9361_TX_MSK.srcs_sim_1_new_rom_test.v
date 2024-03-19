`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/19 14:26:49
// Design Name: 
// Module Name: rom_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rom_test;

reg clka;
reg rst;
reg [7:0] addr;

wire [11:0] douta;
wire [7:0] addra;

initial begin
	rst = 0;
	#23 rst = 1;
	#301 rst = 0;
	#1000;
	#23 rst = 1;
	#31 rst =0;
end

initial begin
	clka = 0;
	while(1) #1 clka = ~clka;
end

assign addra = addr;
qpath_generator your_instance_name (
  .clka(clka),    // input wire clka
  .rsta(rst),    // input wire rsta
  .addra(addra),  // input wire [7 : 0] addra
  .douta(douta)  // output wire [11 : 0] douta
);



always @(posedge clka) begin
	if (rst) begin
		addr <= 0;
	end
	else begin
		if (addr!=215) begin
			addr  <= addr + 1;
		end
		else begin
			addr <= 0;
		end
	end
end

reg [7:0] addr1;
reg [7:0] addr2;
always @(posedge clka) begin
	if (rst) begin
		addr1 <= 0;
		addr2 <= 0;
	end
	else begin
		addr1 <= addr;
		addr2 <= addr1;
	end
end
endmodule
