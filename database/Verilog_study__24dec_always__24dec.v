// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module _24dec(
  input [1:0] a,
  input e,
  output reg [3:0] y
  // Declare y as a reg,
  // as verilog does not allow a wire to be assigned in an always block
);

always @(*)
begin
  if (e == 0)
    y = 4'b0000;
  else
    case({e, a})
      3'b100:   y   =   4'b0001;
      3'b101:   y   =   4'b0010;
      3'b110:   y   =   4'b0100;
      3'b111:   y   =   4'b1000;
      default:  y   =   4'b0000;
    endcase
end

endmodule