// Seed: 1257424664
`timescale 1ps / 1ps
module module_0 (
    output id_0,
    output id_1,
    input  id_2,
    output id_3
);
  always @(posedge 1) begin
    id_0 <= id_2;
    id_3 <= id_2;
  end
  assign id_1 = id_2 ? id_2 : 1;
endmodule
