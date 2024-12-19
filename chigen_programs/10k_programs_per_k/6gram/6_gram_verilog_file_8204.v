// Seed: 3404790164
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output uwire id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input wor id_6,
    output tri0 id_7,
    input wire id_8,
    output tri1 id_9,
    input supply1 id_10,
    input tri1 id_11,
    output supply0 id_12,
    output supply1 id_13,
    output supply0 id_14,
    output supply0 id_15,
    input uwire id_16,
    input tri id_17,
    output supply0 id_18,
    output tri1 id_19
);
  wire id_21;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output tri id_0,
    input tri id_1,
    output uwire id_2
    , id_22,
    input wor id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri1 id_8
    , id_23,
    input wor id_9,
    input tri1 id_10,
    output uwire id_11,
    output wor id_12,
    input supply1 id_13,
    output tri id_14,
    output tri1 id_15,
    output tri1 id_16,
    input uwire id_17,
    input wire id_18,
    input wor id_19,
    output wor id_20
);
  module_0 modCall_1 (
      id_19,
      id_10,
      id_11,
      id_10,
      id_3,
      id_6,
      id_13,
      id_11,
      id_19,
      id_20,
      id_3,
      id_8,
      id_7,
      id_14,
      id_7,
      id_0,
      id_10,
      id_18,
      id_2,
      id_16
  );
  wire id_24 = !id_9;
  nor primCall (
      id_16, id_9, id_8, id_3, id_4, id_22, id_18, id_13, id_5, id_19, id_6, id_10, id_23
  );
endmodule
