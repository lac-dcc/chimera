// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

//  4 to 2 priority encoder using always blocking assignment
module _42penc(
  input [3:0] y,
  output reg [1:0] a   // for always block
  // output [1:0] a    // for assign statement
);

  // assign a[0] = ((~y[3]) & y[2]) | y[3];
  // assign a[0] = ((~y[3]) & (~y[2]) & y[1]) | y[3];

  // always @(*)
  // begin
  //   if (y[3]) a = 2'b11;
  //   else if (y[3] == 1) a = 2'b11;
  //   else if (y[3:2] == 2'b01) a = 2'b10;
  //   else if (y[3:1] == 3'b001) a = 2'b01;
  //   else if (y == 4'b0001) a = 2'b00;
  //   else if (y == 4'b0000) a = 2'b00;
  // end

  always @(*)
  begin
    case (y)
      4'b0000: a = 2'b00;
      4'b0001: a = 2'b00;
      4'b0010: a = 2'b01;
      4'b0011: a = 2'b01;
      4'b0100: a = 2'b10;
      4'b0101: a = 2'b10;
      4'b0110: a = 2'b10;
      4'b0111: a = 2'b10;
      4'b1000: a = 2'b11;
      4'b1001: a = 2'b11;
      4'b1010: a = 2'b11;
      4'b1100: a = 2'b11;
      4'b1101: a = 2'b11;
      4'b1110: a = 2'b11;
      4'b1111: a = 2'b11;
      default: a = 2'b00;
    endcase
  end

endmodule