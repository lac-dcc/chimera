
module VGA_Controller(
	input clk,
	input rst,
	
	//avalon slave
	input [1:0]slave_address,
	input slave_read_en,
	input slave_write_en,
	output [31:0]slave_read_data,
	input [31:0]slave_write_data,
	
	//avalon master for accessing SDRAM
	output [31:0]master_address, 
	output master_read, 
	input [31:0]master_read_data, 
	input master_wait_request,
	input master_read_data_valid,
	
	//VGA_clk domain
	input VGA_CLK,
	input vga_rst,
	output VGA_SYNC_N,
	output VGA_BLANK_N,
	output [7:0]VGA_R,
	output [7:0]VGA_G,
	output [7:0]VGA_B,
	output VGA_HS,
	output VGA_VS
);

	//VGA state registers
	reg [31:0]fbAddr;
	reg [31:0]currUsing;
	reg [31:0]framesDone;
	
	//read requests
	reg [31:0]READ_REG;
	assign slave_read_data = READ_REG;
	always @ (*) begin
		case(slave_address)
			2'd0: READ_REG = framesDone;
			2'd1: READ_REG = currUsing;
			default: READ_REG = 0;
		endcase
	end
	
	//writing
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			fbAddr <= 0;
		end else begin
			if(slave_write_en) begin
				case(slave_address)
					2'd1: fbAddr <= slave_write_data;
				endcase
			end
		end
	end

	
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			framesDone <= 0;
			currUsing <= 0;
		end else begin
			//clear the frame status when read
			if(slave_read_en && slave_address == 0) begin
				framesDone <= starting_new;
			end else begin
				framesDone <= framesDone + starting_new;
			end
			if(starting_new) begin
				currUsing <= fbAddr;
			end
		end
	end
	
	
	
	wire starting_new;
	VGA_driver VGA0(
		//sys_clk
		clk, 
		rst, 
		fbAddr,
		starting_new,
		
		master_address, 
		master_read, 
		master_read_data, 
		master_wait_request,
		master_read_data_valid,
		
		//vga_clk
		VGA_CLK,
		vga_rst,
		VGA_SYNC_N, 
		VGA_BLANK_N, 
		VGA_R, 
		VGA_G, 
		VGA_B, 
		VGA_HS, 
		VGA_VS
	);

endmodule
