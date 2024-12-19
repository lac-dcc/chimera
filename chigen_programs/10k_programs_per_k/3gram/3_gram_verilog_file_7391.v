// Seed: 3333220847
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output wire id_5,
    input wor id_6,
    output uwire id_7,
    output wire id_8,
    input uwire id_9,
    output tri id_10,
    output supply1 id_11,
    input tri0 id_12,
    input tri1 id_13,
    input wand id_14,
    output uwire id_15,
    input wand id_16,
    output uwire id_17,
    output supply1 id_18,
    input wand id_19,
    output wor id_20
);
  integer id_22 = id_12;
endmodule
module module_1 (
    input supply0 id_0,
    input logic id_1
    , id_4,
    output tri0 id_2
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_20 = 0;
  assign id_4 = 1;
  id_5 :
  assert property (@((1)) id_1)
  else id_5 <= id_1 - 1;
endmodule
