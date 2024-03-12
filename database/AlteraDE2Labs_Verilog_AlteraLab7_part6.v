module part6 (CLOCK_50, SW, KEY, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  reg [3:0] state;
  reg [0:6] H0, H1, H2, H3, H4, H5, H6, H7, H8;

  wire [25:0] counter;

  counter_modk C0 (CLOCK_50, 1, counter);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  always @ (posedge counter[25])
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
endmodule
