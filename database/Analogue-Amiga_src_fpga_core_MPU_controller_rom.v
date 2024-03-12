`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2022 14:07:05
// Design Name: 
// Module Name: controller_rom
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


module controller_rom #(parameter top_address = 8'h80, address_size = 5'd14)
(

	input                  	clk,
	input                  	reset_n,
	
	// Instruction
	input [31:0]           	iBus_cmd_payload_pc, 
	input							iBus_cmd_valid,
	output reg 					iBus_cmd_ready,
	output [31:0]      		iBus_rsp_payload_inst,
	output reg 					iBus_rsp_valid,
		
	// Data Bus
	input [31:0]           	data_addr,
	input [31:0]           	data_d,
	output [31:0]      		data_q,
	input                  	data_we,
	input							dBus_cmd_valid,
	input [1:0]            	data_bytesel,
	
	// APF Bus
	input 						little_enden,
	input 	     		 		clk_74a,
	input [31:0]  		 		bridge_addr,
	input 	     		 		bridge_rd,
	output reg [31:0]  	 	bridge_rd_data,
	input 	     		 		bridge_wr,
	input  [31:0]   	 		bridge_wr_data
);

// Data wires
wire [31:0] q_b, data_q_dmem, data_q_imem, q_b_wire, bridge_rd_data_dmem;

// APF Bus write selectors
wire wren_b_read 	= (bridge_addr[31:24] == 8'h80) && bridge_rd;
wire wren_b_write 	= (bridge_addr[31:24] == 8'h80) && bridge_wr;

reg [3:0] data_byte_select;

// now we need to make the core able to read and write from the APF and the instructions side will stop for the processes

reg [3:0] IF_STATE;
reg bridge_read_reg;
reg bridge_write_reg;
reg bridge_read_hold;
reg bridge_write_hold;
reg [31:0] bridge_address_reg;
reg [31:0] bridge_data_reg;
reg 			pending_bus;

parameter		reset_state 	= 0,
					start_normal 	= 1,
					normal 			= 2,
					bridge_address = 3,
					bridge_data 	= 4;

	always @(posedge clk) begin
		if (!reset_n) begin
			IF_STATE 				<= reset_state;
			iBus_cmd_ready 		<= 1'b0;
			iBus_rsp_valid 		<= 1'b0;
			pending_bus				<= 1'b0;
			bridge_address_reg 	<=	bridge_addr;
			bridge_data_reg 		<= bridge_wr_data;
			bridge_write_reg		<= wren_b_write;
			bridge_read_reg		<= wren_b_read;
			bridge_write_hold		<= 'b0;
			bridge_read_hold		<= 'b0;
		end
		else begin
			case (IF_STATE)
				start_normal : begin
					iBus_cmd_ready <= 1'b1;
					iBus_rsp_valid <= 1'b0;
					IF_STATE			<= normal;
				end
				normal : begin
					if (pending_bus) begin
						iBus_cmd_ready <= 1'b0;
						iBus_rsp_valid <= iBus_cmd_valid;
						IF_STATE			<= bridge_address;
					end
					else if (iBus_cmd_valid && ~pending_bus) begin
						iBus_cmd_ready <= 1'b1;
						iBus_rsp_valid <= 1'b1;
						IF_STATE			<= normal;
					end
					else begin
						iBus_cmd_ready <= 1'b1;
						iBus_rsp_valid <= 1'b0;
						IF_STATE			<= normal;
					end
				
				end
				bridge_address : begin
					iBus_cmd_ready <= 1'b0;
					iBus_rsp_valid <= 1'b0;
					IF_STATE			<= bridge_data;
				
				end
				bridge_data : begin
					iBus_cmd_ready 	<= 1'b1;
					iBus_rsp_valid 	<= 1'b0;
					bridge_read_reg	<= bridge_read_hold;
					bridge_write_reg	<= bridge_write_hold;
					pending_bus			<= 1'b0;
					IF_STATE				<= normal;
				end	
			
				default : begin
					iBus_cmd_ready 	<= 1'b0;
					iBus_rsp_valid 	<= 1'b0;
					bridge_read_reg	<= 1'b0;
					bridge_write_reg	<= 1'b0;
					pending_bus			<= 1'b0;
					IF_STATE				<= start_normal;
				end
			endcase
		
			if (|{wren_b_read, wren_b_write}) begin
				pending_bus 			<= 1'b1;
				bridge_address_reg 	<=	bridge_addr;
				bridge_data_reg 		<= bridge_wr_data;
				bridge_read_hold		<= bridge_rd;
				bridge_write_hold		<= bridge_wr;
			end
		end
		
		
	end

always @* begin
	case ({data_bytesel,data_addr[1:0]})
		{2'b00, 2'b00} : data_byte_select <= 4'b0001;
		{2'b00, 2'b01} : data_byte_select <= 4'b0010;
		{2'b00, 2'b10} : data_byte_select <= 4'b0100;
		{2'b00, 2'b11} : data_byte_select <= 4'b1000;
		
		{2'b01, 2'b00} : data_byte_select <= 4'b0011;
		{2'b01, 2'b01} : data_byte_select <= 4'b0011;
		{2'b01, 2'b10} : data_byte_select <= 4'b1100;
		{2'b01, 2'b11} : data_byte_select <= 4'b1100;
		
		default  		: data_byte_select <= 4'b1111;
	endcase
end

// This is a 32K ram block for the MPU CPU access and is switched to the APF bus when in reset for uploading code.
// It will allow the instruction and data sides of the MPU to read instructions and R/W Data at the same time.


// The A side is the Data side.
// The B Side is the instruction and APF UPLOAD side.




imem_bram imem_bram (
	.clock_a		(clk),
	.address_a	(data_addr),
	.data_a		(data_d),
	.byteena_a	(data_byte_select),
	.rden_a		(dBus_cmd_valid),
	.wren_a		(data_we),
	.q_a			(data_q_imem),
	
	.clock_b		(clk),
	.address_b	(iBus_cmd_ready ? iBus_cmd_payload_pc[23:2] 	: bridge_address_reg[23:2]),
	.rden_b		(iBus_cmd_ready ? iBus_cmd_valid 				: bridge_read_reg),
	.data_b		({bridge_wr_data[7:0], bridge_wr_data[15:8], bridge_wr_data[23:16], bridge_wr_data[31:24]}),
	.wren_b		(bridge_write_reg),
	.q_b			(iBus_rsp_payload_inst));
	
// This is a 2K ram block for the MPU CPU access and APF bus for a buffer core.	
//dmem_bram dmem_bram (
//	.clock_a		(clk),
//	.address_a	(data_addr[15:2]),
//	.data_a		(data_d),
//	.byteena_a	(data_byte_select),
//	.rden_a		(dBus_cmd_valid),
//	.wren_a		(data_we && data_addr[16]),
//	.q_a			(data_q_dmem),
//	
//	.address_b	(bridge_addr[15:2]),
//	.rden_b		(bridge_rd),
//	.clock_b		(clk),
//	.data_b		(~little_enden ? {bridge_wr_data[7:0], bridge_wr_data[15:8], bridge_wr_data[23:16], bridge_wr_data[31:24]} : bridge_wr_data),
//	.wren_b		(wren_b_data),
//	.q_b			(bridge_rd_data_dmem));

// MPU Data Side to mux the two ram locations
	
//reg data_addr_mux;
//	
//always @(posedge clk) if (dBus_cmd_valid) data_addr_mux <= data_addr[16];
//	
//assign data_q = data_addr_mux ? data_q_dmem : data_q_imem;

// APF Address

//reg bridge_addr_mux;
always @(posedge clk_74a) begin
	if(bridge_read_reg) bridge_rd_data <= ~little_enden ? {iBus_rsp_payload_inst[7:0], iBus_rsp_payload_inst[15:8], iBus_rsp_payload_inst[23:16], iBus_rsp_payload_inst[31:24]} 
																		 : iBus_rsp_payload_inst;
end
endmodule
