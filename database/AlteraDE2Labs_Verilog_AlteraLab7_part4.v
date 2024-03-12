module part4 (SW, KEY, LEDR, LEDG, HEX0);
  input [17:0] SW;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX0;

  reg [3:0] state;
  wire [1:0] w;

  assign w[0] = SW[1];
  assign w[1] = SW[2];

  always @ (negedge KEY[0])
  begin
    if (SW[0])
      state = 0;
    else begin
      case (w)
        1: state = state + 1;
        2: state = state + 2;
        3: if(state == 0)
              state = 9;
            else
              state = state - 1;
      endcase

      if (state == 10)
        state = 0;
      else if (state == 11)
        state = 1;
    end
  end

  b2d_ssd H0 (state, HEX0);
endmodule
