`timescale 1ns / 1ps
module uart_loop_tb();
	parameter	CLK_FREQUENCE	= 50_000_000,		//hz
				BAUD_RATE		= 921600	,		//9600、19200 、38400 、57600 、115200、230400、460800、921600
				PARITY			= "EVEN"	,		//"NONE","EVEN","ODD"
				FRAME_WD		= 8			;		//if PARITY="NONE",it can be 5~9;else 5~8	

	reg						clk			;
	reg						rst_n		;
	reg						frame_en	;	//once_tx_start
	reg		[FRAME_WD-1:0]	data_frame	;	//data_to_tx
	wire	[FRAME_WD-1:0]	rx_frame	;
	wire					rx_done		;
	wire					frame_error	;

	wire					tx_done		;

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

	always @(posedge rx_done) begin
		$display("rx_frame=%h\n",rx_frame);
	end

	initial begin
		$dumpfile("uart_loop_tb.vcd");
		$dumpvars();
	end

uart_loop
#(
	.CLK_FREQUENCE	(CLK_FREQUENCE	),
	.BAUD_RATE		(BAUD_RATE	),
	.PARITY			(PARITY	),
	.FRAME_WD		(FRAME_WD)
	
)
uart_loop_inst
(
	.clk			( clk		 	),
	.rst_n			( rst_n		 	),
	.frame_en		( frame_en	 	),	//once_tx_start
	.data_frame		( data_frame	),	//data_to_tx
	.tx_done		( tx_done	 	),	//once_tx_done
	.rx_frame		( rx_frame	 	),
	.rx_done		( rx_done	 	),
	.frame_error	( frame_error 	) 
);

endmodule