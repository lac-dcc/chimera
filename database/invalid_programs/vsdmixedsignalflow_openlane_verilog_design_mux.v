`include "raven_spi.v"

module design_mux (
   	output out,
   	input select,
   	input RST,
    	input SCK,
    	input SDI,
    	input CSB,
    	input  trap,
    	input [3:0] mask_rev_in
);
	wire I0;
	wire I1;
	wire sdo_enb;
	wire xtal_ena;
	wire reg_ena;
	wire pll_vco_ena;
	wire pll_cp_ena;
	wire pll_bias_ena;
	wire [3:0] pll_trim;
	wire pll_bypass;
	wire irq;
	wire [11:0] mfgr_id;
	wire [7:0] prod_id;
	wire [3:0] mask_rev;
   AMUX2_3V AMUX2_3V (
		//.VDD (VDD),
		//.VSS (VSS),
		.I0 (IO),
		.I1 (I1),
		.out (out),
		.select (select)
	);
  raven_spi raven_spi(
  		.RST (RST), 
  		.SCK (SCK), 
  		.SDI (SDI), 
  		.CSB (CSB), 
  		.SDO (I0), 
  		.sdo_enb (sdo_enb),
		.xtal_ena (xtal_ena), 
		.reg_ena (reg_ena), 
		.pll_vco_ena (pll_vco_ena), 
		.pll_cp_ena (pll_cp_ena), 
		.pll_bias_ena (pll_bias_ena),
	        .pll_trim (pll_trim), 
	        .pll_bypass (pll_bypass), 
	        .irq (irq), 
	        .reset (I1), 
	        .trap (trap),
		.mfgr_id (mfgr_id), 
		.prod_id (prod_id), 
		.mask_rev_in (mask_rev_in), 
		.mask_rev (mask_rev)
		);

endmodule
