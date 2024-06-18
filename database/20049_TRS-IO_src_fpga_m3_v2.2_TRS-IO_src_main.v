// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module main(
  input clk_in,
  input RST_N,

  input Z80_IOREQ,
  input Z80_IN,
  input Z80_OUT,
  output ABUS_SEL_N,
  output TRS_DIR,
  output DBUS_SEL_N,
  inout [7:0] TRS_AD,

  input CS,
  input SCK,
  input MOSI,
  output MISO,
  output [2:0] ESP_S,
  output ESP_REQ,
  input ESP_DONE,

  output EXTIOSEL,
  output TRS_INT,
  output reg TRS_WAIT,
  output CASS_OUT_RIGHT,
  output CASS_OUT_LEFT,

  input [1:0] sw,
  output [5:0] led,

  // Video
  output HSYNC_O,
  output VSYNC_O,
  output VIDEO_O,
  input HSYNC_I,
  input VSYNC_I,
  input VIDEO_I,

  // HDMI
  output [2:0] tmds_p,
  output [2:0] tmds_n,
  output tmds_clock_p,
  output tmds_clock_n
);

localparam [2:0] VERSION_MAJOR = 0;
localparam [4:0] VERSION_MINOR = 3;

localparam [7:0] COOKIE = 8'hAF;

wire clk;

/*
 * Clocking Wizard
 * Clock primary: 27 MHz
 * clk_out1 frequency: 84 MHz
 */

Gowin_rPLL clk_wiz_0(
   .clkout(clk), //output clkout
   .clkin(clk_in) //input clkin
);


reg rst = 1'b0;;

always @ (posedge clk)
begin
   rst <= ~RST_N;
end


//----Address Decoder------------------------------------------------------------

wire TRS_RD = 1'b1;
wire TRS_WR = 1'b1;
wire TRS_IN = !(!Z80_IOREQ && !Z80_IN);
wire TRS_OUT = !(!Z80_IOREQ && !Z80_OUT);

reg [7:0] TRS_A = 8'h00;

wire io_access_raw = !TRS_RD || !TRS_WR || !TRS_IN || !TRS_OUT;

wire io_access_rising_edge;

filter io(
  .clk(clk),
  .in(io_access_raw),
  .out(),
  .rising_edge(io_access_rising_edge),
  .falling_edge()
);

// io_access_rising_edge =        ^
// io_trigger            = ...xxx012345678xxx...
// AD                    = ...DDDAAAAADDDDDDDDD...
// read_a                =           ^
// io_trigger            =               ^

reg [8:0] io_trigger;

always @(posedge clk)
begin
  io_trigger <= {io_trigger[7:0], io_access_rising_edge};
end

wire io_access = io_trigger[8];

assign ABUS_SEL_N = (io_trigger[4:0] == 5'b0);
wire read_a = io_trigger[4];

always @(posedge clk)
begin
  if (read_a)
    TRS_A <= TRS_AD;
end


wire [7:0] TRS_D;

assign TRS_D[0] = TRS_AD[7];
assign TRS_D[1] = TRS_AD[6];
assign TRS_D[2] = TRS_AD[5];
assign TRS_D[3] = TRS_AD[4];
assign TRS_D[4] = TRS_AD[3];
assign TRS_D[5] = TRS_AD[2];
assign TRS_D[6] = TRS_AD[1];
assign TRS_D[7] = TRS_AD[0];


//----TRS-IO---------------------------------------------------------------------

wire esp_ready = esp_status_esp_ready;
reg esp_boot_ready = 1'b0;

// Ports 0xF8-0xFB
// The M3 has a builtin printer port so the status read conflicts
// with the internal one but it is reported to work on some M3's.
// Ports 0xF4-0xF7 just below the printer is write-only so the
// printer status is also mapped there.  This would require a
// custom print driver that reads printer status from port 0xF4
// but at least port 0xF4 can be used to verify if the printer
// function is working.
// printer @ F8h-FBh (F4h-F7h)
wire printer_sel_rd = esp_ready && (TRS_A[7:2] == (8'hF8 >> 2) ||
                                    TRS_A[7:2] == (8'hF4 >> 2)) && !TRS_IN;
wire printer_sel_wr = esp_ready && (TRS_A[7:2] == (8'hF8 >> 2)) && !TRS_OUT;
wire printer_sel = printer_sel_rd || printer_sel_wr;

// trs-io @ 1Fh
wire trs_io_sel_in  = esp_ready && (TRS_A == 8'd31) && !TRS_IN;
wire trs_io_sel_out = esp_ready && (TRS_A == 8'd31) && !TRS_OUT;
wire trs_io_sel = trs_io_sel_in || trs_io_sel_out;

// frehd @ C0h-CFh
wire frehd_sel_in  = esp_ready && ((TRS_A[7:4] == 4'hC) && ((TRS_A[3:0] != 4'h4) || esp_boot_ready)) && !TRS_IN;
wire frehd_sel_out = esp_ready && ((TRS_A[7:4] == 4'hC) && ((TRS_A[3:0] != 4'h5) || esp_boot_ready)) && !TRS_OUT;

// trs-io loader @ C4h,C5h
wire loader_sel_in  = !esp_boot_ready && (TRS_A == 8'hC4) && !TRS_IN;
wire loader_sel_out =                    (TRS_A == 8'hC5) && !TRS_OUT;

// hires graphics @ 80h-83h
wire hires_sel_in  = (TRS_A[7:2] == (8'h80 >> 2)) && !TRS_IN;

// orchestra-90 @ 79h,75h
wire orch90l_sel_out = (TRS_A == 8'h75) && !TRS_OUT;
wire orch90r_sel_out = (TRS_A == 8'h79) && !TRS_OUT;


wire loader_rom_rd_en, loader_rom_rd_regce;

trigger loader_rom_rd_trigger (
  .clk(clk),
  .cond(io_access && loader_sel_in),
  .one(loader_rom_rd_en),
  .two(loader_rom_rd_regce),
  .three()
);


reg [7:0] loader_addr;
reg [7:0] loader_param;

always @(posedge clk)
begin
  if (loader_rom_rd_en)
    loader_addr <= loader_addr + 8'd1;

  if (io_access && loader_sel_out)
  begin
    loader_addr <= 8'd0;
    loader_param <= TRS_D;
    esp_boot_ready <= esp_status_esp_ready && ((esp_status_wifi_up && esp_status_smb_mounted) || esp_status_sd_mounted);
  end
end

wire [7:0] _loader_dout;

Gowin_pROM loader_rom (
  .clk(clk), //input
  .ce(loader_rom_rd_en), //input
  .ad(loader_addr), //input [7:0]
  .dout(_loader_dout), //output [7:0]
  .oce(loader_rom_rd_regce), //input
  .reset(1'b0) //input
);

wire [7:0] loader_dout = (loader_addr == 8'd3) ? loader_param : _loader_dout;


wire esp_sel_in  = trs_io_sel_in  | frehd_sel_in  | printer_sel_rd;
wire esp_sel_out = trs_io_sel_out | frehd_sel_out | printer_sel_wr;
wire esp_sel = esp_sel_in | esp_sel_out;

wire esp_sel_risingedge = io_access & esp_sel;


assign EXTIOSEL = (esp_sel_in | loader_sel_in | hires_sel_in);

reg [2:0] esp_done_raw; always @(posedge clk) esp_done_raw <= {esp_done_raw[1:0], ESP_DONE};
wire esp_done_risingedge = esp_done_raw[2:1] == 2'b01;

reg [6:0] esp_req_count = 6'd1;

always @(posedge clk) begin
  if (rst) begin
    esp_req_count <= 7'd0;
    TRS_WAIT <= 1'b0;
  end
  else begin
    if (esp_sel_risingedge) begin
      // ESP needs to do something
      esp_req_count <= -7'd50;
      // Assert WAIT
      TRS_WAIT <= 1'b1;
    end
    else if (esp_done_risingedge) begin
      // When ESP is done, de-assert WAIT
      TRS_WAIT <= 1'b0;
    end
    if (esp_req_count != 7'd0) begin
      esp_req_count <= esp_req_count + 7'd1;
    end
  end
end

assign ESP_REQ = esp_req_count[6];


localparam [2:0]
  esp_trs_io_in  = 3'd0,
  esp_trs_io_out = 3'd1,
  esp_frehd_in   = 3'd2,
  esp_frehd_out  = 3'd3,
  esp_printer_rd = 3'd4,
  esp_printer_wr = 3'd5,
  esp_xray       = 3'd6;


assign ESP_S = ~( (~esp_trs_io_in  & {3{trs_io_sel_in }}) |
                  (~esp_trs_io_out & {3{trs_io_sel_out}}) |
                  (~esp_frehd_in   & {3{frehd_sel_in  }}) |
                  (~esp_frehd_out  & {3{frehd_sel_out }}) |
                  (~esp_printer_rd & {3{printer_sel_rd}}) |
                  (~esp_printer_wr & {3{printer_sel_wr}}) );


//---main-------------------------------------------------------------------------

localparam [2:0]
  idle       = 3'b000,
  read_bytes = 3'b001,
  execute    = 3'b010;

reg [2:0] state = idle;

wire start_msg = 1'b0;

localparam [7:0]
  get_cookie          = 8'b0,
  bram_poke           = 8'd1,
  bram_peek           = 8'd2,
  dbus_read           = 8'd3,
  dbus_write          = 8'd4,
  data_ready          = 8'd5,
  set_breakpoint      = 8'd6,
  clear_breakpoint    = 8'd7,
  xray_code_poke      = 8'd8,
  xray_data_poke      = 8'd9,
  xray_data_peek      = 8'd10,
  enable_breakpoints  = 8'd11,
  disable_breakpoints = 8'd12,
  xray_resume         = 8'd13,
  set_full_addr       = 8'd14,
  get_version         = 8'd15,
  get_printer_byte    = 8'd16, // Deprecated
  set_screen_color    = 8'd17,
  abus_read           = 8'd18,
  send_keyb           = 8'd19,
  set_led             = 8'd26,
  get_config          = 8'd27,
  set_spi_ctrl_reg    = 8'd29,
  set_spi_data        = 8'd30,
  get_spi_data        = 8'd31,
  set_esp_status      = 8'd32;


reg[7:0] byte_in, byte_out;
reg byte_received = 1'b0;

reg [7:0] params[0:4];
reg [2:0] bytes_to_read;
reg [2:0] idx;
reg [7:0] cmd;
reg trs_io_data_ready = 1'b0;

assign TRS_INT = trs_io_data_ready;

reg trigger_action = 1'b0;

always @(posedge clk) begin
  trigger_action <= 1'b0;

  if (io_access && trs_io_sel) trs_io_data_ready <= 1'b0;

  if (start_msg)
    state <= idle;
  else if (byte_received) begin
    case (state)
    idle:
      begin
        trigger_action <= 1'b0;
        cmd <= byte_in;
        state <= read_bytes;
        idx <= 3'b000;
        case (byte_in)
          get_cookie: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          get_version: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          bram_poke: begin
            bytes_to_read <= 3'd3;
          end
          bram_peek: begin
            bytes_to_read <= 3'd2;
          end
          dbus_read: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          dbus_write: begin
            bytes_to_read <= 3'd1;
          end
          abus_read: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          data_ready: begin
            trs_io_data_ready <= 1'b1;
            state <= idle;
          end
          set_breakpoint: begin
            bytes_to_read <= 3'd3;
          end
          clear_breakpoint: begin
            bytes_to_read <= 3'd1;
          end
          xray_code_poke: begin
            bytes_to_read <= 3'd2;
          end
          xray_data_poke: begin
            bytes_to_read <= 3'd2;
          end
          xray_data_peek: begin
            bytes_to_read <= 3'd1;
          end
          xray_resume: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          set_full_addr: begin
            bytes_to_read <= 3'd1;
          end
          get_printer_byte: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          set_screen_color: begin
            bytes_to_read <= 3'd3;
          end
          set_esp_status: begin
            bytes_to_read <= 3'd1;
          end
          default:
            begin
              state <= idle;
            end
        endcase
      end
    read_bytes:
      begin
        params[idx] <= byte_in;
        idx <= idx + 3'b001;
        
        if (bytes_to_read == 3'd1)
          begin
            trigger_action <= 1'b1;
            state <= idle;
          end
        else
          bytes_to_read <= bytes_to_read - 3'd1;
      end
    default:
      state <= idle;
      endcase
  end
end


//---SPI---------------------------------------------------------

reg [2:0] SCKr;  always @(posedge clk) SCKr <= {SCKr[1:0], SCK};
wire SCK_rising_edge = (SCKr[2:1] == 2'b01);
wire SCK_falling_edge = (SCKr[2:1] == 2'b10);

reg [2:0] CSr;  always @(posedge clk) CSr <= {CSr[1:0], CS};
wire CS_active = ~CSr[1];
//wire CS_startmessage = (CSr[2:1]==2'b10);
//wire CS_endmessage = (CSr[2:1]==2'b01);

//assign start_msg = CS_startmessage;
//wire end_msg = CS_endmessage;

reg [1:0] MOSIr;  always @(posedge clk) MOSIr <= {MOSIr[0], MOSI};
wire MOSI_data = MOSIr[1];

reg [2:0] bitcnt = 3'b000;
reg [7:0] byte_data_sent;

always @(posedge clk) begin
  byte_received <= 1'b0;

  if(~CS_active)
    bitcnt <= 3'b000;
  else begin
    if(SCK_rising_edge) begin
      bitcnt <= bitcnt + 3'b001;
      byte_in <= {byte_in[6:0], MOSI_data};
      if(bitcnt == 3'b111)
         byte_received <= 1'b1;
    end

    if(SCK_falling_edge) begin
      if(bitcnt == 3'b001)
        byte_data_sent <= byte_out;
      else
        byte_data_sent <= {byte_data_sent[6:0], 1'b0};
    end
  end
end

assign MISO = CS_active ? byte_data_sent[7] : 1'bz;


//---ESP Status----------------------------------------------------------------------------

reg[7:0] esp_status = 0;

wire esp_status_esp_ready   = esp_status[0];
wire esp_status_wifi_up     = esp_status[1];
wire esp_status_smb_mounted = esp_status[2];
wire esp_status_sd_mounted  = esp_status[3];

always @(posedge clk) begin
  if (trigger_action && cmd == set_esp_status)
    esp_status <= params[0];
end


reg [7:0] trs_data;

always @(posedge clk) begin
  if (trigger_action && cmd == dbus_write)
    trs_data <= params[0];
end


//---BUS INTERFACE----------------------------------------------------------------

assign TRS_DIR = TRS_RD && TRS_IN;

assign DBUS_SEL_N = !(ABUS_SEL_N &&
                      (!TRS_WR || !TRS_OUT ||
                       hires_sel_in        ||
                       loader_sel_in       ||
                       esp_sel_in          ));


wire [7:0] hires_dout;

wire [7:0] trs_d = ((!TRS_RD || !TRS_IN) && !DBUS_SEL_N)
                 ? ( ({8{esp_sel_in   }} & trs_data   ) |
                     ({8{loader_sel_in}} & loader_dout) |
                     ({8{hires_sel_in }} & hires_dout ) )
                : 8'bz;


assign TRS_AD[0] = trs_d[7];
assign TRS_AD[1] = trs_d[6];
assign TRS_AD[2] = trs_d[5];
assign TRS_AD[3] = trs_d[4];
assign TRS_AD[4] = trs_d[3];
assign TRS_AD[5] = trs_d[2];
assign TRS_AD[6] = trs_d[1];
assign TRS_AD[7] = trs_d[0];


always @(posedge clk)
begin
  if (trigger_action)
    case (cmd)
      dbus_read:   byte_out <= TRS_D;
      abus_read:   byte_out <= TRS_A;
      get_cookie:  byte_out <= COOKIE;
      get_version: byte_out <= {VERSION_MAJOR, VERSION_MINOR};
    endcase
end


//-----HDMI------------------------------------------------------------------------

logic [23:0] rgb_screen_color = 24'hFFFFFF;

always @(posedge clk) begin
  if (trigger_action && cmd == set_screen_color)
    rgb_screen_color <= {params[0], params[1], params[2]};
end


logic [8:0] audio_cnt;
logic clk_audio;

always @(posedge clk_in) audio_cnt <= (audio_cnt == 9'd280) ? 9'd0 : audio_cnt + 9'd1;
always @(posedge clk_in) if (audio_cnt == 9'd0) clk_audio <= ~clk_audio;

logic [15:0] audio_sample_word [1:0] = '{16'd0, 16'd0};


//-----HDMI------------------------------------------------------------------------

wire clk_pixel;
wire clk_pixel_x5;

// 125.875 MHz (126 MHz actual)
Gowin_rPLL0 pll3(
  .clkout(clk_pixel_x5), //output clkout
  .clkin(clk_in) //input clkin
);

// 25.175 MHz (25.2 MHz actual)
Gowin_CLKDIV0 clk3div0(
  .clkout(clk_pixel), //output clkout
  .hclkin(clk_pixel_x5), //input hclkin
  .resetn(1'b1) //input resetn
);

reg [23:0] rgb = 24'h0;
wire dsp_vid, dsp_present;
wire vga_vid;
wire hires_enable;

always @(posedge clk_pixel)
begin
  rgb <= ((!dsp_present || hires_enable) ? vga_vid : dsp_vid) ? rgb_screen_color : 24'h0;
end

logic [9:0] cx, frame_width, screen_width;
logic [9:0] cy, frame_height, screen_height;
wire [2:0] tmds_x;
wire tmds_clock_x;

// 640x480 @ 60Hz
hdmi #(.VIDEO_ID_CODE(1), .VIDEO_REFRESH_RATE(60), .AUDIO_RATE(48000), .AUDIO_BIT_WIDTH(16)) hdmi(
  .clk_pixel_x5(clk_pixel_x5),
  .clk_pixel(clk_pixel),
  .clk_audio(clk_audio),
  .reset(1'b0),
  .rgb(rgb),
  .audio_sample_word(audio_sample_word),
  .tmds(tmds_x),
  .tmds_clock(tmds_clock_x),
  .cx(cx),
  .cy(cy),
  .frame_width(frame_width),
  .frame_height(frame_height),
  .screen_width(screen_width),
  .screen_height(screen_height)
);

ELVDS_OBUF tmds [2:0] (
  .O(tmds_p),
  .OB(tmds_n),
  .I(tmds_x)
);

ELVDS_OBUF tmds_clock(
  .O(tmds_clock_p),
  .OB(tmds_clock_n),
  .I(tmds_clock_x)
);


//-----VGA-------------------------------------------------------------------------------

wire clk_vga = clk_pixel;
wire crt_vid, crt_hsync, crt_vsync;
wire hertz50;

reg sync;

vga vga(
  .clk(clk),
  .srst(rst),
  .vga_clk(clk_vga), // 25.2 MHz
  .TRS_A(TRS_A), // input [7:0]
  .TRS_D(TRS_D), // input [7:0]
  .TRS_OUT(TRS_OUT), // input
  .TRS_IN(TRS_IN), // input
  .io_access(io_access), // input
  .hires_dout(hires_dout), // output [7:0]
  .hires_dout_rdy(), // output
  .hires_enable(hires_enable), // output
  .VGA_VID(vga_vid), // output
  .VGA_HSYNC(vga_hsync), // output
  .VGA_VSYNC(vga_vsync), // output
  .CRT_VID(crt_vid), // output
  .CRT_HSYNC(crt_hsync), // output
  .CRT_VSYNC(crt_vsync), // output
  .HZ50(hertz50), // input
  .genlock(sync) // input
);

always @(posedge clk_pixel)
begin
  sync <= (cx == frame_width - 10) && (cy == frame_height - 1);
end


assign HSYNC_O = hires_enable ?  crt_hsync : HSYNC_I;
assign VSYNC_O = hires_enable ? ~crt_vsync : VSYNC_I;
assign VIDEO_O = hires_enable ?  crt_vid   : VIDEO_I;


//---------------------------------------------------------------------------------

// Detect if video input is present and if it's 60 or 60 Hz.

videodetector videodetector(
  .vgaclk(clk_pixel), // 25.2MHz clock
  .hsync_in(HSYNC_I), // input
  .vsync_in(VSYNC_I), // input

  .present(dsp_present), // output
  .hertz50(hertz50) // output 
);


//-----Framegrabber----------------------------------------------------------------

wire lock;

framegrabber framegrabber(
  .vgaclk_x5(clk_pixel_x5), // 126MHz clock
  .vgaclk(clk_pixel), // 25.2MHz clock
  .hsync_in(HSYNC_I), // input
  .vsync_in(VSYNC_I), // input
  .pixel_in(VIDEO_I), // input
  .HZ50(hertz50), // input

  .cx(cx), // input [9:0]
  .cy(cy), // input [9:0]

  .vga_rgb(dsp_vid), // output

  .dpll_lock(lock), // output
  .dpll_hcheck(), // output
  .dpll_vcheck() // output
);


//-----ORCH90----------------------------------------------------------------------

// orchestra-90 output registers
reg [7:0] orch90l_reg;
reg [7:0] orch90r_reg;

always @ (posedge clk)
begin
   if(io_access && orch90l_sel_out)
      orch90l_reg <= TRS_D;

   if(io_access && orch90r_sel_out)
      orch90r_reg <= TRS_D;
end


//-----Cassette out----------------------------------------------------------------

wire cass_sel_out = (TRS_A == 8'hFF) && !TRS_OUT;

// raw 2-bit cassette output
reg[1:0] cass_reg = 2'b00;

always @(posedge clk)
begin
   if (io_access && cass_sel_out)
      cass_reg <= TRS_D[1:0];
end

// bit1 is inverted and added to bit0 for the analog output
wire [1:0] cass_outx = {~cass_reg[1], cass_reg[0]};
// the sum is 0, 1, or 2
wire [1:0] cass_outy = {1'b0, cass_outx[1]} + {1'b0, cass_outx[0]};

reg [8:0] cass_outl_reg;
reg [8:0] cass_outr_reg;

always @ (posedge clk)
begin
   cass_outl_reg <= {orch90l_reg[7], orch90l_reg} + {cass_outy - 2'b01, 7'b0000000};
   cass_outr_reg <= {orch90r_reg[7], orch90r_reg} + {cass_outy - 2'b01, 7'b0000000};
end

reg [9:0] cass_pdml_reg;
reg [9:0] cass_pdmr_reg;

always @ (posedge clk)
begin
   cass_pdml_reg <= {1'b0, cass_pdml_reg[8:0]} + {1'b0, ~cass_outl_reg[8], cass_outl_reg[7:0]};
   cass_pdmr_reg <= {1'b0, cass_pdmr_reg[8:0]} + {1'b0, ~cass_outr_reg[8], cass_outr_reg[7:0]};
end

always @(posedge clk_audio)
begin
   audio_sample_word <= '{{cass_outr_reg, 7'b0000000},
                          {cass_outl_reg, 7'b0000000}};
end


assign CASS_OUT_LEFT  = cass_pdml_reg[9];
assign CASS_OUT_RIGHT = cass_pdmr_reg[9];


//-----LED------------------------------------------------------------------------------------

assign led[0] = ~TRS_WAIT;
assign led[1] = ~EXTIOSEL;
assign led[5:2] = ~esp_status[3:0];

endmodule
