// Seed: 1668303031
`timescale 1ps / 1 ps
module module_0 (
    id_1,
    id_2,
    id_3
);
  output id_3;
  output id_2;
  input id_1;
  always @(negedge id_1) begin
    if (1 && {1{id_1}}) begin
      #1 id_3 = 1;
      id_3 <= id_1;
      id_1[1] <= 1 ? id_2 & 1 : 1;
      id_3 <= id_3;
    end
  end
endmodule
