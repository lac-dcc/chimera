// Seed: 976968902
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input wand id_2,
    input wire id_3
    , id_16,
    input supply0 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wand id_7,
    input wor id_8,
    output tri0 id_9,
    output wand id_10,
    output wire id_11,
    input uwire id_12,
    output uwire id_13,
    input supply0 id_14
);
  wire id_17, id_18 = 1, id_19;
  generate
    begin : LABEL_0
    end
  endgenerate
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  tri1  id_5,
    input  tri0  id_6
);
  always id_0 = (id_3);
  wire id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3,
      id_0,
      id_0,
      id_0,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.id_12 = 0;
endmodule
