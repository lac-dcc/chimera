// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

// using conter
// ref : https://github.com/YukunXue/IC_lib
module sync_fifo_cnt #(
	parameter DATA_WIDTH = 'd8 ,
	parameter DATA_DEPTH = 'd16
	)
	(
	input								clk,    // Clock
	input								rst_n,  // Asynchronous reset active low
	input	[DATA_WIDTH-1:0]			data_in ,
	input								rd_en,
	input								wr_en,

	output reg	[DATA_WIDTH-1:0]		data_out,
	output								empty,
	output								full ,
	output reg	[$clog2(DATA_DEPTH):0]	fifo_cnt
);
	// reg define
	reg [DATA_WIDTH - 1 : 0] fifo_buffer[DATA_DEPTH - 1 : 0];
	reg [$clog2(DATA_DEPTH) - 1 : 0] wr_addr ;
	reg [$clog2(DATA_DEPTH) - 1 : 0] rd_addr ;

	// read operation
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			rd_addr <= 0 ;
		end
		else if (~empty && rd_en) begin
			rd_addr <=  rd_addr + 1'b1;
			data_out <= fifo_buffer[rd_addr];
		end
	end

	// write operation
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			wr_addr <= 0 ;
		end
		else if (~full && wr_en) begin
			wr_addr <= wr_addr + 1'b1 ;
			fifo_buffer[wr_addr] <= data_in;
		end
	end

	// update counter
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			fifo_cnt <= 0 ;
		end
		else begin
			case ({wr_en, rd_en})
				2'b00: fifo_cnt <= fifo_cnt ;
				2'b01: 
					if (fifo_cnt != 0) begin
						fifo_cnt <= fifo_cnt - 1'b1 ;
					end
				2'b10:
					if (fifo_cnt != DATA_DEPTH) begin
						fifo_cnt <= fifo_cnt + 1'b1 ;
					end
				2'b11: fifo_cnt <= fifo_cnt ;
				default : ;
			endcase
		end
	end

	assign full  = (fifo_cnt == DATA_DEPTH) ? 1'b1 : 1'b0 ;
	assign empty = (fifo_cnt == 0) ? 1'b1 : 1'b0 ;

endmodule