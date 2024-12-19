// Seed: 1083971360
module module_0 (
    output wor id_0,
    output supply1 id_1,
    output supply0 id_2
);
  tri1 id_4, id_5;
  specify
    (id_6 => id_7) = 1;
    (negedge id_8 => (id_9 +: 1)) = (1 - id_6, 1  : 1  : id_4 == id_6);
    (id_10 *> id_11) = (id_4  : 1 == ~id_4  : id_11, id_10 - 1);
    (id_12 => id_13) = 1;
  endspecify
endmodule
module module_1 (
    input  tri1  id_0,
    output tri0  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output tri   id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  uwire id_7
);
  supply1 id_9 = id_7;
  assign id_1 = 'h0;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_4
  );
  assign modCall_1.type_14 = 0;
endmodule
