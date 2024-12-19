// Seed: 2830027447
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    output uwire id_2,
    output uwire id_3,
    output wire id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    output tri1 id_8,
    input supply0 id_9,
    output tri0 id_10,
    input uwire id_11,
    input wor id_12
    , id_14, id_15
);
  wire id_16;
  assign id_4 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    inout wand id_2,
    input wor id_3,
    output supply1 id_4,
    output tri0 id_5,
    output tri0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_6,
      id_3,
      id_4,
      id_0,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_6 = id_3;
endmodule
