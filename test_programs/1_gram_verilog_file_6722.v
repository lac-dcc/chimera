// Seed: 2682535071
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input wor id_2,
    input wand id_3,
    id_13,
    output uwire id_4,
    output wor void id_5,
    output supply0 id_6,
    input supply0 id_7,
    input supply1 void id_8,
    input supply0 id_9,
    input wor id_10,
    input wor id_11
);
  uwire id_14;
  assign module_1.type_0 = 0;
  wor id_15 = 1;
  specify
    (id_16 *> id_17) = (1, -1  : 1  : 1, 1);
    (id_18 => id_19) = (-1, 1);
  endspecify
  parameter id_20 = -1;
  assign id_15 = {1} < id_3;
  wire id_21, id_22;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input tri id_2,
    input wire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wor id_6,
    input wor id_7,
    input wor id_8,
    input tri id_9,
    input supply1 id_10,
    input supply1 id_11,
    id_22,
    output supply1 id_12,
    input tri0 id_13,
    output wand id_14,
    output wire id_15,
    input uwire id_16,
    output wor id_17,
    input uwire id_18,
    output tri0 id_19,
    output supply1 id_20
);
  wire id_23;
  module_0 modCall_1 (
      id_20,
      id_15,
      id_13,
      id_10,
      id_20,
      id_12,
      id_14,
      id_11,
      id_6,
      id_9,
      id_11,
      id_8
  );
endmodule
