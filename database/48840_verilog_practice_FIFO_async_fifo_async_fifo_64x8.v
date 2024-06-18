// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

// ref : https://github.com/YukunXue/IC_lib
module async_fifo_64x8 (
	input wire			rst_n,  // Asynchronous reset active low

	// write interface
	input wire			wr_clk,
	input wire			wr_en,
	input wire	[7:0]	wr_data,

	// read interface
	input wire			rd_clk,
	input wire			rd_en,
	output wire	[7:0]	rd_data,

	// fifo flag signal
	output wire			overflow,
	output wire			underflow
);
	// memory
	reg [7:0] fifo_buffer [64-1 : 0];

	// memory addr
	wire	[5 : 0]	wr_addr ;
	wire	[5 : 0]	rd_addr ;

	// write pointer of gray
	reg		[6 : 0]		wr_ptr ;
	wire	[6 : 0]		wr_ptr_gray ;
	reg		[6 : 0]		wr_ptr_gray_dly1 ;
	reg		[6 : 0]		wr_ptr_gray_dly2 ;
	wire	[6 : 0]		wr_ptr_bin ;

	// read pointer of gray
	reg		[6 : 0]		rd_ptr ;
	wire	[6 : 0]		rd_ptr_gray ;
	reg		[6 : 0]		rd_ptr_gray_dly1 ;
	reg		[6 : 0]		rd_ptr_gray_dly2 ;
	wire	[6 : 0]		rd_ptr_bin ;

	wire full_o  ;
	wire empty_o ;

/*-----------------------------------------------\
 --         write addr and read addr          --
\-----------------------------------------------*/
	assign wr_addr = wr_ptr[5:0] ;
	assign rd_addr = rd_ptr[5:0] ;

/*-----------------------------------------------\
 --         write ptr and bin -> gray          --
\-----------------------------------------------*/
    always @(posedge wr_clk or negedge rst_n) begin
    	if (rst_n == 1'b0) begin
    		wr_ptr <= {7{1'b0}} ;
    	end
    	else if (wr_en && ~full_o) begin
            wr_ptr               <= wr_ptr + 1'b1 ;
            fifo_buffer[wr_addr] <= wr_data ;
    	end
    end

    assign wr_ptr_gray = (wr_ptr >> 1'b1) ^ wr_ptr ; // ???

/*-----------------------------------------------\
 --         read ptr and bin -> gray          --
\-----------------------------------------------*/
    always @(posedge rd_clk or negedge rst_n) begin
    	if (rst_n == 1'b0) begin
    		rd_ptr <= {7{1'b0}} ;
    	end
    	else if (rd_en && ~empty_o) begin
    		rd_ptr <= rd_en + 1'b1 ;
    	end
    end

    assign rd_data     = fifo_buffer[rd_addr] ;
    assign rd_ptr_gray = (rd_ptr >> 1'b1) ^ rd_ptr ;

/*-----------------------------------------------\
 --         wr_ptr_gray sync          --
\-----------------------------------------------*/
    always @(posedge rd_clk or negedge rst_n) begin
    	if (rst_n == 1'b0) begin
    		wr_ptr_gray_dly1 <= {7{1'b0}} ;
    		wr_ptr_gray_dly2 <= {7{1'b0}} ;
    	end
    	else begin
    		wr_ptr_gray_dly1 <= wr_ptr_gray ;
    		wr_ptr_gray_dly2 <= wr_ptr_gray_dly1 ;
    	end
    end

/*-----------------------------------------------\
 --         rd_ptr_gray sync          --
\-----------------------------------------------*/
    always @(posedge wr_clk or negedge rst_n) begin
    	if (rst_n == 1'b0) begin
    		wr_ptr_gray_dly1 <= {7{1'b0}} ;
    		wr_ptr_gray_dly2 <= {7{1'b0}} ;
    	end
    	else begin
    		wr_ptr_gray_dly1 <= wr_ptr_gray ;
    		wr_ptr_gray_dly2 <= wr_ptr_gray_dly1 ;
    	end
    end

/*-----------------------------------------------\
 --         full and empty flag          --
\-----------------------------------------------*/
    assign full_o  = (wr_ptr_gray == {~rd_ptr_gray_dly2[7:6], rd_ptr_gray_dly2[5:0]}) ? 1'b1 : 1'b0 ;
    assign empty_o = rd_ptr_gray == wr_ptr_gray_dly2 ;

/*-----------------------------------------------\
 --         gray -> bin          --
\-----------------------------------------------*/
    assign rd_ptr_bin = rd_ptr_gray_dly2 ^ (rd_ptr_gray_dly2 >> 1) ;
    assign wr_ptr_bin = wr_ptr_gray_dly2 ^ (wr_ptr_gray_dly2 >> 1) ;

    wire [6 : 0] rd_dis ;
    wire [6 : 0] wr_dis ;

    assign wr_dis    = wr_addr - rd_ptr_bin[5:0] ;
    assign rd_dis    = rd_addr - wr_ptr_bin[5:0] ;
    assign overflow  = (wr_dis[6]) ? (wr_dis[5:4] == 2'b00) : (wr_dis == 2'b11);
    assign underflow = (rd_dis[6]) ? (rd_dis[5:4] == 2'b00) : (rd_dis == 2'b11);


endmodule