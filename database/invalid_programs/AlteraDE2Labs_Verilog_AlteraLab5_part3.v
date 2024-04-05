module part3 (CLOCK_50, KEY, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input CLOCK_50;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  wire [25:0] PERSEC;
  wire [31:0] PERMIN;
  wire [37:0] PERHOUR;

  wire [5:0] SECONDS, MINUTES;
  wire [4:0] HOURS;

  reg sec, min, hour;



  counter_modk C0 (CLOCK_50, KEY[0], PERSEC);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  counter_modk C1 (CLOCK_50, KEY[0], PERMIN);
  defparam C1.n = 32;
  defparam C1.k = 3000000000;

  counter_modk C2 (CLOCK_50, KEY[0], PERHOUR);
  defparam C2.n = 38;
  defparam C2.k = 180000000000;


  counter_modk C3 (sec, KEY[0], SECONDS);
  defparam C3.n = 6;
  defparam C3.k = 60;

  counter_modk C4 (min, KEY[0], MINUTES);
  defparam C4.n = 6;
  defparam C4.k = 60;

  counter_modk C5 (hour, KEY[0], HOURS);
  defparam C5.n = 5;
  defparam C5.k = 24;



  always @ (negedge CLOCK_50) begin
    if (PERSEC == 49999999)
      sec = 1;
    else
      sec = 0;

    if (PERMIN == 2999999999)
      min = 1;
    else
      min = 0;

    if (PERHOUR == 179999999999)
      hour = 1;
    else
      hour = 0;
  end


  twodigit_b2d_ssd D7 (HOURS, HEX7, HEX6);
  twodigit_b2d_ssd D5 (MINUTES, HEX5, HEX4);
  twodigit_b2d_ssd D3 (SECONDS, HEX3, HEX2);

  assign HEX1 = 7'b1111111;
  assign HEX0 = 7'b1111111;
endmodule

module b2d_ssd (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case(X)
      0:SSD=7'b0000001;
      1:SSD=7'b1001111;
      2:SSD=7'b0010010;
      3:SSD=7'b0000110;
      4:SSD=7'b1001100;
      5:SSD=7'b0100100;
      6:SSD=7'b0100000;
      7:SSD=7'b0001111;
      8:SSD=7'b0000000;
      9:SSD=7'b0001100;
    endcase
  end
endmodule

module twodigit_b2d_ssd (X, SSD1, SSD0);
  input [6:0] X;
  output [0:6] SSD1, SSD0;

  reg [3:0] ONES, TENS;

  always begin
    ONES = X % 10;
    TENS = (X - ONES) / 10;
  end

  b2d_ssd B1 (TENS, SSD1);
  b2d_ssd B0 (ONES, SSD0);
endmodule

