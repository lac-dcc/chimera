
// This module generates video for DAC
// (c)2015 TSL

`include "tune.v"

module video_out
(
  // clocks
  input wire clk, c3,

  // video controls
  input wire vga_on,
  input wire tv_blank,
  input wire vga_blank,
  input wire vga_line,
  input wire [1:0] plex_sel_in,

  // mode controls
  input wire tv_hires,
  input wire vga_hires,
  input wire [3:0] palsel,

  // Z80 pins
  input  wire [15:0] cram_data_in,
  input  wire [7:0] cram_addr_in,
  input  wire cram_we,

  // video data
  input wire [7:0] vplex_in,
  input wire [7:0] vgaplex,
  output wire [1:0] vred,
  output wire [1:0] vgrn,
  output wire [1:0] vblu,
  output wire [4:0] vred_raw,
  output wire [4:0] vgrn_raw,
  output wire [4:0] vblu_raw,
  output wire vdac_mode
);

  wire [14:0] vpix;
  wire [15:0] vpixel;
  wire [1:0] phase;
  wire [7:0] pwm[0:7];

  reg blank1;         // GOVNOKOD!!!!!!!!!!!!!!!!!!!!!

  assign vred_raw = vpix[14:10];
  assign vgrn_raw = vpix[9:5];
  assign vblu_raw = vpix[4:0];
  assign vdac_mode = vpixel[15];

  // TV/VGA mux
  reg [7:0] vplex;
  always @(posedge clk) if (c3)
    vplex <= vplex_in;

  wire [7:0] plex = vga_on ? vgaplex : vplex;
  wire hires = vga_on ? vga_hires : tv_hires;
  wire plex_sel = vga_on ? plex_sel_in[0] : plex_sel_in[1];
  wire [7:0] vdata = hires ? {palsel, plex_sel ? plex[3:0] : plex[7:4]} : plex;
  wire blank = vga_on ? vga_blank : tv_blank;

  assign vpix = blank1 ? 15'b0 : vpixel[14:0];
  // assign vpix = blank1 ? 15'b0 : (vpixel[14:0] & 15'b111001110011100);    // test for 373 colors
  // assign vpix = blank1 ? 15'b0 : (vpixel[14:0] & 15'b110001100011000);    // test for 64 colors

  // GOVNOKOD!!!!!!!!!!!!!!!!!!!!!
  always @(posedge clk)
  begin
      blank1 <= blank;
  end

// color components extraction
  wire [1:0] cred = vpix[14:13];
  wire [2:0] ired = vpix[12:10];
  wire [1:0] cgrn = vpix[ 9: 8];
  wire [2:0] igrn = vpix[ 7: 5];
  wire [1:0] cblu = vpix[ 4: 3];
  wire [2:0] iblu = vpix[ 2: 0];

// prepare and clocking two phases of output
  reg [1:0] red0;
  reg [1:0] grn0;
  reg [1:0] blu0;
  reg [1:0] red1;
  reg [1:0] grn1;
  reg [1:0] blu1;

  always @(posedge clk)
  begin
    red0 <= (!pwm[ired][{phase, 1'b0}] | &cred) ? cred : (cred + 2'b1);
    grn0 <= (!pwm[igrn][{phase, 1'b0}] | &cgrn) ? cgrn : (cgrn + 2'b1);
    blu0 <= (!pwm[iblu][{phase, 1'b0}] | &cblu) ? cblu : (cblu + 2'b1);
    red1 <= (!pwm[ired][{phase, 1'b1}] | &cred) ? cred : (cred + 2'b1);
    grn1 <= (!pwm[igrn][{phase, 1'b1}] | &cgrn) ? cgrn : (cgrn + 2'b1);
    blu1 <= (!pwm[iblu][{phase, 1'b1}] | &cblu) ? cblu : (cblu + 2'b1);
  end

`ifdef IDE_VDAC
// no PWM
  assign vred = cred;
  assign vgrn = cgrn;
  assign vblu = cblu;
`elsif IDE_VDAC2
// no PWM
  assign vred = cred;
  assign vgrn = cgrn;
  assign vblu = cblu;
`else
// output muxing for 56MHz PWM resolution
  assign vred = clk ? red1 : red0;
  assign vgrn = clk ? grn1 : grn0;
  assign vblu = clk ? blu1 : blu0;
`endif

// PWM phase
  reg [1:0] ph;
  always @(posedge clk)
    ph <= ph + 2'b1;

  assign phase = {vga_on ? vga_line : ph[1], ph[0]};

// PWM
  assign pwm[0] = 8'b00000000;
  assign pwm[1] = 8'b00000001;
  assign pwm[2] = 8'b01000001;
  assign pwm[3] = 8'b01000101;
  assign pwm[4] = 8'b10100101;
  assign pwm[5] = 8'b10100111;
  assign pwm[6] = 8'b11010111;
  assign pwm[7] = 8'b11011111;

// CRAM
  altdpram video_cram
  (
    .inclock        (clk),
    .data           (cram_data_in),
    .rdaddress      (vdata),
    .wraddress      (cram_addr_in),
    .wren           (cram_we),
    .q              (vpixel),
    .aclr           (1'b0),
    .byteena        (1'b1),
    .inclocken      (1'b1),
    .outclock       (1'b1),
    .outclocken     (1'b1),
    .rdaddressstall (1'b0),
    .rden           (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    video_cram.indata_aclr = "OFF",
    video_cram.indata_reg = "INCLOCK",
    video_cram.intended_device_family = "ACEX1K",
    video_cram.lpm_file = "../video/mem/video_cram.mif",
    video_cram.lpm_type = "altdpram",
    video_cram.outdata_aclr = "OFF",
    video_cram.outdata_reg = "UNREGISTERED",
    video_cram.rdaddress_aclr = "OFF",
    video_cram.rdaddress_reg = "INCLOCK",
    video_cram.rdcontrol_aclr = "OFF",
    video_cram.rdcontrol_reg = "UNREGISTERED",
    video_cram.width = 16,
    video_cram.widthad = 8,
    video_cram.wraddress_aclr = "OFF",
    video_cram.wraddress_reg = "INCLOCK",
    video_cram.wrcontrol_aclr = "OFF",
    video_cram.wrcontrol_reg = "INCLOCK";

endmodule
