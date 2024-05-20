// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module siso_shift_register (
  input wire clk,
  input wire reset,
  input wire serial_in,
  output wire serial_out
);

  reg [3:0] shift_reg;

  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_reg <= 4'b0000;
    else
      shift_reg <= {shift_reg[2:0], serial_in};
  end

  assign serial_out = shift_reg[3];

endmodule