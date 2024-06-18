// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module asyn_fifo #(
	parameter DW 		 = 16,
	parameter DEPTH 	 = 32,
	parameter PROG_DEPTH = 16  //programmable depth
	)(
	input				rst_n,    // Asynchronous reset active low
	input				wclk ,    // write clock
	input				wren ,    // write enable
	input	[DW-1:0]	wdata,    // write data
	output				wfull,    // write full flag
	output 			prog_full,    // programmable full flag

	input				rclk ,    // read clock
	input				rden ,    // read enable
	output  [DW-1:0]	rdata,    // read data
	output 				rempty    // read empty flag
);
	localparam AW = $clog2(DEPTH) ;

/*-----------------------------------------------\
 --         push / wr counter          --
\-----------------------------------------------*/
    // wptr/waddr using one more bit to indict new-loop

    wire [AW : 0] waddr ;
    wire [AW : 0] waddr_gray ;
    wire [AW : 0] waddr_gray_d ;

    wire wren_notf;
    assign wren_notf = wren && !wfull ; // when full , cannot write

    ccnt_gray #(
    	.W(AW+1)
    	) u_push_cnt(
    	.rst_n     (rst_n       ),
    	.clk 	   (wclk        ),
    	.en 	   (wren_notf  ),
    	.cnt  	   (waddr       ),
    	.cnt_gray  (waddr_gray  ),
    	.cnt_gray_d(waddr_gray_d)
    	);
     wire [AW : 0] raddr ;
     wire [AW : 0] raddr_gray ;
     wire [AW : 0] raddr_gray_d ;
     wire          rden_notr ; // when empty cannot read

    // sync : wptr from wclk to rclk
    wire [AW : 0] waddr_gray_rclk ;
    data1c_sync #(
    	.DW   (AW+1) ,
    	.STAGE(3)
    	) u_waddr_to_rclk (
    	.rst_n    (rst_n          ),
    	.clk      (rclk            ),
    	.data_in  (waddr_gray_d   ),
    	.data_out (waddr_gray_rclk)
    	) ;

    // sync : rdtr from rclk to wclk
    wire [AW : 0] raddr_gray_wclk ;
    data1c_sync #(
    	.DW   (AW+1) ,
    	.STAGE(3)
    	) u_raddr_to_rclk (
    	.rst_n    (rst_n          ),
    	.clk      (wclk            ),
    	.data_in  (raddr_gray_d   ),
    	.data_out (raddr_gray_wclk)
    	) ;

 /*-----------------------------------------------\
  --         pop / rd counter	          --
 \-----------------------------------------------*/


     assign rden_notr = rden && !rempty ;

     ccnt_gray #(
    	.W(AW+1)
    	) u_pop_cnt(
    	.rst_n     (rst_n       ),
    	.clk 	   (rclk        ),
    	.en 	   (rden_notr  ),
    	.cnt  	   (raddr       ),
    	.cnt_gray  (raddr_gray  ),
    	.cnt_gray_d(raddr_gray_d)
    	);

/*-----------------------------------------------\
 --         full / empty logic	          --
\-----------------------------------------------*/
    // empty logic
    assign rempty = (raddr_gray == waddr_gray_rclk) ;

    // full logic
    assign wfull = (waddr_gray[AW:AW-1] == ~raddr_gray_wclk[AW:AW-1]) &&
    			   (waddr_gray[AW-2:0]  ==  raddr_gray_wclk[AW-2:0]) ;

    // programmable full
    // waddr gray decode
    wire [AW : 0] raddr_degray_wclk	 ;

    gray_decode #(
    	.W(AW+1)
    ) u_waddr_degray_rclk(
    .gray       (raddr_gray_wclk),
    .gray_decode(raddr_degray_wclk)
    );

    wire [AW : 0] waddr_delta ;
    assign waddr_delta = waddr >= raddr_degray_wclk ?
    					 (waddr - raddr_degray_wclk) :
    					 ((1<<(AW+1)) + waddr - raddr_degray_wclk) ;

    assign prog_full = waddr_delta >= PROG_DEPTH ;

    ramdp # (
    	.AW(AW),
    	.DW(DW)
    ) u_ramdp (
    .clk_wr (wclk),
    .wr_en  (wren_notf),
    .addr_wr(waddr[AW-1:0]),
    .D      (wdata[DW-1:0]),
    .clk_rd (rclk),
    .rd_en  (rden_notr),
    .addr_rd(raddr[AW-1:0]),
    .Q      (rdata[DW-1:0])
    );

endmodule