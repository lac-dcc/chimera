module hex_display_wb (input rst_i,
		       input 	  clk_i,
		       input [15:0] wb_dat_i,
		       input [1:0]  wb_sel_i,
		       input 	  wb_we_i,
		       input 	  wb_cyc_i,
		       input 	  wb_stb_i,
		       output 	  wb_ack_o,
		       output [7:0] hex0_o,
		       output [7:0] hex1_o,
		       output [7:0] hex2_o,
		       output [7:0] hex3_o);
   
   reg [15:0] 			  value = 15'h00;

   reg 				  ack = 1'b0;
   assign wb_ack_o = ack;

   always @(posedge clk_i)
     begin
	value <= (wb_we_i & wb_stb_i & wb_cyc_i) ? wb_dat_i[15:0] : value;
	ack <= wb_stb_i & wb_cyc_i;
     end

   hex_display display (.num (value),
			.en (1'b1),
			.hex0 (hex0_o[6:0]),
			.hex1 (hex1_o[6:0]),
			.hex2 (hex2_o[6:0]),
			.hex3 (hex3_o[6:0]));

endmodule
