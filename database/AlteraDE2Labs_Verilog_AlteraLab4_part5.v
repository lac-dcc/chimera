module part5 (CLOCK_50, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input CLOCK_50;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  wire [25:0] CYCLES;
  wire [3:0] SECONDS;
  reg secclk;

  counter_modk C0 (CLOCK_50, 1, CYCLES);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  always @ (posedge CLOCK_50)
    if (CYCLES == 0)
      secclk = 0;
    else
      secclk = 1;

  counter_modk C1 (secclk, 1, SECONDS);
  defparam C1.n = 4;
  defparam C1.k = 7;

  bin2hello7 (SECONDS, HEX6);
  bin2hello6 (SECONDS, HEX5);
  bin2hello5 (SECONDS, HEX4);
  bin2hello4 (SECONDS, HEX3);
  bin2hello3 (SECONDS, HEX2);
  bin2hello2 (SECONDS, HEX1);
  bin2hello1 (SECONDS, HEX0);
  bin2hello0 (SECONDS, HEX7);

endmodule

module bin2hello7 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      0:SSD=7'b1111111;
      1:SSD=7'b1111111;
      2:SSD=7'b1111111;
      3:SSD=7'b1001000;
      4:SSD=7'b0110000;
      5:SSD=7'b1110001;
      6:SSD=7'b1110001;
      7:SSD=7'b0000001;
      8:SSD=7'b1111111;
    endcase
  end
endmodule

module bin2hello6 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      7:SSD=7'b1111111;
      8:SSD=7'b1111111;
      0:SSD=7'b1111111;
      1:SSD=7'b1111111;
      2:SSD=7'b1001000;
      3:SSD=7'b0110000;
      4:SSD=7'b1110001;
      5:SSD=7'b1110001;
      6:SSD=7'b0000001;
    endcase
  end
endmodule

module bin2hello5 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      6:SSD=7'b1111111;
      7:SSD=7'b1111111;
      8:SSD=7'b1111111;
      0:SSD=7'b1111111;
      1:SSD=7'b1001000;
      2:SSD=7'b0110000;
      3:SSD=7'b1110001;
      4:SSD=7'b1110001;
      5:SSD=7'b0000001;
    endcase
  end
endmodule

module bin2hello4 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      5:SSD=7'b1111111;
      6:SSD=7'b1111111;
      7:SSD=7'b1111111;
      8:SSD=7'b1001000;
      0:SSD=7'b1001000;
      1:SSD=7'b0110000;
      2:SSD=7'b1110001;
      3:SSD=7'b1110001;
      4:SSD=7'b0000001;
    endcase
  end
endmodule

module bin2hello3 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      4:SSD=7'b1111111;
      5:SSD=7'b1111111;
      6:SSD=7'b1111111;
      7:SSD=7'b1001000;
      8:SSD=7'b0110000;
      0:SSD=7'b0110000;
      1:SSD=7'b1110001;
      2:SSD=7'b1110001;
      3:SSD=7'b0000001;
    endcase
  end
endmodule

module bin2hello2 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      3:SSD=7'b1111111;
      4:SSD=7'b1111111;
      5:SSD=7'b1111111;
      6:SSD=7'b1001000;
      7:SSD=7'b0110000;
      8:SSD=7'b1110001;
      0:SSD=7'b1110001;
      1:SSD=7'b1110001;
      2:SSD=7'b0000001;
    endcase
  end
endmodule

module bin2hello1 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      2:SSD=7'b1111111;
      3:SSD=7'b1111111;
      4:SSD=7'b1111111;
      5:SSD=7'b1001000;
      6:SSD=7'b0110000;
      7:SSD=7'b1110001;
      8:SSD=7'b1110001;
      0:SSD=7'b1110001;
      1:SSD=7'b0000001;
    endcase
  end
endmodule

module bin2hello0 (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always begin
    case (X)
      1:SSD=7'b1111111;
      2:SSD=7'b1111111;
      3:SSD=7'b1111111;
      4:SSD=7'b1001000;
      5:SSD=7'b0110000;
      6:SSD=7'b1110001;
      7:SSD=7'b1110001;
      8:SSD=7'b0000001;
      0:SSD=7'b0000001;
    endcase
  end
endmodule
