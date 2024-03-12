module part2 (CLOCK_50, KEY, LEDR, HEX2, HEX1, HEX0);
  input CLOCK_50;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [0:6] HEX2, HEX1, HEX0;

  wire [25:0] CYCLES;
  reg ones, tens, hundreds;
  wire x2, y2, z2;
  reg x1, y1, z1;

  assign x2 = x1 && KEY[0];
  assign y2 = y1 && KEY[0];
  assign z2 = z1 && KEY[0];

  counter_modk C0 (CLOCK_50, KEY[0], CYCLES);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  counter_modk C1 (ones, x2, LEDR[3:0]);
  defparam C1.n = 4;
  defparam C1.k = 11;

  counter_modk C2 (tens, y2, LEDR[7:4]);
  defparam C2.n = 4;
  defparam C2.k = 11;

  counter_modk C3 (hundreds, z2, LEDR[11:8]);
  defparam C3.n = 4;
  defparam C3.k = 10;

 


  always @ (negedge CLOCK_50) begin
    if (CYCLES == 49999999)
      ones = 1;
    else
      ones = 0;

    if (LEDR[3:0] == 10) begin
      tens = 1;
      x1 = 0;
    end else begin
      tens = 0;
      x1 = 1;
    end

    if (LEDR[7:4] == 10) begin
      hundreds = 1;
      y1 = 0;
    end else begin
      hundreds = 0;
      y1 = 1;
    end

    z1 = 1;
  end

  b2d_ssd H2 (LEDR[11:8], HEX2);
  b2d_ssd H1 (LEDR[7:4], HEX1);
  b2d_ssd H0 (LEDR[3:0], HEX0);

  assign LEDR[17] = z1;
  assign LEDR[16] = z2;
  assign LEDR[15] = y1;
  assign LEDR[14] = y2;



endmodule

module b2d_ssd (X, SSD);
  input [4:0] X;
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
