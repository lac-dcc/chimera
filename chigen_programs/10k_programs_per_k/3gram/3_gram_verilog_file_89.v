// Seed: 1544599212
module module_0 (
    output wand id_0,
    output wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input supply1 id_6,
    output wire id_7,
    output tri id_8,
    input tri0 id_9,
    output supply1 id_10,
    input tri1 id_11,
    output wor id_12,
    output uwire id_13
);
  wire id_15;
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    output wire id_0,
    input tri id_1,
    output supply1 id_2,
    input wire id_3,
    output wire id_4,
    input wor id_5,
    input tri0 id_6,
    output supply1 id_7,
    input uwire id_8,
    output tri id_9,
    input uwire id_10
);
  wand id_12;
  genvar id_13;
  tri0 id_14 = id_13;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_6,
      id_13,
      id_5,
      id_8,
      id_6,
      id_14,
      id_4,
      id_3,
      id_13,
      id_3,
      id_4,
      id_14
  );
  assign modCall_1.type_5 = 0;
  assign id_13 = id_10 ? id_5 : id_13;
  wire  id_15;
  uwire id_16;
  wire  id_17;
  assign id_16 = id_16 == id_13;
endmodule
