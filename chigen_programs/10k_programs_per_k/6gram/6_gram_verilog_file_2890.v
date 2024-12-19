// Seed: 1040034256
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input supply0 id_2,
    output wand id_3,
    output uwire id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wand id_7,
    input tri1 id_8,
    input wor id_9,
    input wire id_10,
    input uwire id_11,
    output wand id_12,
    output wand id_13,
    input uwire id_14,
    output wand id_15
    , id_17
);
endmodule
module module_1 (
    output tri   id_0,
    input  tri1  id_1,
    output logic id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.type_19 = 0;
  always @(*) begin : LABEL_0
    id_2 <= {'b0, 1 ^ id_1};
    release id_2;
  end
endmodule
