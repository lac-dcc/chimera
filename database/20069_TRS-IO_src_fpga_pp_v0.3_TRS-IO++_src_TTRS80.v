// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// Crude implementation of a TRS-80 Model 4 using the T80 core.
//
// Inputs:
//    z80_clk - Z80 clock input.
//    z80_rst_n - Reset input, active low.
//    keyb_matrix - Keyboard input (basically row (address) and column (data)
//                  data from keyboard matrix).
//    vga_clk - VGA clock input, 25.2MHz for 640x480@60Hz display.
//
// Outputs:
//    pixel_data - Single bit (on/off) pixel signal.  If driving the Z (blanking)
//                 input of an oscilloscope this may need to be inverted at the
//                 top level.

module TTRS80 (
   // Inputs
   z80_clk,
   z80_rst_n,
   keyb_matrix,
   vga_clk,

   // Outputs
   cpu_fast,
   pixel_data,
   h_sync,
   v_sync,
   cass_out,
   orch90l_out,
   orch90r_out,
   lb80,

   // Expansion connector
   // Inputs
   xio_int_n,
   xio_wait_n,
   xio_sel_n,
   // Outputs
   xio_ioreq_n,
   xio_iord_n,
   xio_iowr_n,
   xio_addr,
   xio_enab,
   xio_dir_out,
   // Inputs/Outputs
   xio_data
);

input z80_clk;
input z80_rst_n;

input [7:0] keyb_matrix[0:7];
input vga_clk;

output cpu_fast;
output pixel_data;
output h_sync;
output v_sync;
output [1:0] cass_out;
output orch90l_out;
output orch90r_out;
output [7:0] lb80;

input xio_int_n;
input xio_wait_n;
input xio_sel_n;
output xio_ioreq_n;
output xio_iord_n;
output xio_iowr_n;
output [7:0] xio_addr;
output xio_enab;
output xio_dir_out;
inout [7:0] xio_data;


wire WAIT_n;
wire INT_n;
wire NMI_n;
wire nM1;
wire nMREQ;
wire nIORQ;
wire nRD;
wire nWR;
wire nRFSH;
wire nHALT;
wire nBUSACK;

wire [15:0] z80_addr;
wire [7:0] z80_data;

T80a T80a (
   .RESET_n(z80_rst_n), //: in std_logic;
   .CLK_n(z80_clk),     //: in std_logic;
   .WAIT_n(WAIT_n),     //: in std_logic;
   .INT_n(INT_n),       //: in std_logic;
   .NMI_n(NMI_n),       //: in std_logic;
   .BUSRQ_n(1'b1),      //: in std_logic;
   .M1_n(nM1),          //: out std_logic;
   .MREQ_n(nMREQ),      //: out std_logic;
   .IORQ_n(nIORQ),      //: out std_logic;
   .RD_n(nRD),          //: out std_logic;
   .WR_n(nWR),          //: out std_logic;
   .RFSH_n(nRFSH),      //: out std_logic;
   .HALT_n(),           //: out std_logic;
   .BUSAK_n(),          //: out std_logic;
   .A(z80_addr),        //: out std_logic_vector(15 downto 0);
   .D(z80_data),        //: inout std_logic_vector(7 downto 0)
   .R800_mode(1'b0)
);

wire z80_mem_rd = ~nMREQ & ~nRD;
wire z80_mem_wr = ~nMREQ & ~nWR;
wire z80_io_rd = ~nIORQ & ~nRD;
wire z80_io_wr = ~nIORQ & ~nWR;

// Forward reference
wire [1:0] opreg_sel;

// Generate the memory decodes for the ROM, RAM, display, and keyboard.
wire z80_rom_sel = ~nMREQ & (((opreg_sel == 2'b00) & ((z80_addr[15:13] == 3'b000) | (z80_addr[15:12] == 4'b0010) | (z80_addr[15:11] == 5'b00110)))); // 8k+4k+2k=14k @ 0x0000-0x37ff
wire z80_kbd_sel = ~nMREQ & (((opreg_sel == 2'b00) & ((z80_addr[15:10] == 6'b001110))) | // 1k @ 0x3800-0x3bff
                             ((opreg_sel == 2'b01) & ((z80_addr[15:10] == 6'b001110))) | // 1k @ 0x3800-0x3bff
                             ((opreg_sel == 2'b10) & ((z80_addr[15:10] == 6'b111101)))); // 1k @ 0xf400-0xf7ff
wire z80_dsp_sel = ~nMREQ & (((opreg_sel == 2'b00) & ((z80_addr[15:10] == 6'b001111))) | // 1k @ 0x3c00-0x3fff
                             ((opreg_sel == 2'b01) & ((z80_addr[15:10] == 6'b001111))) | // 1k @ 0x3c00-0x3fff
                             ((opreg_sel == 2'b10) & ((z80_addr[15:11] == 5'b11111)))); // 2k @ 0xf800-0xffff
wire z80_ram_sel = ~nMREQ & (((opreg_sel == 2'b00) & ((z80_addr[15:14] == 2'b01) | (z80_addr[15] == 1'b1))) | // 48k @ 0x4000-0xffff
                             ((opreg_sel == 2'b01) & ((z80_addr[15:13] == 3'b000) | (z80_addr[15:12] == 4'b0010) | (z80_addr[15:11] == 5'b00110) |
                                                      (z80_addr[15:14] == 2'b01) | (z80_addr[15] == 1'b1))) | // 62k @ 0x0000-0x37ff, 0x4000-0xffff
                             ((opreg_sel == 2'b10) & ((z80_addr[15] == 1'b0) | (z80_addr[15:14] == 2'b10) | (z80_addr[15:13] == 3'b110) |
                                                      (z80_addr[15:12] == 4'b1110) | (z80_addr[15:10] == 6'b111100))) | // 61k @ 0x0000-0xf3ff
                             ((opreg_sel == 2'b11))); // 64k @ 0x0000-0xffff


// Instantiate the ROM.
wire [7:0] _z80_rom_data;

blk_mem_gen_0 z80_rom (
   .clk(z80_clk), // input
   .ce(z80_rom_sel & ~nRD), // input
   .ad(z80_addr[13:0]), // input [13:0]
   .dout(_z80_rom_data), // output [7:0]
   .oce(1'b1),
   .reset(1'b0)
);

reg [7:0] z80_rom_data;

always @ (negedge z80_clk)
begin
   if(z80_rom_sel & ~nRD)
      z80_rom_data <= _z80_rom_data;
end


// Forward reference
reg [1:0] bnk_addr; // forward reference

// Instantiate the RAM.
wire [7:0] _z80_ram_data;

blk_mem_gen_1 z80_ram (
   .clk(z80_clk), // input
   .ce(z80_ram_sel & (~nRD | ~nWR)), // input
   .ad({bnk_addr[0], z80_addr[14:0]}), // input [15:0]
   .wre(~nWR), // input
   .din(z80_data), // input [7:0]
   .dout(_z80_ram_data), // output [7:0]
   .oce(1'b1),
   .reset(1'b0)
);

reg [7:0] z80_ram_data;

always @ (negedge z80_clk)
begin
   if(z80_ram_sel & ~nRD)
      z80_ram_data <= _z80_ram_data;
end


// Forward references
reg vga_80_64_n;
wire opreg_page;

// The VGA display is 640x480.
// Each row of the TRS-80 display is repeated twice for an effective resolution of 640x240.
// In 64x16 mode the characters are 8x12 or 8x24 when rows are repeated.
// In 80x24 mode the characters are 8x10 or 8x20 when rows are repeated.
// For convenience the VGA X and Y counters are partitioned into high and low parts which
// count the character position and the position within the character respectively.
reg [2:0] vga_xxx;     // 0-7
reg [6:0] vga_XXXXXXX; // 0-79 active, -99 total
reg [4:0] vga_yyyyy;   // 0-23 in 64x16 mode, 0-19 in 80x24 mode
reg [4:0] vga_YYYYY;   // 0-19 active, -21-20/24 total in 64x16 mode, 0-23 active, -26-4/20 total in 80x24 mode
reg vga_Z;
// VGA in active area.
wire vga_act = vga_80_64_n ?
               ((vga_XXXXXXX < 7'd80) & (vga_YYYYY < 5'd24)) :
               ((vga_XXXXXXX < 7'd80) & (vga_YYYYY < 5'd20));


// Instantiate the display RAM.  The display RAM is dual port.
// The A port is connected to the z80.
// The B port is connected to the video logic.
wire [7:0] _z80_dsp_data;
wire [7:0] z80_dsp_data_b;

// Center the 64x16 text display in the 640x480 VGA display.
wire [6:0] dsp_XXXXXXX = vga_XXXXXXX - 7'd8;
wire [4:0] dsp_YYYYY   = vga_YYYYY   - 5'd2;
// Display in active area.
wire dsp_act = vga_80_64_n ?
               ((vga_XXXXXXX < 7'd80) & (vga_YYYYY < 5'd24)) :
               ((dsp_XXXXXXX < 7'd64) & (dsp_YYYYY < 5'd16));
// 64/32 or 80/40 column display mode.
// If modsel=1 then in 32/40 column mode.
// in 32/40 column mode only the even columns are active.
wire mod_modsel; // forward reference
wire col_act = (mod_modsel ? ~dsp_XXXXXXX[0] : 1'b1);
  
blk_mem_gen_2 z80_dsp (
   .clka(z80_clk), // input
   .cea(z80_dsp_sel & (~nRD | ~nWR)), // input
   .ada({(opreg_sel[1] ? z80_addr[10] : opreg_page), z80_addr[9:0]}), // input [10:0]
   .wrea(~nWR), // input
   .dina(z80_data), // input [7:0]
   .douta(_z80_dsp_data), // output [7:0]
   .ocea(1'b1),
   .reseta(1'b0),

   .clkb(vga_clk), // input
   .ceb(dsp_act & col_act & (vga_xxx == 3'b000)), // input
   .adb(vga_80_64_n ?
        ({vga_YYYYY, 6'b000000} + {2'b00, vga_YYYYY, 4'b0000} + vga_XXXXXXX) : // 80*vga_YYYYY + dsp_XXXXXXX
        {1'b0, dsp_YYYYY[3:0], dsp_XXXXXXX[5:0]}), // input [10:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(z80_dsp_data_b), // output [7:0]
   .oceb(dsp_act & col_act & (vga_xxx == 3'b001)), // input
   .resetb(1'b0)
);

reg [7:0] z80_dsp_data;

always @ (negedge z80_clk)
begin
   if(z80_dsp_sel & ~nRD)
      z80_dsp_data <= _z80_dsp_data;
end


// Instantiate the hires display RAM.  The hires display RAM is dual port.
// The A port is connected to the z80.
// The B port is connected to the video logic.
wire [7:0] _z80_hires_data;
wire [7:0] z80_hires_data_b;
// The z80 address is supplied by the x and y registers
wire z80_hires_data_sel;
reg [7:0] z80_hires_x_reg, z80_hires_y_reg;

// The hires display is the same as the effective 640x240 VGA display.
wire [6:0] hires_XXXXXXX = vga_XXXXXXX; // 0-79 active
wire [7:0] hires_YYYYYYYY = vga_80_64_n ?
                            ((vga_YYYYY << 3) + (vga_YYYYY << 1) + vga_yyyyy[4:1]) :
                            ((vga_YYYYY << 3) + (vga_YYYYY << 2) + vga_yyyyy[4:1]); // 0-239 active
// Hires in active area.
wire hires_act = vga_act;

blk_mem_gen_4 z80_hires (
   .clka(z80_clk), // input
   .cea(z80_hires_data_sel & (~nRD | ~nWR)), // input
   .ada({z80_hires_x_reg[6:0], z80_hires_y_reg}), // input [14:0]
   .wrea(~nWR), // input
   .dina(z80_data), // input [7:0]
   .douta(_z80_hires_data), // output [7:0]
   .ocea(1'b1),
   .reseta(1'b0),

   .clkb(vga_clk), // input
   .ceb(hires_act & (vga_xxx == 3'b010)), // input
   .adb({hires_XXXXXXX, hires_YYYYYYYY}), // input [14:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(z80_hires_data_b), // output [7:0]
   .oceb(hires_act & (vga_xxx == 3'b011)), // input
   .resetb(1'b0)
);

reg [7:0] z80_hires_data;

always @ (negedge z80_clk)
begin
   if(z80_hires_data_sel & ~nRD)
      z80_hires_data <= _z80_hires_data;
end


// This is a hack to crudely emulate keyboard scanned input.
// kbd_reg is an external input that contains the keyboard row and column.
// As the z80 scans the keybard addresses, is an address bit in the z80 addr[6:0] is
// also set in kbd_reg[14:8] then the data in kbd_reg[7:0] is returned to the z80.
reg [7:0] z80_kbd_data;

always @ (posedge z80_clk)
begin
   z80_kbd_data <= ({8{z80_addr[0]}} & keyb_matrix[0]) |
                   ({8{z80_addr[1]}} & keyb_matrix[1]) |
                   ({8{z80_addr[2]}} & keyb_matrix[2]) |
                   ({8{z80_addr[3]}} & keyb_matrix[3]) |
                   ({8{z80_addr[4]}} & keyb_matrix[4]) |
                   ({8{z80_addr[5]}} & keyb_matrix[5]) |
                   ({8{z80_addr[6]}} & keyb_matrix[6]) |
                   ({8{z80_addr[7]}} & keyb_matrix[7]);
end


// Generate the io port decodes.
// Output ports
wire z80_opreg_sel      = ~nIORQ & (z80_addr[7:2] == 6'b100001); // 84-87
wire z80_int_mask_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111000); // e0-e3
wire z80_nmi_mask_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111001); // e4-e7
wire z80_rs232_out_sel  = ~nIORQ & (z80_addr[7:2] == 6'b111010); // e8-eb
wire z80_mod_sel        = ~nIORQ & (z80_addr[7:2] == 6'b111011); // ec-ef
wire z80_disk_out_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111100); // f0-f3
wire z80_drv_sel        = ~nIORQ & (z80_addr[7:2] == 6'b111101); // f4-f7
wire z80_lp_out_sel     = ~nIORQ & (z80_addr[7:2] == 6'b111110); // f8-fb
wire z80_cass_out_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111111); // fc-ff
// Input ports
wire z80_int_stat_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111000); // e0-e3
wire z80_nmi_stat_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111001); // e4-e7
wire z80_rs232_in_sel   = ~nIORQ & (z80_addr[7:2] == 6'b111010); // e8-eb
wire z80_rtc_sel        = ~nIORQ & (z80_addr[7:2] == 6'b111011); // ec-ef
wire z80_disk_in_sel    = ~nIORQ & (z80_addr[7:2] == 6'b111100); // f0-f3
                                                                 // f4-f7
wire z80_lp_in_sel      = ~nIORQ & (z80_addr[7:2] == 6'b111110); // f8-fb
wire z80_cass_in_sel    = ~nIORQ & (z80_addr[7:2] == 6'b111111); // fc-ff

// FDC
wire z80_fdc_cmnd_sel  = z80_disk_in_sel & (z80_addr[1:0] == 2'b00); // f0 output
wire z80_fdc_stat_sel  = z80_disk_in_sel & (z80_addr[1:0] == 2'b00); // f0 input
wire z80_fdc_track_sel = z80_disk_in_sel & (z80_addr[1:0] == 2'b01); // f1 input/output
//wire [7:0] z80_fdc_stat = 8'hff; // no fdc
wire [7:0] z80_fdc_stat = 8'h34; // seek error
wire [7:0] z80_fdc_track = 8'h00;

// Hi-res board
wire z80_hires_sel      = ~nIORQ & (z80_addr[7:2] == 6'b100000); // 80-83
assign z80_hires_data_sel = z80_hires_sel & (z80_addr[1:0] == 2'b10); // 82

// orchestra-90
wire z80_orch90l_sel    = ~nIORQ & (z80_addr[7:0] == 8'h75); // 75
wire z80_orch90r_sel    = ~nIORQ & (z80_addr[7:0] == 8'h79); // 79

// External expansion bus
wire z80_xio_sel = (~nIORQ & ((z80_addr[7] == 1'b0) | (z80_addr[7:6] == 2'b10) | (z80_addr[7:5] == 3'b110))) & // 00-df
                   ~z80_hires_sel & // minus 80-83
                   ~z80_orch90l_sel & ~z80_orch90r_sel; // 00-df minus 75,79

reg [7:0] z80_opreg_reg;    // 84-87
assign opreg_sel      = z80_opreg_reg[1:0];
assign opreg_80_64_n  = z80_opreg_reg[2];
wire   opreg_invvide  = z80_opreg_reg[3];
wire [1:0] opreg_mbit = z80_opreg_reg[5:4];
wire   opreg_fxupmem  = z80_opreg_reg[6];
assign opreg_page     = z80_opreg_reg[7];
reg [7:0] z80_int_mask_reg; // e0-e3
reg [7:0] z80_nmi_mask_reg; // e4-e7
reg [7:0] z80_mod_reg;      // ec-ef
wire   mod_casmotoron = z80_mod_reg[1];
assign mod_modsel     = z80_mod_reg[2];
wire   mod_enaltset   = z80_mod_reg[3];
wire   mod_enextio    = z80_mod_reg[4];
wire   mod_diswait    = z80_mod_reg[5];
wire   mod_cpufast    = z80_mod_reg[6];
reg [7:0] z80_cass_reg;     // fc-ff

always @ (posedge z80_clk or negedge z80_rst_n)
begin
   if(~z80_rst_n)
   begin
      z80_opreg_reg <= 8'h00;
      z80_int_mask_reg <= 8'h00;
      z80_nmi_mask_reg <= 8'h00;
      z80_mod_reg <= 8'h00;
      z80_cass_reg <= 8'h00;
   end
   else
   begin
      if(z80_opreg_sel & ~nWR)
         z80_opreg_reg <= z80_data;

      if(z80_int_mask_sel & ~nWR)
         z80_int_mask_reg <= z80_data;

      if(z80_nmi_mask_sel & ~nWR)
         z80_nmi_mask_reg <= z80_data;

      if(z80_mod_sel & ~nWR)
         z80_mod_reg <= z80_data;

      if(z80_cass_out_sel & ~nWR)
         z80_cass_reg <= z80_data;
   end
end


reg [7:0] z80_hires_options_reg;
wire hires_options_graphics_alpha_n = z80_hires_options_reg[0];
wire hires_options_unused           = z80_hires_options_reg[1];
wire hires_options_x_dec_inc_n      = z80_hires_options_reg[2];
wire hires_options_y_dec_inc_n      = z80_hires_options_reg[3];
wire hires_options_x_read_clk_n     = z80_hires_options_reg[4];
wire hires_options_y_read_clk_n     = z80_hires_options_reg[5];
wire hires_options_x_write_clk_n    = z80_hires_options_reg[6];
wire hires_options_y_write_clk_n    = z80_hires_options_reg[7];
// The x/y post-modify must be performed after the data operation is complete.
// These registers record the data operation while in progress.
reg hires_data_rd, hires_data_wr;

always @ (posedge z80_clk or negedge z80_rst_n)
begin
   if(~z80_rst_n)
   begin
      z80_hires_options_reg <= 8'h00;
   end
   else
   begin
      if(z80_hires_sel)
      begin
         case(z80_addr[1:0])
            2'b00: if(~nWR) z80_hires_x_reg <= z80_data;
            2'b01: if(~nWR) z80_hires_y_reg <= z80_data;
            2'b10: begin
                      if(~nRD) hires_data_rd <= 1'b1;
                      if(~nWR) hires_data_wr <= 1'b1;
                   end
            2'b11: if(~nWR) z80_hires_options_reg <= z80_data;
         endcase
      end
      else
      begin
         if((hires_data_rd & ~hires_options_x_read_clk_n) | (hires_data_wr & ~hires_options_x_write_clk_n))
            z80_hires_x_reg <= z80_hires_x_reg + (hires_options_x_dec_inc_n ? -8'b1 : 8'b1);
         if((hires_data_rd & ~hires_options_y_read_clk_n) | (hires_data_wr & ~hires_options_y_write_clk_n))
            z80_hires_y_reg <= z80_hires_y_reg + (hires_options_y_dec_inc_n ? -8'b1 : 8'b1);
         hires_data_rd <= 1'b0;
         hires_data_wr <= 1'b0;
      end
   end
end


wire [7:0] z80_int_stat;
wire [7:0] z80_nmi_stat;
wire [7:0] z80_cass_in = {1'b0,  z80_mod_reg[6:1], 1'b0}; // fc-ff - model 4


// Mux the ROM, RAM, display, keyboard, and io data to the z80 read data.
// Invert the data and the final mux'ed result so that the value for an
// undriven bus is 0xff instead of 0x00.
assign z80_data = ~nRD ?
                  ~((~z80_rom_data & {8{z80_rom_sel}}) | 
                    (~z80_ram_data & {8{z80_ram_sel}}) |
                    (~z80_dsp_data & {8{z80_dsp_sel}}) |
                    (~z80_kbd_data & {8{z80_kbd_sel}}) |

                    (~z80_hires_data & {8{z80_hires_data_sel}}) |
                    (~xio_data       & {8{z80_xio_sel & mod_enextio & ~xio_sel_n}}) |
                    (~z80_int_stat   & {8{z80_int_stat_sel  }}) |
                    (~z80_nmi_stat   & {8{z80_nmi_stat_sel  }}) |
                    (~z80_fdc_stat   & {8{z80_fdc_stat_sel  }}) |
                    (~z80_fdc_track  & {8{z80_fdc_track_sel }}) |
                    (~z80_cass_in    & {8{z80_cass_in_sel   }})) :
                  8'bzzzzzzzz;


// Instantiate the character generator ROM.
// The character ROM has a latency of 2 clock cycles.
wire [7:0] char_rom_data;

blk_mem_gen_3 char_rom (
   .clk(vga_clk), // input
   .ad({z80_dsp_data_b[7] & ~opreg_invvide,
        z80_dsp_data_b[6] & ~(z80_dsp_data_b[7] & mod_enaltset),
        z80_dsp_data_b[5:0], vga_yyyyy[3:1]}), // input [11:0]
   .dout(char_rom_data), // output [7:0]
   .ce(dsp_act & col_act & (vga_yyyyy[4] == 1'b0) & (vga_xxx == 3'b010)),
   .oce(dsp_act & col_act & (vga_yyyyy[4] == 1'b0) & (vga_xxx == 3'b011)),
   .reset(1'b0)
);


// Latch the character rom address with the same latency as the rom.
// This is the block graphic.
reg [11:0] char_rom_addr, _char_rom_addr;

always @ (posedge vga_clk)
begin
   if(dsp_act & col_act & (vga_xxx == 3'b010))
      _char_rom_addr <= {z80_dsp_data_b, vga_yyyyy[4:1]};
   if(dsp_act & col_act & (vga_xxx == 3'b011))
      char_rom_addr <= _char_rom_addr;
end


// Bump the VGA counters.
always @ (posedge vga_clk)
begin
   if(vga_xxx == 3'b111)
   begin
      if(vga_XXXXXXX == 7'd99)
      begin
         vga_XXXXXXX <= 7'd0;

         if({vga_YYYYY, vga_yyyyy} == (vga_80_64_n ? {5'd26, 5'd4} : {5'd21, 5'd20}))
         begin
            vga_yyyyy <= 5'd0;
            vga_YYYYY <= 5'd0;
            vga_Z <= ~vga_Z;
            vga_80_64_n <= opreg_80_64_n;
         end
         else if(vga_yyyyy == (vga_80_64_n ? 5'd19 : 5'd23))
         begin
            vga_yyyyy <= 5'd0;
            vga_YYYYY <= vga_YYYYY + 5'd1;
         end
         else
            vga_yyyyy <= vga_yyyyy + 5'd1;
      end
      else
         vga_XXXXXXX <= vga_XXXXXXX + 7'd1;
   end
   vga_xxx <= vga_xxx + 3'b1;
end


// Load the display pixel data into the pixel shift register, or shift current contents.
reg [7:0] dsp_pixel_shift_reg;

always @ (posedge vga_clk)
begin
   // If the msb's are 10 and not inverse video then it's block graphic.
   // Otherwise it's character data from the character rom.
   if(dsp_act & col_act & (vga_xxx == 3'b100))
   begin
      if(~((char_rom_addr[11:10] == 2'b10) & ~opreg_invvide))
         dsp_pixel_shift_reg <= (char_rom_addr[3] ? 8'h00 : char_rom_data) ^ {8{char_rom_addr[11] & opreg_invvide}};
      else
      begin
         // The character is 12 rows.
         case(char_rom_addr[3:2])
            2'b00: dsp_pixel_shift_reg <= {{4{char_rom_addr[4]}}, {4{char_rom_addr[5]}}};
            2'b01: dsp_pixel_shift_reg <= {{4{char_rom_addr[6]}}, {4{char_rom_addr[7]}}};
            2'b10: dsp_pixel_shift_reg <= {{4{char_rom_addr[8]}}, {4{char_rom_addr[9]}}};
            2'b11: dsp_pixel_shift_reg <= 8'h00; // should never happen
         endcase
      end
   end
   else
   begin
      // If 32 column mode then shift only every other clock.
      // Note the vga_xxx[0] value here (0 or 1) must be the same as the lsb used above
      // so that the load cycle would also be a shift cycle.
      if(mod_modsel ? (vga_xxx[0] == 1'b0) : 1'b1)
         dsp_pixel_shift_reg <= {dsp_pixel_shift_reg[6:0], 1'b0};
   end
end


// Load the hires pixel data into the pixel shift register, or shift current contents.
reg [7:0] hires_pixel_shift_reg;
 
always @ (posedge vga_clk)
begin
   if(hires_act & (vga_xxx == 3'b100))
      hires_pixel_shift_reg <= z80_hires_data_b;
   else
      hires_pixel_shift_reg <= {hires_pixel_shift_reg[6:0], 1'b0};
end


// Synchronize the RTC divider to the z80 clock.
reg [1:0] rtc_div_dly;
reg rtc_int;

always @ (posedge z80_clk)
begin
   if(z80_rtc_sel & ~nRD)
      rtc_int <= 1'b0;
   else if(rtc_div_dly == 2'b10)
      rtc_int <= 1'b1;

   rtc_div_dly <= {rtc_div_dly[0], (mod_cpufast ? vga_YYYYY[4] : vga_Z)};
end

// Combine all interrupt sources to the z80.
// The individual interrupts are active high, but in the status register 0 means active.
assign z80_int_stat = ~{4'b0000, mod_enextio & ~xio_int_n, rtc_int, 2'b00};
assign z80_nmi_stat = ~{8'b00000000};
// The interrupts are enabled by a 1 in the mask register.
assign INT_n = ~|(~z80_int_stat & z80_int_mask_reg);
assign NMI_n = ~|(~z80_nmi_stat & z80_nmi_mask_reg);


//assign pixel_data = hires_options_graphics_alpha_n ? hires_pixel_shift_reg[7] : dsp_pixel_shift_reg[7]; // mux graphics and alpha
assign pixel_data = (hires_options_graphics_alpha_n & hires_pixel_shift_reg[7]) ^ dsp_pixel_shift_reg[7]; // xor graphics and alpha


// The RAM bank address is decoded from fxupmem, mbit1, mbit0, and a15.
// If mbit1=0 then banking is disabled, if mbit1=1 then banking is enabled. 

always @ (*)
begin
   case({opreg_fxupmem, opreg_mbit, z80_addr[15]})
      4'b0000: bnk_addr = 2'b00; // map 0
      4'b0001: bnk_addr = 2'b01; // map 0
      4'b0010: bnk_addr = 2'b00;
      4'b0011: bnk_addr = 2'b01;
      4'b1000: bnk_addr = 2'b00;
      4'b1001: bnk_addr = 2'b01;
      4'b1010: bnk_addr = 2'b00;
      4'b1011: bnk_addr = 2'b01;
      4'b0100: bnk_addr = 2'b00; // map 2
      4'b0101: bnk_addr = 2'b10; // map 2
      4'b0110: bnk_addr = 2'b00; // map 3
      4'b0111: bnk_addr = 2'b11; // map 3
      4'b1100: bnk_addr = 2'b10; // map 6
      4'b1101: bnk_addr = 2'b01; // map 6
      4'b1110: bnk_addr = 2'b11; // map 7
      4'b1111: bnk_addr = 2'b01; // map 7
   endcase
end


// Expansion interface
assign xio_ioreq_n = mod_enextio ? nIORQ                           : 1'b1;
assign xio_iord_n  = mod_enextio ? ~z80_io_rd                      : 1'b1;
assign xio_iowr_n  = mod_enextio ? ~z80_io_wr                      : 1'b1;
assign xio_addr    = mod_enextio ? z80_addr[7:0]                   : 8'b00000000;
assign xio_data    = mod_enextio ? (~nWR ? z80_data : 8'bzzzzzzzz) : 8'bzzzzzzzz;
assign xio_dir_out = mod_enextio ? (~nWR ? 1'b1     : 1'b0       ) : 1'b0;
assign xio_enab    = mod_enextio;

assign WAIT_n = ~(z80_xio_sel & mod_enextio & ~xio_wait_n);


assign cass_out = {~z80_cass_reg[1], z80_cass_reg[0]};
assign cpu_fast = mod_cpufast;


reg h_sync, v_sync;

always @ (posedge vga_clk)
begin
   if({vga_XXXXXXX, vga_xxx} == {7'd82, 3'b010})
      h_sync <= 1'b1;
   else if({vga_XXXXXXX, vga_xxx} == {7'd94, 3'b010})
      h_sync <= 1'b0;

   if({vga_YYYYY, vga_yyyyy} == (vga_80_64_n ? {5'd24, 5'd9} : {5'd20, 5'd9}))
      v_sync <= 1'b1;
   else if({vga_YYYYY, vga_yyyyy} == (vga_80_64_n ? {5'd24, 5'd11} : {5'd20, 5'd11}))
      v_sync <= 1'b0;
end


// orchestra-90 output registers
reg [7:0] orch90l_reg;
reg [7:0] orch90r_reg;

always @ (posedge z80_clk)
begin
   if(z80_orch90l_sel & ~nWR)
      orch90l_reg <= z80_data;

   if(z80_orch90r_sel & ~nWR)
      orch90r_reg <= z80_data;
end


// orchestra-90 PDM DACs
reg [8:0] orch90l_pdm;
reg [8:0] orch90r_pdm;

always @ (posedge z80_clk)
begin
   orch90l_pdm <= {1'b0, orch90l_pdm[7:0]} + {1'b0, orch90l_reg ^ 8'h80};
   orch90r_pdm <= {1'b0, orch90r_pdm[7:0]} + {1'b0, orch90r_reg ^ 8'h80};
end

assign orch90l_out = orch90l_pdm[8];
assign orch90r_out = orch90r_pdm[8];


reg [7:0] lb80_reg;

always @ (posedge z80_clk)
begin
   if(z80_mem_rd | z80_mem_wr)
      lb80_reg <= z80_addr[15:8];
end

assign lb80 = lb80_reg;

endmodule
