// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: AZXUNO
// Engineer: Miguel Angel Rodriguez Jodar
// 
// Create Date:    19:12:34 03/16/2017 
// Design Name:    
// Module Name:    cpc
// Project Name:   The CPC core, almost device independent
// Target Devices: ZXUNO Spartan 6
// Additional Comments: all rights reserved for now
//
//////////////////////////////////////////////////////////////////////////////////

module cpc (
  input wire ck16,
  input wire pown_reset_n,
  // Salida RGB
  output wire red,       // 
  output wire red_oe,    //
  output wire green,     // 1 o 0
  output wire green_oe,  // si vale 1, color sale afuera cono 5V o 0V. Si 0, HZ
  output wire blue,      //
  output wire blue_oe,   //
  output wire hsync_pal,
  output wire vsync_pal,
  output wire csync_pal,
  // Audio y EAR
  input wire ear,
  output wire audio_out_left,
  output wire audio_out_right,
  // Teclado PS/2
  input wire clkps2,
  input wire dataps2,
  // Joystick (de momento, solo 1 jugador)
  input wire joyup,
  input wire joydown,
  input wire joyleft,
  input wire joyright,
  input wire joyfire1,
  input wire joyfire2,
  // Interface con la SRAM externa
  output tri [20:0] sram_addr,
  inout wire [7:0] sram_data,
  output tri sram_we_n,
	input wire[7:0] disk_data_in,
	output wire[7:0] disk_data_out,
	output wire[31:0] disk_sr,
	input wire[31:0] disk_cr,
	input wire disk_data_clkout,
	input wire disk_data_clkin,
	input wire[1:0] disk_wp,
	input wire[31:0] host_bootdata,
  input wire host_bootdata_req,
  output wire host_bootdata_ack,
  output wire host_rom_initialised,
  output wire[31:0] debug,
  output wire[31:0] debug2,
  output wire mono,
  output wire kbd_scandoubler
  );
  
  // Señales del CRTC
	wire vsync, hsync, dispen;
  wire [13:0] ma;
  wire [4:0] ra;
  wire[7:0] crtc_dout;
  wire crtc_oe_n;

  // Señales del GA
  wire en244_n, cpu_n, romen_n, ramrd_n, mwe_n, ras_n, cas_n;
  wire[2:0] ram_bank;

  // Señales del chip AY-3-8912
  wire [7:0] ay_data_output;
  wire ay_oe_n;

  // Señales del gestor de memoria
  wire [7:0] memory_dout;
  wire [7:0] data_to_ga;
  wire memory_oe_n;

  // Señales del PPI
  wire [7:0] configuration_bits = {ear, 2'b11, 1'b1 /* PAL 50Hz */, 3'b111 /* Amstrad */, vsync_processed};
  wire [7:0] ppi_dout;
  wire ppi_oe_n;
  wire [7:0] port_c_output;
  wire [7:0] port_b_output;  
  wire [7:0] port_a_output;
  wire [7:0] port_a_oe_n;
  wire [7:0] port_b_oe_n;
  wire [7:0] port_c_oe_n;
  wire [7:0] columns;
  
  // Señales del FDC
  wire nec765a_oe_n;
  wire[7:0] fdc_dout;

  // esta señal es el resultado de procesar VSYNC desde el CRTC + un posible forzado del bit 0 del puerto B.
  wire vsync_processed = (port_b_oe_n[0] == 1'b0)? port_b_output[0] : vsync;

  // Latch de lo ultimo escrito en los puertos A, B y C
  reg [7:0] port_a_input = 8'hFF;
  reg [7:0] port_b_input = 8'hFF;
  reg [7:0] port_c_input = 8'hFF;
  always @(posedge clk_reg) begin
    port_a_input <= (ay_oe_n == 1'b0)? ay_data_output : (port_a_output & ~port_a_oe_n) | (port_a_input & port_a_oe_n);
    port_b_input <= (configuration_bits & port_b_oe_n) | ( (configuration_bits & port_b_output) & ~port_b_oe_n);
    port_c_input <= (port_c_output & ~port_c_oe_n) | (port_c_input & port_c_oe_n);
  end

  // Sonido + cassette
  wire mic = port_c_output[5];
  wire [7:0] ay_cha, ay_chb, ay_chc;
  
  // Señales desde el teclado
  wire kbd_reset, kbd_mreset, kbd_nmi;

  // Dirección que forma el CRTC para leer la VRAM
  wire [15:0] vram_addr = {ma[13:12], ra[2:0], ma[9:0], cclk};

  // Señales de la CPU  
  wire [15:0] a;
  wire [7:0] cpu_dout;
  reg [7:0] cpu_din;
  wire m1_n, mreq_n, iorq_n, rd_n, wr_n, ready, int_n, rfsh_n;
  wire iord_n = iorq_n | rd_n;
  wire iowr_n = iorq_n | wr_n;
  
  reg iowr_delayed = 1'b1;
  always @(posedge clk_reg)
    iowr_delayed <= iowr_n;
  wire iowr_falling_edge_n = ~(iowr_delayed & ~iowr_n);

  wire cclk, phi_n, clk_for_crtc, clk_cpu, clk_reg;
  // primitiva de Xilinx para rutear una señal hacia un buffer global y convertirla en un reloj
  BUFG buffcclk (
    .I(~cclk),
    .O(clk_for_crtc)
  );

  // Antes de usar un reloj generado por el PLL, voy a probar si vale usando el que genera el GA
  BUFG buffclkcpu (
    .I(phi_n),  // esto deberia estar negado pero por alguna razón, funciona sólo si no lo está.
    .O(clk_cpu)
  );

  assign clk_reg = ck16;

  // Señal de reset, combinando reset power on + reset de teclado
  wire reset_n = pown_reset_n & kbd_reset;

  always @* begin
    case (1'b0)
      crtc_oe_n  : cpu_din = crtc_dout;
      ppi_oe_n   : cpu_din = ppi_dout;
      memory_oe_n: cpu_din = memory_dout;
      nec765a_oe_n: cpu_din = fdc_dout;
      default    : cpu_din = 8'hFF;
    endcase
  end

  reg[15:0] pc = 16'd0;
  reg[15:0] io = 16'd0;
  
  assign debug2[31:0] = {pc[15:0], io[15:0]};
    
  always @(posedge clk_cpu) begin
    if (!rd_n && !mreq_n && !m1_n) pc <= a;
    if ((!rd_n || !wr_n) && !iorq_n) io <= a;
  end
    
    
  z80 cpu (
    .m1_n(m1_n), 
    .mreq_n(mreq_n), 
    .iorq_n(iorq_n), 
    .rd_n(rd_n), 
    .wr_n(wr_n), 
    .rfsh_n(rfsh_n), 
    .halt_n(), 
    .busak_n(), 
    .A(a), 
    .dout(cpu_dout),
    .reset_n(reset_n && host_rom_initialised), 
    .clk(clk_cpu), 
    .wait_n(ready), 
    .int_n(int_n), 
    .nmi_n(kbd_nmi), 
    .busrq_n(1'b1), 
    .di(cpu_din)
  );
  
	ga40010 gate_array (
		.ck16(ck16), 
		.reset_n(reset_n), 
		.a15(a[15]), 
		.a14(a[14]), 
		.mreq_n(mreq_n), 
		.iorq_n(iorq_n), 
		.m1_n(m1_n), 
		.rd_n(rd_n), 
    .rfsh_n(rfsh_n),
		.phi_n(phi_n), 
		.ready(ready), 
		.int_n(int_n), 
		.d(data_to_ga), 
		.vsync(vsync_processed), 
		.hsync(hsync), 
		.dispen(dispen), 
		.cclk(cclk), 
		.en244_n(en244_n), 
		.cpu_n(cpu_n), 
		.romen_n(romen_n), 
		.ramrd_n(ramrd_n), 
		.ras_n(ras_n), 
		.cas_n(cas_n), 
		.casad_n(), 
		.ram_bank(ram_bank),
		.mwe_n(mwe_n), 
    .hsync_pal(hsync_pal),
    .vsync_pal(vsync_pal),
		.sync_n(csync_pal), 
		.red(red), 
		.red_oe(red_oe), 
		.green(green), 
		.green_oe(green_oe), 
		.blue(blue), 
		.blue_oe(blue_oe)
	);

  mc6845 crtc (
    .CLOCK(clk_for_crtc),
    .CLKREG(clk_reg),
    .CLKEN(1'b1),
    .nRESET(reset_n),
    .ENABLE( (~(iord_n & iowr_n)) & ~a[14]),
    .R_nW(a[9] | iowr_n | a[14]),
    .RS(a[8]),
    .DI(cpu_dout),
    .DO(crtc_dout),
    .DO_oe_n(crtc_oe_n),
    .VSYNC(vsync),
    .HSYNC(hsync),
    .DE(dispen),
    .CURSOR(),
    .LPSTB(1'b0),
    .MA(ma),
    .RA(ra)
	);

  I82C55 ppi (
    .I_ADDR(a[9:8]),
    .I_DATA(cpu_dout),
    .O_DATA(ppi_dout),
    .O_DATA_OE_L(ppi_oe_n),
    .I_CS_L(a[11]),
    .I_RD_L(iord_n),
    .I_WR_L(iowr_n),

    .I_PA(port_a_input),
    .O_PA(port_a_output),
    .O_PA_OE_L(port_a_oe_n),

    .I_PB(port_b_input),
    .O_PB(port_b_output),
    .O_PB_OE_L(port_b_oe_n),

    .I_PC(port_c_input),
    .O_PC(port_c_output),
    .O_PC_OE_L(port_c_oe_n),

    .RESET(~reset_n),
    .ENA(1'b1),
    .CLK(clk_reg)
  );

  kb_matrix teclado (
    .clk(ck16),
    .clkps2(clkps2),
    .dataps2(dataps2),
    .rowselect(port_c_output[3:0]),
    .columns(columns),
    .joyup(joyup),
    .joydown(joydown),
    .joyleft(joyleft),
    .joyright(joyright),
    .joyfire1(joyfire1),
    .joyfire2(joyfire2),
    .kbd_mreset(kbd_mreset),
    .kbd_reset(kbd_reset),
    .kbd_nmi(kbd_nmi),
    .kbd_greenscreen(mono),
    .kbd_scandoubler(kbd_scandoubler)
  );

  multiboot vuelta_bios (
    .clk_icap(ck16),   // WARNING: this clock must not be greater than 20MHz (50ns period)
    .boot(kbd_mreset)
  );

  memory_cpc464 memory (
    .clk(ck16),
    .reset_n(reset_n),
    .cpu_addr(a),
    .mreq_n(mreq_n),
    .iorq_n(iorq_n),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .vram_addr(vram_addr),
    .ready(ready),
    .cpu_n(cpu_n),
    .romen_n(romen_n),
    .ramrd_n(ramrd_n),
    .ras_n(ras_n),
    .cas_n(cas_n),
    .mwe_n(mwe_n),
    .ram_bank(ram_bank),
    .en244_n(en244_n),
    .data_from_cpu(cpu_dout),
    .data_to_cpu(memory_dout),
    .memory_oe_n(memory_oe_n),
    .data_to_ga(data_to_ga),
    .sram_addr(sram_addr),
    .sram_data(sram_data),
    .sram_we_n(sram_we_n),
    // rom loading
		.host_bootdata(host_bootdata),
		.host_bootdata_ack(host_bootdata_ack),
		.host_bootdata_req(host_bootdata_req),
		.host_rom_initialised(host_rom_initialised),
		.pown_reset_n(pown_reset_n)
  );

  YM2149 sonido_ay_3 (
    .I_DA(port_a_input),
    .O_DA(ay_data_output),
    .O_DA_OE_L(ay_oe_n),
    .I_A9_L(1'b0),
    .I_A8(1'b1),
    .I_BDIR(port_c_input[7]),  // era output
    .I_BC2(1'b1),
    .I_BC1(port_c_input[6]),   // era output
    .I_SEL_L(1'b1),
    .O_AUDIO(),
    .O_AUDIO_A(ay_cha),
    .O_AUDIO_B(ay_chb),
    .O_AUDIO_C(ay_chc),
    .I_IOA(columns),
    .O_IOA(),
    .O_IOA_OE_L(),
    .I_IOB(8'hFF),
    .O_IOB(),
    .O_IOB_OE_L(),
    .ENA(1'b1),
    .RESET_L(reset_n),
    .CLK(clk_for_crtc), // 1MHz
    .CLKREG(clk_reg)
  );

  mixer mezclador (  
    .clk(ck16),
    .rst_n(reset_n),
    .mic(mic),
    .ear(ear),
    .ay_cha(ay_cha),
    .ay_chb(ay_chb),
    .ay_chc(ay_chc),
    .audio_out_left(audio_out_left),
    .audio_out_right(audio_out_right)
  );
  
  wire nec765a_oe = !a[10] && !a[7] && a[8] && !iorq_n;
  assign nec765a_oe_n = !nec765a_oe;
  nec765 fdc (
    .clk(ck16),
    .rst_n(reset_n),
    .dout(fdc_dout),
    .din(cpu_dout),
    .ce(nec765a_oe),
    .a0(a[0]),
    .motorctl(!a[10] && !a[7] && !a[8] && !iorq_n),
    .disk_data_in(disk_data_in),
    .disk_data_out(disk_data_out),
    .disk_sr(disk_sr),
    .disk_cr(disk_cr),
    .disk_data_clkout(disk_data_clkout),
    .disk_data_clkin(disk_data_clkin),
    .disk_wp(disk_wp),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .debug(debug)
  );
  

endmodule
