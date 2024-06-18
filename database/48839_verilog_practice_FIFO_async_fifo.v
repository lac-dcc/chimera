// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

// async_fifo
module test #(
	parameter DATA_WIDTH = 'd8 ,  // fifo bit width  
	parameter DATA_DEPTH = 'd64   // fifo depth
	)
	(
	// write data
	input wr_clk	,  // write Clock
	input wr_rst_n	,  // write Asynchronous reset active low
	input wr_en		,  // write enanle signal
	input [DATA_WIDTH-1 : 0] data_in ,
	// read data
	input rd_clk	,  // read clock
	input rd_rst_n  ,  // read Asynchrronous reset active low
	input rd_en 	,  // read enable
	output reg	[DATA_WIDTH-1 : 0]	data_out,
	// state flag
	output overflow	,
	output underflow
);

	// RAM using 2 dim list
	reg [DATA_WIDTH - 1 : 0] fifo_buffer[DATA_DEPTH - 1 : 0];
	reg [$clog2(DATA_DEPTH) : 0] wr_ptr ;
	reg [$clog2(DATA_DEPTH) : 0] rd_ptr ;
	reg [$clog2(DATA_DEPTH) : 0] rd_ptr_g_d1 ;
	reg [$clog2(DATA_DEPTH) : 0] rd_ptr_g_d2 ;
 	reg [$clog2(DATA_DEPTH) : 0] wr_ptr_g_d1 ;
	reg [$clog2(DATA_DEPTH) : 0] wr_ptr_g_d2 ;

	wire [$clog2(DATA_DEPTH) : 0] wr_ptr_g ;
	wire [$clog2(DATA_DEPTH) : 0] rd_ptr_g ;
	wire [$clog2(DATA_DEPTH) - 1 : 0] wr_ptr_true ;
 	wire [$clog2(DATA_DEPTH) - 1 : 0] rd_ptr_true ;

 	wire full ;
 	wire empty ;

 	assign wr_ptr_g = wr_ptr ^ (wr_ptr >> 1) ;
 	assign rd_ptr_g = rd_ptr ^ (rd_ptr >> 1) ;

 	assign wr_ptr_true = wr_ptr [$clog2(DATA_DEPTH) - 1 : 0];
 	assign rd_ptr_true = rd_ptr [$clog2(DATA_DEPTH) - 1 : 0];

 	always @(posedge wr_clk or negedge wr_rst_n) begin
 		if (wr_rst_n == 1'b0) begin
 			wr_ptr <= 0 ;
 		end
 		else if (~full && wr_en) begin
 			wr_ptr <= wr_ptr + 1'b1 ;
 			fifo_buffer[wr_ptr_true] <= data_in ;
 		end
 	end

 	always @(posedge wr_clk or negedge wr_rst_n) begin
 		if (wr_rst_n == 1'b0) begin
 			rd_ptr_g_d1 <= 0 ;
 			rd_ptr_g_d2 <= 0 ;
 		end
 		else begin
 			rd_ptr_g_d1 <= rd_ptr_g    ;
 			rd_ptr_g_d2 <= rd_ptr_g_d1 ;
 		end
 	end

 	// read operation
 	always @(posedge rd_clk or negedge rd_rst_n) begin
 		if (rd_rst_n == 1'b0) begin
 			rd_ptr <= 'd0 ;
 		end
 		else if ( rd_en && ~empty ) begin
 			data_out <= fifo_buffer[rd_ptr_true] ;
 			rd_ptr <=  rd_ptr + 1'd1;
 		end
 	end

 	// write pointer gray -> read clock dom
 	always @(posedge rd_clk or negedge rd_rst_n) begin
 		if (rd_rst_n == 1'b0) begin
 			wr_ptr_g_d1 <= 0 ;
 			wr_ptr_g_d2 <= 0 ;
 		end
 		else begin
 			wr_ptr_g_d1 <= wr_ptr_g    ;
 			wr_ptr_g_d2 <= wr_ptr_g_d1 ;
 		end
 	end

 	assign empty = (wr_ptr_g_d2 == rd_ptr_g) ? 1'b1 : 1'b0 ;

 	assign full  = (wr_ptr_g == {~(rd_ptr_g_d2[$clog2(DATA_DEPTH) : $clog2(DATA_DEPTH) - 1])
 					, rd_ptr_g_d2[$clog2(DATA_DEPTH) - 2 : 0]}) ? 1'b1 :  1'b0 ;


 	wire [$clog2(DATA_DEPTH) : 0] rd_ptr_bin ;
 	wire [$clog2(DATA_DEPTH) : 0] wr_ptr_bin ;

 	//gray -> bin
 	assign rd_ptr_bin[$clog2(DATA_DEPTH)] = rd_ptr_g_d2[$clog2(DATA_DEPTH)] ;
 	assign rd_ptr_bin[$clog2(DATA_DEPTH)-1:0] = rd_ptr_bin[$clog2(DATA_DEPTH):1] ^ rd_ptr_g_d2[$clog2(DATA_DEPTH)-1:0];

 	assign wr_ptr_bin[$clog2(DATA_DEPTH)] = wr_ptr_g_d2[$clog2(DATA_DEPTH)] ;
 	assign wr_ptr_bin[$clog2(DATA_DEPTH)-1:0] = wr_ptr_bin[$clog2(DATA_DEPTH):1] ^ wr_ptr_g_d2[$clog2(DATA_DEPTH)-1:0];

	wire [6 : 0] dis_r ;
	wire [6 : 0] dis_w ;
	wire [6 : 0] dis_r_yuan ;
	wire [6 : 0] dis_w_yuan ;

	assign dis_w = wr_ptr_true - rd_ptr_bin[5:0] ;
	assign dis_r = wr_ptr_bin[5:0] - rd_ptr_true ;
	assign dis_w_yuan = ~dis_w + 1'b1 ;
	assign dis_r_yuan = ~dis_r + 1'b1 ;
	assign overflow = (dis_w[6] || full) ? (dis_w_yuan[5:4] == 2'b00) : (dis_w[5:4] == 2'b11) ;
	assign underflow = (dis_r[6]) ? (dis_r_yuan[5:4] == 2'b11) : (dis_r[5:4] == 2'b00);

endmodule