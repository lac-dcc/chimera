/*===========================================================================*/
/*                                 DIGITAL I/O                               */
/*---------------------------------------------------------------------------*/
/* Test the Digital I/O interface.                                           */
/*===========================================================================*/
`define NO_TIMEOUT

always @(dut.lt24_d_out_en) lt24_data_drive_en = ~dut.lt24_d_out_en;

initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
      repeat(5) @(posedge FPGA_CLK1_50);
      stimulus_done = 0;

      //repeat(100) @(posedge FPGA_CLK1_50);
      fork
	 begin
	    #(1000000.0);
	    #(1000000.0);
	    #(1000000.0);

	    stimulus_done = 1;
	    force omsp_inst_pc =16'hffff;
	 end
	 begin
	    while (~stimulus_done)
	      begin
		 @(negedge GPIO_0[10]); // Update register values with each RD_N negative edge
		 case ($urandom_range(3,1))
		   1       : lt24_data_reg = 16'h0000;
		   2       : lt24_data_reg = 16'h0023;
		   3       : lt24_data_reg = 16'h0000;
		   default : lt24_data_reg = 16'h0000;
		 endcase
	      end
	 end
      join
   end
