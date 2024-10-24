// Seed: 3330469727
`timescale 1 ps / 1ps
module module_0 (
    id_1,
    id_2
);
  output id_2;
  output id_1;
  always #1 begin
    id_1 <= id_2;
  end
  generate
    always @(posedge 1'd0 or posedge 1'd0) begin
      id_1 <= 1;
    end
  endgenerate
endmodule
