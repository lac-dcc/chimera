module audio_pll (
    input  wire          ref_audio,      // Oscillator #24.576MHz
    input  wire          reset_n,        // reset
    output wire          mclk,           // 12.288MHz clock for audio
    output wire          sclk,           // 3.072MHz  clock for audio
    output wire          pll_locked      // PLL locked
);

// --------------------------------------------------------------------
// internal wires
// --------------------------------------------------------------------

    wire [9:0]  pll_clocks;

`ifdef    INCLUDE_PLL

  // PLL generating Audio clocks

  altpll #(
    .bandwidth_type          ("AUTO"),
    .clk0_divide_by          (2),
    .clk0_duty_cycle         (50),
    .clk0_multiply_by        (1),
    .clk0_phase_shift        ("0"),
    .clk1_divide_by          (8),
    .clk1_duty_cycle         (50),
    .clk1_multiply_by        (1),
    .clk1_phase_shift        ("0"),
    .clk2_divide_by          (25),
    .clk2_duty_cycle         (50),
    .clk2_multiply_by        (3),
    .clk2_phase_shift        ("0"),
    .clk3_divide_by          (5),
    .clk3_duty_cycle         (50),
    .clk3_multiply_by        (2),
    .clk3_phase_shift        ("0"),
    .clk4_divide_by          (5),
    .clk4_duty_cycle         (50),
    .clk4_multiply_by        (4),
    .clk4_phase_shift        ("0"),
    .inclk0_input_frequency  (40690),
    .intended_device_family  ("Cyclone V"),
    .lpm_hint                ("CBX_MODULE_PREFIX=plls_Altera"),
    .lpm_type                ("altpll"),
    .operation_mode          ("NO_COMPENSATION"),
    .pll_type                ("AUTO"),
    .port_activeclock        ("PORT_UNUSED"),
    .port_areset             ("PORT_UNUSED"),
    .port_clkbad0            ("PORT_UNUSED"),
    .port_clkbad1            ("PORT_UNUSED"),
    .port_clkloss            ("PORT_UNUSED"),
    .port_clkswitch          ("PORT_UNUSED"),
    .port_configupdate       ("PORT_UNUSED"),
    .port_fbin               ("PORT_UNUSED"),
    .port_fbout              ("PORT_UNUSED"),
    .port_inclk0             ("PORT_USED"),
    .port_inclk1             ("PORT_UNUSED"),
    .port_locked             ("PORT_USED"),
    .port_pfdena             ("PORT_UNUSED"),
    .port_phasecounterselect ("PORT_UNUSED"),
    .port_phasedone          ("PORT_UNUSED"),
    .port_phasestep          ("PORT_UNUSED"),
    .port_phaseupdown        ("PORT_UNUSED"),
    .port_pllena             ("PORT_UNUSED"),
    .port_scanaclr           ("PORT_UNUSED"),
    .port_scanclk            ("PORT_UNUSED"),
    .port_scanclkena         ("PORT_UNUSED"),
    .port_scandata           ("PORT_UNUSED"),
    .port_scandataout        ("PORT_UNUSED"),
    .port_scandone           ("PORT_UNUSED"),
    .port_scanread           ("PORT_UNUSED"),
    .port_scanwrite          ("PORT_UNUSED"),
    .port_clk0               ("PORT_USED"),
    .port_clk1               ("PORT_USED"),
    .port_clk2               ("PORT_UNUSED"),
    .port_clk3               ("PORT_UNUSED"),
    .port_clk4               ("PORT_UNUSED"),
    .port_clk5               ("PORT_UNUSED"),
    .port_clk6               ("PORT_UNUSED"),
    .port_clk7               ("PORT_UNUSED"),
    .port_clk8               ("PORT_UNUSED"),
    .port_clk9               ("PORT_UNUSED"),
    .port_clkena0            ("PORT_UNUSED"),
    .port_clkena1            ("PORT_UNUSED"),
    .port_clkena2            ("PORT_UNUSED"),
    .port_clkena3            ("PORT_UNUSED"),
    .port_clkena4            ("PORT_UNUSED"),
    .port_clkena5            ("PORT_UNUSED"),
    .port_clkena6            ("PORT_UNUSED"),
    .port_clkena7            ("PORT_UNUSED"),
    .port_clkena8            ("PORT_UNUSED"),
    .port_clkena9            ("PORT_UNUSED"),
    .self_reset_on_loss_lock ("ON"),
    .using_fbmimicbidir_port ("OFF"),
    .width_clock             (10))
   u_cpu_periph_clk_pll_0 (
    .inclk              ({1'b0, ref_audio}),
    .clk                (pll_clocks[9:0]),
    .activeclock        (),
    .areset             (~reset_n),  // Optional
    .clkbad             (),
    .clkena             ({10{1'b1}}),
    .clkloss            (),
    .clkswitch          (1'b0),
    .configupdate       (1'b0),
    .enable0            (),
    .enable1            (),
    .extclk             (),
    .extclkena          ({4{1'b1}}),
    .fbin               (1'b1),
    .fbmimicbidir       (),
    .fbout              (),
    .locked             (pll_locked),
    .pfdena             (1'b1),
    .phasecounterselect ({4{1'b1}}),
    .phasedone          (),
    .phasestep          (1'b1),
    .phaseupdown        (1'b1),
    .pllena             (1'b1),
    .scanaclr           (1'b0),
    .scanclk            (1'b0),
    .scanclkena         (1'b1),
    .scandata           (1'b0),
    .scandataout        (),
    .scandone           (),
    .scanread           (1'b0),
    .scanwrite          (1'b0),
    .sclkout0           (),
    .sclkout1           (),
    .vcooverrange       (),
    .vcounderrange      ());


`else
  assign pll_clocks[0] = ref_audio;
  assign pll_clocks[1] = ref_audio;
  assign pll_locked    = 1'b1;
`endif

  assign mclk          = pll_clocks[0];
  assign sclk          = pll_clocks[1];

endmodule
