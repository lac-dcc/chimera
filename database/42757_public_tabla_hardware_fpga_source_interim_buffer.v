// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module interim_buffer #(
    parameter addrLen = 6,
	parameter dataLen = 32,
	parameter memSize = 1 << addrLen
	)(
	input clk,
	input rstn,
	input wrt_en,
	input stall,
	input interim_invalid,
	
	input [addrLen-1:0] wrt_addr,
	input [dataLen-1:0] wrt_data,
    input rd_en,
	input [addrLen-1:0] rd_addr,
	//input [addrLen-1:0] rd_addr1,

	output reg [dataLen-1:0] data_out,
	output reg data_out_v
	//output reg [dataLen-1:0] data_out1,
	//output reg data_out1_v
);

reg [ dataLen - 1 : 0 ] mem [ 0 : memSize - 1 ];
reg [ memSize - 1 : 0 ] mem_en;
 

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		mem_en <= {memSize{1'b0}};
	end
	else if(wrt_en)
		mem_en[wrt_addr] <= 1'b1;
end

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		data_out_v <= 1'b0;
		//data_out1_v <= 1'b0;
	end
	else if(rd_en &&(~stall) ) begin
		data_out_v <= wrt_en && (wrt_addr == rd_addr) ? 1'b1 : mem_en[rd_addr];
		//data_out1_v <= wrt_en && (wrt_addr == rd_addr1) ? 1'b1 : mem_en[rd_addr1];
	end
	else if(~rd_en) begin
		data_out_v <= 1'b0;
		//data_out1_v <= 1'b0;
	end
end

always @(posedge clk) begin
	if(wrt_en)
		mem[wrt_addr] <= wrt_data;
end

always @(posedge clk) begin
	if(rd_en && (~stall) ) begin
		data_out <= wrt_en && (wrt_addr == rd_addr) ? wrt_data : mem[rd_addr];
		//data_out1 <= wrt_en && (wrt_addr == rd_addr1) ? wrt_data : mem[rd_addr1];
	end
end

endmodule