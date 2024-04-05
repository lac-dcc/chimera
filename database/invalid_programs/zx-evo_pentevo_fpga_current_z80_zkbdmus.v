// (c) 2010 NedoPC
//
// MUXes mouse and kbd data in two single databusses for zports

`include "tune.v"

module zkbdmus
(
  input  wire        fclk,
  input  wire        rst_n,

  input  wire [7:0] kbd_in,  // key bits
  input  wire [2:0] kbd_in_sel,  // key byte selector
  input  wire       kbd_stb, // and strobe

  input  wire [7:0] mus_in,
  input  wire       mus_xstb,
  input  wire       mus_ystb,
  input  wire       mus_btnstb,
  input  wire       kj_stb,

  input  wire [7:0] zah,

  output wire [4:0] kbd_data,
  output wire [7:0] mus_data,
`ifdef KEMPSTON_8BIT
  output reg  [7:0] kj_data
`else
  output reg  [4:0] kj_data
`endif
);

  reg [39:0] kbd;
  reg [7:0] musx, musy;
  reg [2:0] musbtn;
  reg [3:0] muswhl;

  wire [4:0] keys [0:7]; // key matrix

  reg [4:0] kout; // wire AND


  // store data from slavespi
  always @(posedge fclk)
  begin
    if (kbd_stb)
    begin
      kbd[{kbd_in_sel, 3'h0}] <= kbd_in[0];
      kbd[{kbd_in_sel, 3'h1}] <= kbd_in[1];
      kbd[{kbd_in_sel, 3'h2}] <= kbd_in[2];
      kbd[{kbd_in_sel, 3'h3}] <= kbd_in[3];
      kbd[{kbd_in_sel, 3'h4}] <= kbd_in[4];
      kbd[{kbd_in_sel, 3'h5}] <= kbd_in[5];
      kbd[{kbd_in_sel, 3'h6}] <= kbd_in[6];
      kbd[{kbd_in_sel, 3'h7}] <= kbd_in[7];
    end

    if (mus_xstb)
      musx <= mus_in;

    if (mus_ystb)
      musy <= mus_in;

    if (mus_btnstb)
    begin
      musbtn <= mus_in[2:0];
      muswhl <= mus_in[7:4];
    end

    if (kj_stb)
`ifdef KEMPSTON_8BIT
      kj_data <= mus_in;
`else
      kj_data <= mus_in[4:0];
`endif

  end

  // keys
  assign keys[0] = {kbd[00], kbd[08], kbd[16], kbd[24], kbd[32]};// v  c  x  z  CS
  assign keys[1] = {kbd[01], kbd[09], kbd[17], kbd[25], kbd[33]};// g  f  d  s  a
  assign keys[2] = {kbd[02], kbd[10], kbd[18], kbd[26], kbd[34]};// t  r  e  w  q
  assign keys[3] = {kbd[03], kbd[11], kbd[19], kbd[27], kbd[35]};// 5  4  3  2  1
  assign keys[4] = {kbd[04], kbd[12], kbd[20], kbd[28], kbd[36]};// 6  7  8  9  0
  assign keys[5] = {kbd[05], kbd[13], kbd[21], kbd[29], kbd[37]};// y  u  i  o  p
  assign keys[6] = {kbd[06], kbd[14], kbd[22], kbd[30], kbd[38]};// h  j  k  l  EN
  assign keys[7] = {kbd[07], kbd[15], kbd[23], kbd[31], kbd[39]};// b  n  m  SS SP

  always @*
  begin
    kout = 5'b11111;

    kout = kout & ({5{zah[0]}} | (~keys[0]));
    kout = kout & ({5{zah[1]}} | (~keys[1]));
    kout = kout & ({5{zah[2]}} | (~keys[2]));
    kout = kout & ({5{zah[3]}} | (~keys[3]));
    kout = kout & ({5{zah[4]}} | (~keys[4]));
    kout = kout & ({5{zah[5]}} | (~keys[5]));
    kout = kout & ({5{zah[6]}} | (~keys[6]));
    kout = kout & ({5{zah[7]}} | (~keys[7]));
  end

  assign kbd_data = kout;

  // mouse
  // FADF - buttons, FBDF - x, FFDF - y
  assign mus_data = zah[0] ? (zah[2] ? musy : musx) : {muswhl, 1'b1, musbtn};

endmodule
