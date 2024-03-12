module part7 (CLOCK_50, SW, KEY, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  reg [3:0] state;
  reg [0:6] H0, H1, H2, H3, H4, H5, H6, H7, H8;

  wire [22:0] counter;
  wire [4:0] counter2;
  reg trigger;

  counter_modk C0 (CLOCK_50, 1, counter);
  defparam C0.n = 23;
  defparam C0.k = 6250000;

  counter_modk C1 (counter[22], 1, counter2);
  defparam C1.n = 5;
  defparam C1.k = 32;

  always @ (posedge trigger)
  begin
    if (~SW[0]) begin
      H8 = H7;
      H7 = H6;
      H6 = H5;
      H5 = H4;
      H4 = H3;
      H3 = H2;
      H2 = H1;
      H1 = H0;
      case (state)
        0: H0 = 7'b1001000;
        1: H0 = 7'b0110000;
        2: H0 = 7'b1110001;
        3: H0 = 7'b1110001;
        4: H0 = 7'b0000001;
        5: H0 = 7'b1111111;
        6: H0 = 7'b1111111;
        7: H0 = 7'b1111111;
        8: H0 = H8;
      endcase

      if (state < 8) begin
        state = state + 1;
      end
    end else begin
      state = 0;
      
      H0 = 7'b1111111;
      H8 = 7'b1111111;
      H7 = 7'b1111111;
      H6 = 7'b1111111;
      H5 = 7'b1111111;
      H4 = 7'b1111111;
      H3 = 7'b1111111;
      H2 = 7'b1111111;
      H1 = 7'b1111111;
    end
  end

  assign HEX0 = H0;
  assign HEX1 = H1;
  assign HEX2 = H2;
  assign HEX3 = H3;
  assign HEX4 = H4;
  assign HEX5 = H5;
  assign HEX6 = H6;
  assign HEX7 = H7;

  assign LEDG[3:0] = state;







  reg [3:0] y_Q, Y_D; // y_Q represents current state, Y_D represents next state
  parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000;
  always @(KEY[0], SW[0], KEY[1], y_Q)
  begin: state_table
    case (y_Q)
      A: if (SW[0]) Y_D = C;
        else if (~KEY[0]) Y_D = B;
        else if (~KEY[1]) Y_D = A;
      B: if (SW[0]) Y_D = C;
        else if (~KEY[0]) Y_D = C;
        else if (~KEY[1]) Y_D = A;
      C: if (SW[0]) Y_D = C;
        else if (~KEY[0]) Y_D = D;
        else if (~KEY[1]) Y_D = B;
      D: if (SW[0]) Y_D = C;
        else if (~KEY[0]) Y_D = E;
        else if (~KEY[1]) Y_D = C;
      E: if (SW[0]) Y_D = C;
        else if (~KEY[0]) Y_D = E;
        else if (~KEY[1]) Y_D = D;
      default: Y_D = 4'bxxxx;
    endcase
  end // state_table
  always @(posedge (KEY[0] && KEY[1])/* or posedge SW[0]*/)
  begin: state_FFs
    y_Q = Y_D;
  end // state_FFS

  assign LEDR[3:0] = y_Q;



  reg [27:0] z;
  parameter z1 = 28'b0000101111101011110000100000, z2 = 28'b0001011111010111100001000000, z3 = 28'b0010111110101111000010000000, z4 = 28'b0101111101011110000100000000, z5 = 28'b1011111010111100001000000000;
  always @(counter2, y_Q)
  begin
    case (y_Q)
      A: trigger = counter2[0];
      B: trigger = counter2[1];
      C: trigger = counter2[2];
      D: trigger = counter2[3];
      E: trigger = counter2[4];
      default: trigger = 0;
    endcase
  end

  assign LEDR[17:13] = counter2;
endmodule
