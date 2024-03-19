`timescale			1ns / 1ps
`default_nettype	none



module serdes_output_to_fin1216
		#(
			parameter	N = 3
		)
		(
			input	wire				reset,
			input	wire				clk,
			input	wire				clk_x7,
			
			input	wire	[N*7-1:0]	in_data,
			
			output	wire				out_clk_p,
			output	wire				out_clk_n,
			output	wire	[N-1:0]		out_data_p,
			output	wire	[N-1:0]		out_data_n
		);
	
	genvar		i;
	
	wire	[N-1:0]		serdes_data;
	
	generate
	for ( i = 0; i < N; i = i+1 ) begin : loop_data
		OSERDESE2
				#(
					.DATA_RATE_OQ	("SDR"),
					.DATA_RATE_TQ	("SDR"),
					.DATA_WIDTH 	(7),
					.TRISTATE_WIDTH (1),
					.SERDES_MODE	("MASTER")
				)
			i_oserdese2_master
				(
					.D1 			(in_data[i*7+6]),
					.D2 			(in_data[i*7+5]),
					.D3 			(in_data[i*7+4]),
					.D4 			(in_data[i*7+3]),
					.D5 			(in_data[i*7+2]),
					.D6 			(in_data[i*7+1]),
					.D7 			(in_data[i*7+0]),
					.D8 			(1'b0),
					.T1 			(1'b0),
					.T2 			(1'b0),
					.T3 			(1'b0),
					.T4 			(1'b0),
					.SHIFTIN1		(1'b0),
					.SHIFTIN2		(1'b0),
					.SHIFTOUT1		(),
					.SHIFTOUT2		(),
					.OCE			(1'b1),
					.CLK			(clk_x7),
					.CLKDIV 		(clk),
					.OQ 			(serdes_data[i]),
					.TQ 			(),
					.OFB			(),
					.TFB			(),
					.TBYTEIN		(1'b0),
					.TBYTEOUT		(),
					.TCE			(1'b0),
					.RST			(reset)
				);
			
		OBUFDS
			i_obufds
				(
					.I			(serdes_data[i]),
					.O			(out_data_p[i]),
					.OB 		(out_data_n[i])
				);
	end
	endgenerate
	
	
	
	// clock
//	wire	[13:0]	clk_format = ~14'b1110000_0011111;
	wire	[13:0]	clk_format = ~14'b1111000_0001111;
	
	wire			serdes_clk;
	
	wire			ocascade_sm_d;
	wire			ocascade_sm_t;
	OSERDESE2
			#(
				.DATA_RATE_OQ	("DDR"),
				.DATA_RATE_TQ	("SDR"),
				.DATA_WIDTH 	(14),
				.TRISTATE_WIDTH (1),
				.SERDES_MODE	("MASTER")
			)
		i_oserdese2_clk_master
			(
				.D1 			(clk_format[13]),
				.D2 			(clk_format[12]),
				.D3 			(clk_format[11]),
				.D4 			(clk_format[10]),
				.D5 			(clk_format[9]),
				.D6 			(clk_format[8]),
				.D7 			(clk_format[7]),
				.D8 			(clk_format[6]),
				
				.T1 			(1'b0),
				.T2 			(1'b0),
				.T3 			(1'b0),
				.T4 			(1'b0),
				.SHIFTIN1		(ocascade_sm_d),
				.SHIFTIN2		(ocascade_sm_t),
				.SHIFTOUT1		(),
				.SHIFTOUT2		(),
				.OCE			(1'b1),
				.CLK			(clk_x7),
				.CLKDIV 		(clk),
				.OQ 			(serdes_clk),
				.TQ 			(),
				.OFB			(),
				.TFB			(),
				.TBYTEIN		(1'b0),
				.TBYTEOUT		(),
				.TCE			(1'b0),
				.RST			(reset)
			);
	
	OSERDESE2
			#(
				.DATA_RATE_OQ	("DDR"),
				.DATA_RATE_TQ	("SDR"),
				.DATA_WIDTH		(14),
				.TRISTATE_WIDTH	(1),
				.SERDES_MODE	("SLAVE")
			)
	   i_oserdese2_clk_slave
			(
				.D1				(1'b0),
				.D2				(1'b0),
				
				.D3				(clk_format[5]),
				.D4				(clk_format[4]),
				.D5				(clk_format[3]),
				.D6				(clk_format[2]),
				.D7				(clk_format[1]),
				.D8				(clk_format[0]),
				
				.T1				(1'b0),
				.T2				(1'b0),
				.T3				(1'b0),
				.T4				(1'b0),
				.SHIFTOUT1		(ocascade_sm_d),
				.SHIFTOUT2		(ocascade_sm_t),
				.SHIFTIN1		(1'b0),
				.SHIFTIN2		(1'b0),
				.OCE			(1'b1),
				.CLK			(clk_x7),
				.CLKDIV 		(clk),
				.OQ 			(),
				.TQ 			(),
				.OFB			(),
				.TFB			(),
				.TBYTEIN		(1'b0),
				.TBYTEOUT		(),
				.TCE			(1'b0),
				.RST			(reset)
			);
	
	OBUFDS
		i_obufds_clk
			(
				.I			(serdes_clk),
				.O			(out_clk_p),
				.OB 		(out_clk_n)
			);

endmodule


`default_nettype	wire


// end of file
