module uart_frame_tx_tb;

reg				clk			;
reg				rst_n		;
reg				frame_en	;
reg	[5:0]		data_frame	;
wire			tx_done		;
wire			uart_tx		;

initial begin
	clk = 1;
	forever #10 clk = ~clk;
  end

initial begin
	rst_n = 1'b0;
	#22 rst_n = 1'b1;
  end

initial begin
	frame_en = 1'b0;
	#30 frame_en = 1'b1;
	#20 frame_en = 1'b0;
	@(posedge tx_done)
	#50frame_en = 1'b1;
	#20 frame_en = 1'b0;
	@(posedge tx_done) 
	#20 $finish;
end

initial begin
	data_frame = 8'b00101011;
	@(posedge tx_done)
	data_frame <= 8'b00110101;
end

	initial begin
		$dumpfile("uart_frame_tx_tb.vcd");
		$dumpvars();
	end

uart_frame_tx_fsm
#(
	.CLK_FREQUENCE	( 50_000_000 )	,
	.BAUD_RATE		( 5_000_000 )	,
	.PARITY			( "NONE" )	,	//"NONE","EVEN","ODD"
	.FRAME_WD		( 6 )	
)
uart_frame_tx_inst
(
	.clk			( clk		 	 )	,
	.rst_n			( rst_n		 	 )	,
	.frame_en		( frame_en	 	 )	,
	.data_frame		( data_frame	 )	,
	.tx_done		( tx_done		 )	,
	.uart_tx		( uart_tx		 )	 
);

endmodule

