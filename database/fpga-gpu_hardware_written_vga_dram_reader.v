

module vga_dram_master(
	//clk domain
		input clk,
		input rst,
		input start,
		input [31:0]read_from_addr,
		
		//avalon master for accessing SDRAM
		output [31:0]master_address, 
		output master_read, 
		input [31:0]master_read_data, 
		input master_wait_request,
		input master_read_data_valid,
	
	//VGA_CLK domain
		input VGA_CLK,
		input vga_rst,
		input read_pixel,
		output [15:0]pixel_out
);	
	//draw red on the screen if the fifo bottoms out
	wire [15:0]data_out;
	assign pixel_out = out_valid ? data_out : {1'd0, 5'd31, 5'd0, 5'd0};
	
	reg out_valid;
	always @ (posedge VGA_CLK or posedge vga_rst) begin
		if(vga_rst) begin
			out_valid <= 1'd0;
		end else begin
			out_valid <= read_pixel && !rdempty;
		end
	end
	
	
	//fifo to buffer data and bridge clock domains
	wire rdempty, wrfull;
	wire [9:0]wrusedw;
	pixel_fifo F1(rst | start, master_read_data, VGA_CLK, read_pixel, clk, master_read_data_valid, data_out, rdempty, wrfull, wrusedw);
	
	//pipelined access 
	assign master_address = currAddress; 
	
	//whenever the fifo is at least half-empty, try and read in 16 words
	wire shouldReadBurst = !wrusedw[9] && !wrfull && (wordsRead < 18'd153600) && (currAddress != 0);
	assign master_read = shouldReadBurst | (currAddress[5:0] != 0);
	
	reg [31:0]currAddress;
	reg [17:0]wordsRead;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			currAddress <= 32'd0;
			wordsRead <= 18'd0;
		end else begin
			if (start) begin
				currAddress <= read_from_addr;
				wordsRead <= 18'd0;
			end else if (!master_wait_request && master_read) begin
				wordsRead <= wordsRead + 1'd1;
				currAddress <= currAddress + 3'd4;
			end
		end
	end
	

endmodule


