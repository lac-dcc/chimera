//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : V2M-MPS2 FPGA PLL
//-----------------------------------------------------------------------------

`include "fpga_options_defs.v"

module fpga_pll_speed (
    input  wire [2:0]    osc,            // Oscillator #0 - 50    MHz
                                         // Oscillator #1 - 24.576MHz
                                         // Oscillator #2 - 25    MHz
    input  wire          reset_n,        // reset
    output wire          fclk,           // Free running clock (25MHz)
    output wire          clk_zbtout,     // Phase shifted clock for ZBT(25MHz)
    output wire          mclk,           // 12.288MHz clock for audio
    output wire          sclk,           // 3.072MHz  clock for audio
    output wire          clk_peripheral, // 25MHz clock for ethernet, psram, vga, uart
    output wire [2:0]    pll_locked      // PLL locked
  );

// --------------------------------------------------------------------
// internal wires
// --------------------------------------------------------------------

    wire [9:0]  pll_clocks_sys;
    wire [9:0]  pll_clocks_peripheral;
    wire [9:0]  pll_clocks_audio;

// INCLUDE_PLL is define in FPGA project configuration
`ifdef    INCLUDE_PLL

  // PLL generating CPU (25MHz) and ZBT SRAM (25MHz) clocks

  altpll #(
    .bandwidth_type          ("AUTO"),
    .clk0_divide_by          (2),
    .clk0_duty_cycle         (50),
    .clk0_multiply_by        (1),
    .clk0_phase_shift        ("0"),
    .clk1_divide_by          (2),
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
    .inclk0_input_frequency  (20000),
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
    .inclk              ({1'b0, osc[0]}),
    .clk                (pll_clocks_sys[9:0]),
    .activeclock        (),
    .areset             (~reset_n),  // Optional
    .clkbad             (),
    .clkena             ({6{1'b1}}),
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
    .locked             (pll_locked[0]),
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
   u_cpu_periph_clk_pll_1 (
    .inclk              ({1'b0, osc[1]}),
    .clk                (pll_clocks_audio[9:0]),
    .activeclock        (),
    .areset             (~reset_n),  // Optional
    .clkbad             (),
    .clkena             ({6{1'b1}}),
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
    .locked             (pll_locked[1]),
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

  altpll #(
    .bandwidth_type          ("AUTO"),
    .clk0_divide_by          (1),
    .clk0_duty_cycle         (50),
    .clk0_multiply_by        (1),
    .clk0_phase_shift        ("0"),
    .clk1_divide_by          (2),
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
    .inclk0_input_frequency  (40000),
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
    .port_clk1               ("PORT_UNUSED"),
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
   u_cpu_periph_clk_pll_2 (
    .inclk              ({1'b0, osc[2]}),
    .clk                (pll_clocks_peripheral[9:0]),
    .activeclock        (),
    .areset             (~reset_n),  // Optional
    .clkbad             (),
    .clkena             ({6{1'b1}}),
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
    .locked             (pll_locked[2]),
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
  assign pll_clocks_sys[0] = osc[0];
  assign pll_clocks_sys[1] = osc[0];
  assign pll_clocks_peripheral[0] = osc[2];
  assign pll_clocks_audio[0] = osc[1];
  assign pll_clocks_audio[1] = osc[1];
  assign pll_locked[0]     = 1'b1;
  assign pll_locked[1]     = 1'b1;
  assign pll_locked[2]     = 1'b1;
`endif

  assign fclk          = pll_clocks_sys[0];
  assign clk_zbtout    = pll_clocks_sys[1];
  assign clk_peripheral= pll_clocks_peripheral[0];
  assign mclk          = pll_clocks_audio[0];
  assign sclk          = pll_clocks_audio[1];

endmodule
