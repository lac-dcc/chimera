// Seed: 300064915
module module_0 (
    output logic id_0,
    output supply0 id_1,
    input tri0 id_2,
    input logic id_3
);
  logic id_5;
  assign id_0 = id_5;
  logic [7:0] id_6;
  reg id_7;
  always_ff
    if (1'b0) id_6[1'h0] <= {1'b0, id_5, 1, 1, 1, 1, 1};
    else id_7 <= id_3;
  wire id_8, id_9;
endmodule
module module_1 (
    output wor   id_0,
    input  logic id_1,
    input  logic id_2,
    output tri0  id_3,
    input  logic id_4,
    output logic id_5,
    input  wand  id_6
);
  always
    if (id_6.id_6) do id_5 = 1; while (1);
    else id_5.id_2 <= id_1;
  assign id_5 = id_4;
  uwire id_8 = 1;
  logic id_9;
  assign id_5 = id_4;
  assign id_9 = id_4;
  wire id_10, id_11, id_12;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_6,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
