// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

// using ptr
// ref : https://github.com/YukunXue/IC_lib
module sync_fifo_ptr #(
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
	output								full 
);

	parameter ADDR_WIDTH = $clog2(DATA_DEPTH) ;

	// reg define
	// 2 dim list -> RAM
	reg	[DATA_WIDTH-1:0] fifo_buffer [DATA_DEPTH - 1 : 0] ;
	reg	[ADDR_WIDTH :0]	wr_ptr ;
	reg	[ADDR_WIDTH :0]	rd_ptr ;

	// wire define
	wire	[ADDR_WIDTH - 1 : 0]	wr_ptr_true ;
	wire	[ADDR_WIDTH - 1 : 0]	rd_ptr_true ;
	wire							wr_ptr_msb  ;
	wire							rd_ptr_msb  ;

	assign {wr_ptr_msb, wr_ptr_true} = wr_ptr ;
	assign {rd_ptr_msb, rd_ptr_true} = rd_ptr ;

	// read operation
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			rd_ptr <= 'd0 ;
		end
		else if (rd_en && ~empty) begin
			data_out <= fifo_buffer[rd_ptr_true] ;
			rd_ptr   <= rd_ptr + 1'b1 ;
		end
	end

	// write operation
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			wr_ptr <= 0 ;
		end
		else if (~full && wr_en) begin
			wr_ptr <= wr_ptr + 1'b1 ;
			fifo_buffer[wr_ptr_true] <= data_in ;
		end
	end

	// update state signal
	assign empty = (wr_ptr == rd_ptr) ? 1'b1 : 1'b0 ;
	assign full = ((wr_ptr_msb != rd_ptr_msb) && (wr_ptr_true == rd_ptr_true)) ? 1'b1 : 1'b0 ;


endmodule