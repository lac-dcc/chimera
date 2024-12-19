// Seed: 1694503263
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input wor id_4,
    output tri1 id_5,
    output tri id_6,
    input wand id_7,
    output wand id_8,
    output supply1 id_9,
    input supply0 id_10,
    input wor id_11
    , id_21,
    input wire id_12,
    input wand id_13,
    output tri id_14,
    input uwire id_15,
    input uwire id_16,
    output wor id_17,
    input supply1 id_18,
    input wand id_19
);
  wire id_22;
  wire id_23;
  wire id_24;
  assign id_17 = id_7;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri id_3,
    output tri0 id_4,
    input wor id_5,
    input supply0 id_6,
    input tri0 id_7
);
  assign id_4 = id_6;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_5,
      id_0,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_2,
      id_0,
      id_7,
      id_5,
      id_3,
      id_2,
      id_5,
      id_0,
      id_2,
      id_3,
      id_6
  );
  specify
    (id_9 => id_10) = (1, 1  : 1  : 1'b0 == 1'b0);
    (id_11 => id_12) = (id_7  : 1  : 1);
    (id_13 => id_14) = 1;
  endspecify
endmodule
