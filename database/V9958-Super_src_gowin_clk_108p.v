// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License


module CLK_108P (
    clkout,
    lock,
    clkoutp,
    reset,
    clkin
);

  output clkout;
  output lock;
  output clkoutp;
  input reset;
  input clkin;

  wire gw_vcc;
  wire gw_gnd;

  assign gw_vcc = 1'b1;
  assign gw_gnd = 1'b0;

  rPLL rpll_inst (
      .CLKOUT(clkout),
      .LOCK(lock),
      .CLKOUTP(clkoutp),
      .CLKOUTD(),
      .CLKOUTD3(),
      .RESET(reset),
      .RESET_P(gw_gnd),
      .CLKIN(clkin),
      .CLKFB(gw_gnd),
      .FBDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .IDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .ODSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .PSDA({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .DUTYDA({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .FDLY({gw_vcc, gw_vcc, gw_vcc, gw_vcc})
  );

  defparam rpll_inst.FCLKIN = "27";
  defparam rpll_inst.DYN_IDIV_SEL = "false";
  defparam rpll_inst.IDIV_SEL = 0;
  defparam rpll_inst.DYN_FBDIV_SEL = "false";
  defparam rpll_inst.FBDIV_SEL = 3;
  defparam rpll_inst.DYN_ODIV_SEL = "false";
  defparam rpll_inst.ODIV_SEL = 8;
  defparam rpll_inst.PSDA_SEL = "1000";
  defparam rpll_inst.DYN_DA_EN = "false";
  defparam rpll_inst.DUTYDA_SEL = "1000";
  defparam rpll_inst.CLKOUT_FT_DIR = 1'b1;
  defparam rpll_inst.CLKOUTP_FT_DIR = 1'b1;
  defparam rpll_inst.CLKOUT_DLY_STEP = 0;
  defparam rpll_inst.CLKOUTP_DLY_STEP = 0;
  defparam rpll_inst.CLKFB_SEL = "internal";
  defparam rpll_inst.CLKOUT_BYPASS = "false";
  defparam rpll_inst.CLKOUTP_BYPASS = "false";
  defparam rpll_inst.CLKOUTD_BYPASS = "false";
  defparam rpll_inst.DYN_SDIV_SEL = 2;
  defparam rpll_inst.CLKOUTD_SRC = "CLKOUT";
  defparam rpll_inst.CLKOUTD3_SRC = "CLKOUT";
  defparam rpll_inst.DEVICE = "GW2AR-18C";

endmodule
