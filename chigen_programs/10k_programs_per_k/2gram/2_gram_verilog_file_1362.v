// Seed: 742221215
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    input supply0 id_3,
    output tri id_4,
    output tri id_5,
    input supply1 id_6,
    input wire id_7,
    input uwire id_8,
    input wor id_9,
    input uwire id_10,
    inout uwire id_11,
    input tri id_12,
    output wand id_13
    , id_17,
    output wire id_14,
    input wor id_15
);
  logic id_18;
  ;
  wire id_19;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1,
    inout  tri0  id_2,
    output uwire id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  tri0  id_6
);
  module_0 modCall_1 (
      id_4,
      id_5,
      id_6,
      id_2,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_2,
      id_2,
      id_6,
      id_0,
      id_2,
      id_6
  );
  assign modCall_1.id_13 = 0;
  buf primCall (id_2, id_4);
endmodule
