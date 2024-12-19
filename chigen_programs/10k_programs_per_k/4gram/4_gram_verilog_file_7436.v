// Seed: 2379805704
module module_0 (
    output tri0 id_0,
    output tri0 id_1
    , id_16,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wor id_7,
    input tri id_8,
    input tri0 id_9,
    output tri id_10,
    output supply1 id_11,
    output uwire id_12,
    input tri0 id_13,
    input wor id_14
);
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    output tri id_2,
    input wor id_3,
    output logic id_4,
    input supply1 id_5,
    input logic id_6
);
  assign id_4 = id_6;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_3,
      id_5,
      id_3,
      id_1,
      id_0,
      id_5,
      id_5,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_18 = 0;
  initial begin : LABEL_0
    id_2 = id_1;
    if (1) id_4 <= 1 ? 1'b0 : id_6 ? 1 : !id_1;
  end
endmodule
