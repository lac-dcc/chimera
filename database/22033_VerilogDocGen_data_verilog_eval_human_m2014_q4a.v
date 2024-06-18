// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module m2014_q4a (
  input d,
  input ena,
  output logic q

);

  always@(*) begin
    if (ena)
      q = d;
  end

endmodule



