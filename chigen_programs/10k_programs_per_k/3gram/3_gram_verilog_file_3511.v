// Seed: 2757646896
module module_0 (
    input uwire id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    output tri id_4,
    input tri id_5,
    output tri0 id_6,
    input wor id_7,
    output uwire id_8,
    output uwire id_9,
    output supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri id_14,
    input tri0 id_15,
    input wand id_16,
    output tri id_17,
    input tri id_18,
    input wire id_19,
    input supply0 id_20,
    input tri0 id_21
);
endmodule
macromodule module_1 (
    input tri1 id_0,
    input uwire id_1,
    input wor id_2,
    input supply1 id_3,
    output wor id_4,
    output wor id_5,
    input supply0 id_6
);
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_5,
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_4,
      id_4,
      id_6,
      id_0,
      id_1,
      id_6,
      id_1,
      id_5,
      id_2,
      id_6,
      id_1,
      id_3
  );
  assign modCall_1.id_18 = 0;
  assign id_5 = id_1;
  wire id_8;
  assign id_8 = id_2;
  wire id_9;
  ;
  logic id_10 = id_3;
endmodule
