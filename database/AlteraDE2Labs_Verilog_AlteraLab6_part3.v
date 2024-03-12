module part3 (SW, LEDG, LEDR, KEY, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input [17:0] SW;
  input [3:0] KEY;
  output [8:0] LEDG;
  output [17:0] LEDR;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  wire [7:0] wireS;
  wire wireoverflow;

  reg [7:0] A, B, S;
  reg overflow;

  always @ (negedge KEY[1] or negedge KEY[0]) begin
    if (KEY[1] == 0) begin
      A = SW[15:8];
      B = SW[7:0];
      S = wireS;
      overflow = wireoverflow;
    end
    if (KEY[0] == 0) begin
      A = 8'b00000000;
      B = 8'b00000000;
      S = 8'b00000000;
      overflow = 0;
    end
  end

  lpm_add_8bit FA (A, B, wireoverflow, wireS);

  assign LEDR[15:8] = A;
  assign LEDR[7:0] = B;
  assign LEDG[7:0] = S[7:0];
  assign LEDG[8] = overflow;

  hex_ssd H7 (A[7:4], HEX7);
  hex_ssd H6 (A[3:0], HEX6);
  hex_ssd H5 (B[7:4], HEX5);
  hex_ssd H4 (B[3:0], HEX4);
  hex_ssd H1 (S[7:4], HEX1);
  hex_ssd H0 (S[3:0], HEX0);

  assign HEX3 = 7'b1111111;
  assign HEX2 = 7'b1111111;

endmodule

module fulladder (a, b, ci, s, co);
  input a, b, ci;
  output co, s;

  wire d;

  assign d = a ^ b;
  assign s = d ^ ci;
  assign co = (b & ~d) | (d & ci);
endmodule

module fulladder_8bit (A, B, ci, S, CO);
  input [7:0] A, B;
  input ci;
  output [7:0] S;
  output [8:1] CO;

  fulladder A0 (A[0], B[0], ci, S[0], CO[1]);
  fulladder A1 (A[1], B[1], CO[1], S[1], CO[2]);
  fulladder A2 (A[2], B[2], CO[2], S[2], CO[3]);
  fulladder A3 (A[3], B[3], CO[3], S[3], CO[4]);
  fulladder A4 (A[4], B[4], CO[4], S[4], CO[5]);
  fulladder A5 (A[5], B[5], CO[5], S[5], CO[6]);
  fulladder A6 (A[6], B[6], CO[6], S[6], CO[7]);
  fulladder A7 (A[7], B[7], CO[7], S[7], CO[8]);
endmodule

module hex_ssd (BIN, SSD);
  input [15:0] BIN;
  output reg [0:6] SSD;

  always begin
    case(BIN)
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
      10:SSD=7'b0001000;
      11:SSD=7'b1100000;
      12:SSD=7'b0110001;
      13:SSD=7'b1000010;
      14:SSD=7'b0110000;
      15:SSD=7'b0111000;
    endcase
  end
endmodule
