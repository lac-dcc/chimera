// Seed: 3170261166
module module_0 (
    input wire id_0,
    input wor id_1,
    input wand id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    output supply0 id_7,
    output supply1 id_8
    , id_13,
    input wand id_9,
    output supply1 id_10,
    input supply0 id_11
);
  wire id_14;
  assign id_7 = id_11;
  assign id_8 = id_0;
  supply1 id_15, id_16;
  assign id_13 = 1;
  tri id_17 = id_15;
  assign id_16 = 1;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input supply1 id_2,
    output supply0 id_3,
    input uwire id_4,
    output uwire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_2,
      id_2,
      id_0,
      id_1,
      id_5,
      id_5,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
