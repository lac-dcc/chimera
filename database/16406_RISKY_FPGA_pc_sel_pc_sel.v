// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module pc_sel (
  input [31:0] inst,
  output reg [1:0] control
);

wire [6:0] opcode;

assign opcode = inst[6:0];

always @(opcode) begin
  case (opcode)
    7'b1100011: control <= 2'b01;
    7'b1101111: control <= 2'b10;
    7'b1100111: control <= 2'b10;
    7'b1110011: control <= 2'b11;
    default: control <= 2'b00;
  endcase
end

endmodule
