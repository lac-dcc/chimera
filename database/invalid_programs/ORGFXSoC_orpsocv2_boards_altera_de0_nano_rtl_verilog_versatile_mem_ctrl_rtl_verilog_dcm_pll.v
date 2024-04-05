`include "versatile_mem_ctrl_defines.v"

module dcm_pll
  (
   input  rst,          // reset
   input  clk_in,       // clock in
   input  clkfb_in,     // feedback clock in
   output clk0_out,     // clock out
   output clk90_out,    // clock out, 90 degree phase shift
   output clk180_out,   // clock out, 180 degree phase shift
   output clk270_out,   // clock out, 270 degree phase shift
   output clkfb_out     // feedback clock out
   );

`ifdef XILINX
   wire clk_in_ibufg;
   wire clk0_bufg, clk90_bufg, clk180_bufg, clk270_bufg;
   // DCM with internal feedback
   DCM #(
      .CLKDV_DIVIDE(2.0),
      .CLKFX_DIVIDE(1),
      .CLKFX_MULTIPLY(4),
      .CLKIN_DIVIDE_BY_2("FALSE"), 
      .CLKIN_PERIOD(8.0),
      .CLKOUT_PHASE_SHIFT("NONE"), 
      .CLK_FEEDBACK("1X"), 
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), 
      .DLL_FREQUENCY_MODE("LOW"), 
      .DUTY_CYCLE_CORRECTION("TRUE"), 
      .PHASE_SHIFT(0), 
      .STARTUP_WAIT("FALSE")) 
   DCM_internal (
      .CLK0(clk0_bufg),
      .CLK180(clk180_bufg),
      .CLK270(clk270_bufg),
      .CLK2X(),
      .CLK2X180(),
      .CLK90(clk90_bufg),
      .CLKDV(),
      .CLKFX(),
      .CLKFX180(),
      .LOCKED(),
      .PSDONE(),
      .STATUS(),
      .CLKFB(clk0_out),
      .CLKIN(clk_in_ibufg),
      .DSSEN(),
      .PSCLK(),
      .PSEN(),
      .PSINCDEC(),
      .RST(rst)
   );
   // DCM with external feedback
   DCM #(
      .CLKDV_DIVIDE(2.0),
      .CLKFX_DIVIDE(1),
      .CLKFX_MULTIPLY(4),
      .CLKIN_DIVIDE_BY_2("FALSE"), 
      .CLKIN_PERIOD(8.0),
      .CLKOUT_PHASE_SHIFT("NONE"), 
      .CLK_FEEDBACK("1X"), 
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), 
      .DLL_FREQUENCY_MODE("LOW"), 
      .DUTY_CYCLE_CORRECTION("TRUE"), 
      .PHASE_SHIFT(0), 
      .STARTUP_WAIT("FALSE")) 
   DCM_external (
      .CLK0(clkfb_bufg),
      .CLK180(),
      .CLK270(),
      .CLK2X(),
      .CLK2X180(),
      .CLK90(),
      .CLKDV(),
      .CLKFX(),
      .CLKFX180(),
      .LOCKED(),
      .PSDONE(),
      .STATUS(),
      .CLKFB(clkfb_ibufg),
      .CLKIN(clk_in_ibufg),
      .DSSEN(),
      .PSCLK(),
      .PSEN(),
      .PSINCDEC(),
      .RST(rst)
   );

   // Input buffer on DCM clock source
   IBUFG IBUFG_clk (
     .I(clk_in),
     .O(clk_in_ibufg));

   // Global buffers on DCM generated clocks
   BUFG BUFG_0 (
     .I(clk0_bufg),
     .O(clk0_out));
   BUFG BUFG_90 (
     .I(clk90_bufg),
     .O(clk90_out));
   BUFG BUFG_180 (
     .I(clk180_bufg),
     .O(clk180_out));
   BUFG BUFG_270 (
     .I(clk270_bufg),
     .O(clk270_out));

   // External feedback to DCM
   IBUFG IBUFG_clkfb (
     .I(clkfb_in),
     .O(clkfb_ibufg));
   OBUF OBUF_clkfb (
     .I(clkfb_bufg),
     .O(clkfb_out));
`endif   // XILINX


`ifdef ALTERA
   wire [9:0] sub_wire0;
   wire [0:0] sub_wire8 = 1'h0;
   wire [3:3] sub_wire4 = sub_wire0[3:3];
   wire [2:2] sub_wire3 = sub_wire0[2:2];
   wire [1:1] sub_wire2 = sub_wire0[1:1];
   wire [0:0] sub_wire1 = sub_wire0[0:0];
   wire       sub_wire6 = clk_in;
   wire [1:0] sub_wire7 = {sub_wire8, sub_wire6};

   assign clk0_out   = sub_wire1;	
   assign clk90_out  = sub_wire2;	
   assign clk180_out = sub_wire3;	
   assign clk270_out = sub_wire4;	

   // PLL with external feedback
   altpll #(
     .bandwidth_type("AUTO"),
     .clk0_divide_by(1),
     .clk0_duty_cycle(50),
     .clk0_multiply_by(1),
     .clk0_phase_shift("0"),
     .clk1_divide_by(1),
     .clk1_duty_cycle(50),
     .clk1_multiply_by(1),
     .clk1_phase_shift("1250"),
     .clk2_divide_by(1),
     .clk2_duty_cycle(50),
     .clk2_multiply_by(1),
     .clk2_phase_shift("2500"),
     .clk3_divide_by(1),
     .clk3_duty_cycle(50),
     .clk3_multiply_by(1),
     .clk3_phase_shift("3750"),
     .compensate_clock("CLK0"),
     .inclk0_input_frequency(5000),
     .intended_device_family("Stratix III"),
     .lpm_hint("UNUSED"),
     .lpm_type("altpll"),
     .operation_mode("NORMAL"),
//   .operation_mode("SOURCE_SYNCHRONOUS"),
     .pll_type("AUTO"),
     .port_activeclock("PORT_UNUSED"),
     .port_areset("PORT_USED"),
     .port_clkbad0("PORT_UNUSED"),
     .port_clkbad1("PORT_UNUSED"),
     .port_clkloss("PORT_UNUSED"),
     .port_clkswitch("PORT_UNUSED"),
     .port_configupdate("PORT_UNUSED"),
     .port_fbin("PORT_USED"),
     .port_fbout("PORT_USED"),
     .port_inclk0("PORT_USED"),
     .port_inclk1("PORT_UNUSED"),
     .port_locked("PORT_UNUSED"),
     .port_pfdena("PORT_UNUSED"),
     .port_phasecounterselect("PORT_UNUSED"),
     .port_phasedone("PORT_UNUSED"),
     .port_phasestep("PORT_UNUSED"),
     .port_phaseupdown("PORT_UNUSED"),
     .port_pllena("PORT_UNUSED"),
     .port_scanaclr("PORT_UNUSED"),
     .port_scanclk("PORT_UNUSED"),
     .port_scanclkena("PORT_UNUSED"),
     .port_scandata("PORT_UNUSED"),
     .port_scandataout("PORT_UNUSED"),
     .port_scandone("PORT_UNUSED"),
     .port_scanread("PORT_UNUSED"),
     .port_scanwrite("PORT_UNUSED"),
     .port_clk0("PORT_USED"),
     .port_clk1("PORT_USED"),
     .port_clk2("PORT_USED"),
     .port_clk3("PORT_USED"),
     .port_clk4("PORT_UNUSED"),
     .port_clk5("PORT_UNUSED"),
     .port_clk6("PORT_UNUSED"),
     .port_clk7("PORT_UNUSED"),
     .port_clk8("PORT_UNUSED"),
     .port_clk9("PORT_UNUSED"),
     .port_clkena0("PORT_UNUSED"),
     .port_clkena1("PORT_UNUSED"),
     .port_clkena2("PORT_UNUSED"),
     .port_clkena3("PORT_UNUSED"),
     .port_clkena4("PORT_UNUSED"),
     .port_clkena5("PORT_UNUSED"),
     .using_fbmimicbidir_port("OFF"),
     .width_clock(10))
   altpll_internal (
     .fbin (),//(clkfb_in),
     .inclk (sub_wire7),
     .areset (rst),
     .clk (sub_wire0),
     .fbout (),//(clkfb_out),
     .activeclock (),
     .clkbad (),
     .clkena ({6{1'b1}}),
     .clkloss (),
     .clkswitch (1'b0),
     .configupdate (1'b0),
     .enable0 (),
     .enable1 (),
     .extclk (),
     .extclkena ({4{1'b1}}),
     .fbmimicbidir (),
     .locked (),
     .pfdena (1'b1),
     .phasecounterselect ({4{1'b1}}),
     .phasedone (),
     .phasestep (1'b1),
     .phaseupdown (1'b1),
     .pllena (1'b1),
     .scanaclr (1'b0),
     .scanclk (1'b0),
     .scanclkena (1'b1),
     .scandata (1'b0),
     .scandataout (),
     .scandone (),
     .scanread (1'b0),
     .scanwrite (1'b0),
     .sclkout0 (),
     .sclkout1 (),
     .vcooverrange (),
     .vcounderrange ()
   );
`endif   // ALTERA

//`ifdef GENERIC_PRIMITIVES
//`endif   // GENERIC_PRIMITIVES


endmodule   // dcm_pll


