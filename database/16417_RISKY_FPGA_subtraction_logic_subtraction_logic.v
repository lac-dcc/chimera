// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module subtraction_logic (
  input [6:0] opcode,
  input [2:0] funct3,
  input [6:0] funct7,
  output reg out
);

always @ (opcode or funct3 or funct7) begin
  case (opcode)
    7'b1100011: out = 1'b1;
    7'b0110011: begin
      if (funct7[5] == 1 | funct3[1] == 1) 
      out <= 1;
      else
      out <= 0;
    end
    7'b0010011: begin
      if (funct3[1] == 1)
      out <= 1;
      else
      out <= 0;
  end
endcase
end
endmodule
