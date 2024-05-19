// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module main(
  input clk_in,

  input TRS_RD,
  input TRS_WR,
  input TRS_IN,
  input TRS_OUT,
  input TRS_RAS,
  output [1:0] MUX_A,
  input [7:0] TRS_AHL,
  output TRS_DIR,
  output TRS_OE,
  inout [7:0] TRS_D,

  input CS,
  input SCK,
  input MOSI,
  output MISO,
  output [2:0] ESP_S,
  output ESP_REQ,
  input ESP_DONE,

  output reg TRS_INT,
  output reg TRS_WAIT,

  input [1:0] sw,
  output [5:0] led,

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
   rst <= ~sw[0];
end


//----Address Decoder------------------------------------------------------------

reg [7:0] TRS_AH = 8'h00;

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
// io_trigger            = ...xxxx0123456789Axxx...
// AHL                   = ...LLLHHHHHLLLLLLLLLL...
// read_ah               =           ^
// io_trigger            =                  ^

reg [10:0] io_trigger;

always @(posedge clk)
begin
  io_trigger <= {io_trigger[9:0], io_access_rising_edge};
end

wire io_access = io_trigger[10];


wire ras_access_rising_edge;

filter ras(
  .clk(clk),
  .in(!TRS_RAS),
  .out(),
  .rising_edge(ras_access_rising_edge),
  .falling_edge()
);

reg[10:0] ras_trigger;

always @(posedge clk)
begin
  ras_trigger <= {ras_trigger[9:0], ras_access_rising_edge};
end

wire ras_access = ras_trigger[10];

assign MUX_A = ({ras_trigger[3:0], ras_access_rising_edge} == 5'b0) ? 2'b10 : 2'b01;
wire read_ah = ras_trigger[3];

always @(posedge clk)
begin
  if (read_ah)
    TRS_AH <= TRS_AHL;
end


wire [15:0] TRS_A;

assign TRS_A[7:0] = TRS_AHL;
assign TRS_A[8] = TRS_AH[1];
assign TRS_A[9] = TRS_AH[0];
assign TRS_A[10] = TRS_AH[2];
assign TRS_A[11] = TRS_AH[3];
assign TRS_A[12] = TRS_AH[6];
assign TRS_A[13] = TRS_AH[7];
assign TRS_A[14] = TRS_AH[4];
assign TRS_A[15] = TRS_AH[5];


//----TRS-IO---------------------------------------------------------------------

reg full_addr = 1'b0;
wire esp_ready = esp_status_esp_ready;

// m1 extension rom (1.96875k @ 3000h-37DFh)
wire trs_extrom_sel = ((TRS_A[15:11] == 5'b00110) &&        // 2k @ 3000h-37FFh
                       ~(TRS_A[15:5] == 11'b00110111111));  // - 32 @ 37E0h-37FFh
wire trs_extrom_sel_rd = trs_extrom_sel & ~TRS_RD;
wire trs_extrom_sel_wr = trs_extrom_sel & ~TRS_WR;

// ram (32k @ 8000h-FFFFh)
wire trs_ram_sel = (TRS_A[15] == 1'b1);  // upper 32k
wire trs_ram_sel_rd = trs_ram_sel && !TRS_RD;
wire trs_ram_sel_wr = trs_ram_sel && !TRS_WR;

// fdc irq status @ 37E0h-37E3h
wire fdc_37e0_sel_rd = (TRS_A[15:2] == (16'h37E0 >> 2)) && !TRS_RD; // 37E0h-37E3h
// fdc @ 37ECh-37EFh
wire fdc_37ec_sel_rd = (TRS_A[15:2] == (16'h37EC >> 2)) && !TRS_RD; // 37ECh-37EFh
wire fdc_37ec_sel_wr = (TRS_A[15:2] == (16'h37EC >> 2)) && !TRS_WR; // 37ECh-37EFh

// printer @ 37E8h-37EBh
wire printer_mem = esp_ready && (TRS_A[15:2] == (16'h37E8 >> 2));
wire printer_sel_rd = printer_mem & ~TRS_RD;
wire printer_sel_wr = printer_mem & ~TRS_WR;
wire printer_mem_trigger = printer_mem && ras_access;
wire printer_sel = printer_sel_rd | printer_sel_wr;

// trs-io @ 1Fh
wire trs_io_sel_in  = esp_ready && (TRS_A[7:0] == 8'd31) && !TRS_IN;
wire trs_io_sel_out = esp_ready && (TRS_A[7:0] == 8'd31) && !TRS_OUT;
wire trs_io_sel = trs_io_sel_in || trs_io_sel_out;

// frehd @ C0h-CFh
wire frehd_sel_in  = esp_ready && (TRS_A[7:4] == 4'hC) && !TRS_IN;
wire frehd_sel_out = esp_ready && (TRS_A[7:4] == 4'hC) && !TRS_OUT;

// le18 graphics @ ECh-EFh
wire le18_data_sel_in = (TRS_A[7:0] == 8'hEC) & ~TRS_IN;

// orchestra-85 @ B9h,B5h
wire orch85l_sel_out = (TRS_A[7:0] == 8'hB5) && !TRS_OUT;
wire orch85r_sel_out = (TRS_A[7:0] == 8'hB9) && !TRS_OUT;


wire esp_sel_in  = trs_io_sel_in  | frehd_sel_in  | printer_sel_rd;
wire esp_sel_out = trs_io_sel_out | frehd_sel_out | printer_sel_wr;
wire esp_sel = esp_sel_in | esp_sel_out;

wire esp_sel_risingedge = io_access & esp_sel;


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
    end
    if (esp_sel_risingedge || printer_mem_trigger) begin
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


reg [7:0] byte_in, byte_out;
reg byte_received = 1'b0;

reg [7:0] params[0:4];
reg [2:0] bytes_to_read;
reg [2:0] idx;
reg [7:0] cmd;
reg trs_io_data_ready = 1'b0;


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


//---Full Address--------------------------------------------------------------------------

always @(posedge clk) begin
  if (trigger_action && cmd == set_full_addr) begin
    full_addr <= (params[0] != 0);
  end
end


//--------IRQ--------------------------------------------------------------------------

reg [7:0] irq_data;
reg [21:0] counter_25ms = 22'd0;

always @(posedge clk)
begin
   // 0.025*84000000 = 2100000
   if (counter_25ms == (22'd2100000 -22'd1))
   begin
      counter_25ms <= 22'd0;
      TRS_INT <= 1;
   end
   else
   begin
      counter_25ms <= counter_25ms + 22'd1;
   end

   if (io_access & fdc_37e0_sel_rd)
   begin
      irq_data <= {TRS_INT, 1'b0, ~trs_io_data_ready, 5'b00000};
      TRS_INT <= 0;
   end
end


//--------FDC--------------------------------------------------------------------------

/*
  ; Assembly of the autoboot. This will be returned when the M1 ROM reads in the
  ; boot sector from the FDC.
    org 4200h
    ld a,1
    out (197),a
    in a,(196)
    cp 254
    jp nz,0075h
    ld bc,196
    ld hl,20480
    inir
    jp 20480
*/
localparam [7:0] frehd_loader [0:22-1] =
  {8'h3E, 8'h01, 8'hD3, 8'hC5, 8'hDB, 8'hC4, 8'hFE, 8'hFE, 8'hC2, 8'h75, 8'h00, 8'h01,
   8'hC4, 8'h00, 8'h21, 8'h00, 8'h50, 8'hED, 8'hB2, 8'hC3, 8'h00, 8'h50};

reg [7:0] fdc_sector_idx = 8'd0;
reg [7:0] fdc_data;

always @ (posedge clk)
begin
   if(io_access & fdc_37ec_sel_rd)
      case(TRS_A[1:0])
      2'b00: // fdc status
         fdc_data <= 8'h02;
      2'b11: // fdc data
         begin
            fdc_data <= (fdc_sector_idx < 8'd22) ? frehd_loader[fdc_sector_idx] : 8'h00;
            fdc_sector_idx <= fdc_sector_idx + 8'd1;
         end
      endcase

   if(io_access & fdc_37ec_sel_wr)
      case(TRS_A[1:0])
      2'b00: // fdc command
         fdc_sector_idx <= 8'h00;
      endcase
end


reg [7:0] trs_data;

always @(posedge clk) begin
  if (trigger_action && cmd == dbus_write)
    trs_data <= params[0];
end


//--------BRAM-------------------------------------------------------------------------

wire ram_rd_en, ram_rd_regce;

trigger rama_read_trigger(
  .clk(clk),
  .cond(io_access & trs_ram_sel_rd),
  .one(ram_rd_en),
  .two(ram_rd_regce),
  .three()
);

wire ram_wr_en;

trigger rama_write_trigger(
  .clk(clk),
  .cond(io_access & trs_ram_sel_wr),
  .one(),
  .two(ram_wr_en),
  .three()
);

wire [7:0] ram_dout;

wire enb;
wire regceb;
wire web;
wire [14:0] addrb;
wire [7:0] dinb;
wire [7:0] doutb;


Gowin_DPB0 bram(
  .clka(clk), //input
  .cea(ram_rd_en || ram_wr_en), //input
  .ada(TRS_A[14:0]), //input [14:0]
  .wrea(~TRS_WR), //input
  .dina(TRS_D), //input [7:0]
  .douta(ram_dout), //output [7:0]
  .ocea(ram_rd_regce), //input
  .reseta(1'b0), //input

  .clkb(clk), //input
  .ceb(enb), //input
  .adb(addrb), //input [14:0]
  .wreb(web), //input
  .dinb(dinb), //input [7:0]
  .doutb(doutb), //output [7:0]
  .oceb(regceb), //input
  .resetb(1'b0) //input
);


//---EXTENSION ROM----------------------------------------------------------------

wire extrom_rd_en, extrom_rd_regce;

trigger extrom_rd_trigger (
  .clk(clk),
  .cond(io_access & trs_extrom_sel_rd),
  .one(extrom_rd_en),
  .two(extrom_rd_regce),
  .three()
);

wire extrom_wr_en;

trigger extrom_write_trigger(
  .clk(clk),
  .cond(io_access & trs_extrom_sel_wr),
  .one(),
  .two(extrom_wr_en),
  .three()
);

wire [7:0] extrom_dout;

Gowin_DPB2 extrom (
   .clka(clk), // input
   .cea(extrom_rd_en | extrom_wr_en), // input
   .ada(TRS_A[10:0]), // input [10:0]
   .wrea(~TRS_WR), // input
   .dina(TRS_D), // input [7:0]
   .douta(extrom_dout), // output [7:0]
   .ocea(extrom_rd_regce),
   .reseta(1'b0),
 
   .clkb(clk), // input
   .ceb(1'b0), // input
   .adb(11'h000), // input [10:0]
   .wreb(1'b0), // input
   .dinb(8'h00), // input [7:0]
   .doutb(), // output [7:0]
   .oceb(1'b0), // input
   .resetb(1'b0)
);


//---BUS INTERFACE----------------------------------------------------------------

assign TRS_DIR = TRS_RD && TRS_IN;

assign TRS_OE = !(!TRS_WR || !TRS_OUT ||
                  trs_extrom_sel_rd   ||
                  trs_ram_sel_rd      ||
                  esp_sel_in          ||
                  fdc_37e0_sel_rd     ||
                  fdc_37ec_sel_rd     ||
                  le18_data_sel_in    );


wire [7:0] le18_dout;

assign TRS_D = (!TRS_RD || !TRS_IN)
             ? ( ({8{trs_extrom_sel_rd}} & extrom_dout) |
                 ({8{trs_ram_sel_rd   }} & ram_dout   ) |
                 ({8{esp_sel_in       }} & trs_data   ) |
                 ({8{fdc_37e0_sel_rd  }} & irq_data   ) |
                 ({8{fdc_37ec_sel_rd  }} & fdc_data   ) |
                 ({8{le18_data_sel_in }} & le18_dout  ) )
             : 8'bz;


//--------BRAM-------------------------------------------------------------------------

assign addrb = {params[1][6:0], params[0]};
assign dinb = params[2];

wire enb_peek, enb_poke;
assign enb = enb_peek || enb_poke;
assign web = (cmd == bram_poke);
wire bram_peek_done;

trigger bram_poke_trigger(
  .clk(clk),
  .cond(trigger_action && (cmd == bram_poke)),
  .one(enb_poke),
  .two(),
  .three());

trigger bram_peek_trigger(
  .clk(clk),
  .cond(trigger_action && (cmd == bram_peek)),
  .one(enb_peek),
  .two(regceb),
  .three(bram_peek_done));


always @(posedge clk)
begin
  if (bram_peek_done)
    byte_out <= doutb;
  else if (trigger_action)
    case (cmd)
      dbus_read:   byte_out <= TRS_D;
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

// 200 MHz (200.571 MHz actual)
Gowin_rPLL0 pll0(
  .clkout(clk_pixel_x5), //output clkout
  .clkin(clk_in) //input clkin
);

// 40 MHz (40.114 MHz actual)
Gowin_CLKDIV0 clkdiv0(
  .clkout(clk_pixel), //output clkout
  .hclkin(clk_pixel_x5), //input hclkin
  .resetn(1'b1) //input resetn
);

reg [23:0] rgb = 24'h0;
wire vga_vid;

always @(posedge clk_pixel)
begin
  rgb <= vga_vid ? rgb_screen_color : 24'h0;
end

logic [10:0] cx, frame_width, screen_width;
logic [9:0] cy, frame_height, screen_height;
wire [2:0] tmds_x;
wire tmds_clock_x;

// 800x600 @ 60Hz
hdmi #(.VIDEO_ID_CODE(5), .VIDEO_REFRESH_RATE(60), .AUDIO_RATE(48000), .AUDIO_BIT_WIDTH(16)) hdmi(
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

reg sync;

vga vga(
  .clk(clk),
  .srst(rst),
  .vga_clk(clk_pixel), // 40 MHz
  .vga_clk_en(cx[0]),
  .TRS_A(TRS_A),
  .TRS_D(TRS_D),
  .TRS_WR(TRS_WR),
  .TRS_OUT(TRS_OUT),
  .TRS_IN(TRS_IN),
  .io_access(io_access),
  .le18_dout(le18_dout),
  .le18_dout_rdy(),
  .le18_enable(),
  .VGA_VID(vga_vid),
  .VGA_HSYNC(),
  .VGA_VSYNC(),
  .genlock(sync)
);

always @(posedge clk_pixel)
begin
  sync <= (cx == frame_width - 10) && (cy == frame_height - 1);
end


//-----ORCH85----------------------------------------------------------------------

// orchestra-85 output registers
reg [7:0] orch85l_reg;
reg [7:0] orch85r_reg;

always @ (posedge clk)
begin
   if(io_access && orch85l_sel_out)
      orch85l_reg <= TRS_D;

   if(io_access && orch85r_sel_out)
      orch85r_reg <= TRS_D;
end


//-----Cassette out----------------------------------------------------------------

wire cass_sel_out = (TRS_A[7:0] == 8'hFF) && !TRS_OUT;

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
   cass_outl_reg <= {orch85l_reg[7], orch85l_reg} + {cass_outy - 2'b01, 7'b0000000};
   cass_outr_reg <= {orch85r_reg[7], orch85r_reg} + {cass_outy - 2'b01, 7'b0000000};
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


//assign CASS_OUT_LEFT  = cass_pdml_reg[9];
//assign CASS_OUT_RIGHT = cass_pdmr_reg[9];


//-----LED------------------------------------------------------------------------------------

assign led[0] = ~TRS_WAIT;
assign led[1] = ~ESP_REQ;
assign led[5:2] = ~esp_status[3:0];

endmodule
