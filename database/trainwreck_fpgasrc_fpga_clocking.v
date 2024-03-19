module fpga_clocking #(parameter CLK_CPU_MHZ = 25, parameter CLK_ETH_MHZ = 125)
(
  input wire clkin_200_p,
  input wire clkin_200_n,
  input wire resetin_p,

  output wire clk_200,
  output wire reset_200,

  output wire clk_eth,
  output wire reset_eth,

  output wire clk_cpu,
  output wire reset_cpu
);

  localparam CLKMUL = 5.0;
  localparam CLK_ETH_DIV = 200 * CLKMUL / CLK_ETH_MHZ;
  localparam CLK_CPU_DIV = 200 * CLKMUL / CLK_CPU_MHZ;

  wire clkin_200_buffered;
  IBUFGDS clkin_buf
  (
    .I (clkin_200_p),
    .IB(clkin_200_n),

    .O(clkin_200_buffered)
  );

  wire clkfb_unbuffered, clkfb_buffered;
  BUFG clkfb_buf
  (
    .I(clkfb_unbuffered),
    .O(clkfb_buffered)
  );

  wire clk_eth_unbuffered;
  BUFG clk_eth_buf
  (
    .I(clk_eth_unbuffered),
    .O(clk_eth)
  );

  wire clk_cpu_unbuffered;
  BUFG clk_cpu_buf
  (
    .I(clk_cpu_unbuffered),
    .O(clk_cpu)
  );

  wire clk_200_unbuffered;
  BUFG clk_200_buf
  (
    .I(clk_200_unbuffered),
    .O(clk_200)
  );

  wire dcm_locked;

  MMCM_BASE #
  (
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(5.0),
    .CLKFBOUT_PHASE(0.0),
    .CLKIN1_PERIOD(CLKMUL),
    .CLKOUT0_DIVIDE_F(CLK_ETH_DIV),
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT0_PHASE(0.0),
    .CLKOUT1_DIVIDE(CLK_CPU_DIV),
    .CLKOUT1_DUTY_CYCLE(0.5),
    .CLKOUT1_PHASE(0.0),
    .CLKOUT2_DIVIDE(CLKMUL),
    .CLKOUT2_DUTY_CYCLE(0.5),
    .CLKOUT2_PHASE(0.0),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.5),
    .CLKOUT3_PHASE(0.0),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.5),
    .CLKOUT4_PHASE(0.0),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.5),
    .CLKOUT5_PHASE(0.0),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.5),
    .CLKOUT6_PHASE(0.0),
    .CLOCK_HOLD("FALSE"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.0),
    .STARTUP_WAIT("FALSE")
  )
  dcm
  (
    .CLKFBOUT(clkfb_unbuffered),
    .CLKFBOUTB(),
    .CLKOUT0(clk_eth_unbuffered),
    .CLKOUT0B(),
    .CLKOUT1(clk_cpu_unbuffered),
    .CLKOUT1B(),
    .CLKOUT2(clk_200_unbuffered),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .LOCKED(dcm_locked),
    .CLKFBIN(clkfb_buffered),
    .CLKIN1(clkin_200_buffered),
    .PWRDWN(1'b0),
    .RST(resetin_p)
  );

  wire reset_unbuffered, reset_buffered;
  assign reset_unbuffered = ~dcm_locked;
  BUFG reset_buf
  (
    .I(reset_unbuffered),
    .O(reset_buffered)
  );

  reset_synchronizer reset_cpu_sync
  (
    .clk(clk_cpu),
    .reset_in(reset_buffered),
    
    .reset_out(reset_cpu)
  );

  reset_synchronizer reset_eth_sync
  (
    .clk(clk_eth),
    .reset_in(reset_buffered),
    
    .reset_out(reset_eth)
  );

  reset_synchronizer reset_200_sync
  (
    .clk(clk_200),
    .reset_in(reset_buffered),
    
    .reset_out(reset_200)
  );

endmodule

module reset_synchronizer
(
  input clk,
  input reset_in,

  output reset_out
);

  reg [7:0] count;
  (* syn_maxfan=64 *) reg r /*synthesis syn_maxfan=64 syn_preserve=1*/;

  always @(posedge clk or posedge reset_in)
  begin
    if (reset_in)
    begin
      count <= 8'b0;
      r <= 1'b1;
    end
    else if (count != 8'hFF)
    begin
      count <= count + 1'b1;
      r <= 1'b1;
    end
    else
    begin
      count <= count;
      r <= 1'b0;
    end
  end

  assign reset_out = r;

endmodule
