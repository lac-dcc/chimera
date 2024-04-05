module testbench;


   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [aw-1:0]	ADR_O;			// From wb_slave_behavioral of wb_master.v
   wire			CYC_O;			// From wb_slave_behavioral of wb_master.v
   wire [31:0]		DAT_O;			// From wb_slave_behavioral of wb_master.v
   wire			MACK_I;			// From dut of dut.v, ...
   wire [63:0]		MDAT_I;			// From dut of dut.v, ...
   wire			MERR_I;			// From dut of dut.v, ...
   wire			MRST_I;			// From dut of dut.v, ...
   wire			MRTY_I;			// From dut of dut.v, ...
   wire [15:0]		MTGD_I;			// From dut of dut.v, ...
   wire [63:0]		SADR_I;			// From dut of dut.v, ...
   wire			SCYC_I;			// From dut of dut.v, ...
   wire [63:0]		SDAT_I;			// From dut of dut.v, ...
   wire [3:0]		SEL_O;			// From wb_slave_behavioral of wb_master.v
   wire			SLOCK_I;		// From dut of dut.v, ...
   wire			SRST_I;			// From dut of dut.v, ...
   wire [7:0]		SSEL_I;			// From dut of dut.v, ...
   wire			SSTB_I;			// From dut of dut.v, ...
   wire			STB_O;			// From wb_slave_behavioral of wb_master.v
   wire [15:0]		STGA_I;			// From dut of dut.v, ...
   wire [15:0]		STGC_I;			// From dut of dut.v, ...
   wire [15:0]		STGD_I;			// From dut of dut.v, ...
   wire			SWE_I;			// From dut of dut.v, ...
   wire [3:0]		TAG_O;			// From wb_slave_behavioral of wb_master.v
   wire			WE_O;			// From wb_slave_behavioral of wb_master.v
   // End of automatics


  

   dut dut(/*AUTOINST*/
	   // Outputs
	   .MDAT_I			(MDAT_I[63:0]),
	   .MRST_I			(MRST_I),
	   .MTGD_I			(MTGD_I[15:0]),
	   .MACK_I			(MACK_I),
	   .MERR_I			(MERR_I),
	   .MRTY_I			(MRTY_I),
	   .SCYC_I			(SCYC_I),
	   .SDAT_I			(SDAT_I[63:0]),
	   .SRST_I			(SRST_I),
	   .STGD_I			(STGD_I[15:0]),
	   .SADR_I			(SADR_I[63:0]),
	   .SLOCK_I			(SLOCK_I),
	   .SSEL_I			(SSEL_I[7:0]),
	   .SSTB_I			(SSTB_I),
	   .STGA_I			(STGA_I[15:0]),
	   .STGC_I			(STGC_I[15:0]),
	   .SWE_I			(SWE_I),
	   // Inputs
	   .clk				(clk),
	   .MCYC_I			(SCYC_I),
	   .MDAT_O			(SDAT_O[63:0]),
	   .MTGD_O			(STGD_O[15:0]),
	   .MADR_O			(SADR_O[63:0]),
	   .MCYC_O			(SCYC_O),
	   .MLOCK_O			(SLOCK_O),
	   .MSEL_O			(SSEL_O[7:0]),
	   .MSTB_O			(SSTB_O),
	   .MTGA_O			(STGA_O[15:0]),
	   .MTGC_O			(STGC_O[15:0]),
	   .MWE_O			(SWE_O),
	   .SDAT_O			(SDAT_O[63:0]),
	   .STGD_O			(STGD_O[15:0]),
	   .SACK_O			(SACK_O),
	   .SERR_O			(SERR_O),
	   .SRTY_O			(SRTY_O));

   wb_master(/*AUTOINST*/
	     // Outputs
	     .MDAT_I			(MDAT_O[63:0]),
	     .MRST_I			(MRST_I),
	     .MTGD_I			(MTGD_I[15:0]),
	     .MACK_I			(MACK_O),
	     .MERR_I			(MERR_O),
	     .MRTY_I			(MRTY_O),
	     .SCYC_I			(SCYC_O),
	     .SDAT_I			(SDAT_O[63:0]),
	     .SRST_I			(SRST_O),
	     .STGD_I			(STGD_O[15:0]),
	     .SADR_I			(SADR_O[63:0]),
	     .SLOCK_I			(SLOCK_O),
	     .SSEL_I			(SSEL_I[7:0]),
	     .SSTB_I			(SSTB_I),
	     .STGA_I			(STGA_I[15:0]),
	     .STGC_I			(STGC_I[15:0]),
	     .SWE_I			(SWE_I),
	     // Inputs
	     .clk			(clk),
	     .MCYC_I			(MCYC_O),
	     .MDAT_O			(MDAT_O[63:0]),
	     .MTGD_O			(MTGD_O[15:0]),
	     .MADR_O			(MADR_O[63:0]),
	     .MCYC_O			(MCYC_O),
	     .MLOCK_O			(MLOCK_O),
	     .MSEL_O			(MSEL_O[7:0]),
	     .MSTB_O			(MSTB_O),
	     .MTGA_O			(MTGA_O[15:0]),
	     .MTGC_O			(MTGC_O[15:0]),
	     .MWE_O			(MWE_O),
	     .SDAT_O			(SDAT_O[63:0]),
	     .STGD_O			(STGD_O[15:0]),
	     .SACK_O			(SACK_O),
	     .SERR_O			(SERR_O),
	     .SRTY_O			(SRTY_O));


   wb_slave_behavioral(/*AUTOINST*/
		       // Outputs
		       .TAG_O		(STAG_O[3:0]),
		       .ADR_O		(SADR_O[aw-1:0]),
		       .CYC_O		(SCYC_O),
		       .DAT_O		(SDAT_O[31:0]),
		       .SEL_O		(SSEL_O[3:0]),
		       .STB_O		(SSTB_O),
		       .WE_O		(SWE_O),
		       // Inputs
		       .CLK_I		(CLK_I),
		       .RST_I		(RST_I),
		       .TAG_I		(STAG_I[3:0]),
		       .ACK_I		(SACK_I),
		       .DAT_I		(SDAT_I[31:0]),
		       .ERR_I		(SERR_I),
		       .RTY_I		(SRTY_I));
   

   
endmodule // testbench
