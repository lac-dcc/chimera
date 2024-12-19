// Seed: 3612535688
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    output supply0 id_5,
    input wire id_6,
    output wor id_7,
    input tri1 id_8,
    output tri1 id_9,
    input wand id_10,
    output supply1 id_11,
    input tri1 id_12,
    output wor id_13,
    input supply1 id_14,
    input supply0 id_15,
    input tri0 id_16,
    output supply1 id_17,
    output supply0 id_18,
    input supply1 id_19,
    output tri id_20,
    input supply1 id_21,
    input wor id_22,
    output tri id_23,
    input uwire id_24,
    input tri0 id_25,
    output wand id_26
);
  wire id_28, id_29;
  specify
    $width(id_30, 1);
    specparam id_31 = {id_29};
  endspecify
  wire id_32;
  assign module_1.id_15 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    input supply0 id_2,
    input wor id_3,
    output tri0 id_4,
    input uwire id_5,
    input wand id_6,
    output tri1 id_7,
    output supply1 id_8,
    input supply0 id_9,
    output supply1 id_10,
    output supply1 id_11,
    input wire id_12,
    output uwire id_13,
    output uwire id_14,
    output tri id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_1,
      id_9,
      id_4,
      id_0,
      id_1,
      id_2,
      id_7,
      id_9,
      id_14,
      id_3,
      id_7,
      id_0,
      id_12,
      id_2,
      id_7,
      id_15,
      id_9,
      id_14,
      id_3,
      id_3,
      id_14,
      id_0,
      id_0,
      id_11
  );
endmodule
