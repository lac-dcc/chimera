// Seed: 1459663377
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wor id_3,
    output uwire id_4,
    output tri1 id_5,
    output tri id_6,
    output wor id_7,
    input uwire id_8,
    input tri0 id_9,
    output tri id_10,
    output tri id_11,
    output supply0 id_12,
    output wor id_13,
    input tri0 id_14,
    input supply1 id_15,
    input supply0 id_16,
    input wire id_17,
    input tri1 id_18,
    output uwire id_19,
    input tri id_20,
    input tri id_21
);
  wor id_23, id_24 = 1;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  wand  id_2,
    input  tri   id_3,
    output tri0  id_4
    , id_7,
    output wire  id_5
);
  assign id_5 = {1};
  wire id_8;
  or primCall (id_0, id_2, id_1, id_8);
  module_0 modCall_1 (
      id_5,
      id_2,
      id_3,
      id_0,
      id_0,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_0,
      id_2,
      id_3
  );
endmodule
