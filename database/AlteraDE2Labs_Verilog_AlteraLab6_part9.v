module part9 (SW, KEY, LEDG, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input [17:0] SW;
  input [3:0] KEY;
  output [8:0] LEDG;
  output [17:0] LEDR;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  reg [7:0] A, B, C, D, disp0, disp1;
  reg [15:0] S;
  wire [15:0] wireS;
  wire [16:0] result;
  wire [15:0] temp0, temp1;
  wire c;
  reg overflow;

  always @ (negedge KEY[1] or negedge KEY[0]) begin
    if (KEY[1] == 0) begin
      if (SW[17] == 1) begin
        // if WE
        if (SW[16] == 0) begin
          // store A & B
          A = SW[15:8];
          B = SW[7:0];
        end else begin
          // store C & D
          C = SW[15:8];
          D = SW[7:0];
        end
        overflow = c;
        S = wireS;
      end
    end
    if (KEY[0] == 0) begin
      // clear all registers
      A = 8'b00000000;
      B = 8'b00000000;
      C = 8'b00000000;
      D = 8'b00000000;
      S = 16'b0000000000000000;
      overflow = 0;
    end
  end
          
  always begin
    if (SW[16] == 0) begin
      disp0 = A;
      disp1 = B;
    end else begin
      disp0 = C;
      disp1 = D;
    end
  end

/*
  lpm_multiplier_8bit M0 (A, B, temp0);
  lpm_multiplier_8bit M1 (C, D, temp1);
  lpm_add_8bit A0 (temp0, temp1, c, wireS);
*/

  altmult_add_8bit AMA (KEY[0], KEY[1], A, B, C, D, SW[17], result);
  assign wireS = result[15:0];
  assign c = result[16];
  
  hex_ssd H7 (disp0[7:4], HEX7);
  hex_ssd H6 (disp0[3:0], HEX6);

  hex_ssd H5 (disp1[7:4], HEX5);
  hex_ssd H4 (disp1[3:0], HEX4);

  hex_ssd H3 (S[15:12], HEX3);
  hex_ssd H2 (S[11:8], HEX2);
  hex_ssd H1 (S[7:4], HEX1);
  hex_ssd H0 (S[3:0], HEX0);

  assign LEDG[8] = overflow;
endmodule

