// Seed: 475641417
module module_0 (
    input tri0 id_0
    , id_18,
    input wor id_1,
    input tri0 id_2,
    output supply1 id_3,
    input wor id_4,
    output supply1 id_5,
    input wand id_6,
    input wor id_7
    , id_19,
    input wire id_8,
    output wire id_9,
    output wire id_10,
    output wire id_11,
    output tri0 id_12,
    output supply0 id_13,
    output tri1 id_14
    , id_20,
    output wand id_15,
    input uwire id_16
);
  assign id_11 = id_4;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    output uwire id_2,
    output tri1 id_3,
    input supply0 id_4,
    input uwire id_5
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_3,
      id_1,
      id_3,
      id_4,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
  initial begin : LABEL_0
    id_0 <= -1 == id_4;
  end
endmodule
