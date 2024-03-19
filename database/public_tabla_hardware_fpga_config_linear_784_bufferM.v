`timescale 1ns/1ps
`ifdef FPGA
	`include "config.vh"
`endif

module bufferM #(

	parameter addrLen = 10,
	parameter dataLen = 32,
	parameter peId = 0

	)(
	clk,
	reset,

	rd_addr,

	data_out
);

	//--------------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------------
	input clk;
	input reset;

	input [ addrLen - 1 : 0 ] rd_addr;

	output reg [ dataLen - 1 : 0 ] data_out;
	//--------------------------------------------------------------------------------------
reg [dataLen-1:0] rdata;
wire [addrLen-1:0] address;
assign address = rd_addr;

always @(posedge clk or posedge reset) begin
    if(reset)
        data_out <= {dataLen{1'b0}};
    else
	   data_out <= rdata;
end
/******************************************************/
generate
if(peId == 0) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 1) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 2) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 3) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 4) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 5) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 6) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 7) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 8) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 9) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 10) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 11) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 12) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 13) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 14) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 15) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 16) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 17) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 18) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 19) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 20) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 21) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 22) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 23) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 24) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 25) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 26) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 27) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 28) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 29) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 30) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 31) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 32) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 33) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 34) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 35) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 36) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 37) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 38) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 39) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 40) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 41) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 42) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 43) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 44) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 45) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 46) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 47) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 48) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 49) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 50) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 51) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 52) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 53) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 54) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 55) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 56) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 57) begin
	always @(*) begin
		case(address)
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 58) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 59) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 60) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 61) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 62) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

if(peId == 63) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end

endgenerate
/******************************************************/
endmodule
