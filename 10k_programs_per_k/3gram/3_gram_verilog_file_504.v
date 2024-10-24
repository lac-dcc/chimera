// Seed: 226953862
`timescale 1ps / 1ps
module module_0 (
    output id_0,
    input  id_1,
    input  id_2,
    input  id_3
);
  always @(1 or posedge id_1) begin
    id_0 = id_1;
  end
  always #(id_2 - 1) id_0 <= #id_2 id_2 & id_1;
  logic id_4;
endmodule
