// Seed: 2017473284
module module_0 (
    input tri0 id_0,
    input wor  id_1
);
  wire id_3;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output wand id_2,
    input supply1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wire id_6,
    input logic id_7
    , id_10,
    output logic id_8
);
  wire id_11;
  wire id_12;
  logic [7:0] id_13;
  module_0 modCall_1 (
      id_11,
      id_4
  );
  assign modCall_1.id_1 = 0;
  assign id_11 = id_5;
  initial begin : LABEL_0
    id_10 = 1;
    fork
      id_13[1] <= id_7;
    join_any
  end
  always begin : LABEL_0
    id_8 <= 1;
  end
  assign id_13[1'b0] = 1'h0;
  if (id_7) assign id_0 = 1'b0;
endmodule
