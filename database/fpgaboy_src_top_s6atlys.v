// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

// Main board module.
module s6atlys(
  // Global clock
  input  wire        CLK_100M,
  
  // onboard HDMI OUT
  //output wire        HDMIOUTCLKP,
  //output wire        HDMIOUTCLKN,
  //output wire        HDMIOUTD0P,
  //output wire        HDMIOUTD0N,
  //output wire        HDMIOUTD1P,
  //output wire        HDMIOUTD1N,
  //output wire        HDMIOUTD2P,
  //output wire        HDMIOUTD2N,
  //output wire        HDMIOUTSCL,
  //output wire        HDMIOUTSDA,
  
  // LEDs
  output wire  [7:0] LED,
  
  // Switches
  input  wire  [7:0] SW,
  
  // Buttons
  input  wire  [5:0] BTN,
  
  // PMOD Connector
  inout  wire  [7:0] JB
);

  //
  // Initialize outputs -- remove these when they're actually used
  //
  
  // Audio output
  //assign AUD_L = 0;
  //assign AUD_R = 0;
  
  // VGA output
  //assign VGA_R = 0;
  //assign VGA_G = 0;
  //assign VGA_B = 0;
  //assign VGA_HSYNC = 0;
  //assign VGA_VSYNC = 0;
  
  //
  // Clocks (GameBoy clock runs at ~4.194304 MHz)
  // 
  // FPGABoy runs at 33.33 MHz, mostly to simplify the video controller.
  //  Certain cycle sensitive modules, such as the CPU and Timer are
  //  internally clocked down to the GameBoy's normal speed.
  //
  
  // Core Clock: 33.33 MHz
  wire coreclk, core_clock;
  DCM_SP core_clock_dcm (.CLKIN(CLK_100M), .CLKFX(coreclk), .RST(1'b0));
  defparam core_clock_dcm.CLKFX_DIVIDE = 6;
  defparam core_clock_dcm.CLKFX_MULTIPLY = 2;
  defparam core_clock_dcm.CLKDV_DIVIDE = 3.0;
  defparam core_clock_dcm.CLKIN_PERIOD = 10.000;
  BUFG core_clock_buf (.I(coreclk), .O(core_clock));
  
  // Initial Reset
  wire reset_init, reset;
  SRL16 reset_sr(.D(1'b0), .CLK(core_clock), .Q(reset_init),
                 .A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1));
  
  // HDMI Clocks
  //  TODO: No idea what these look like yet.
  
  // Joypad Clock: 1 KHz
  wire pulse_1khz;
  reg  clock_1khz;
  divider#(.DELAY(33333)) div_1ms (
    .reset(reset_init),
    .clock(core_clock),
    .enable(pulse_1khz)
  );
  
  // CLS Clock: 200 Khz
  wire pulse_200khz;
  reg  clock_200khz;
  divider#(.DELAY(166)) div_5us (
    .reset(reset_init),
    .clock(core_clock),
    .enable(pulse_200khz)
  );
  
  //
  // CPU clock - overflows every 8 cycles
  //
  
  reg [2:0] clock_divider;
  
  wire cpu_clock; 
  BUFG cpu_clock_buf(.I(clock_divider[2]), .O(cpu_clock));
  
  //
  // Switches
  //   
  //   SW0-SW4 - Breakpoints Switches (Not Implemented)
  //   SW5 - Step Clock
  //   SW6 - Step Enable
  //   SW7 - Power (Reset)
  //
  
  wire reset_sync, step_sync, step_enable;
  debounce debounce_step_sync(reset_init, core_clock, SW[5], step_sync);
  debounce debounce_step_enable(reset_init, core_clock, SW[6], step_enable);
  debounce debounce_reset_sync(reset_init, core_clock, !SW[7], reset_sync);
  
  assign reset = (reset_init || reset_sync);
  
  // Game Clock
  wire clock;
  BUFGMUX clock_mux(.S(step_enable), .O(clock),
                    .I0(core_clock), .I1(step_sync));
  
  //
  // Buttons
  //
  // BTN0 - Not Implemented
  // BTN1 - Joypad
  // BTN2 - PC SP
  // BTN3 - AF BC
  // BTN4 - DE HL
  //
  
  reg [1:0] mode;
  wire mode0_sync, mode1_sync, mode2_sync, mode3_sync;
  debounce debounce_mode0_sync(reset_init, core_clock, BTN[2], mode0_sync);
  debounce debounce_mode1_sync(reset_init, core_clock, BTN[3], mode1_sync);
  debounce debounce_mode2_sync(reset_init, core_clock, BTN[4], mode2_sync);
  debounce debounce_mode3_sync(reset_init, core_clock, BTN[1], mode3_sync);
  
  //
  // GameBoy
  //
  
  // GB <-> Cartridge + WRAM
  wire [15:0] A;
  wire [7:0] Di;
  wire [7:0] Do;
  wire wr_n, rd_n, cs_n;
  
  // GB <-> VRAM
  wire [15:0] A_vram;
  wire [7:0] Di_vram;
  wire [7:0] Do_vram;
  wire wr_vram_n, rd_vram_n, cs_vram_n;
  
  // GB <-> Display Adapter
  wire [1:0] pixel_data;
  wire pixel_clock;
  wire pixel_latch;
  wire hsync, vsync;
  
  // GB <-> Joypad Adapter
  wire [3:0] joypad_data;
  wire [1:0] joypad_sel;
  
  // GB <-> Audio Adapter
  wire audio_left, audio_right;
  
  // GB <-> CLS SPI
  wire [15:0] PC;
  wire [15:0] SP;
  wire [15:0] AF;
  wire [15:0] BC;
  wire [15:0] DE;
  wire [15:0] HL;
  wire [15:0] A_cpu;
  wire  [7:0] Di_cpu;
  wire  [7:0] Do_cpu;
  
  gameboy gameboy (
    .clock(clock),
    .cpu_clock(cpu_clock),
    .reset(reset),
    .reset_init(reset_init),
    .A(A),
    .Di(Di),
    .Do(Do),
    .wr_n(wr_n),
    .rd_n(rd_n),
    .cs_n(cs_n),
    .A_vram(A_vram),
    .Di_vram(Di_vram),
    .Do_vram(Do_vram),
    .wr_vram_n(wr_vram_n),
    .rd_vram_n(rd_vram_n),
    .cs_vram_n(cs_vram_n),
    .pixel_data(pixel_data),
    .pixel_clock(pixel_clock),
    .pixel_latch(pixel_latch),
    .hsync(hsync),
    .vsync(vsync),
    .joypad_data(joypad_data),
    .joypad_sel(joypad_sel),
    .audio_left(audio_left),
    .audio_right(audio_right),
    // debug output
    .dbg_led(LED),
    .PC(PC),
    .SP(SP),
    .AF(AF),
    .BC(BC),
    .DE(DE),
    .HL(HL),
    .A_cpu(A_cpu),
    .Di_cpu(Di_cpu),
    .Do_cpu(Do_cpu)
  );
  
  // Internal ROMs and RAMs
  reg [7:0] tetris_rom [0:32767];
  
  initial begin
    $readmemh("data/tetris.hex", tetris_rom, 0, 32767);
  end
  
  wire [7:0] Di_wram;
  
  // WRAM
  async_mem #(.asz(8), .depth(8192)) wram (
    .rd_data(Di_wram),
    .wr_clk(clock),
    .wr_data(Do),
    .wr_cs(!cs_n && !wr_n),
    .addr(A),
    .rd_cs(!cs_n && !rd_n)
  );
  
  // VRAM
  async_mem #(.asz(8), .depth(8192)) vram (
    .rd_data(Di_vram),
    .wr_clk(clock),
    .wr_data(Do_vram),
    .wr_cs(!cs_vram_n && !wr_vram_n),
    .addr(A_vram),
    .rd_cs(!cs_vram_n && !rd_vram_n)
  );
  
  assign Di = A[14] ? Di_wram : tetris_rom[A];
  
  // Joypad Adapter
  wire [15:0] joypad_state;
  joypad_snes_adapter joypad_adapter(
    .clock(clock_1khz),
    .reset(reset),
    .button_sel(joypad_sel),
    .button_data(joypad_data),
    .button_state(joypad_state),
    .controller_data(JB[4]),
    .controller_clock(JB[5]),
    .controller_latch(JB[6])
  );
  
  cls_spi cls_spi(
    .clock(clock_200khz),
    .reset(reset),
    .mode(mode),
    .ss(JB[0]),
    .mosi(JB[1]),
    .miso(JB[2]),
    .sclk(JB[3]),
    .A(A_cpu),
    .Di(Di_cpu),
    .Do(Do_cpu),
    .PC(PC),
    .SP(SP),
    .AF(AF),
    .BC(BC),
    .DE(DE),
    .HL(HL),
    .joypad_state(joypad_state)
  );
  
  // driver for divider clocks and debug elements
  always @(posedge core_clock) begin
    if (reset_init) begin
      clock_1khz <= 1'b0;
      clock_200khz <= 1'b0;
      mode <= 2'b0;
    end else begin
      if (pulse_1khz)
        clock_1khz <= !clock_1khz;
      if (pulse_200khz)
        clock_200khz <= !clock_200khz;
        
      if (mode0_sync)
        mode <= 2'b00;
      else if (mode1_sync)
        mode <= 2'b01;
      else if (mode2_sync)
        mode <= 2'b10;
      else if (mode3_sync)
        mode <= 2'b11;
    end
  end
  
  always @(posedge clock) begin
    if (reset_init) begin
      clock_divider <= 1'b0;
    end else begin
      if (step_enable)
        clock_divider <= clock_divider + 4;
      else
        clock_divider <= clock_divider + 1;
    end
  end
  
endmodule
