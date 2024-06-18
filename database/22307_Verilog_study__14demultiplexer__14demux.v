// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module _14mux(
  input [1:0] s,
  input i,
  // output [3:0] y
  output reg [3:0] y
);

  // assign y[0] = i & ~s[1] & ~s[0];
  // assign y[1] = i & ~s[1] & s[0];
  // assign y[2] = i & s[1] & ~s[0];
  // assign y[3] = i & s[1] & s[0];

  always @(*)
  begin
    if (s == 2'b00) y = {3'b000, i};
    else if (s == 2'b01) y = {2'b00, i, 1'b0};
    else if (s == 2'b10) y = {1'b0, i, 2'b00};
    else if (s == 2'b11) y = {i, 3'b000};
  end

  // always @(*)
  //   begin
  //     case (s)
  //       2'b00: y = {3'b000, i};
  //       2'b01: y = {2'b00, i, 1'b0};
  //       2'b10: y = {1'b0, i, 2'b00};
  //       2'b11: y = {i, 3'b000};
  //     endcase
  //   end

endmodule