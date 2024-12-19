// Seed: 2936896127
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input wand id_2,
    output tri id_3,
    output tri1 id_4,
    output supply1 id_5,
    output wor id_6,
    input wire id_7,
    input wire id_8,
    input tri0 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input supply1 id_12,
    input tri0 id_13
    , id_16,
    input tri0 id_14
);
  assign id_1 = 1;
  assign module_1.id_9 = 0;
  id_17(
      .id_0(1), .id_1({id_8{1}}), .id_2(id_7)
  );
  tri1 id_18 = 1, id_19, id_20;
  wire id_21, id_22;
  wire id_23;
  wire id_24;
  wire id_25, id_26;
endmodule
module module_1 (
    output tri0 id_0,
    inout wire id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4
);
  tri0 id_6, id_7;
  uwire id_8 = id_7, id_9;
  wire  id_10;
  assign id_9 = id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_4,
      id_9,
      id_9,
      id_6,
      id_7,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_9
  );
  assign id_8 = id_4;
endmodule
