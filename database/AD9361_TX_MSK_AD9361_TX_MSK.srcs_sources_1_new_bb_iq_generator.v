`timescale 1ns / 1ps
//--------------------------------------------------------------
// author 		: Noodle
// introduciton : this mudole used to be i/q data generator
//--------------------------------------------------------------


module bb_iq_generator 
	#(
	parameter DATA_SIZE 	= 7200,		// i/q data size restore in BROM
	parameter ADDR_WIDTH 	= 13		// addr width depends on DATA_SIZE		
	)
	(
	input rst,
	input clk,
(*mark_debug = "true"*)	output reg [11:0] i_path,
(*mark_debug = "true"*)	output reg [11:0] q_path
    );


wire 	[ADDR_WIDTH-1:0] 	addra;				
reg 	[ADDR_WIDTH-1:0] 	addr;				
wire 	[11:0] 				dout_i;
wire 	[11:0] 				dout_q;

assign addra = addr;

ipath_generator i_path_inst (
  .clka(clk),    	// input wire clka
  .rsta(rst),    	// input wire rsta
  .addra(addra),  	// input wire [ADDR_WIDTH-1 : 0] addra
  .douta(dout_i)  	// output wire [ADDR_WIDTH-1 : 0] douta
);

qpath_generator q_path_inst (
  .clka(clk),    	// input wire clka
  .rsta(rst),    	// input wire rsta
  .addra(addra),  	// input wire [ADDR_WIDTH-1 : 0] addra
  .douta(dout_q)  	// output wire [ADDR_WIDTH-1 : 0] douta
);

integer delay_cnt;

/*build addr timing*/
always @(posedge clk) begin
	if (rst) begin
		addr <= 0;
		delay_cnt <= 0;
	end
	else begin
		if (delay_cnt==0 && addr != DATA_SIZE-1) begin
			addr  <= addr + 1;
			delay_cnt <= delay_cnt+1;
		end
		else if(delay_cnt==1) begin
			delay_cnt <= 0;
		end
		else  begin
			addr <= 0;
		end
	end
end

always @(posedge clk) begin
	if (rst) begin
		i_path <= 0;
		q_path <= 0;
	end
	else begin
		i_path <= dout_i;
		q_path <= dout_q;
	end
end

endmodule
