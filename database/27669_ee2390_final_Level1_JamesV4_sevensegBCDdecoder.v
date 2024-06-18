// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module sevensegBCDdecoder(
  input [3:0] IN,
  input clk,
  input reset,
  output reg [0:6] Seg
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      Seg <= 7'b111_1111; // Display '0' when reset is asserted
    end else begin
      case(IN)
        4'b0000: Seg <= 7'b000_0001;
        4'b0001: Seg <= 7'b100_1111;
        4'b0010: Seg <= 7'b001_0010;
        4'b0011: Seg <= 7'b000_0110;
        4'b0100: Seg <= 7'b100_1100;
        4'b0101: Seg <= 7'b010_0100;
        4'b0110: Seg <= 7'b000_1000;
        4'b0111: Seg <= 7'b000_0110;
        4'b1000: Seg <= 7'b001_0010;
        4'b1001: Seg <= 7'b100_1111;
        default: Seg <= 7'b111_1111; // Display '0' for invalid inputs
      endcase
    end
  end

endmodule