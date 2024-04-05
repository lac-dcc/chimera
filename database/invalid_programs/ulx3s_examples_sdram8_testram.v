`default_nettype none
module testram (
  input         clk25_mhz,
  // Buttons
  input [6:0]   btn,
  output sdram_csn,       // chip select
  output sdram_clk,       // clock to SDRAM
  output sdram_cke,       // clock enable to SDRAM
  output sdram_rasn,      // SDRAM RAS
  output sdram_casn,      // SDRAM CAS
  output sdram_wen,       // SDRAM write-enable
  output [12:0] sdram_a,  // SDRAM address bus
  output  [1:0] sdram_ba, // SDRAM bank-address
  output  [1:0] sdram_dqm,// byte select
  inout  [15:0] sdram_d,  // data bus to/from SDRAM
  inout  [27:0] gp,gn,
  // SPI display
  //output oled_csn,
  //output oled_clk,
  //output oled_mosi,
  //output oled_dc,
  //output oled_resn,
  // Leds
  output [7:0]  leds
);

  // ===============================================================
  // System Clock generation
  // ===============================================================
  wire clk_sdram_locked;
  wire [3:0] clocks;

  ecp5pll
  #(
      .in_hz( 25*1000000),
    .out0_hz(125*1000000),
    .out1_hz( 25*1000000),
    .out2_hz(100*1000000),                 // SDRAM core
    .out3_hz(100*1000000), .out3_deg(189)  // SDRAM chip 45-330:ok 0-30:not
  )
  ecp5pll_inst
  (
    .clk_i(clk25_mhz),
    .clk_o(clocks),
    .locked(clk_sdram_locked)
  );

  wire clk_hdmi  = clocks[0];
  wire clk_vga   = clocks[1];
  wire clk_cpu   = clocks[1];
  wire clk_sdram = clocks[2];
  assign sdram_clk = clocks[3];
  assign sdram_cke = 1'b1;

  // ===============================================================
  // Reset generation
  // ===============================================================
  reg [15:0] pwr_up_reset_counter = 0;
  wire       pwr_up_reset_n = &pwr_up_reset_counter;
  wire       reset = ~pwr_up_reset_n | ~btn[0];

  always @(posedge clk_cpu) begin
     if (!pwr_up_reset_n)
       pwr_up_reset_counter <= pwr_up_reset_counter + 1;
  end

  // ===============================================================
  // Diagnostic leds
  // ===============================================================
  reg [15:0] diag16;

  generate
    genvar i;
      for(i = 0; i < 4; i = i+1) begin
        assign gn[17-i] = diag16[8+i];
        assign gp[17-i] = diag16[12+i];
        assign gn[24-i] = diag16[i];
        assign gp[24-i] = diag16[4+i];
      end
  endgenerate

  reg [7:0] rom_dout;
  reg [27:0] div;
  reg state;

  // Tristate sdram_d pins when reading
  wire sdram_d_wr; // SDRAM controller sets this when writing
  wire [15:0] sdram_d_in, sdram_d_out;
  assign sdram_d = sdram_d_wr ? sdram_d_out : 16'hzzzz;
  assign sdram_d_in = sdram_d;

  wire clk_enable = div[1];            // 8 cycles of clk_sdram per access
  wire we = state == 0 && !clk_enable; // Write when state == 0 on PPU cycles
  wire re = state == 1 && clk_enable;  // Read when state == 1 on CPU cycles
  wire [24:0] addr_b = div[9:2];       // Write address goes from 0 to 255
  wire [24:0] addr_a = div[27:20];     // Read slowly
  wire [7:0] din = addr_b[7:0];        // Set value written to address

  always @(posedge clk_cpu) begin
    if (reset) begin
      state <= 0;
      div <= 0;
    end else begin
      div <= div + 1;
      if (&div[9:0]  && state == 0) state <= 1;
    end
  end

  sdram sdram_i (
   .sd_data_in(sdram_d_in),
   .sd_data_out(sdram_d_out),
   .sd_addr(sdram_a),
   .sd_dqm(sdram_dqm),
   .sd_cs(sdram_csn),
   .sd_ba(sdram_ba),
   .sd_we(sdram_wen),
   .sd_ras(sdram_rasn),
   .sd_cas(sdram_casn),
   // system interface
   .clk(clk_sdram),
   .clkref(clk_enable),
   .init(!clk_sdram_locked),
   .we_out(sdram_d_wr),
   // cpu/chipset interface
   .weA(0),
   .addrA(addr_a),
   .oeA(re),
   .dinA(0),
   .doutA(rom_dout),
   // SPI interface
   .weB(we),
   .addrB(addr_b),
   .dinB(din),
   .oeB(0),
   .doutB()
  );

  assign leds = (state == 1 ? rom_dout : 0);

  always @(posedge clk_cpu) diag16 <= sdram_a;

endmodule

