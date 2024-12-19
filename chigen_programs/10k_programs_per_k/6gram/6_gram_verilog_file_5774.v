// Seed: 664508451
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output uwire id_2
    , id_21,
    output supply1 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri id_6,
    input tri1 id_7,
    input wor id_8,
    input tri id_9,
    input tri1 id_10,
    input supply0 id_11,
    input wand id_12,
    output uwire id_13,
    input supply0 id_14,
    input wire id_15,
    output tri0 id_16,
    input supply0 id_17,
    input tri0 id_18,
    output supply1 id_19
);
  assign id_2  = (1 ^ "");
  assign id_19 = id_10;
  wire id_22;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wand id_3,
    input tri0 id_4,
    input wire id_5,
    input wor id_6,
    input wor id_7,
    input tri0 id_8,
    input wand id_9,
    input uwire id_10,
    output wire id_11,
    input tri id_12,
    input wor id_13,
    output tri1 id_14,
    output supply0 id_15
);
  assign id_3 = id_0 && 1;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_3,
      id_11,
      id_1,
      id_8,
      id_4,
      id_0,
      id_8,
      id_12,
      id_8,
      id_6,
      id_11,
      id_1,
      id_1,
      id_3,
      id_6,
      id_8,
      id_15
  );
endmodule
