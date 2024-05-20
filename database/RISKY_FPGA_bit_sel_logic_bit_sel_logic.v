// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module bit_sel_logic (
  input [6:0] opcode,
  output reg out
);

always @ (opcode) begin
  if (opcode == 7'b0010011) begin
    out = 1;
  end else
    out = 0;
end
endmodule
    
