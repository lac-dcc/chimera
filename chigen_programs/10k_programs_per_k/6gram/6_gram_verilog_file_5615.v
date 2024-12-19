// Seed: 1091945605
module module_0 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output wire  id_4,
    output tri0  id_5,
    output uwire id_6,
    output tri0  id_7,
    output uwire id_8
);
  assign id_6 = id_2;
  assign module_1.type_31 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    input uwire id_2,
    input wand id_3
    , id_22,
    input wire id_4,
    output uwire id_5,
    input tri1 id_6,
    input tri id_7,
    input tri0 id_8,
    output wor id_9,
    output tri0 id_10,
    input wand id_11,
    output supply0 id_12,
    input wor id_13,
    input tri1 id_14,
    input uwire id_15,
    input wor id_16,
    input tri0 id_17,
    output supply0 id_18,
    input wire id_19,
    output tri0 id_20
);
  specify
    (id_23[1] => id_24) = (id_22, 1 - 1  : id_7  : id_15);
    (id_25 *> id_26) = 1;
  endspecify
  or primCall (
      id_10, id_22, id_7, id_16, id_1, id_11, id_13, id_8, id_4, id_23, id_3, id_0, id_2, id_6
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_22,
      id_5,
      id_18,
      id_20,
      id_18,
      id_26
  );
endmodule
