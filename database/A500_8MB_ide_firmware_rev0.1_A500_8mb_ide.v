// This program was cloned from: https://github.com/OlegMishin/A500_8MB_ide
// License: GNU General Public License v3.0

module A500_8mb_ide(
// CPU bus
		input		CLKCPU,
		input		RESETn,

		input		[23:1] A,
		inout		[3:0] D,
        
		input		ASn,
		input		RWn,
		input		LDSn,
		input		UDSn,		
		output	DTACKn,
		
// IDE interface part		
		output 	IDEACT, // IDE LED
      output 	INT2,
		output 	OVRn, 

		input  	IDEIRQn,
		input  	IDELEDn,
		output 	IORDn,
		output 	IOWRn,
		input 	IORDY,
		output 	IDECS1n,
		output 	IDECS2n,
		
// ram chip control
		output  	RAMOEn,
		output   LCASn,
		output   UCASn,
		output   RAMWn,
		output  	RASn,
		output   [11:0] RAM_A,
		
// Debug
		output 	LED,
		output 	[5:0] test,
		
// unused spare pins
		input 	[2:0] IPLn
);

wire override;
wire ideintreq;

ram_8mb ram( 
		.cpu_a(A), 
		.cpu_d(D[3:0]),
      .cpu_nas(ASn),
		.cpu_nlds(LDSn),
		.cpu_nuds(UDSn),
		.cpu_clk(CLKCPU),
		.cpu_rw(RWn),
		.cpu_nreset(RESETn),
      .dram_nras(RASn), 
		.dram_nlcas(LCASn),
		.dram_nucas(UCASn),
      .dram_ma(RAM_A),
		.dram_wrn(RAMWn),
		.dram_oen(RAMOEn),
		.configured(LED)

);

a500_ide ide(
		// Amiga/CPU side
		.cpu_clk(CLKCPU),	// IN CPU clock
		.cpu_rstn(RESETn),// IN global RESET
		.cpu_a(A),			// IN Address bus
		.cpu_d(D), 			// IN/OUT data bus
		.cpu_ASn(ASn),		// IN Adress select
		.cpu_DSn(UDSn), 	// IN Data select
		.cpu_RWn(RWn), 	// IN R/W#
		.IDEACT(IDEACT),	// OUT IDE activity LED
		.IDEINT(ideintreq),	// OUT IDE interrupt request
		.IDEOVR_RANGE(override),	// Override address decoding (to Gary)
		
		// IDE interface side
 		.IDEIRQ(IDEIRQn),		// IN Interrupt request
		.IDELEDn(IDELEDn), 	// IN IDE activity led
		.IORDn(IORDn),			// OUT IDE read
		.IOWRn(IOWRn),			// OUT IDE write
		.IORDY(IORDY),			// IN IO ready 
		.IDECS1n(IDECS1n),	// OUT IDE chip select 1
		.IDECS2n(IDECS2n)		// OUT IDE chip select 2
);

// DEBUG 
assign test = 6'b101010;



assign DTACKn = override  ? 1'b0 : 1'bz;

wire OVR_pin = ((A[23:16] == 8'hD9) | (A[23:16] == 8'hDB) | (A[23:16] == 8'hDA) | (A[23:16] == 8'hDE)& ~ASn);

assign OVRn = OVR_pin ? 1'b0 : 1'bz;
assign INT2 = ideintreq ? 1'b0 : 1'bz;

endmodule