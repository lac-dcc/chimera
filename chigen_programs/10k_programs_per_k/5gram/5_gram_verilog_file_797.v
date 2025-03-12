// Seed: 1911321728
module module_0 (
    input wor id_0,
    input wor id_1,
    output tri id_2,
    input tri0 id_3,
    input tri0 id_4,
    input uwire id_5,
    input wand id_6,
    input supply0 id_7,
    output tri1 id_8,
    input supply1 id_9,
    input tri1 id_10
    , id_19,
    output wire id_11,
    input wor id_12,
    output tri1 id_13,
    output wand id_14,
    input uwire id_15,
    input wand id_16,
    input tri id_17
);
  assign id_2  = -1;
  assign id_11 = id_5;
  assign id_19 = 1 == (id_16 && id_3 ? id_9 : id_16);
  logic id_20;
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    input supply1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_2,
      id_0,
      id_4,
      id_1,
      id_0,
      id_3,
      id_3,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.id_17 = 0;
endmodule
