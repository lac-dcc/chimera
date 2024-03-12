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


module controller_rom #(address_size = 5'd14)
(

	input             clk,
	input             reset_n,
	
	// Instruction
	input [31:0]    	iBus_cmd_payload_pc, 
	input					iBus_cmd_valid,
	output reg			iBus_cmd_ready,
	output [31:0]     iBus_rsp_payload_inst,
	output reg			iBus_rsp_valid,
		
	// Data Bus
    output reg      	bram_valid,
    input           	bram_write,
    input           	bram_request,
    input  [23:0]   	bram_address,
    input  [3:0]    	bram_mask,
    input  [31:0]   	bram_data_out,
    output [31:0]   	bram_data_in
);

// Data wires
wire [31:0] bridge_rd_data_dmem;



// This is a 32K ram block for the MPU CPU access and is switched to the APF bus when in reset for uploading code.
// It will allow the instruction and data sides of the MPU to read instructions and R/W Data at the same time.


// The A side is the Data side.
// The B Side is the instruction and APF UPLOAD side.

// Now here is the BRAM!!! YAY

// first we upload via the Imem interface

reg [23:0] iBus_address;
reg iBus_rden;
reg iBus_wren;


always @(posedge clk) iBus_rsp_valid <= iBus_cmd_valid;

always @* begin
//	if (reset_n) begin
		iBus_address 	<= iBus_cmd_payload_pc;
		iBus_rden		<= iBus_cmd_valid;
		iBus_wren 		<= 1'b0;
	   iBus_cmd_ready  <= 1;
end

always @(posedge clk) bram_valid <= bram_request;
	
imem_bram imem_bram (
	.clock		(clk),
	
	.address_a	(bram_address[23:2]),
	.data_a		(bram_data_out),
	.byteena_a	(bram_mask),
	.rden_a		(bram_request),
	.wren_a		(bram_write && bram_request),
	.q_a		   (bram_data_in),
	 
	
	.address_b	(iBus_cmd_payload_pc[23:2]),
	.rden_b		(iBus_cmd_valid),
	.data_b		(32'h0),
	.wren_b		(1'b0),
	.q_b			(iBus_rsp_payload_inst));

endmodule
