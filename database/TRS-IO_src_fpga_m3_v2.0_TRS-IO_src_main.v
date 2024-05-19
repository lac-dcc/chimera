// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module main(
  input clk_in,
  input SCK,
  input MOSI,
  output MISO,
  input CS,
  output ABUS_SEL_N,
  output DBUS_SEL_N,
  output TRS_DIR,
  inout [7:0] TRS_AD,
  input Z80_IN,
  input Z80_OUT,
  input Z80_IOREQ,
  output EXTIOSEL,
  output reg TRS_INT,
  output reg ESP_REQ,
  output [2:0] ESP_S,
  output reg WAIT,
  input ESP_DONE,
  input [1:0] sw,
  output reg [5:0] led
);

localparam [2:0] VERSION_MAJOR = 0;
localparam [4:0] VERSION_MINOR = 3;

localparam [7:0] COOKIE = 8'haf;

wire clk;
wire vga_clk;

/*
 * Clocking Wizard
 * Clock primary: 12 MHz
 * clk_out1 frequency: 100 MHz
 * clk_out2: 20 MHz
 */
/*
clk_wiz_0 clk_wiz_0(
   .clk_out1(clk),
   .clk_out2(vga_clk),
   .reset(1'b0),
   .locked(),
   .clk_in1(clk_in)
);
*/

Gowin_rPLL clk_wiz_0(
   .clkout(clk), //output clkout
   .clkin(clk_in) //input clkin
);

reg[7:0] byte_in, byte_out;
reg byte_received = 1'b0;

//----Address Decoder------------------------------------------------------------

wire TRS_RD = 1;
wire TRS_WR = 1;
wire TRS_IN = !(!Z80_IOREQ && !Z80_IN);
wire TRS_OUT = !(!Z80_IOREQ && !Z80_OUT);


reg[8:0] TRS_A = 9'h100;

wire io_access_raw = !TRS_RD || !TRS_WR || !TRS_IN || !TRS_OUT;

wire io_access_filtered;

wire io_access_rising_edge;


filter io(
  .clk(clk),
  .in(io_access_raw),
  .out(io_access_filtered),
  .rising_edge(io_access_rising_edge),
  .falling_edge()
);

reg[16:0] io_trigger;

always @(posedge clk) begin
  io_trigger <= {io_trigger[15:0], io_access_rising_edge};
end

wire read_a = io_trigger[6];
wire io_access = io_trigger[16];


assign ABUS_SEL_N = io_trigger[6:0] == 0;


always @(posedge clk) begin
  if (read_a == 1) begin
    TRS_A[7:0] <= TRS_AD;
    TRS_A[8] <= 0; // TRS_A holds a valid address
  end
  else TRS_A[8] <= io_access_filtered ? TRS_A[8] : 1; // TRS_A does not hold a valid address when io_sccess_filtered becomes 1
end



//----TRS-IO---------------------------------------------------------------------

localparam[7:0]
  PRINTER_STATUS_READY = 8'h30,
  PRINTER_STATUS_BUSY = 8'hf0;

reg[7:0] printer_status = PRINTER_STATUS_READY;

// One byte buffer for printer output
reg[7:0] printer_byte;



wire printer_sel_rd = 0;//XXX (TRS_A == 17'h37e8) && !TRS_RD;
wire printer_sel_wr = 0;//XXX (TRS_A == 17'h37e8) && !TRS_WR;
wire printer_sel = printer_sel_wr;
reg printer_sel_reg = 0;

wire trs_io_sel_in = (TRS_A[8:0] == 31) && !TRS_IN;
wire trs_io_sel_out = (TRS_A[8:0] == 31) && !TRS_OUT;
wire trs_io_sel = trs_io_sel_in || trs_io_sel_out;

wire frehd_sel_in = (TRS_A[8:4] == 5'hc) && !TRS_IN;
wire frehd_sel_out = (TRS_A[8:4] == 5'hc) && !TRS_OUT;
wire frehd_sel = frehd_sel_in || frehd_sel_out;


wire esp_sel = trs_io_sel || frehd_sel || printer_sel;

wire esp_sel_risingedge = esp_sel && io_access;


assign EXTIOSEL = esp_sel;

reg [2:0] esp_done_raw; always @(posedge clk) esp_done_raw <= {esp_done_raw[1:0], ESP_DONE};
wire esp_done_risingedge = esp_done_raw[2:1] == 2'b01;

reg [5:0] count;

always @(posedge clk) begin
  if (esp_sel_risingedge) begin
    // ESP needs to do something
    ESP_REQ <= 1;
    count <= 50;
    if (printer_sel) begin
      // The next byte for the printer is ready
      printer_sel_reg <= 1;
      printer_byte <= TRS_AD;
      printer_status <= PRINTER_STATUS_BUSY;
    end
    else begin
      // This is not a write to 0x37e8 (the printer). Need to assert WAIT
      WAIT <= 1;
    end
  end
  else if (esp_done_risingedge)
    begin
      // When ESP is done, de-assert WAIT
      WAIT <= 0;
      printer_sel_reg <= 0;
      printer_status <= PRINTER_STATUS_READY;
    end
  if (count == 1) ESP_REQ <= 0;
  if (count != 0) count <= count - 1;
end

      
localparam [2:0]
  esp_trs_io_in = 3'd0,
  esp_trs_io_out = 3'd1,
  esp_frehd_in = 3'd2,
  esp_frehd_out = 3'd3,
  esp_printer_wr = 3'd4,
  esp_xray = 3'd5;


assign ESP_S = (esp_trs_io_in & {3{trs_io_sel_in}}) |
               (esp_trs_io_out & {3{trs_io_sel_out}}) |
               (esp_frehd_in & {3{frehd_sel_in}}) |
               (esp_frehd_out & {3{frehd_sel_out}}) |
               (esp_printer_wr & {3{printer_sel_reg}});



//---main-------------------------------------------------------------------------


localparam [2:0]
  idle       = 3'b000,
  read_bytes = 3'b001,
  execute    = 3'b010;

reg [2:0] state = idle;

wire start_msg;

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
  get_printer_byte    = 8'd16,
  set_screen_color    = 8'd17,
  abus_read           = 8'd18;
  



reg [7:0] params[0:4];
reg [2:0] bytes_to_read;
reg [7:0] bits_to_send;
reg [2:0] idx;
reg [7:0] cmd;
reg trs_io_data_ready = 1'b0;

assign TRS_INT = trs_io_data_ready;

reg trigger_action = 1'b0;

always @(posedge clk) begin
  trigger_action <= 1'b0;
  bits_to_send <= 0;

  if (esp_sel_risingedge && (TRS_A[8:0] == 31)) trs_io_data_ready <= 1'b0;

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
            bits_to_send <= 9;
            state <= idle;
          end
          get_version: begin
            trigger_action <= 1'b1;
            bits_to_send <= 9;
            state <= idle;
          end
          bram_poke: begin
            bytes_to_read <= 3'b011;
          end
          bram_peek: begin
            bytes_to_read <= 3'b010;
            bits_to_send <= 9;
          end
          dbus_read: begin
            trigger_action <= 1'b1;
            bits_to_send <= 9;
            state <= idle;
          end
          dbus_write: begin
            bytes_to_read <= 3'b001;
          end
          abus_read: begin
            trigger_action <= 1'b1;
            bits_to_send <= 9;
            state <= idle;
          end
          data_ready: begin
            trs_io_data_ready <= 1'b1;
            state <= idle;
          end
          set_breakpoint: begin
            bytes_to_read <= 3;
          end
          clear_breakpoint: begin
            bytes_to_read <= 1;
          end
          xray_code_poke: begin
            bytes_to_read <= 2;
          end
          xray_data_poke: begin
            bytes_to_read <= 2;
          end
          xray_data_peek: begin
            bytes_to_read <= 1;
            bits_to_send <= 9;
          end
          xray_resume: begin
            trigger_action <= 1'b1;
            state <= idle;
          end
          set_full_addr: begin
            bytes_to_read <= 1;
          end
          get_printer_byte: begin
            trigger_action <= 1'b1;
            bits_to_send <= 9;
            state <= idle;
          end
          set_screen_color: begin
            bytes_to_read <= 3;
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
        
        if (bytes_to_read == 3'b001)
          begin
            trigger_action <= 1'b1;
            state <= idle;
          end
        else
          bytes_to_read <= bytes_to_read - 3'b001;
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
wire CS_startmessage = (CSr[2:1]==2'b10);
wire CS_endmessage = (CSr[2:1]==2'b01);

assign start_msg = CS_startmessage;
wire end_msg = CS_endmessage;

reg [1:0] MOSIr;  always @(posedge clk) MOSIr <= {MOSIr[0], MOSI};
wire MOSI_data = MOSIr[1];

reg [7:0] remaining_bits_to_send;


reg [2:0] bitcnt = 3'b000;


always @(posedge clk) begin
  if(~CS_active)
    bitcnt <= 3'b000;
  else
    if(SCK_rising_edge) begin
      bitcnt <= bitcnt + 3'b001;
      byte_in <= {byte_in[6:0], MOSI_data};
    end
end

wire need_to_read_data = ((state == idle) && (remaining_bits_to_send == 0)) || (state == read_bytes);

always @(posedge clk) byte_received <= CS_active && SCK_rising_edge && need_to_read_data && (bitcnt == 3'b111);

reg [7:0] byte_data_sent;

always @(posedge clk) begin
  if (bits_to_send != 0) remaining_bits_to_send = bits_to_send;
  if(CS_active) begin
    if(SCK_falling_edge && state == idle) begin
      if(remaining_bits_to_send == 8)
        byte_data_sent <= byte_out;
      else
        byte_data_sent <= {byte_data_sent[6:0], 1'b0};
      if (remaining_bits_to_send != 0) remaining_bits_to_send <= remaining_bits_to_send - 1;
    end
  end
end

assign MISO = CS_active ? byte_data_sent[7] : 1'bz;



//--------BRAM-------------------------------------------------------------------------

assign DBUS_SEL_N = !((esp_sel || printer_sel_rd || printer_sel_wr) && ABUS_SEL_N);

assign TRS_DIR = TRS_RD && TRS_IN;



reg[7:0] trs_data;

wire trs_ad_in = (!TRS_RD || !TRS_IN) && !DBUS_SEL_N;

assign TRS_AD[0] = trs_ad_in ? trs_data[7] : 1'bz;
assign TRS_AD[1] = trs_ad_in ? trs_data[6] : 1'bz;
assign TRS_AD[2] = trs_ad_in ? trs_data[5] : 1'bz;
assign TRS_AD[3] = trs_ad_in ? trs_data[4] : 1'bz;
assign TRS_AD[4] = trs_ad_in ? trs_data[3] : 1'bz;
assign TRS_AD[5] = trs_ad_in ? trs_data[2] : 1'bz;
assign TRS_AD[6] = trs_ad_in ? trs_data[1] : 1'bz;
assign TRS_AD[7] = trs_ad_in ? trs_data[0] : 1'bz;


wire [7:0] spi_data_in;


always @(posedge clk) begin
  if (trigger_action && cmd == dbus_write)
    trs_data <= params[0];
  else if (io_access && printer_sel_rd)
    trs_data <= printer_status;
end



//---BRAM-------------------------------------------------------------------------

always @(posedge clk) begin
  if (trigger_action && cmd == dbus_read) begin
    byte_out[0] <= TRS_AD[7];
    byte_out[1] <= TRS_AD[6];
    byte_out[2] <= TRS_AD[5];
    byte_out[3] <= TRS_AD[4];
    byte_out[4] <= TRS_AD[3];
    byte_out[5] <= TRS_AD[2];
    byte_out[6] <= TRS_AD[1];
    byte_out[7] <= TRS_AD[0];
  end
  if (trigger_action && cmd == abus_read) byte_out <= TRS_A[7:0];
  else if (trigger_action && cmd == get_cookie) byte_out <= COOKIE;
  else if (trigger_action && cmd == get_version) byte_out <= {VERSION_MAJOR, VERSION_MINOR};
  else if (trigger_action && cmd == get_printer_byte) byte_out <= printer_byte;
end



endmodule
