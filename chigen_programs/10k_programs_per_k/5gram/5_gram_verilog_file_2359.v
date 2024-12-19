// Seed: 1411930524
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input tri id_2,
    input tri id_3,
    output tri id_4,
    output wor id_5,
    output supply1 id_6,
    input tri0 id_7,
    input wor id_8,
    output tri0 id_9,
    output uwire id_10,
    output wand id_11,
    input wand id_12,
    input uwire id_13,
    output wire id_14,
    input supply0 id_15,
    input wire id_16,
    input uwire id_17,
    output tri1 id_18,
    input tri1 id_19,
    input uwire id_20,
    input wand id_21,
    input supply1 id_22
);
  wire id_24;
  assign id_4 = (~id_20);
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    input tri id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_3 = 0;
  wire id_5;
  wand id_6 = id_2;
  wire id_7;
  tri0 id_8;
  assign id_8 = id_1;
endmodule
