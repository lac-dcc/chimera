// Seed: 1478444321
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wand id_3,
    input tri id_4,
    input tri id_5,
    input supply0 id_6,
    output wor id_7,
    output wand id_8
    , id_10
);
  wire id_11;
  wire id_12;
  assign id_8 = id_5;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1
    , id_18,
    input  tri0  id_2,
    output wire  id_3,
    output tri   id_4,
    input  tri0  id_5,
    output tri1  id_6,
    input  wand  id_7,
    input  tri0  id_8,
    input  wire  id_9,
    output wand  id_10,
    output wire  id_11,
    input  tri0  id_12
    , id_19,
    input  tri0  id_13,
    output tri   id_14,
    input  uwire id_15,
    output tri0  id_16
);
  wire id_20, id_21, id_22, id_23;
  module_0 modCall_1 (
      id_16,
      id_0,
      id_2,
      id_12,
      id_1,
      id_0,
      id_13,
      id_11,
      id_6
  );
  assign modCall_1.type_0 = 0;
  id_24(
      .id_0(id_4), .id_1(1), .id_2(id_13), .id_3(id_9)
  );
  wire id_25;
  or primCall (
      id_6,
      id_19,
      id_5,
      id_8,
      id_23,
      id_20,
      id_13,
      id_18,
      id_21,
      id_12,
      id_0,
      id_9,
      id_22,
      id_7,
      id_1,
      id_15
  );
  assign id_23 = 1;
endmodule
