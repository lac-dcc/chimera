`default_nettype none
`timescale 1ns / 1ps

module gameboy (
  input  wire        clock,
  input  wire        cpu_clock,
  input  wire        reset,
  input  wire        reset_init,
  
  // Main RAM + Cartridge
  output wire [15:0] A,
  input  wire  [7:0] Di,
  output wire  [7:0] Do,
  output wire        wr_n,
  output wire        rd_n,
  output wire        cs_n,
  
  // Video RAM
  output wire [15:0] A_vram,
  input  wire  [7:0] Di_vram,
  output wire  [7:0] Do_vram,
  output wire        wr_vram_n,
  output wire        rd_vram_n,
  output wire        cs_vram_n,
  
  // Video Display
  output wire  [1:0] pixel_data,
  output wire        pixel_clock,
  output wire        pixel_latch,
  output wire        hsync,
  output wire        vsync,
  
  // Controller
  input  wire  [3:0] joypad_data,
  output wire  [1:0] joypad_sel,
  
  // Audio
  output wire        audio_left,
  output wire        audio_right,
  
  // Debug - CPU Pins
  output wire  [7:0] dbg_led,
  output wire [15:0] PC,
  output wire [15:0] SP,
  output wire [15:0] AF,
  output wire [15:0] BC,
  output wire [15:0] DE,
  output wire [15:0] HL,
  output wire [15:0] A_cpu,
  output wire  [7:0] Di_cpu,
  output wire  [7:0] Do_cpu
);
  
  //assign pixel_data = 2'b0;
  assign pixel_clock = 1'b0;
  //assign pixel_latch = 1'b0;
  //assign hsync = 1'b0;
  //assign vsync = 1'b0;

  assign audio_left = 1'b0;
  assign audio_right = 1'b0;
  
  //
  // CPU I/O Pins
  //
  
  wire reset_n, wait_n, int_n, nmi_n, busrq_n; // cpu inputs
  wire m1_n, mreq_n, iorq_n, rd_cpu_n, wr_cpu_n, rfsh_n, halt_n, busak_n; // cpu outputs
  
  //
  // Debug - CPU I/O Pins
  //
  
  assign dbg_led = {
    m1_n,
    mreq_n,
    iorq_n,
    int_n,
    halt_n,
    reset_n,
    rd_n,
    wr_n
  };
  
  //
  // CPU internal registers
  //
  
  wire IntE_FF1;
  wire IntE_FF2;
  wire INT_s;
  
  //
  // TV80 CPU
  //
      
  tv80s tv80_core(
    .reset_n(reset_n),
    .clk(cpu_clock),
    .wait_n(wait_n),
    .int_n(int_n),
    .nmi_n(nmi_n),
    .busrq_n(busrq_n),
    .m1_n(m1_n),
    .mreq_n(mreq_n),
    .iorq_n(iorq_n),
    .rd_n(rd_cpu_n),
    .wr_n(wr_cpu_n),
    .rfsh_n(rfsh_n),
    .halt_n(halt_n),
    .busak_n(busak_n),
    .A(A_cpu),
    .di(Di_cpu),
    .do(Do_cpu),
    .ACC(AF[15:8]),
    .F(AF[7:0]),
    .BC(BC),
    .DE(DE),
    .HL(HL),
    .PC(PC),
    .SP(SP),
    .IntE_FF1(IntE_FF1),
    .IntE_FF2(IntE_FF2),
    .INT_s(INT_s)
  );
  
  assign reset_n = !reset;
  assign wait_n = 1'b1;
  assign nmi_n = 1'b1;
  assign busrq_n = 1'b1;
  
  //
  // MMU
  //
  
  wire cs_interrupt;
  wire cs_timer;
  wire cs_sound;
  wire cs_joypad;
  
  wire  [7:0] Do_mmu;
  wire  [7:0] Do_interrupt;
  wire  [7:0] Do_timer;
  wire  [7:0] Do_sound;
  wire  [7:0] Do_joypad;
  
  wire [15:0] A_ppu;
  wire  [7:0] Do_ppu;
  wire  [7:0] Di_ppu;
  wire        cs_ppu;
  
  mmu memory (
    .clock(clock),
    .reset(reset),
    
    // CPU <-> MMU
    .A_cpu(A_cpu),
    .Di_cpu(Do_cpu),
    .Do_cpu(Do_mmu),
    .rd_cpu_n(rd_cpu_n),
    .wr_cpu_n(wr_cpu_n),
    
    // MMU <-> I/O Registers + External RAMs
    .A(A),
    .Do(Do),
    .Di(Di),
    .wr_n(wr_n),
    .rd_n(rd_n),
    .cs_n(cs_n),
    
    // MMU <-> PPU
    .A_ppu(A_ppu),
    .Do_ppu(Do_ppu),
    .Di_ppu(Di_ppu),
    .cs_ppu(cs_ppu),
    
    // Data lines (I/O Registers) -> MMU
    .Do_interrupt(Do_interrupt),
    .Do_timer(Do_timer),
    .Do_sound(Do_sound),
    .Do_joypad(Do_joypad),
    
    // MMU -> Modules (I/O Registers)
    .cs_interrupt(cs_interrupt),
    .cs_timer(cs_timer),
    .cs_sound(cs_sound),
    .cs_joypad(cs_joypad)
  );
  
  //
  // Interrupt Controller
  //
  
  wire[4:0] int_req;
  wire[4:0] int_ack;
  wire[7:0] jump_addr;
  
  interrupt_controller interrupt(
    .reset(reset),
    .clock(clock),
    .cs(cs_interrupt),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .m1_n(m1_n),
    .int_n(int_n),
    .iorq_n(iorq_n),
    .int_ack(int_ack),
    .int_req(int_req),
    .jump_addr(jump_addr),
    .A(A),
    .Di(Do_cpu),
    .Do(Do_interrupt)
  );
  
  // During an interrupts the CPU reads the jump address
  //  from a table in memory. It gets the address of this
  //  table from the interrupt module which is why this
  //  mux exists.
  assign Di_cpu = (!iorq_n && !m1_n) ? jump_addr : Do_mmu;
  
  //
  // Timer Controller
  //
  
  timer_controller timer (
    .reset(reset),
    .clock(cpu_clock),
    .cs(cs_timer),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .int_ack(int_ack[2]),
    .int_req(int_req[2]),
    .A(A),
    .Di(Do_cpu),
    .Do(Do_timer)
  );
  
  //
  // Video Controller
  //
  
  video_controller video (
    .reset(reset),
    .clock(clock),
    
    // Interrupts
    .int_vblank_ack(int_ack[0]),
    .int_vblank_req(int_req[0]),
    .int_lcdc_ack(int_ack[1]),
    .int_lcdc_req(int_req[1]),
    
    // PPU <-> MMU
    .A(A_ppu),
    .Di(Do_ppu),
    .Do(Di_ppu),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .cs(cs_ppu),
    
    // PPU <-> VRAM
    .A_vram(A_vram),
    .Di_vram(Do_vram),
    .Do_vram(Di_vram),
    .rd_vram_n(rd_vram_n),
    .wr_vram_n(wr_vram_n),
    .cs_vram_n(cs_vram_n),
    
    // LCD Output
    .hsync(hsync),
    .vsync(vsync),
    .pixel_data(pixel_data),
    .pixel_latch(pixel_latch)
    //.pixel_clock(clock) // TODO ??
  );
  
  //
  // Input Controller
  //
  
  joypad_controller joypad_controller (
    .reset(reset),
    .clock(clock),
    .int_ack(int_ack[4]),
    .int_req(int_req[4]),
    .A(A),
    .Di(Do_cpu),
    .Do(Do_joypad),
    .cs(cs_timer),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .button_sel(joypad_sel),
    .button_data(joypad_data)
  );

endmodule
