// Seed: 2832897901
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4,
    output wor id_5,
    input supply0 id_6,
    output supply1 id_7,
    input wor id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    input uwire id_12,
    input supply0 id_13,
    output tri id_14,
    input tri id_15,
    output supply1 id_16
);
  wire id_18;
  wand id_19 = id_8, id_20 = 1;
  assign id_18 = 1;
endmodule
module module_1 (
    output wand id_0,
    output tri id_1,
    input supply1 id_2,
    output wand id_3
);
  assign id_1 = id_2;
  assign id_0 = 1;
  wire id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
