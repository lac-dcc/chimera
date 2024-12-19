// Seed: 3562189387
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  specify
    $width(negedge id_3, 1 ** 1);
    (id_4 *> id_5) = (id_5, 1 / 1);
    specparam id_6 = id_5 == id_3;
  endspecify
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1
    , id_6,
    output tri0 id_2,
    output wor id_3,
    output tri1 id_4
);
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6
  );
endmodule
module module_2 (
    output tri id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    input supply1 id_8,
    output tri id_9,
    input wand id_10,
    input supply1 id_11,
    output wand id_12,
    input wire id_13,
    input wand id_14,
    input tri id_15
);
endmodule
module module_3 (
    input tri0 id_0,
    input tri0 id_1,
    input wire id_2,
    output supply0 id_3,
    output tri1 id_4,
    input tri1 id_5,
    output wand id_6,
    output supply1 id_7,
    output wor id_8,
    input supply0 id_9,
    output wire id_10,
    input wor id_11,
    input supply0 id_12,
    output supply1 id_13
);
  assign id_3 = 1'd0;
  module_2 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_9,
      id_5,
      id_8,
      id_11,
      id_5,
      id_11,
      id_3,
      id_12,
      id_2,
      id_4,
      id_1,
      id_11,
      id_12
  );
  assign modCall_1.type_21 = 0;
  assign id_3 = 1;
endmodule
