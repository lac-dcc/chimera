// Seed: 3429119412
`timescale 1ps / 1ps
module module_0 (
    input reg id_0,
    input id_1,
    inout reg id_2,
    input logic id_3,
    output reg id_4
);
  initial begin
    id_2 <= ~id_3;
    if (id_3) begin
      id_2 <= id_0 | 1;
      for (id_2 = id_2 * id_3; id_2; id_4 = 1) begin
        id_4 <= id_1;
      end
    end
    if (1) id_2 <= id_2;
    else id_4 <= id_0;
  end
  assign id_2 = id_0;
endmodule
