// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module clock_reset
 #( parameter GOWIN_GW2A = 1,
    parameter GOWIN_FCLKIN = "27",
    parameter GOWIN_RPLL_IDIV = 3,
    parameter GOWIN_RPLL_FBDIV = 7,
    parameter GOWIN_RPLL_ODIV = 8,
    parameter GOWIN_RPLL_SDIV = 2
 )
 (
  input clock_in, // External oscilator
  input areset_n, // Asynchronous reset

  output clock,
  output clk2x,
  output reset
  );


  // -- Signals & State Registers -- //

  reg [4:0] reset_count = 5'd0;
  reg rst_q, cap_q, acq_q, cor_q;


  // -- Reset Logic -- //

  always @(posedge clock or negedge areset_n) begin
    if (!areset_n) begin
      rst_q <= 1'b1;
      cap_q <= 1'b0;
      acq_q <= 1'b0;
      cor_q <= 1'b0;
    end else begin
      rst_q <= ~reset_count[4];
    end
  end

  // Reset-delay after clock starts
  always @(posedge clock or negedge areset_n) begin
    if (!areset_n) begin
      reset_count <= 5'd0;
    end else begin
      if (!reset_count[4]) begin
        reset_count <= reset_count + 5'd1;
      end
    end
  end


  // -- Architecture-specific PLL Instances -- //

  generate if (GOWIN_GW2A) begin : g_gowin_gw2a

  gw2a_rpll #(
      .FCLKIN("60"),
      .CLKOUTD_SRC("CLKOUTP"),
      .PSDA_SEL(PHASE),
      .IDIV_SEL(GOWIN_RPLL_IDIV),
      .FBDIV_SEL(GOWIN_RPLL_FBDIV),
      .ODIV_SEL(GOWIN_RPLL_ODIV),
      .DYN_SDIV_SEL(GOWIN_RPLL_SDIV)
  ) U_RPLL0 (
      .clockp(clockp),   // 120 MHz
      .clockd(clockd),   // 60 MHz
      .lock  (locked),
      .clkin (ulpi_clk)
  );

  end else begin : g_no_target_arch

    initial $fatal("No arch specified");

  end
  endgenerate


endmodule  // clock_reset
