module uart_loop
#(
	parameter	CLK_FREQUENCE	= 50_000_000,
				BAUD_RATE		= 921600	,
				PARITY			= "NONE"	,
				FRAME_WD		= 8			
	
)
(
	input						clk			,
	input						rst_n		,
	input						frame_en	,	//once_tx_start
	input		[FRAME_WD-1:0]	data_frame	,	//data_to_tx
	output						tx_done		,	//once_tx_done
	output		[FRAME_WD-1:0]	rx_frame	,
	output						rx_done		,
	output						frame_error	 
);

wire uart_tx;

uart_frame_tx
#(
	.CLK_FREQUENCE	( CLK_FREQUENCE )	,
	.BAUD_RATE		( BAUD_RATE 	)	,
	.PARITY			( PARITY 		)	,	//"NONE","EVEN","ODD"
	.FRAME_WD		( FRAME_WD 		)	
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

uart_frame_rx
#(
	.CLK_FREQUENCE	(CLK_FREQUENCE	),		//hz
	.BAUD_RATE		(BAUD_RATE		),		//9600、19200 、38400 、57600 、115200、230400、460800、921600
	.PARITY			(PARITY			),		//"NONE","EVEN","ODD"
	.FRAME_WD		(FRAME_WD		)		//if PARITY="NONE",it can be 5~9;else 5~8
)
uart_frame_rx_inst
(
	.clk			( clk			)	,
	.rst_n			( rst_n			)	,
	.uart_rx		( uart_tx		)	,
	.rx_frame		( rx_frame		)	,
	.rx_done		( rx_done		)	,
	.frame_error	( frame_error	)	 
);
endmodule